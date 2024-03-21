/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author chi
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT top 12 *from Products order by id asc";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product a = new Product();
                a.setId(rs.getString(1));
                a.setCategoryId(rs.getString(2));
                a.setBrandId(rs.getString(3));
                a.setName(rs.getString(4));
                a.setImage(rs.getString(5));
                a.setPrice(rs.getString(6));
                a.setStock(rs.getString(7));
                a.setCreated_date(rs.getString(8));
                a.setDescription(rs.getString(9));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }
    
    public List<Product> getLastProduct(){
        List<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT top 4 * FROM Products ORDER BY Id desc";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product a = new Product();
                a.setId(rs.getString(1));
                a.setCategoryId(rs.getString(2));
                a.setBrandId(rs.getString(3));
                a.setName(rs.getString(4));
                a.setImage(rs.getString(5));
                a.setPrice(rs.getString(6));
                a.setStock(rs.getString(7));
                a.setCreated_date(rs.getString(8));
                a.setDescription(rs.getString(9));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getBestSeller(){
        List<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT top 4 * FROM Products ORDER BY Stock asc";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product a = new Product();
                a.setId(rs.getString(1));
                a.setCategoryId(rs.getString(2));
                a.setBrandId(rs.getString(3));
                a.setName(rs.getString(4));
                a.setImage(rs.getString(5));
                a.setPrice(rs.getString(6));
                a.setStock(rs.getString(7));
                a.setCreated_date(rs.getString(8));
                a.setDescription(rs.getString(9));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getFeatured(){
        List<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT top 4 * FROM Products ORDER BY Price desc";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product a = new Product();
                a.setId(rs.getString(1));
                a.setCategoryId(rs.getString(2));
                a.setBrandId(rs.getString(3));
                a.setName(rs.getString(4));
                a.setImage(rs.getString(5));
                a.setPrice(rs.getString(6));
                a.setStock(rs.getString(7));
                a.setCreated_date(rs.getString(8));
                a.setDescription(rs.getString(9));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> sort(String option){
        List<Product> list = new ArrayList<>();

        try {
            String sql = "";
            if(option.equals("1")){
                sql = "SELECT * FROM Products ORDER BY Price asc";
            }else if(option.equals("2")){
                sql = "SELECT * FROM Products ORDER BY Price desc";
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product a = new Product();
                a.setId(rs.getString(1));
                a.setCategoryId(rs.getString(2));
                a.setBrandId(rs.getString(3));
                a.setName(rs.getString(4));
                a.setImage(rs.getString(5));
                a.setPrice(rs.getString(6));
                a.setStock(rs.getString(7));
                a.setCreated_date(rs.getString(8));
                a.setDescription(rs.getString(9));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getNumberProduct(String cid, String bid) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select count(*) from Products p, Brands b, Categories c where p.BrandId = b.BrandId  \n"
                + "and p.CategoryId = c.Id\n"
                + "and p.BrandId like ?  and p.BrandId like ?";
        try {
            Connection conn = connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + bid + "%");
            ps.setString(2, "%" + cid + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public ArrayList<Product> getProduct(String cid, String bid, int index) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "  select * from [Products] p, Categories c, Brands b where p.CategoryId = c.id and\n"
                + "  p.BrandId = b.BrandId  "
                + "  and p.CategoryId like ?   and p.BrandId like ?"
                + " ORDER BY p.Id  OFFSET ? ROWS FETCH NEXT 8  ROWS ONLY";
        try {
            Connection conn = connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + cid + "%");
            ps.setString(2, "%" + bid + "%");
            ps.setInt(3, (index - 1) * 8);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product a = new Product();
                a.setId(rs.getString(1));
                a.setCategoryId(rs.getString(2));
                a.setBrandId(rs.getString(3));
                a.setName(rs.getString(4));
                a.setImage(rs.getString(5));
                a.setPrice(rs.getString(6));
                a.setStock(rs.getString(7));
                a.setCreated_date(rs.getString(8));
                a.setDescription(rs.getString(9));
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getAllProductByBrand(String brand) {
        List<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Products where BrandId = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, brand);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product a = new Product();
                a.setId(rs.getString(1));
                a.setCategoryId(rs.getString(2));
                a.setBrandId(rs.getString(3));
                a.setName(rs.getString(4));
                a.setImage(rs.getString(5));
                a.setPrice(rs.getString(6));
                a.setStock(rs.getString(7));
                a.setCreated_date(rs.getString(8));
                a.setDescription(rs.getString(9));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public List<Product> getAllProductByCategory(String category) {
        List<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Products where CategoryId = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, category);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product a = new Product();
                a.setId(rs.getString(1));
                a.setCategoryId(rs.getString(2));
                a.setBrandId(rs.getString(3));
                a.setName(rs.getString(4));
                a.setImage(rs.getString(5));
                a.setPrice(rs.getString(6));
                a.setStock(rs.getString(7));
                a.setCreated_date(rs.getString(8));
                a.setDescription(rs.getString(9));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public List<Product> getAllProductByName(String name) {
        List<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Products where name like ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + name + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product a = new Product();
                a.setId(rs.getString(1));
                a.setCategoryId(rs.getString(2));
                a.setBrandId(rs.getString(3));
                a.setName(rs.getString(4));
                a.setImage(rs.getString(5));
                a.setPrice(rs.getString(6));
                a.setStock(rs.getString(7));
                a.setCreated_date(rs.getString(8));
                a.setDescription(rs.getString(9));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }
    

    public Product getProductById(int pid) {
        String sql = " select * from [ShoeShop].[dbo].[Products] \n"
                + "  where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Category getCategoryById(int pid) {
        String sql = " select * from [ShoeShop].[dbo].[Categories] \n"
                + "  where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category p = new Category(rs.getString(1), rs.getString(2), rs.getString(3));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Brand getBrandById(int pid) {
        String sql = " select * from [ShoeShop].[dbo].[brands] \n"
                + "  where [BrandId] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Brand p = new Brand(rs.getString(1), rs.getString(2), rs.getString(3));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Product> getProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "  select * from [Products] ";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), getCategoryById(rs.getInt(2)), getBrandById(rs.getInt(3)), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Category> getCategory() {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "  select * from [Categories] ";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Brand> getBrand() {
        ArrayList<Brand> list = new ArrayList<>();
        String sql = "  select * from [Brands] ";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void AddProduct(String name, String price, int stock, String img, String descri, String category, String brand) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([CategoryId]\n"
                + "           ,[BrandId]\n"
                + "           ,[Name]\n"
                + "           ,[Image]\n"
                + "           ,[Price]\n"
                + "           ,[Stock]\n"
                + "           ,[Created_date]\n"
                + "           ,[Description])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,GETDATE()\n"
                + "           ,?)";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection conn = connection;
            ps = conn.prepareStatement(sql);
            ps.setString(1, category);
            ps.setString(2, brand);
            ps.setInt(6, stock);
            ps.setString(4, img);
            ps.setString(7, descri);
            ps.setString(5, price);
            ps.setString(3, name);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void DeleteProduct(String pid) {
        String sql = "delete from products where id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = connection;
            ps = conn.prepareStatement(sql);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateProduct(int id, String name, String price, int stock, String img, String descri, String category, String brand) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [CategoryId] = ?\n"
                + "      ,[BrandId] = ?\n"
                + "      ,[Name] = ?\n"
                + "      ,[Image] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Stock] = ?\n"
                + "      ,[Description] = ?\n"
                + " WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = connection;
            ps = conn.prepareStatement(sql);
            ps.setString(1, category);
            ps.setString(2, brand);
            ps.setString(3, name);
            ps.setString(5, price);
            ps.setInt(6, stock);
            ps.setString(4, img);
            ps.setString(7, descri);
            ps.setInt(8, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        ProductDAO d = new ProductDAO();
        System.out.println(d.getProduct());
    }

}
