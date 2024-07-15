/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import static Model.Book.getConnect;
import static Model.DatabaseInfo.DBURL;
import static Model.DatabaseInfo.DRIVERNAME;
import static Model.DatabaseInfo.PASSDB;
import static Model.DatabaseInfo.USERDB;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CartItem implements Serializable, DatabaseInfo {

    private int cartItemID;
    private int userID;
    private int bookID;
    private int languageID;
    private int quantity;
    private BigDecimal price;
    private BigDecimal priceDiscount;
    private BigDecimal totalPrice;

    public CartItem() {
    }

    public CartItem(int userID, int bookID, int languageID, int quantity, BigDecimal price, BigDecimal priceDiscount) {
        this.userID = userID;
        this.bookID = bookID;
        this.languageID = languageID;
        this.quantity = quantity;
        this.price = price;
        this.priceDiscount = priceDiscount;
    }

    public CartItem(int cartItemID, int userID, int bookID, int languageID, int quantity, BigDecimal price, BigDecimal priceDiscount, BigDecimal totalPrice) {
        this.cartItemID = cartItemID;
        this.userID = userID;
        this.bookID = bookID;
        this.languageID = languageID;
        this.quantity = quantity;
        this.price = price;
        this.priceDiscount = priceDiscount;
        this.totalPrice = totalPrice;
    }

    public int getCartItemID() {
        return cartItemID;
    }

    public void setCartItemID(int cartItemID) {
        this.cartItemID = cartItemID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public int getLanguageID() {
        return languageID;
    }

    public void setLanguageID(int languageID) {
        this.languageID = languageID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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
        return "CartItem{" + "cartItemID=" + cartItemID + ", userID=" + userID + ", bookID=" + bookID + ", languageID=" + languageID + ", quantity=" + quantity + ", price=" + price + ", priceDiscount=" + priceDiscount + ", totalPrice=" + totalPrice + '}';
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

    public CartItem getCartItem(int cartItemID) {
        CartItem c = null;
        try (Connection con = getConnect()) {
            String query = """
                           SELECT CartItem.CartItemID, CartItem.UserID, BookID,CartItem.LanguageID, Quantity, Price,PriceDiscount, TotalPrice
                            FROM CartItem 
                            WHERE cartItemID= ?""";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, cartItemID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                c = new CartItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
                        rs.getInt(5), rs.getBigDecimal(6), rs.getBigDecimal(7), rs.getBigDecimal(8));
            }
            con.close();
            return c;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getCartItemID(int userID, int bookID) {
        int c = 0;
        try (Connection con = getConnect()) {
            String query = """
                           SELECT CartItem.CartItemID
                            FROM CartItem 
                            WHERE userID= ? and bookID=?""";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, userID);
            stmt.setInt(2, bookID);
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

    public ArrayList<CartItem> getListCartItem(int userID) {
        ArrayList<CartItem> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            String query = """
                           SELECT CartItem.CartItemID, CartItem.UserID, BookID,CartItem.LanguageID, Quantity, Price,priceDiscount, TotalPrice
                            FROM CartItem inner join Users on CartItem.UserID=Users.UserID
                            WHERE Users.UserID = ?""";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, userID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new CartItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
                        rs.getInt(5), rs.getBigDecimal(6), rs.getBigDecimal(7), rs.getBigDecimal(8)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int newCartItem(CartItem cartItem) {
        int id = -1;
        String sql = """
                     INSERT INTO CartItem (UserID, BookID, LanguageID, Quantity, Price, PriceDiscount)
                     VALUES (?, ?,?, ?, ?,?)
                     """;

        try (Connection con = getConnect(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, cartItem.getUserID());
            stmt.setInt(2, cartItem.getBookID());
            stmt.setInt(3, cartItem.getLanguageID());
            stmt.setInt(4, cartItem.getQuantity());
            stmt.setBigDecimal(5, cartItem.getPrice());
            stmt.setBigDecimal(6, cartItem.getPriceDiscount());
            stmt.executeUpdate();
            id = getCartItemID(cartItem.getUserID(), cartItem.getBookID());

        } catch (SQLException ex) {
            Logger.getLogger(CartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public int deleteCartItem(int cartItemID) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement(" Delete CartItem where CartItemID=?");
            stmt.setInt(1, cartItemID);
            int rc = stmt.executeUpdate();
            con.close();
            return rc;
        } catch (Exception ex) {
            Logger.getLogger(CartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public CartItem updateCartItemQuantity(int cartItemID, int newQuantity) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt1 = con.prepareStatement(" update CartItem set quantity = ? where CartItemID=?");
            stmt1.setInt(1, newQuantity);
            stmt1.setInt(2, cartItemID);
            stmt1.executeUpdate();
            con.close();
            return getCartItem(cartItemID);
        } catch (Exception ex) {
            Logger.getLogger(CartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        CartItem s = new CartItem(3, 10, 1, 2, new BigDecimal("18.99"), new BigDecimal("15.99"));

        System.out.println(s.getLanguageNameByCartID(29));
    }

    public int noCartItemsByUserID(int userID) {
        int res = 0;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           select count(CartItemID) as noCartItems
                                                          from CartItem where userID = ?""");
            stmt.setInt(1, userID);
            ResultSet rc = stmt.executeQuery();
            
            while (rc.next()) {
                res = rc.getInt(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(CartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }
      public String getLanguageNameByCartID(int cartID) {
        String res = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           select bl.LanguageName 
                                                           from BookLanguageInfo bl inner join CartItem ci on bl.LanguageID=ci.LanguageID
                                                           where ci.CartItemID = ?""");
            stmt.setInt(1, cartID);
            ResultSet rc = stmt.executeQuery();
            
            while (rc.next()) {
                res = rc.getString(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(CartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }


}
