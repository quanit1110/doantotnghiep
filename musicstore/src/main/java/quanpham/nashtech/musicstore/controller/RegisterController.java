package quanpham.nashtech.musicstore.controller;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import quanpham.nashtech.musicstore.entity.Role;
import quanpham.nashtech.musicstore.entity.User;
import quanpham.nashtech.musicstore.repository.RoleRepository;
import quanpham.nashtech.musicstore.repository.UserRepository;

@Controller
public class RegisterController {

	@Autowired
	UserRepository userRepository;
	@Autowired
	RoleRepository roleRepository;

	@GetMapping("/register")
	public String showRegister(User user,HttpServletRequest request) {
		if(request.getUserPrincipal()!=null)
		return "redirect:/";
		return "register";
	}

	@PostMapping("/registeruser")
	public String createRegister(@Valid User user, BindingResult result, Model model, HttpServletRequest req) {
		if (result.hasErrors()) {
			return "/register";
		}
		if (userRepository.findByUsername(user.getUsername()) != null) {
			model.addAttribute("error_username", "The username is Exit !");
			return "/register";
		}
		if (user.getPassword().hashCode() != user.getConfirmpassword().hashCode()) {
			model.addAttribute("confirmpass", "Password and confirm password invalid");
			return "/register";
		}
		Set<Role> role = new HashSet<Role>();
		role.add(roleRepository.getOne(2));
		user.setRoles(role);
		userRepository.save(user);

		return "redirect:/login";
	}

}
