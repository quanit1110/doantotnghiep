package quanpham.nashtech.musicstore.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;

@Entity

public class Cart{

	//private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private Integer Id;
	@NotNull
	@JoinColumn(name = "UserId")
	@OneToOne
	private User user;
	@NotNull
	@Column(name = "Count")
	private int count;
	@NotNull
	@Column(name = "DateCreated")
	private Date dateCreated;
	@JoinColumn(name = "AlbumId")
	@ManyToOne(optional = false)
	private Album album;

	public Cart() {
	}
	
	public Cart(Album album, int count) {
		this.album=album;
		this.count=count;
	}
	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	

	@Override
	public String toString() {
		return "Cart [Id=" + Id + ", cart=" + "user" + ", count=" + count + ", dateCreated=" + dateCreated + ", album="
				+ album + "]";
	}

}