package quanpham.nashtech.musicstore.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import quanpham.nashtech.musicstore.entity.Album;
import quanpham.nashtech.musicstore.entity.Artist;
import quanpham.nashtech.musicstore.entity.Genre;
import quanpham.nashtech.musicstore.repository.AlbumRepository;
import quanpham.nashtech.musicstore.repository.ArtistRepository;
import quanpham.nashtech.musicstore.repository.GenreRepository;
import quanpham.nashtech.musicstore.serviceimpl.MultipartFileServiceImpl;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AlbumRepository albumRepository;

	@Autowired
	private GenreRepository genreRepository;

	@Autowired
	private ArtistRepository artistRepository;

	@Autowired
	private MultipartFileServiceImpl multipartFileServiceImpl;

	@RequestMapping("/album-list")
	public String showAlbumList(Model model) {
		model.addAttribute("listAlbum1", albumRepository.findAll());
		return "admin/album-list";
	}

	@GetMapping("/deleteAlbum")
	public String deleteAlbum(@RequestParam int id) throws IOException {
		albumRepository.delete(id);
		return "redirect:/admin/album-list";
	}

	@RequestMapping("/detail-albumgenre")
	public String showDetailAlbum(@RequestParam int id, Model model) {
		Album albums = albumRepository.findById(id);
		model.addAttribute("title", albums.getTitle());
		model.addAttribute("url", albums.getAlbumArtUrl());
		model.addAttribute("genre", albums.getGenre().getName());
		model.addAttribute("artist", albums.getArtist().getName());
		model.addAttribute("price", albums.getPrice());
		model.addAttribute("id", albums.getId());
		return "admin/detail-albumgenre";
	}

	/* File.separator + */
	// insert album
	@RequestMapping(value = "/createnewsuccess", method = RequestMethod.POST)
	public String insert(@Valid Album album,
			BindingResult result,@RequestParam("albumArtUrl") CommonsMultipartFile file,
			ModelMap model, HttpServletRequest request) {
		if(!file.isEmpty()){
		multipartFileServiceImpl.checkMultipartFileEmpty(file, request);
		album.setAlbumArtUrl(file.getOriginalFilename());
		albumRepository.save(album);
		return "redirect:/admin/album-list";
		}
		else if(file.isEmpty()&&!result.hasErrors()){
			albumRepository.save(album);
			return "redirect:/admin/album-list";
		}
		if (result.hasErrors()) {
			model.addAttribute("listArtist", artistRepository.findAll());
			model.addAttribute("listGenre", genreRepository.findAll());
			return "admin/create-new";
		}


		return "redirect:/admin/album-list";
	}

	@GetMapping("/create-new")
	public String createNewPage(Album album, Model model) {
		List<Genre> listgenre = genreRepository.findAll();
		List<Artist> listArtist = artistRepository.findAll();
		model.addAttribute("listArtist", listArtist);
		model.addAttribute("listGenre", listgenre);
		return "admin/create-new";
	}

	@GetMapping("/edit-album")
	public String Edit(@RequestParam int id, Model model) {
		Album album = albumRepository.findById(id);
		model.addAttribute("album", album);
		model.addAttribute("listArtist", artistRepository.findAll());
		model.addAttribute("listGenre", genreRepository.findAll());


		return "admin/edit-album";
	}

	// @RequestMapping(value = "/updateAlbum", method = RequestMethod.POST)
	@PostMapping("/updateAlbum")
	public String update(@Valid Album album, BindingResult result,
			ModelMap model,@RequestParam int id,@RequestParam("albumArtUrl") CommonsMultipartFile file, HttpServletRequest request) {
		if(!file.isEmpty()){
			multipartFileServiceImpl.checkMultipartFileEmpty(file, request);
			album.setAlbumArtUrl(file.getOriginalFilename());
			albumRepository.save(album);
			return "redirect:/admin/album-list";
		}
		album.setAlbumArtUrl(file.getOriginalFilename());
		albumRepository.save(album);
		return "redirect:/admin/album-list";
	}

}

