package quanpham.nashtech.musicstore.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@Entity
public class OrderDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OrderDetailId")
	private Integer Id;
	@NotNull
	@Column(name = "Quantity")
	private int quantity;
	@NotNull
	@Column(name = "UnitPrice")
	private Double unitPrice;
	@JoinColumn(name = "AlbumId")
	@ManyToOne(optional = false)
	private Album album;
	@JoinColumn(name = "OrderId")
	@ManyToOne(optional = false)
	private Order order;

	public OrderDetail() {
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "Orderdetail [Id=" + Id + ", quantity=" + quantity + ", unitPrice=" + unitPrice + ", album=" + album
				+ ", order=" + order + "]";
	}

}