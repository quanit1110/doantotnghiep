package quanpham.nashtech.musicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import quanpham.nashtech.musicstore.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Integer>{

}
