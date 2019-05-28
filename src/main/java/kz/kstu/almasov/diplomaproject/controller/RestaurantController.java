package kz.kstu.almasov.diplomaproject.controller;

import kz.kstu.almasov.diplomaproject.entity.dto.RegistrationRestaurantDTO;
import kz.kstu.almasov.diplomaproject.entity.dto.SearchRestaurantDTO;
import kz.kstu.almasov.diplomaproject.entity.restaurant.Restaurant;
import kz.kstu.almasov.diplomaproject.entity.review.RestaurantReview;
import kz.kstu.almasov.diplomaproject.entity.user.RestaurantAdmin;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.service.RestaurantService;
import kz.kstu.almasov.diplomaproject.util.PaginationManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;

    @Autowired
    private PaginationManager<Restaurant> restaurantPaginationManager;

    @Autowired
    private PaginationManager<RestaurantAdmin> restaurantAdminPaginationManager;

    @Autowired
    private PaginationManager<RestaurantReview> restaurantReviewPaginationManager;

    @PostMapping("/updateRestaurantAdmin")
    public String updateRestaurantAdmin(
            @Valid RestaurantAdmin restaurantAdmin,
            BindingResult bindingResult,
            Model model
    ) {
        String view = "/editProfile";
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("restaurantAdmin", restaurantAdmin);
        } else {
            if (restaurantService.updateRestaurantAdmin(restaurantAdmin, model)) {
                view = "redirect:/user/" + restaurantAdmin.getUser().getId();
            }
        }
        return view;
    }

    @GetMapping("{restaurant}")
    public String restaurantPage(
            @AuthenticationPrincipal User user,
            @PathVariable Restaurant restaurant,
            Model model) {
        boolean isFavorite = restaurantService.isFavorite(restaurant, user);
        boolean isRestaurantAdmin = user.getId().equals(restaurant.getAdministrator().getId());
        restaurantService.setRating(restaurant);
        model.addAttribute("restaurant", restaurant);
        model.addAttribute("isFavorite", isFavorite);
        model.addAttribute("isRestaurantAdmin", isRestaurantAdmin);
        return "restaurantPage";
    }

    @GetMapping("/registrate")
    public String restaurantRegistrationPage() {
        return "createRestaurant";
    }

    @PostMapping("/createRestaurant")
    public String createRestaurant(
            @AuthenticationPrincipal User administrator,
            @Valid RegistrationRestaurantDTO restaurantDTO,
            BindingResult bindingResult,
            Model model
    ) {
        restaurantDTO.setAdministrator(administrator);
        String view = "/createRestaurant";
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("creatingRestaurant", restaurantDTO);
        } else {
            Restaurant restaurant = restaurantService.saveRestaurant(restaurantDTO);
            // view = "redirect:/restaurant/" + restaurant.getId();
            view = "redirect:/user/" + administrator.getId();
        }
        return view;
    }

    @GetMapping("/restaurantList")
    public String restaurantList(
            Model model,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ) {
        Page<Restaurant> page = restaurantService.getRestaurantPage(pageable);
        List<Integer> bodyForPagination = restaurantPaginationManager.getBody(page);

        model.addAttribute("page", page);
        model.addAttribute("restaurantList", page.getContent());
        model.addAttribute("url", "/restaurant/restaurantList");
        model.addAttribute("body", bodyForPagination);
        model.addAttribute("querySymbol", "?");

        return "restaurantList";
    }

    @GetMapping("/restaurantListOfUser")
    public String restaurantListOfUser(
            Model model,
            @RequestParam User user,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ) {
        Page<Restaurant> page = restaurantService.getRestaurantListOfUser(pageable, user.getId());
        List<Integer> bodyForPagination = restaurantPaginationManager.getBody(page);

        model.addAttribute("administrator", user);
        model.addAttribute("page", page);
        model.addAttribute("restaurantList", page.getContent());
        model.addAttribute("url", "/restaurant/restaurantListOfUser?user=" + user.getId());
        model.addAttribute("body", bodyForPagination);
        model.addAttribute("querySymbol", "&");

        return "restaurantList";
    }

    @GetMapping("/favoriteRestaurantsOfUser")
    public String favoriteRestaurantsOfUser(
            @AuthenticationPrincipal User user,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable,
            Model model
    ) {
        Page<Restaurant> page = restaurantService.getFavoriteRestaurantsOfUser(user, pageable);
        List<Integer> bodyForPagination = restaurantPaginationManager.getBody(page);

        model.addAttribute("favorite", true);

        model.addAttribute("user", user);
        model.addAttribute("page", page);
        model.addAttribute("restaurantList", page.getContent());
        model.addAttribute("url", "/restaurant/favoriteRestaurantsOfUser");
        model.addAttribute("body", bodyForPagination);
        model.addAttribute("querySymbol", "?");

        return "restaurantList";
    }

    @GetMapping("/searchRestaurant")
    public String searchRestaurant(
            @AuthenticationPrincipal User authenticatedUser,
            @Valid SearchRestaurantDTO restaurantDTO,
            BindingResult bindingResult,
            Model model,
            @RequestParam(required = false, defaultValue = "name") String sort,
            @RequestParam(name = "administrator", required = false) User administrator,
            @RequestParam(name = "favorite", required = false, defaultValue = "false") boolean favorite,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ) {
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("searchedRestaurant", restaurantDTO);
        } else {
            if (administrator != null) {
                restaurantDTO.setAdministrator(administrator);
                model.addAttribute("administrator", administrator);
            }
            Page<Restaurant> page = restaurantService.getRestaurantPage(restaurantDTO, pageable, favorite, authenticatedUser);
            List<Integer> bodyForPagination = restaurantPaginationManager.getBody(page);

            String url = getUrl(restaurantDTO, sort);

            model.addAttribute("searchedRestaurant", restaurantDTO);
            model.addAttribute("sort", sort);

            if (favorite) {
                model.addAttribute("user", authenticatedUser);
                model.addAttribute("favorite", true);
            }

            model.addAttribute("page", page);
            model.addAttribute("restaurantList", page.getContent());
            model.addAttribute("url", url);
            model.addAttribute("body", bodyForPagination);
            model.addAttribute("querySymbol", "&");
        }
        return "restaurantList";
    }

    private String getUrl(SearchRestaurantDTO restaurantDTO, String sort) {
        String name = restaurantDTO.getName().replace(' ', '+');
        String administrator = "";
        if (restaurantDTO.getAdministrator() != null) {
            administrator = restaurantDTO.getAdministrator().getId().toString();
        }
        String url = "/restaurant/searchRestaurant?name=" + name + "&capacity=" + restaurantDTO.getCapacity()
                + "&pricePerPerson=" + restaurantDTO.getPricePerPerson()
                + "&city=" + restaurantDTO.getCity() + "&address=" + restaurantDTO.getAddress()
                + "&administrator=" + administrator + "&sort=" + sort;
        return url;
    }

    @GetMapping("/editRestaurant/{restaurant}")
    public String editRestaurant(
            @PathVariable("restaurant") Restaurant restaurant,
            Model model
    ) {
        model.addAttribute("restaurant", restaurant);
        return "editRestaurant";
    }

    @PostMapping("/updateRestaurant")
    public String updateRestaurant(
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable,
            @AuthenticationPrincipal User user,
            @Valid Restaurant restaurant,
            BindingResult bindingResult,
            Model model
    ) {
        String view = "editRestaurant";
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("restaurant", restaurant);
            System.out.println("\n\nПроблемки:\n");
            System.out.println(errorsMap);
        } else {
            restaurant.setAdministrator(user);
            restaurantService.saveRestaurant(restaurant);
            view = "redirect:/restaurant/" + restaurant.getId();
        }
        return view;
    }

    @GetMapping("/reviewList/{restaurant}")
    public String reviewList(
            @PathVariable Restaurant restaurant,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable,
            @AuthenticationPrincipal User user,
            Model model
    ) {
        Page<RestaurantReview> page = restaurantService.getRestaurantReviewPage(restaurant, pageable);
        List<Integer> bodyForPagination = restaurantReviewPaginationManager.getBody(page);

        model.addAttribute("page", page);
        model.addAttribute("reviews", page.getContent());
        model.addAttribute("url", "/restaurant/reviewList/" + restaurant.getId());
        model.addAttribute("body", bodyForPagination);
        model.addAttribute("querySymbol", "?");
        model.addAttribute("restaurant", restaurant);
        model.addAttribute("authenticatedUserId", user.getId());

        return "restaurantReviewList";
    }

    @GetMapping("/addReview")
    public String addReviewPage(
            @RequestParam User user,
            @RequestParam Restaurant restaurant,
            Model model
    ) {
        model.addAttribute("user", user);
        model.addAttribute("restaurant", restaurant);
        return "createRestaurantReview";
    }

    @PostMapping("/addReview")
    public String addReview(
            @Valid RestaurantReview restaurantReview,
            BindingResult bindingResult,
            Model model
    ) {
        String view = "createRestaurantReview";
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("restaurantReview", restaurantReview);
            model.addAttribute("restaurant", restaurantReview.getRestaurantId());
        } else {
            restaurantService.saveReview(restaurantReview);
            view = "redirect:/restaurant/" + restaurantReview.getRestaurantId().getId();
        }
        return view;
    }

    @GetMapping("/editReview")
    public String editReviewPage(
            @RequestParam RestaurantReview reviewId,
            Model model
    ) {
        model.addAttribute("review", reviewId);
        return "editRestaurantReview";
    }

    @PostMapping("/updateReview")
    public String updateReview(
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable,
            @AuthenticationPrincipal User user,
            @Valid RestaurantReview review,
            BindingResult bindingResult,
            Model model
    ) {
        String view = "editRestaurantReview";
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("review", review);
        } else {
            restaurantService.saveReview(review);
            view = "redirect:/restaurant/reviewList/" + review.getRestaurantId().getId();
        }
        return view;
    }

    @PostMapping("/deleteReview")
    public String deleteReview(
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable,
            @AuthenticationPrincipal User user,
            @RequestParam RestaurantReview reviewId,
            Model model
    ) {
        restaurantService.deleteRestaurantReview(reviewId);
        return reviewList(reviewId.getRestaurantId(), pageable, user, model);
    }

    @GetMapping("/restaurantAdminList")
    public String restaurantAdminList(
            Model model,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ) {
        Page<RestaurantAdmin> page = restaurantService.getRestaurantAdminPage(pageable);
        List<Integer> bodyForPagination = restaurantAdminPaginationManager.getBody(page);

        model.addAttribute("page", page);
        model.addAttribute("restauranAdmintList", page.getContent());
        model.addAttribute("url", "/restaurant/restaurantAdminList");
        model.addAttribute("body", bodyForPagination);
        model.addAttribute("querySymbol", "?");

        return "restauranAdmintList";
    }
}
