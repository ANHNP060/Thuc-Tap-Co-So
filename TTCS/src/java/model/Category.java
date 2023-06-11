/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Category {
    private int CateId;
    private String NameCate;

    public Category() {
    }

    public Category(int CateId, String NameCate) {
        this.CateId = CateId;
        this.NameCate = NameCate;
    }

    public int getCateId() {
        return CateId;
    }

    public void setCateId(int CateId) {
        this.CateId = CateId;
    }

    public String getNameCate() {
        return NameCate;
    }

    public void setNameCate(String NameCate) {
        this.NameCate = NameCate;
    }
    @Override
	public String toString() {
		return "Category [CateId=" + CateId + ", NameCate=" + NameCate + "]";
	}
}
