package quanpham.nashtech.musicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import quanpham.nashtech.musicstore.entity.Genre;

public interface GenreRepository extends JpaRepository<Genre, Integer> {
	Genre findByName(String name);
	Genre findById(int id);
	//List<Genre> findAll(String name);
}
