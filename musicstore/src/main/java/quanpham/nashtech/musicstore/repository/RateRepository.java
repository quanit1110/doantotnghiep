package quanpham.nashtech.musicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import quanpham.nashtech.musicstore.entity.RatingStar;

public interface RateRepository extends JpaRepository<RatingStar, Integer>{
}
