package quanpham.nashtech.musicstore.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import quanpham.nashtech.musicstore.entity.Role;
import quanpham.nashtech.musicstore.entity.User;
import quanpham.nashtech.musicstore.repository.UserRepository;

@Service
public class DatabaseUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findByUsername(username);
		
		if (user == null) {
			throw new UsernameNotFoundException("Username not found");
		}
		
		
		user.getPassword();
		UserDetails userDetails = convertToSpringUserDetails(user);
		
		return userDetails;
	}

	private UserDetails convertToSpringUserDetails(User user) {
		String username = user.getUsername();
		String password = user.getPassword();
		Collection<Role> roles = user.getRoles();
		
		List<GrantedAuthority> authorities = new ArrayList<>();
		
		for (Role role : roles) {
			GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + role.getName());
			authorities.add(authority);
		}
		
		org.springframework.security.core.userdetails.User springUser = new
				org.springframework.security.core.userdetails.User(
						username,
						password,
						authorities
				);
		
		return springUser;
	}

}
