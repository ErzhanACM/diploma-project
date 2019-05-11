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
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Set;

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

    @ElementCollection(fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    @CollectionTable(name="user_restaurant_favourite", joinColumns=@JoinColumn(name="user_id"))
    private List<Restaurant> favouriteRestaurants;

    @ElementCollection(fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    @CollectionTable(name="user_tamada_favourite", joinColumns=@JoinColumn(name="user_id"))
    private List<Tamada> favouriteTamadas;

    @ElementCollection(fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    @CollectionTable(name="user_toi_favourite", joinColumns=@JoinColumn(name="user_id"))
    private List<Toi> favouriteTois;

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
