package quanpham.nashtech.musicstore.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

@Entity
@Table(name="Orders")
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OrderId")
	private Integer Id;
	
	//@NotNull(message="Ngay khong duoc de trong!")
	@Column(name = "OrderDate")
	//@DateTimeFormat(pattern="YYYY/MM/DD")
    @Past
	//@Temporal(TemporalType.TIMESTAMP)
	private Date orderDate;
	@NotNull(message="Please enter username !")
	@Size(min = 4, max = 255,message="Username of you too short !")
	@Column(name = "UserName")
	private String userName;
	@NotNull(message="Please enter Address!")
	@Size(min = 5, max = 255,message="Address description is too short !")
	@Column(name = "Address")
	private String address;
	@NumberFormat(style=Style.NUMBER)
	@NotNull(message="Please enter phone number !")
	@Size(min = 10, max = 12,message="The phone number is incorrect  !")
	@Column(name = "Phone")
	private String phone;
	
	@Email(message="The email is incorrect !")
	@NotNull(message="Please enter email !")
	@Size(min = 5, max = 255,message="The email is incorrect !")
	@Column(name = "Email")
	private String email;
	@NotNull
	@Column(name = "Total")
	private double total;
	/*@OneToMany(mappedBy = "Id")
	private List<OrderDetail> orderdetail;*/

	public Order() {
	}



	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Order [Id=" + Id + ", orderDate=" + orderDate + ", userName=" + userName + ", address=" + address
				+ ", phone=" + phone + ", email=" + email + ", total=" + total + "]";
	}



	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	/*public List<OrderDetail> getOrderdetail() {
		return orderdetail;
	}

	public void setOrderdetail(List<OrderDetail> orderdetail) {
		this.orderdetail = orderdetail;
	}*/

	/*
	 * @Override public String toString() { return "Orders [Id=" + Id +
	 * ", orderDate=" + orderDate + ", userName=" + userName + ", firstName=" +
	 * firstName + ", lastName=" + lastName + ", address=" + address + ", city="
	 * + city + ", state=" + state + ", postalCode=" + postalCode + ", country="
	 * + country + ", phone=" + phone + ", email=" + email + ", total=" + total
	 * + ", orderdetail=" + orderdetail + "]"; }
	 */
	/*
	 * @Size(max = 160)
	 * 
	 * @Column(name = "FirstName") private String firstName;
	 * 
	 * @Size(max = 160)
	 * 
	 * @Column(name = "LastName") private String lastName;
	 * 
	 * @Size(max = 40)
	 * 
	 * @Column(name = "City") private String city;
	 * 
	 * @Size(max = 40)
	 * 
	 * @Column(name = "State") private String state;
	 * 
	 * @Size(max = 10)
	 * 
	 * @Column(name = "PostalCode") private String postalCode;
	 * 
	 * @Size(max = 45)
	 * 
	 * @Column(name = "Country") private String country;
	 */

}