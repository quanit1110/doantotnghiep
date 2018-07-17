package quanpham.nashtech.musicstore.entity;

import java.util.Collection;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.validation.GroupSequence;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@GroupSequence({ firsth.class, second.class, thirst.class, User.class })
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotEmpty(message = "Please enter your username", groups = firsth.class)
	@Size(min = 5, max = 255, message = "The username is too short", groups = second.class)
	@Pattern(regexp = "[a-zA-Z0-9_.]*",message="The username is invalid !", groups = thirst.class)
	private String username;
	@NotEmpty(message = "Please enter your email", groups = firsth.class)
	@Email(message = "The email is invalid !", groups = second.class)

	@Pattern(regexp="^(\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*)$",message="The email is invalid !",groups=thirst.class)
	private String email;
	@NotEmpty(message = "Please enter password", groups = firsth.class)
	@Size(min = 6, max = 255, message = "The password is too short !", groups = second.class)
	private String password;
	@NotEmpty(message = "Please enter confirm password", groups = firsth.class)
	@Size(min = 6, max = 255, message = "Confirm password is invalid", groups = second.class)
	private String confirmpassword;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<RatingStar> ratingstarCollection;

	public User() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	public Collection<RatingStar> getRatingstarCollection() {
        return ratingstarCollection;
    }

    public void setRatingstarCollection(Collection<RatingStar> ratingstarCollection) {
        this.ratingstarCollection = ratingstarCollection;
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", email=" + email + ", password=" + password + ", roles="
				+ roles + "]";
	}

}

interface firsth {
}

interface second {
}

interface thirst {
}