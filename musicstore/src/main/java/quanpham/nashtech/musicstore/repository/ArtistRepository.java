package quanpham.nashtech.musicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import quanpham.nashtech.musicstore.entity.Artist;

public interface ArtistRepository extends JpaRepository<Artist, Integer>{
	//List<Artist> findAll(String name);
	Artist findById(int id);
}
