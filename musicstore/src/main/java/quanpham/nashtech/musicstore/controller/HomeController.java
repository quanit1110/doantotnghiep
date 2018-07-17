package quanpham.nashtech.musicstore.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import quanpham.nashtech.musicstore.entity.Album;
import quanpham.nashtech.musicstore.entity.RatingStar;
import quanpham.nashtech.musicstore.entity.User;
import quanpham.nashtech.musicstore.repository.AlbumRepository;
import quanpham.nashtech.musicstore.repository.GenreRepository;
import quanpham.nashtech.musicstore.repository.RateRepository;
import quanpham.nashtech.musicstore.repository.UserRepository;
import quanpham.nashtech.musicstore.service.RecommenService;

@Controller
public class HomeController {
	
	@Autowired
	private GenreRepository genreRespository; 
	
	@Autowired
	private AlbumRepository albumRepository;
	
	@Autowired
	private RateRepository rateRepository;
	
	@Autowired 
	private RecommenService recommenService;
	
	@Autowired
	private UserRepository userRepository;
	
	@GetMapping(value={"/"})
	public String showHomeView(Model model){
		return "home";	
	}
	/*@GetMapping(value={"/"})
	public String showHomeView(Model model, HttpServletRequest request) throws IOException, TasteException {
		Principal principal = request.getUserPrincipal();
		List<RatingStar> list= rateRepository.findAll();
		if (principal == null) {
			return "redirect:/";
		}
		User user = userRepository.findByUsername(principal.getName());
		List<RecommendedItem> recommendations = recommenService.recommenderByUser(list, "D:/Code/WebJava/musicstore2/musicstore/data/dataset.csv", user);
		model.addAttribute("listgenre",genreRespository.findAll());
		List<Album> album = new ArrayList<>();
		for(RecommendedItem item : recommendations) {
			Album e = albumRepository.findById((int)item.getItemID());
			album.add(e);
		}
		//model.addAttribute("listAlbum", albumRepository.findAll());
		model.addAttribute("listAlbum",album);
		return "home";	
	}*/
	
	
	
}