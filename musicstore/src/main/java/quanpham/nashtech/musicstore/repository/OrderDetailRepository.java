package quanpham.nashtech.musicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import quanpham.nashtech.musicstore.entity.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer>{
	//List<Album> findByAlbum();
}
