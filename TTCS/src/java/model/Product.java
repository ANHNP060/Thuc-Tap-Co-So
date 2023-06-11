
package model;

public class Product {
    private int ProId;

	private String NamePro, ImagePro;
    private int Price, Quantity;
    Category CateId;
    Describe DesId;

    public Product() {
    }

    public Product(int ProId, String NamePro, String ImagePro, int Price, int Quantity, Category CateId, Describe DesId) {
        this.ProId = ProId;
        this.NamePro = NamePro;
        this.ImagePro = ImagePro;
        this.Price = Price;
        this.Quantity = Quantity;
        this.CateId = CateId;
        this.DesId = DesId;
    }
    
    public Product(String NamePro, String ImagePro, int Price, int Quantity, Category CateId) {
        this.NamePro = NamePro;
        this.ImagePro = ImagePro;
        this.Price = Price;
        this.Quantity = Quantity;
        this.CateId = CateId;
    }

    public int getProId() {
        return ProId;
    }

    public void setProId(int ProId) {
        this.ProId = ProId;
    }

    public String getNamePro() {
        return NamePro;
    }

    public void setNamePro(String NamePro) {
        this.NamePro = NamePro;
    }

    public String getImagePro() {
        return ImagePro;
    }

    public void setImagePro(String ImagePro) {
        this.ImagePro = ImagePro;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public Category getCateId() {
        return CateId;
    }

    public void setCateId(Category CateId) {
        this.CateId = CateId;
    }

    public Describe getDesId() {
        return DesId;
    }

    public void setDesId(Describe DesId) {
        this.DesId = DesId;
    }
    
    @Override
    public String toString() {
    	return "Product [ProId=" + ProId + ", NamePro=" + NamePro + ", ImagePro=" + ImagePro + ", Price=" + Price
    			+ ", Quantity=" + Quantity + ", CateId=" + CateId + ", DesId=" + DesId + "]";
    }
}