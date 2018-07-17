package quanpham.nashtech.musicstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import quanpham.nashtech.musicstore.entity.Album;
import quanpham.nashtech.musicstore.repository.AlbumRepository;

@RestController
@RequestMapping("/test")
public class TestController {

	@Autowired
	private AlbumRepository albumRepository;

	@GetMapping("/genre")
	public String showAlbumByGenre(@RequestParam String name, Model model) {
		List<Album> albums = albumRepository.findByGenreName(name);
		System.out.println(albums);
		return albumRepository.findByGenreName(name).toString();
	}
}
