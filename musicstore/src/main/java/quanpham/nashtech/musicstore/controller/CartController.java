package quanpham.nashtech.musicstore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.context.annotation.SessionScope;

import quanpham.nashtech.musicstore.entity.Album;
import quanpham.nashtech.musicstore.entity.Cart;
import quanpham.nashtech.musicstore.entity.Genre;
import quanpham.nashtech.musicstore.repository.AlbumRepository;
import quanpham.nashtech.musicstore.repository.GenreRepository;

@Controller
@SessionScope
public class CartController {

	@Autowired
	private AlbumRepository albumRepository;

	@Autowired
	private GenreRepository genreRepository;

	@PostMapping("/review-album")
	public String reviewAlbum(Album album, Model model, HttpSession session, HttpServletRequest req) {
		// get list cho menu genre
		model.addAttribute("albums", albumRepository.findById(album.getId()));
		model.addAttribute("listgenre", genreRepository.findAll());
		/////////////////////////////////////////////////////////////////////////////////////
		/* , album.getId() */
		Album albums = albumRepository.findById(album.getId());
		if (session.getAttribute("cart") == null) {
			List<Cart> cart = new ArrayList<Cart>();
			cart.add(new Cart(albums, 1));
			session.setAttribute("cart", cart);
		} else {
			@SuppressWarnings("unchecked")
			List<Cart> cart = (List<Cart>) session.getAttribute("cart");
			int index = isExisting(albums.getId(), session);
			if (index == -1) {
				cart.add(new Cart(albums, 1));
			} else {
				int quantity = cart.get(index).getCount() + 1;
				cart.get(index).setCount(quantity);
				session.setAttribute("cart", cart);
			}
			session.setAttribute("cart", cart);
		}
		return "redirect:/review-album";
	}

	@GetMapping("/review-album")
	public String getCart(Album album, Model model, HttpServletRequest req) {
		List<Genre> genres = genreRepository.findAll();
		model.addAttribute("albums", albumRepository.findById(album.getId()));
		model.addAttribute("listgenre", genres);
		return "review-album";
	}

	@GetMapping("/delete/{index}")
	public String deleteAlbum(@PathVariable("index") int index, Album album, Model model, HttpSession session,
			HttpServletRequest req) {
		@SuppressWarnings("unchecked")
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/review-album";
	}

	private int isExisting(int albumId, HttpSession session) {
		@SuppressWarnings("unchecked")
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");

		for (int i = 0; i < cart.size(); i++)
			if (cart.get(i).getAlbum().getId() == albumId) {
				return i;
			}
		return -1;
	}

}
