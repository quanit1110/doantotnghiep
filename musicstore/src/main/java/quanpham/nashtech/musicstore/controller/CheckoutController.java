package quanpham.nashtech.musicstore.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import quanpham.nashtech.musicstore.entity.Album;
import quanpham.nashtech.musicstore.entity.Cart;
import quanpham.nashtech.musicstore.entity.Order;
import quanpham.nashtech.musicstore.entity.OrderDetail;
import quanpham.nashtech.musicstore.repository.GenreRepository;
import quanpham.nashtech.musicstore.repository.OrderDetailRepository;
import quanpham.nashtech.musicstore.repository.OrderRepository;

@Controller
public class CheckoutController {

	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	@Autowired
	private GenreRepository genreRepository;

	@GetMapping("/shippinginformation")
	public String shippingInformation(Order order, Album album, HttpServletRequest request) {
		if (request.getUserPrincipal().getName() == null)
			return "login";
		return "/shippinginformation";
	}

	@PostMapping("/shippinginformation")
	public String shipping(Model model, HttpSession session, HttpServletRequest request, Order order, Album album) {
		@SuppressWarnings("unchecked")
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		if (list == null) {
			model.addAttribute("listgenre", genreRepository.findAll());
			return "/checkout_empty";
		}
		model.addAttribute("user", request.getUserPrincipal().getName());
		return "/shippinginformation";
	}

	@SuppressWarnings("unchecked")
	@PostMapping("/addShippinginfo")
	public String addshipping(@Valid Order order, BindingResult result, Model model, HttpSession session,
			HttpServletRequest request) {
		if (result.hasErrors()) {
			return "/shippinginformation";
		}
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		Date date = new Date();

		order.setOrderDate(date);
		String user = request.getUserPrincipal().getName();
		order.setUserName(user);
		orderRepository.save(order);
		for (Cart cart : list) {
			OrderDetail orderdetail = new OrderDetail();
			orderdetail.setOrder(order);
			orderdetail.setAlbum(cart.getAlbum());
			orderdetail.setUnitPrice(cart.getAlbum().getPrice());
			orderdetail.setQuantity(cart.getCount());
			orderDetailRepository.save(orderdetail);
		}

		model.addAttribute("id", order.getId());
		session.removeAttribute("cart");
		return "checkoutsuccess";
	}
}
