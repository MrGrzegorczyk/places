package pl.places.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.Email;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "user")
public class User extends BaseEntity implements UserDetails {

	private static final long serialVersionUID = 1014068168464635860L;

	public enum Role {
		USER, ADMIN
	}

	@Column(name = "login", nullable = false, length = 50)
	private String login;

	@Column(name = "first_name", nullable = false, length = 50)
	private String firstName;

	@Column(name = "last_name", nullable = false)
	private String lastName;

	@Column(nullable = false, unique = true)
	@Email
	private String email;

	@Column(nullable = false)
	private String password;

	@Enumerated(EnumType.STRING)
	@Column(name = "role", nullable = false)
	private Role role = Role.USER;

	@Transient
	private Collection<GrantedAuthority> authorities;

	public User() {
	}

	public User(String login, String firstName, String lastName, String email, String password, Role role) {
		super();
		this.login = login;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.role = role;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Transient
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Transient
	public void setAuthorities(Collection<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	@Transient
	public boolean isAdminUser() {
		return role == Role.ADMIN;
	}

	@Override
	@Transient
	public String getUsername() {
		return login;
	}

	@Override
	@Transient
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	@Transient
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	@Transient
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	@Transient
	public boolean isEnabled() {
		return true;
	}
}
