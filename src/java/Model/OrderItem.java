/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import static Model.Book.getConnect;
import static Model.CartItem.getConnect;
import static Model.DatabaseInfo.DBURL;
import static Model.DatabaseInfo.DRIVERNAME;
import static Model.DatabaseInfo.PASSDB;
import static Model.DatabaseInfo.USERDB;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderItem implements Serializable, DatabaseInfo {

    private int orderItemID;
    private Integer orderID; // OrderID can be null, so use Integer instead of int
    private int bookID;
    private int quantity;
    private int languageID;
    private BigDecimal price;
    private BigDecimal priceDiscount;
    private BigDecimal totalPrice;

    // Default constructor
    public OrderItem() {
    }

    // Parameterized constructor
    public OrderItem(int orderItemID, Integer orderID, int bookID, int quantity, int languageID, BigDecimal price, BigDecimal priceDiscount, BigDecimal totalPrice) {
        this.orderItemID = orderItemID;
        this.orderID = orderID;
        this.bookID = bookID;
        this.quantity = quantity;
        this.languageID = languageID;
        this.price = price;
        this.priceDiscount = priceDiscount;
        this.totalPrice = totalPrice;
    }

    // Getters and Setters
    public int getOrderItemID() {
        return orderItemID;
    }

    public void setOrderItemID(int orderItemID) {
        this.orderItemID = orderItemID;
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getLanguageID() {
        return languageID;
    }

    public void setLanguageID(int languageID) {
        this.languageID = languageID;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPriceDiscount() {
        return priceDiscount;
    }

    public void setPriceDiscount(BigDecimal priceDiscount) {
        this.priceDiscount = priceDiscount;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "OrderItem{" + "orderItemID=" + orderItemID + ", orderID=" + orderID + ", bookID=" + bookID + ", quantity=" + quantity + ", languageID=" + languageID + ", price=" + price + ", priceDiscount=" + priceDiscount + ", totalPrice=" + totalPrice + '}';
    }

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        try {
            Connection con = DriverManager.getConnection(DBURL, USERDB, PASSDB);
            return con;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public OrderItem getOrderItem(int orderItemID) {
        OrderItem c = null;
        try (Connection con = getConnect()) {
            String query = """
                           SELECT OrderItemID, OrderID, BookID, Quantity, LanguageID, Price, PriceDiscount, TotalPrice
                                                        FROM OrderItem 
                                                        WHERE OrderItemID= ?""";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, orderItemID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                c = new OrderItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
                        rs.getInt(5), rs.getBigDecimal(6), rs.getBigDecimal(7), rs.getBigDecimal(8));
            }
            con.close();
            return c;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getOrderItemID(int cartItemID) {
        int c = 0;
        try (Connection con = getConnect()) {
            String query = """
                           SELECT OrderItem.OrderItemID
                            FROM OrderItem 
                            WHERE OrderItemID=?""";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, cartItemID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                c = rs.getInt(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public int transformToOrderItem(int cartItemID) {
        int id = -1;
        try (Connection con = getConnect()) {
            String sql = """
                    INSERT INTO OrderItem (OrderItemID, OrderID, BookID, Quantity, LanguageID, Price, PriceDiscount)
                                          SELECT 
                                              CartItemID, -- Use CartItemID as OrderItemID
                                              NULL,       -- Set OrderID to NULL
                                              BookID, 
                                              Quantity, 
                                              LanguageID, 
                                              Price, 
                                              PriceDiscount
                                          FROM 
                                              CartItem                   	
                                          WHERE CartItemID=?
                     """;
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, cartItemID);
            stmt.executeUpdate();
            id = getOrderItemID(cartItemID);
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public int deleteOderItem(int cartItemID) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement(" Delete OrderItem where OrderItemID=?");
            stmt.setInt(1, cartItemID);
            int rc = stmt.executeUpdate();
            con.close();
            return rc;
        } catch (Exception ex) {
            Logger.getLogger(CartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public OrderItem updateOrderItemQuantity(int orderItemID, int newQuantity) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt1 = con.prepareStatement(" update OrderItem set quantity = ? where OrderItemID=?");
            stmt1.setInt(1, newQuantity);
            stmt1.setInt(2, orderItemID);
            stmt1.executeUpdate();
            con.close();
            return getOrderItem(orderItemID);
        } catch (Exception ex) {
            Logger.getLogger(CartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
       public ArrayList<OrderItem> getListOrderItemFromOrderID(int orderID) {
        ArrayList<OrderItem> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            String query = """
                          SELECT OrderItemID, OrderID, BookID, Quantity, LanguageID, Price, PriceDiscount, TotalPrice
                                                                                   FROM OrderItem 
                                                                                   WHERE OrderID=?""";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, orderID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new OrderItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
                        rs.getInt(5), rs.getBigDecimal(6), rs.getBigDecimal(7), rs.getBigDecimal(8)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        OrderItem o = new OrderItem();
        System.out.println(o.updateOrderItemQuantity(1,2));
    }
}
