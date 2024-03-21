/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Cart;
import model.CartItem;
import model.Customer;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author chi
 */
public class OrderDAO extends DBContext {

    private static String INSERT_ORDER = "INSERT INTO [dbo].[Orders]\n"
            + "           ([UserId]\n"
            + "           ,[Order_date]\n"
            + "           ,[Total]\n"
            + "           ,[Notes])\n"
            + "     VALUES\n"
            + "           (?\n"
            + "           ,GETDATE()\n"
            + "           ,?\n"
            + "           ,?)";

    private static String INSERT_ORDER_DETAIL = "INSERT INTO [dbo].[OrderDetails]\n"
            + "           ([OrderId]\n"
            + "           ,[ProductId]\n"
            + "           ,[Price]\n"
            + "           ,[Quantity])\n"
            + "     VALUES\n"
            + "           (?\n"
            + "           ,?\n"
            + "           ,?\n"
            + "           ,?)";
        private static String GETBY_USERID = "select * from [Orders] where userid = ?";
        private static String GETODETAILBY_OID = "select * from [OrderDetails] where orderid = ?";

    public void insertOrder(Customer u, Cart cart) throws ClassNotFoundException, SQLException {
        Connection conn = connection;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = INSERT_ORDER;
            ps = conn.prepareStatement(sql);
            ps.setString(1, u.getId());
            ps.setDouble(2, cart.getTotalMoney());
            ps.setString(3, cart.getNote());
            ps.executeUpdate();
            String sql1 = "select top 1[OrderId] from [Orders] order by [OrderId] desc";
            ps = conn.prepareStatement(sql1);
            rs = ps.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (CartItem item : cart.getItems()) {
                    String sql2 = INSERT_ORDER_DETAIL;
                    ps = conn.prepareStatement(sql2);
                    ps.setInt(1, oid);
                    ps.setString(2, item.getProduct().getId());
                    ps.setString(3, item.getProduct().getPrice());
                    ps.setInt(4, item.getQuantity());
                    ps.executeUpdate();
                }
            }
            String sql3 = "update [dbo].[Products] set [Stock] = [Stock] - ? "
                    + "where id = ?";
            ps = conn.prepareStatement(sql3);
            for (CartItem item : cart.getItems()) {
                ps.setInt(1, item.getQuantity());
                ps.setString(2, item.getProduct().getId());
                ps.executeUpdate();
            }

        } catch (Exception e) {
        }
    }
    public ArrayList<Order> getAllOrderByuId(String uid) throws ClassNotFoundException, SQLException {
        ArrayList<Order> ol = new ArrayList<>();
        String sql = GETBY_USERID;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ol.add(new Order(rs.getString(1), new Customer(rs.getString(2)), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return ol;
    }
    ProductDAO dao = new ProductDAO();
    public ArrayList<OrderDetail> getAllOrderDetailByoId(String oid) throws ClassNotFoundException, SQLException {
        ArrayList<OrderDetail> odl = new ArrayList<>();
        String sql = GETODETAILBY_OID;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, oid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                odl.add(new OrderDetail(rs.getInt(1), rs.getInt(2), dao.getProductById(rs.getInt(3)), rs.getDouble(4), rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return odl;
    }
    public void deleteOrderByOid(String oid) throws ClassNotFoundException, SQLException {
    String sql = "DELETE FROM orders WHERE oid = ?";
    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, oid);
        ps.executeUpdate();
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu có
        e.printStackTrace();
        throw e;
    }
}

}
