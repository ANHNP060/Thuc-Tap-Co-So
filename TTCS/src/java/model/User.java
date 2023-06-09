/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class User {
    private int UserId;
    private String Username , Password, Email, Phone_number, Address ;

    public User() {
    }

    public User(int UserId, String Username, String Password, String Email, String Phone_number, String Address) {
        this.UserId = UserId;
        this.Username = Username;
        this.Password = Password;
        this.Email = Email;
        this.Phone_number = Phone_number;
        this.Address = Address;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone_number() {
        return Phone_number;
    }

    public void setPhone_number(String Phone_number) {
        this.Phone_number = Phone_number;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }
    
@Override
	public String toString() {
		return "user [UserId=" + UserId + ", Username=" + Username + ", email=" + Email + ", phoneNumber=" + Phone_number
				+ ", address=" + Address + ", password=" + Password + "]";
	}
    
}
