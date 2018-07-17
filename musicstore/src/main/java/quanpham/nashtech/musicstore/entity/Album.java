package quanpham.nashtech.musicstore.entity;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

@Entity
public class Album {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AlbumId")
	private int id;

	
	@Size(min = 1, max = 255,message="Please enter title for album !")
	private String title;

	//@Pattern(regexp="(^$|[0-9]{10})",message="Ban khong duoc phep nhap ki tu !")
	@NumberFormat(style=Style.NUMBER)
	@NotNull(message="Please enter price for album !")
	@Min(value=0, message="Price not negative !")
	private Double price;

	
	@Size(max = 1024)
	private String albumArtUrl;

	@ManyToOne
	@JoinColumn(name = "GenreId")
	private Genre genre;

	@ManyToOne
	@JoinColumn(name = "ArtistId")
	private Artist artist;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "album")
    private Collection<RatingStar> ratingstarCollection;

	public Album() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getAlbumArtUrl() {
		return albumArtUrl;
	}

	public void setAlbumArtUrl(String albumArtUrl) {
		this.albumArtUrl = albumArtUrl;
	}

	public Genre getGenre() {
		return genre;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
	}

	public Artist getArtist() {
		return artist;
	}

	public void setArtist(Artist artist) {
		this.artist = artist;
	}
	
	public Collection<RatingStar> getRatingstarCollection() {
        return ratingstarCollection;
    }

    public void setRatingstarCollection(Collection<RatingStar> ratingstarCollection) {
        this.ratingstarCollection = ratingstarCollection;
    }

	@Override
	public String toString() {
		return "Album [id=" + id + ", title=" + title + ", price=" + price + ", albumArtUrl=" + albumArtUrl + ", genre="
				+ genre + ", artist=" + artist + "]";
	}

	
	
}
