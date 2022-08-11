/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hung.dto;

/**
 *
 * @author Admin
 */
public class OrderDetail {
    private int orderDetailID;
    private int orderID;
    private int plantID;
    private String PlantName;
    private int price;
    private String imgpath;
    private int quantity;

    public OrderDetail(){
        
    }
    
    public OrderDetail(int orderDetailID, int orderID, int plantID, String PlantName, int price, String imgpath, int quantity) {
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.plantID = plantID;
        this.PlantName = PlantName;
        this.price = price;
        this.imgpath = imgpath;
        this.quantity = quantity;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getPlantID() {
        return plantID;
    }

    public void setPlantID(int plantID) {
        this.plantID = plantID;
    }

    public String getPlantName() {
        return PlantName;
    }

    public void setPlantName(String PlantName) {
        this.PlantName = PlantName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getimgPath() {
        return imgpath;
    }

    public void setimgPath(String ImgPath) {
        this.imgpath = imgpath;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
