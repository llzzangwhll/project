package com.example.headset0.security.model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
public class MemberDTO extends User {

	private String m_id;
	private String m_name;
	private String m_pwd;
	private String m_phone;
	private String m_email;
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private int m_point;
	private String m_gender;
	private String birthdate;  
	

	public MemberDTO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities,
			String m_id, String m_pwd, String m_name, String m_phone, String m_email, 
			String postcode, String address, String detailAddress,String extraAddress,
			String m_gender, String birthdate ) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name=m_name;
		this.m_email=m_email;
		this.m_phone=m_phone;
		this.postcode=postcode;
		this.address=address;
		this.detailAddress=detailAddress;
		this.extraAddress=extraAddress;
		this.m_gender=m_gender;
		this.birthdate=birthdate;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public int getM_point() {
		return m_point;
	}

	public void setM_point(int m_point) {
		this.m_point = m_point;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	@Override
	public String toString() {
		return "MemberDTO [m_id=" + m_id + ", m_name=" + m_name + ", m_pwd=" + m_pwd + ", m_phone=" + m_phone
				+ ", m_email=" + m_email + ", postcode=" + postcode + ", address=" + address + ", detailAddress="
				+ detailAddress + ", extraAddress=" + extraAddress + ", m_point=" + m_point + ", m_gender=" + m_gender
				+ ", birthdate=" + birthdate + "]";
	}

	

}

