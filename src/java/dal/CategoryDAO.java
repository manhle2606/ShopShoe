/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Category;

/**
 *
 * @author chi
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Categories";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category a = new Category();
                a.setId(rs.getString(1));
                a.setName(rs.getString(2));
                a.setImage(rs.getString(3));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public Category getCateById(String id) {
        String sql = "SELECT * FROM Categories\n"
                + "WHERE Id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Category(rs.getString(1), rs.getString(2), rs.getString(3));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateCategory(String name, String id) {
        String sql = "UPDATE Categories\n"
                + "SET [Name] = ?\n"
                + "WHERE Id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addCategory(String name) {
        String sql = "INSERT INTO Categories\n"
                + "VALUES(?, null)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCate(String id) {
        String sql = "DELETE FROM Categories\n"
                + "WHERE Id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
