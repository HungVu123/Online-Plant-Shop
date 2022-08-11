/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hung.dao;

import hung.dto.OrderDetail;
import hung.dto.Order;
import hung.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    public static ArrayList<Order> getOrders(String email) {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID,OrdDate,shipdate,dbo.Orders.status,dbo.Orders.AccID\n" 
                        + "from dbo.Orders join dbo.Accounts on dbo.Orders.AccID = dbo.Accounts.accID\n"
                        + "where dbo.Accounts.email=? COLLATE Latin1_General_CS_AS ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1,email );
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        String orderDate = rs.getString("OrdDate");
                        String shipDate = rs.getString("shipdate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("AccID");
                        Order orders = new Order(orderID, orderDate, shipDate, status, accID);
                        list.add(orders);
                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }
    }
    
    public static ArrayList<Order> getCompletedOrders(String email ,int status) {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID,OrdDate,shipdate,dbo.Orders.AccID\n" 
                        + "from dbo.Orders join dbo.Accounts on dbo.Orders.AccID = dbo.Accounts.accID\n"
                        + "where dbo.Accounts.email=? COLLATE Latin1_General_CS_AS and dbo.Orders.status = ? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1,email );
                pst.setInt(2, status);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        String orderDate = rs.getString("OrdDate");
                        String shipDate = rs.getString("shipdate");
                        int accID = rs.getInt("AccID");
                        Order orders = new Order(orderID, orderDate, shipDate, accID);
                        list.add(orders);
                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }
    }

    public static ArrayList<OrderDetail> getOrderDetail(int orderID) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select DetailId,OrderID,PID,PName,price,imgPath,quantity\n"
                        + "from OrderDetails, Plants\n "
                        + "where OrderID=? and OrderDetails.FID=Plants.PID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int detailID = rs.getInt("DetailId");
                        int PlantID = rs.getInt("PID");
                        String PlanName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        int quantity = rs.getInt("quantity");
                        OrderDetail orderdetail = new OrderDetail(detailID, orderID, PlantID, PlanName, price, imgPath, quantity);
                        list.add(orderdetail);
                    }

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }
    }
    
    public static boolean insertOrder(String email, HashMap<String,Integer> cart){
        Connection cn=null;
        boolean result = false;
        try{
            cn=DBUtils.makeConnection();
            if(cn != null ){
                int accid=0,orderid=0;
                cn.setAutoCommit(false);//off autocommit
                //get account id by email
                String sql = "select accID from Accounts where Accounts.email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if(rs != null && rs.next()) accid = rs.getInt("accID");
                //insert a new order
                System.out.println("accountid:" +accid);
                Date d = new Date(System.currentTimeMillis());
                System.out.println("order date:" + d);
                sql = "insert Orders(OrdDate,status,AccID) values(?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setDate(1, d);
                pst.setInt(2, 1);
                pst.setInt(3, accid);
                pst.executeUpdate();
                //get order id that is the largest number
                sql = "select top 1 orderID from Orders order by orderId DESC";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if(rs != null && rs.next()) orderid = rs.getInt("orderID");
                // insert order details
                System.out.println("orderid:" + orderid);
                Set<String> pids = cart.keySet();
                for (String pid : pids) {
                    sql = "insert OrderDetails values(?,?,?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderid);
                    pst.setInt(2, Integer.parseInt(pid.trim()));
                    pst.setInt(3, cart.get(pid));
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
                return true;
            } else{
                System.out.println("k chen order dc ");
        }
        }catch(Exception e){
            try{
                if(cn!= null) cn.rollback();
            }catch(SQLException ex){
                ex.printStackTrace();
            }
            e.printStackTrace();
            result=false;
        }
        finally{try{
            if(cn!= null) cn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        }
        return result;
        
    }
    
    public static ArrayList<Order> getFilterDate(String email,String DateFrom, String DateTo) {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
        if (cn != null) {
                String sql = "select OrderID,OrdDate,shipdate,dbo.Orders.status,dbo.Orders.AccID\n" 
                        + "from dbo.Orders join dbo.Accounts on dbo.Orders.AccID = dbo.Accounts.accID\n"
                        + "where dbo.Accounts.email=? COLLATE Latin1_General_CS_AS and OrdDate BETWEEN ? and ? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1,email );
                pst.setString(2,DateFrom );
                pst.setString(3,DateTo );
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        String orderDate = rs.getString("OrdDate");
                        String shipDate = rs.getString("shipdate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("AccID");
                        Order orders = new Order(orderID, orderDate, shipDate, status, accID);
                        list.add(orders);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }
    }
    
    public static ArrayList<Order> getOrder(String keyword) {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID,dbo.Accounts.email,dbo.Accounts.fullname,OrdDate,shipdate,dbo.Orders.status\n"
                             + "from dbo.Orders join dbo.Accounts on dbo.Orders.AccID = dbo.Accounts.accID\n"
                             + "where Accounts.email like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        String Email = rs.getString("email");
                        String FullName = rs.getString("fullname");
                        String orderDate = rs.getString("OrdDate");
                        String shipDate = rs.getString("shipdate");
                        int status = rs.getInt("status");
                        Order p = new Order(orderID, orderDate, shipDate, status, orderID, Email, FullName);
                        list.add(p);
                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }
    }
}
