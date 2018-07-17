package quanpham.nashtech.musicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import quanpham.nashtech.musicstore.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	User findByUsername(String username);
	
	User findById(Integer id);
}
