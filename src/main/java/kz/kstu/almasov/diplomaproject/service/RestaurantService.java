package kz.kstu.almasov.diplomaproject.service;

import kz.kstu.almasov.diplomaproject.entity.dto.RegistrationRestaurantDTO;
import kz.kstu.almasov.diplomaproject.entity.dto.SearchRestaurantDTO;
import kz.kstu.almasov.diplomaproject.entity.restaurant.Restaurant;
import kz.kstu.almasov.diplomaproject.entity.review.RestaurantReview;
import kz.kstu.almasov.diplomaproject.entity.user.RestaurantAdmin;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.repository.RestaurantAdminRepository;
import kz.kstu.almasov.diplomaproject.repository.RestaurantRepository;
import kz.kstu.almasov.diplomaproject.repository.RestaurantReviewPageRepository;
import kz.kstu.almasov.diplomaproject.repository.RestaurantReviewRepository;
import kz.kstu.almasov.diplomaproject.validation.UserValidator;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Service
public class RestaurantService {

    @Autowired
    private RestaurantAdminRepository restaurantAdminRepository;

    @Autowired
    private RestaurantRepository restaurantRepository;

    @Autowired
    private RestaurantReviewRepository restaurantReviewRepository;

    @Autowired
    private RestaurantReviewPageRepository restaurantReviewPageRepository;

    @Autowired
    private UserValidator userValidator;

    public RestaurantAdmin getRestaurantAdmin(User user) {
        return restaurantAdminRepository.findByUser(user);
    }

    public boolean updateRestaurantAdmin(RestaurantAdmin restaurantAdmin, Model model) {
        if (!userValidator.validate(restaurantAdmin)) {
            model.mergeAttributes(userValidator.getErrorMap());
            model.addAttribute("restaurantAdmin", restaurantAdmin);
            return false;
        }
        restaurantAdminRepository.save(restaurantAdmin);
        return true;
    }

    public Restaurant saveRestaurant(Restaurant restaurant) {
        return restaurantRepository.save(restaurant);
    }

    public Restaurant saveRestaurant(RegistrationRestaurantDTO restaurantDTO) {
        Restaurant restaurant = getRestaurantFromDto(restaurantDTO);
        return restaurantRepository.save(restaurant);
    }

    private Restaurant getRestaurantFromDto(@Valid RegistrationRestaurantDTO restaurantDTO) {
        Restaurant restaurant = new Restaurant();

        restaurant.setAdministrator(restaurantDTO.getAdministrator());
        restaurant.setName(restaurantDTO.getName());
        restaurant.setPricePerPerson(new Integer(restaurantDTO.getPricePerPerson()));
        restaurant.setCapacity(new Integer(restaurantDTO.getCapacity()));
        restaurant.setCity(restaurantDTO.getCity());
        restaurant.setAddress(restaurantDTO.getAddress());
        restaurant.setDescription(restaurantDTO.getDescription());

        return restaurant;
    }


    public Page<Restaurant> getRestaurantPage(Pageable pageable) {
        Page<Restaurant> page = restaurantRepository.findAll(pageable);
        setRatingFromReviews(page);
        return page;
    }

    private void setRatingFromReviews(Page<Restaurant> page) {
        for (Restaurant restaurant : page.getContent()) {
            restaurant.setRating(getRatingFromRewievs(restaurant));
        }
    }

    private Double getRatingFromRewievs(Restaurant restaurant) {
        List<RestaurantReview> reviews = getListFromIterable(restaurantReviewRepository.findByRestaurantId(restaurant));
        double sum = 0;
        for (RestaurantReview review : reviews) {
            sum += review.getRating();
        }
        int reviewsNumber = reviews.size();
        Double rating = 0.0;
        if (reviewsNumber != 0) {
            rating = sum / reviewsNumber;
        }
        return rating;
    }

    private List<RestaurantReview> getListFromIterable(Iterable<RestaurantReview> reviews) {
        List<RestaurantReview> list = new ArrayList<>();
        for (RestaurantReview review : reviews) {
            list.add(review);
        }
        return list;
    }

    public Page<Restaurant> getRestaurantPage(SearchRestaurantDTO restaurant, Pageable pageable, boolean favorite, User user) {
        Double rating = 0.0;
        if (Strings.isNotEmpty(restaurant.getRating())) {
            rating = new Double(restaurant.getRating());
        }
        String name = "%" + restaurant.getName() + "%";
        String city = null;
        if (Strings.isNotEmpty(restaurant.getCity())) {
            city = restaurant.getCity();
        }
        String address = null;
        if (Strings.isNotEmpty(restaurant.getAddress())) {
            address = "%" + restaurant.getAddress().toLowerCase() + "%";
        }
        Integer capacity = null;
        if (Strings.isNotEmpty(restaurant.getCapacity())) {
            capacity = new Integer(restaurant.getCapacity());
        }
        Integer price = null;
        if (Strings.isNotEmpty(restaurant.getPricePerPerson())) {
            price = new Integer(restaurant.getPricePerPerson());
        }
        Page<Restaurant> page = restaurantRepository.findByParameters(name, city, address, capacity, price, pageable);
        setRatingFromReviews(page);
        if (favorite) {
            page = checkFavoriteRestaurants(page, pageable, user);
        }
        return removeRestaurantsByRating(page, rating, pageable);
    }

    private Page<Restaurant> checkFavoriteRestaurants(Page<Restaurant> page, Pageable pageable, User user) {
        List<Restaurant> favoriteRestaurants = user.getFavoriteRestaurants();
        List<Restaurant> restaurants = new ArrayList<>(page.getContent());
        Iterator<Restaurant> iterator = restaurants.iterator();
        while (iterator.hasNext()) {
            Restaurant restaurant = iterator.next();
            if (!favoriteRestaurants.contains(restaurant)) {
                iterator.remove();
            }
        }
        Page<Restaurant> newPage = new PageImpl<>(restaurants, pageable, restaurants.size());
        return newPage;
    }

    private Page<Restaurant> removeRestaurantsByRating(Page<Restaurant> page, Double rating, Pageable pageable) {
        List<Restaurant> restaurants = new ArrayList<>(page.getContent());
        Iterator<Restaurant> iterator = restaurants.iterator();
        while (iterator.hasNext()) {
            Restaurant restaurant = iterator.next();
            boolean ratingCase = (rating == 0.0) || (restaurant.getRating() >= rating);
            if (!ratingCase) {
                iterator.remove();
            }
        }
        Page<Restaurant> newPage = new PageImpl<>(restaurants, pageable, restaurants.size());
        return newPage;
    }

    public Page<Restaurant> getRestaurantListOfUser(Pageable pageable, Long userId) {
        Page<Restaurant> page = restaurantRepository.findByAdministrator(userId, pageable);
        setRatingFromReviews(page);
        return page;
    }

    public Page<Restaurant> getFavoriteRestaurantsOfUser(User user, Pageable pageable) {
        List<Restaurant> restaurants = user.getFavoriteRestaurants();
        int start = (int) pageable.getOffset();
        int end = (start + pageable.getPageSize()) > restaurants.size() ? restaurants.size() : (start + pageable.getPageSize());
        Page<Restaurant> page = new PageImpl<>(restaurants.subList(start, end), pageable, restaurants.size());
        setRatingFromReviews(page);
        return page;
    }

    public boolean isFavorite(Restaurant restaurant, User user) {
        return user.getFavoriteRestaurants().contains(restaurant);
    }

    public void saveReview(RestaurantReview restaurantReview) {
        Date date = new Date();
        restaurantReview.setDate(date);
        restaurantReviewRepository.save(restaurantReview);
    }

    public Page<RestaurantReview> getRestaurantReviewPage(Restaurant restaurant, Pageable pageable) {
        return restaurantReviewPageRepository.findByRestaurantId(restaurant, pageable);
    }

    public void deleteRestaurantReview(RestaurantReview review) {
        restaurantReviewRepository.deleteReview(review.getId());
    }

    public void setRating(Restaurant restaurant) {
        restaurant.setRating(getRatingFromRewievs(restaurant));
    }

    public Page<RestaurantAdmin> getRestaurantAdminPage(Pageable pageable) {
        return restaurantAdminRepository.findAll(pageable);
    }
}
