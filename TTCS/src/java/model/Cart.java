/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Cart {
    public List<Item> items;
    public Cart(){
        items = new ArrayList<>();
    }
    private Product getProductById(int id,List<Product> list){
        for(Product i:list){
            if(i.getProId()==id){
                return i;
            }
        }
        return null;
    }
    public Cart(String txt,List<Product> list){
        items = new ArrayList<>();
        try {
            if(txt!=null && txt.length()!=0){
                String [] s = txt.split("/");
                for(String i:s){
                    String[] n= i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    Item t = new Item(getProductById(id, list), quantity, getProductById(id, list).getPrice());
                    addItem(t);
                }
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }
    public List<Item> getItems(){
        return items;
    }
    public void setItems(List<Item> items){
        this.items=items;
    }
    private Item getItemById(int id) {
        for(Item i:items){
            if(i.getProduct().getProId()==id){
                return i;
            }
        }
        return null;
    }
    public int getQuantityById(int id){
        return getItemById(id).getQuantity();
    }
    public void addItem(Item t){
        if(getItemById(t.getProduct().getProId()) != null){
            Item m = getItemById(t.getProduct().getProId());
            m.setQuantity(m.getQuantity()+t.getQuantity());
        }
        else{
            items.add(t);
        }
    }
    public void removeItem(int id){
        if(getItemById(id) != null){
            items.remove(getItemById(id));
        }
    }
    public int getTotalMoney(){
        int t=0;
        for(Item i:items){
            t+= (i.getQuantity()* i.getProduct().getPrice());
        }
        return t;
    }
}
