/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;

/**
 *
 * @author chi
 */
public class CustomerDAO extends DBContext {

    public List<Customer> getAllAccount() {
        List<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM Customers";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Customer getByUserNamePassword(String username, String password) {
        try {
            String sql = "Select * from Customers where username = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Customer account = new Customer();
                account.setId(rs.getString(1));
                account.setUsername(rs.getString(2));
                account.setFullname(rs.getString(3));
                account.setPassword(rs.getString(4));
                account.setPhone(rs.getString(5));
                account.setAddress(rs.getString(6));
                account.setRoleId(rs.getString(7));

                return account;
            }
            rs.close();
        } catch (SQLException ex) {
        }
        return null;
    }

    public void updateProfile(String fullname, String address, String phone, String id) {
        String sql = "UPDATE Customers\n"
                + "SET Fullname = ?,\n"
                + "	[Address] = ?,\n"
                + "	Phone = ?\n"
                + "WHERE Id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, id);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void changePassword(String username, String newPassword) {
        String query = "UPDATE Customers\n"
                + "SET [Password] = ?\n"
                + "WHERE Username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void inserUser(String username, String fullname, String password, String phone, String address) {
        String sql = "INSERT INTO [dbo].[Customers]\n"
                + "           ([Username]\n"
                + "           ,[Fullname]\n"
                + "           ,[Password]\n"
                + "           ,[Phone]\n"
                + "           ,[Address]\n"
                + "           ,[RoleId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,'US')";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, fullname);
            ps.setString(3, password);
            ps.setString(4, password);
            ps.setString(5, address);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Customer checkAccountExist(String user) {
        try {
            String sql = "SELECT * FROM Customers where [user] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getString(1));
                c.setUsername(rs.getString(2));
                c.setFullname(rs.getString(3));
                c.setPassword(rs.getString(4));
                c.setPhone(rs.getString(5));
                c.setAddress(rs.getString(6));
                c.setRoleId(rs.getString(7));

                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void UpDatePassWord(String pass, String user) {
        try {
            String sql = "UPDATE [Customers]\n"
                    + "   SET [Password] = ?\n"
                    + " WHERE [Username] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pass);
            stm.setString(2, user);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void block(String id) {
        String sql = "UPDATE Customers\n"
                + "SET RoleId = 'BL'\n"
                + "WHERE Id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void unlock(String id) {
        String sql = "UPDATE Customers\n"
                + "SET RoleId = 'US'\n"
                + "WHERE Id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        CustomerDAO d = new CustomerDAO();
        List<Customer> list = d.getAllAccount();
        for (Customer customer : list) {
            System.out.println(customer);
        }

    }

}
