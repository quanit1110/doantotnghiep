package quanpham.nashtech.musicstore.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Quan Pham
 */
@Entity
@Table(name = "ratingstar")

public class RatingStar implements Serializable {

	private static final long serialVersionUID = 1L;
	@EmbeddedId
	protected RatingStarPK ratingstarPK;
	@Column(name = "rating_star")
	private Integer ratingStar;
	@JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false)
	@ManyToOne(optional = false)
	private User user;
	@JoinColumn(name = "AlbumId", referencedColumnName = "AlbumId", insertable = false, updatable = false)
	@ManyToOne(optional = false)
	private Album album;

	public RatingStar() {
	}

	public RatingStar(RatingStarPK ratingstarPK) {
		this.ratingstarPK = ratingstarPK;
	}

	public RatingStar(int userId, int albumId) {
		this.ratingstarPK = new RatingStarPK(userId, albumId);
	}

	public RatingStarPK getRatingstarPK() {
		return ratingstarPK;
	}

	public void setRatingstarPK(RatingStarPK ratingstarPK) {
		this.ratingstarPK = ratingstarPK;
	}

	public Integer getRatingStar() {
		return ratingStar;
	}

	public void setRatingStar(Integer ratingStar) {
		this.ratingStar = ratingStar;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (ratingstarPK != null ? ratingstarPK.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		// TODO: Warning - this method won't work in the case the id fields are
		// not set
		if (!(object instanceof RatingStar)) {
			return false;
		}
		RatingStar other = (RatingStar) object;
		if ((this.ratingstarPK == null && other.ratingstarPK != null)
				|| (this.ratingstarPK != null && !this.ratingstarPK.equals(other.ratingstarPK))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "demo.Ratingstar[ ratingstarPK=" + ratingstarPK + " ]";
	}

}
