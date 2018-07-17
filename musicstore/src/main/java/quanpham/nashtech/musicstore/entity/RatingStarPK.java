package quanpham.nashtech.musicstore.entity;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class RatingStarPK implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Basic(optional = false)
    @Column(name = "user_id")
    private int userId;
    @Basic(optional = false)
    @Column(name = "AlbumId")
    private int albumId;

    public RatingStarPK() {
    }

    public RatingStarPK(int userId, int albumId) {
        this.userId = userId;
        this.albumId = albumId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAlbumId() {
        return albumId;
    }

    public void setAlbumId(int albumId) {
        this.albumId = albumId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) userId;
        hash += (int) albumId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RatingStarPK)) {
            return false;
        }
        RatingStarPK other = (RatingStarPK) object;
        if (this.userId != other.userId) {
            return false;
        }
        if (this.albumId != other.albumId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "demo.RatingstarPK[ userId=" + userId + ", albumId=" + albumId + " ]";
    }
    
}

