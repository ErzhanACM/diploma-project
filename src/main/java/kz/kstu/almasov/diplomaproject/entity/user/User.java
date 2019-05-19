package kz.kstu.almasov.diplomaproject.entity.user;

import kz.kstu.almasov.diplomaproject.entity.restaurant.Restaurant;
import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.*;

@Entity
@Table(name = "usr")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "user.username.empty.error")
    private String username;

    @NotBlank(message = "user.password.empty.error")
    private String password;

    @Email(message = "user.email.correct.error")
    @NotBlank(message = "user.email.empty.error")
    private String email;

    private boolean active;
    private String activationCode;

    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;

    private String avatarFileName;

    @Temporal(TemporalType.DATE)
    @Past(message = "user.birthday.time.error")
    private Date birthday;

    private String firstName;
    private String secondName;
    private String patronymic;
    private String city;
    private String address;
    private String phone;
    private String skype;
    private String aboutMyself;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "user_toi_favorite",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "toi_id") }
    )
    @Fetch(value = FetchMode.SUBSELECT)
    private List<Toi> favoriteTois = new ArrayList<>();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "user_restaurant_favorite",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "restaurant_id") }
    )
    @Fetch(value = FetchMode.SUBSELECT)
    private List<Restaurant> favoriteRestaurants = new ArrayList<>();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "user_tamada_favorite",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "tamada_id") }
    )
    @Fetch(value = FetchMode.SUBSELECT)
    private List<Tamada> favoriteTamadas = new ArrayList<>();

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isActive();
    }
}
