
package model;

import java.sql.Date;


public class Order {
    /*
    	OrderId int primary key,
	OrderDate Date not null,
	UserId int references Users(UserID)
	totalAmount int not null
    */
    private int OrderId;
    private String OrderDate;
    private int UserId;
    private int totalAmount;

    public Order() {
    }

    public Order(int OrderId, String OrderDate, int UserId, int totalAmount) {
        this.OrderId = OrderId;
        this.OrderDate = OrderDate;
        this.UserId = UserId;
        this.totalAmount = totalAmount;
    }

    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int OrderId) {
        this.OrderId = OrderId;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    
    
}
