/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hung.dto;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class Order implements Serializable{
    private int orderID;
    private String orderDate;
    private String shipDate;
    private int status;
    private int accID;
    private String email;
    private String fullName;
    
    public Order(){
        
    }

    public Order(int orderID, String orderDate, String shipDate, int status, int accID, String email, String fullName) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.status = status;
        this.accID = accID;
        this.email = email;
        this.fullName = fullName;
    }
    
    
    public Order(int orderID, String orderDate, String shipDate, int accID) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.accID = accID;
    }

    
    public Order(int orderID, String orderDate, String shipDate, int status, int accID) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.status = status;
        this.accID = accID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    
    
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getShipDate() {
        return shipDate;
    }

    public void setShipDate(String shipDate) {
        this.shipDate = shipDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }
    
}
