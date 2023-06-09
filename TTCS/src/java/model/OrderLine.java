
package model;

public class OrderLine {
    /*
    	OrderId int references Orders(OrderId),
	ProId int references Products(ProId),
	quantity int not null,
	price int not null
	primary key (OrderId, ProId)
    */
    private int OrderId, ProId;
    private int quantity;
    private int price;

    public OrderLine() {
    }

    public OrderLine(int OrderId, int ProId, int quantity, int price) {
        this.OrderId = OrderId;
        this.ProId = ProId;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int OrderId) {
        this.OrderId = OrderId;
    }

    public int getProId() {
        return ProId;
    }

    public void setProId(int ProId) {
        this.ProId = ProId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
}
