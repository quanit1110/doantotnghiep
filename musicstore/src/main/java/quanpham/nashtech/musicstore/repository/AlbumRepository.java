package quanpham.nashtech.musicstore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import quanpham.nashtech.musicstore.entity.Album;

public interface AlbumRepository extends JpaRepository<Album, Integer>{
	List<Album> findByGenreName(String genreName);
	List<Album> findByGenreId(int id);
	//Page<Album> findAll(Pageable pageable);
	Album findByTitle(String name);
	Album findById(int id);
//	void save(UploadF)
	//List<Album> findByTitle(Album album);
}
