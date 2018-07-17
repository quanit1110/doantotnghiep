package quanpham.nashtech.musicstore.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import quanpham.nashtech.musicstore.entity.Album;
import quanpham.nashtech.musicstore.entity.Cart;
import quanpham.nashtech.musicstore.repository.AlbumRepository;

@Component
@Service
public class CartService {

	@Autowired
	private AlbumRepository albumRepository;

	/*public void addCart(Album album, HttpSession session) {
		Album albums = albumRepository.findById(album.getId());
		if (session.getAttribute("cart") == null) {
			List<Cart> cart = new ArrayList<Cart>();
			cart.add(new Cart(albums,1));
			session.setAttribute("cart", cart);
		} else {
			@SuppressWarnings("unchecked")
			List<Cart> cart = (List<Cart>) session.getAttribute("cart");
			int index = isExisting(albums.getId(), session);
			if (index == -1){
				cart.add(new Cart(albums, 1));
			}
			else {	
				int quantity = cart.get(index).getCount() + 1;
				cart.get(index).setCount(quantity);
				session.setAttribute("cart", cart);
			}
			session.setAttribute("cart", cart);
		}
	}

	@SuppressWarnings("unchecked")
	private int isExisting(int albumId, HttpSession session) {
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		
		for (int i = 0; i < cart.size(); i++)
			if (cart.get(i).getAlbum().getId() == albumId){
				return i;
			}
		return -1;
	}*/
	
	public void addCart(Album album, List<Cart> cart) {
		cart = new ArrayList<Cart>();
		cart.add(new Cart(album,1));
	}
	public void addNewCart(Album album, List<Cart> cart) {
		Album albums = albumRepository.findById(album.getId());
		if (cart == null) {
			cart = new ArrayList<Cart>();
			cart.add(new Cart(albums,1));
			//session.setAttribute("cart", cart);
		}
		else {
			//@SuppressWarnings("unchecked")
			//List<Cart> cart = (List<Cart>) session.getAttribute("cart");
			int index = isExist(albums.getId(), cart);
			if (index == -1){
				cart.add(new Cart(albums, 1));
			}
			else {	
				int quantity = cart.get(index).getCount() + 1;
				cart.get(index).setCount(quantity);
				//session.setAttribute("cart", cart);
			}
			//session.setAttribute("cart", cart);
		}
	}
	

	//@SuppressWarnings("unchecked")
	//@SuppressWarnings("unused")
	private int isExist(int albumId, List<Cart> cart) {
		//List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		
		for (int i = 0; i < cart.size(); i++)
			if (cart.get(i).getAlbum().getId() == albumId){
				return i;
			}
		return -1;
	}

}
