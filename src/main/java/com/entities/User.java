package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int userId;

	@Column(name = "name")
	private String userName;

	@Column(name = "email")
	private String userEmail;

	@Column(name = "password")
	private String userPassword;

	@Column(name = "dob")
	private String userDOB;

	@Column(name = "mobile", length = 12)
	private String userMobileNumber;

	@Column(name = "gender")
	private String userGender;

	@Column(name = "address", length = 1500)
	private String userAddress;

	@Column(name = "user_type")
	private String userType;
	
	@Column(name = "user_pic",length = 1500)
	private String userPic;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int userId, String userName, String userEmail, String userPassword, String userDOB,
			String userMobileNumber, String userGender, String userAddress, String userType,String userPic) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userDOB = userDOB;
		this.userMobileNumber = userMobileNumber;
		this.userGender = userGender;
		this.userAddress = userAddress;
		this.userType = userType;
		this.userPic = userPic;

	}

	public User(String userName, String userEmail, String userPassword, String userDOB, String userMobileNumber,
			String userGender, String userAddress, String userType,String userPic) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userDOB = userDOB;
		this.userMobileNumber = userMobileNumber;
		this.userGender = userGender;
		this.userAddress = userAddress;
		this.userType = userType;
		this.userPic =userPic;

	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserDOB() {
		return userDOB;
	}

	public void setUserDOB(String userDOB) {
		this.userDOB = userDOB;
	}

	public String getUserMobileNumber() {
		return userMobileNumber;
	}

	public void setUserMobileNumber(String userMobileNumber) {
		this.userMobileNumber = userMobileNumber;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	

	public String getUserPic() {
		return userPic;
	}

	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword="
				+ userPassword + ", userDOB=" + userDOB + ", userMobileNumber=" + userMobileNumber + ", userGender="
				+ userGender + ", userAddress=" + userAddress + ", userType=" + userType + ", userPic=" + userPic + "]";
	}

	

}
