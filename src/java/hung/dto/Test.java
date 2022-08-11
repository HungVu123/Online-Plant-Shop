/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hung.dto;

import hung.dao.AccountDao;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Test {
    public static void main(String[] args) {
//        Account acc=AccountDao.getAccount("admin@gmail.com", "admin");
//        if( acc != null){
//            if(acc.getRole()==1){
//                System.out.println("i am an admin");
//           
//            }else{
//                System.out.println("i am an user");
//            }
//        }else{
//            System.out.println("login failed");
//        }
//        if(AccountDao.insertAccount("test45@gmail.com", "123", "chi pheo","012345", 1, 0)){
//            System.out.println("add new acount successfully");
//            
//        }else{
//            System.out.println("insert new account fail");
//        }
//        ArrayList<Account>list = AccountDao.getAccounts();
//        for (Account account : list) {
//            System.out.println(account.getAccID()+","+account.getEmail()+","+account.getFullName()+","+account.getPassword());
//        }
//    if(AccountDao.updateAccountStatus("test@gmail.com", 0))
//            System.out.println("update success");
//    else System.out.println("update fail");
//    if(AccountDao.updateAccount("test@gmail.com", "test","thino","64654894"))
//            System.out.println("update success");
//    else System.out.println("update fail");  
  if(AccountDao.changeprofileAccount("test@gmail.com","1234", "hungvu")){
      System.out.println("success");
  } else System.out.println("failed");
      
    }
}
