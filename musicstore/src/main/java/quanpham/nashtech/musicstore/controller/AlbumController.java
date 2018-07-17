package quanpham.nashtech.musicstore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import quanpham.nashtech.musicstore.entity.Album;
import quanpham.nashtech.musicstore.entity.RatingStar;
import quanpham.nashtech.musicstore.repository.AlbumRepository;
import quanpham.nashtech.musicstore.repository.GenreRepository;
import quanpham.nashtech.musicstore.repository.RateRepository;
import quanpham.nashtech.musicstore.service.RecommenService;

@Controller
public class AlbumController {

	@Autowired
	private AlbumRepository albumRepository;

	@Autowired
	private GenreRepository genreRepository;
	
	@Autowired 
	private RecommenService recommenService;
	
	@Autowired
	private RateRepository rateRepository;

	/*
	 * @Autowired CartServiceImpl cartServiceImpl;
	 */
	@GetMapping("/genre")
	public String showAlbumByGenre(@RequestParam int id, Model model) {
		model.addAttribute("albumid", albumRepository.findByGenreId(id));
		model.addAttribute("listgenre", genreRepository.findAll());
		return "show-album-genre";
	}

	@GetMapping("/detailMusic")
	public String detailMusic(@ModelAttribute("album") Album album, ModelMap model, HttpServletRequest req) throws IOException, TasteException {
		List<RatingStar> list = new ArrayList<>();
		List<RecommendedItem> recommendations = recommenService.recommenderItem(list, "D:/Code/WebJava/musicstore2/musicstore/data/dataset.csv", album);
		List<Album> listAlbum = new ArrayList<>();
		for(RecommendedItem item : recommendations) {
			Album e = albumRepository.findById((int)item.getItemID());
			listAlbum.add(e);
		}
		model.addAttribute("album", albumRepository.findById(album.getId()));
		model.put("listgenre", genreRepository.findAll());
		
		model.put("listAlbum", listAlbum);
		req.getSession().setAttribute("albumId", album.getId());
		return "detailMusic";
	}
}
