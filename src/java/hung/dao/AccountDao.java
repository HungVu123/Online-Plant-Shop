/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hung.dao;

import hung.dto.Account;
import hung.utils.DBUtils;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class AccountDao {

    public static boolean insertAccount(String newEmail, String newPassword, String newFullname, String newPhone, int newSatus, int newRole) {
        Connection cn = null;
        try {
            //buoc 1: mo ket noi
            cn = (Connection) DBUtils.makeConnection();
            //buoc 2: viet query va execute    
            if (cn != null) {
                String sql
                        = "INSERT INTO Accounts"
                        + "(email,password,fullname,phone,status,role)"
                        + "VALUES (?,?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, newEmail);//gan data vao dau cham ?
                pst.setString(2, newPassword);
                pst.setString(3, newFullname);
                pst.setString(4, newPhone);
                pst.setInt(5, newSatus);
                pst.setInt(6, newRole);
                pst.executeUpdate();
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static boolean updateAccount(String email, String newPassword, String newPhone, String newFullname){
        Connection cn = null;
        try {
            //buoc 1: mo ket noi
            cn = (Connection) DBUtils.makeConnection();
            //buoc 2: viet query va execute    
            if (cn != null) {
                String sql
                        = "update Accounts\n"
                        + "set password = ?,fullname=?, phone =? \n"
                        + "where email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                //gan data vao dau cham ?
                pst.setString(1, newPassword);
                pst.setString(2, newFullname);
                pst.setString(3, newPhone);
                pst.setString(4, email);
                pst.executeUpdate();
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    public static Account getAccount(String email, String password) {
        Connection cn = null;
        Account acc = null;
        try {
            //buoc 1: mo ket noi
            cn = (Connection) DBUtils.makeConnection();
            //buoc 2: viet query va execute    
            if (cn != null) {
                String sql = "select accId,email,password,fullname,phone,status,role\n"
                        + "from dbo.Accounts\n"
                        + "where status=1 and email = ? and password = ? COLLATE Latin1_General_CS_AS ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);//gan data vao dau cham ?
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
                    acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return acc;
    }

    public static int updateToken(String token, String email) {
        int result = 0;
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "update Accounts\n"
                        + "set token=?\n"
                        + "where email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
                pst.setString(2, email);
                result = pst.executeUpdate();
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static boolean updateAccountStatus(String email, int status) {
        Connection cn = null;
        try {
            //buoc 1: mo ket noi
            cn = (Connection) DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "update Accounts\n"
                        + "set status=?\n"
                        + "where email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setString(2, email);
                pst.executeUpdate();
                //buoc 4: dong ket noi
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static Account getAccount(String token) {
        Connection cn = null;
        Account acc = null;
        try {
            //buoc 1: mo ket noi
            cn = (Connection) DBUtils.makeConnection();
            //buoc 2: viet query va execute    
            if (cn != null) {
                String sql = "select accId,email,password,fullname,phone,status,role,token\n"
                        + "from dbo.Accounts\n"
                        + "where token = ? COLLATE Latin1_General_CS_AS ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);//gan data vao dau cham ?
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
                    String Token = rs.getString("token");
                    acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role, Token);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return acc;
    }

    public static ArrayList<Account> getAccounts(String keyword) {
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID,email,fullname,phone,status,role from dbo.Accounts\n"
                            + "where Accounts.email like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int accID = rs.getInt("AccID");
                        String email = rs.getString("Email");
                        String fullname = rs.getString("FullName");
                        String phone = rs.getString("Phone");
                        int status = rs.getInt("Status");
                        int role = rs.getInt("Role");
                        Account account = new Account(accID, email, fullname, status, phone, role);
                        list.add(account);
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
    
    public static boolean changeprofileAccount(String email,String newPhone, String newFullname){
        Connection cn = null;
        try {
            //buoc 1: mo ket noi
            cn = (Connection) DBUtils.makeConnection();
            //buoc 2: viet query va execute    
            if (cn != null) {
                String sql
                        = "update Accounts\n"
                        + "set fullname=?, phone =? \n"
                        + "where email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                //gan data vao dau cham ?
                pst.setString(1, newFullname);
                pst.setString(2, newPhone);
                pst.setString(3, email);
                pst.executeUpdate();
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
