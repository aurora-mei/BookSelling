/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import static Model.Book.getConnect;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.tomcat.jakartaee.commons.lang3.tuple.Pair;

public class Order implements Serializable, DatabaseInfo {

    private int orderID;
    private int userID;
    private int shippingMethodID;
    private int userAddressID;
    private int cardID;
    private int voucherID;
    private BigDecimal originPrice;
    private BigDecimal totalPrice;
    private Date orderDate;

    // Constructors
    public Order() {
    }

    public Order(int orderID, int userID, int shippingMethodID, int userAddressID, int cardID, int voucherID, BigDecimal originPrice, BigDecimal totalPrice, Date orderDate) {
        this.orderID = orderID;
        this.userID = userID;
        this.shippingMethodID = shippingMethodID;
        this.userAddressID = userAddressID;
        this.cardID = cardID;
        this.voucherID = voucherID;
        this.originPrice = originPrice;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
    }

    // Getters and Setters
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getShippingMethodID() {
        return shippingMethodID;
    }

    public void setShippingMethodID(int shippingMethodID) {
        this.shippingMethodID = shippingMethodID;
    }

    public int getUserAddressID() {
        return userAddressID;
    }

    public void setUserAddressID(int userAddressID) {
        this.userAddressID = userAddressID;
    }

    public int getCardID() {
        return cardID;
    }

    public void setCardID(int cardID) {
        this.cardID = cardID;
    }

    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

    public BigDecimal getOriginPrice() {
        return originPrice;
    }

    public void setOriginPrice(BigDecimal originPrice) {
        this.originPrice = originPrice;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", userID=" + userID + ", shippingMethodID=" + shippingMethodID + ", userAddressID=" + userAddressID + ", cardID=" + cardID + ", voucherID=" + voucherID + ", originPrice=" + originPrice + ", totalPrice=" + totalPrice + ", orderDate=" + orderDate + '}';
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

    public Order getOrder(int id) {
        Order s = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                          SELECT orderID, UserID, ShippingMethodID, UserAddressID, CardID, VoucherID, originPrice, TotalPrice, OrderDate
                                                          FROM Orders WHERE orderID=?
                                                          """);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = new Order(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getInt(5),
                        rs.getInt(6), rs.getBigDecimal(7),
                        rs.getBigDecimal(8), rs.getDate(9));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public BigDecimal getVoucherValueByVID(int voucherID) {
        BigDecimal s = new BigDecimal("0");
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           SELECT VoucherValue
                                                            FROM VoucherOrder WHERE VoucherID=?
                                                          """);
            stmt.setInt(1, voucherID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = rs.getBigDecimal(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public BigDecimal getShippingCostBySID(int shippingID) {
        BigDecimal s = new BigDecimal("0");
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                        SELECT cost
                                                        FROM ShippingMethodInfo WHERE ShippingMethodID=?
                                                          """);
            stmt.setInt(1, shippingID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = rs.getBigDecimal(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public String getPaymentNameByCardID(int cardID) {
        if (cardID == 0) {
            return "Cash On Delivery";
        }
        String s = "";
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                SELECT pm.PaymentName
                                FROM Cards c inner join PaymentMethod pm on c.PaymentMethodID=pm.PaymentMethodID
                                WHERE c.CardID=?
                                                          """);
            stmt.setInt(1, cardID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = rs.getString(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public ArrayList<Order> getListOrderByUserID(int userID) {
        ArrayList<Order> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           SELECT orderID, UserID, ShippingMethodID, UserAddressID,
                                                          CardID, VoucherID, originPrice, TotalPrice, OrderDate
                                                       FROM Orders where UserID=?
                                                            """);
            stmt.setInt(1, userID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getInt(5), rs.getInt(6),
                        rs.getBigDecimal(7), rs.getBigDecimal(8), rs.getDate(9)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Book> getListBookByOrderID(int orderID) {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                          select bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity,
                                                                              bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL
                                                                              from BookInfo bi inner join OrderItem oi on bi.bookID = oi.bookID
                                                          where orderID=?
                                                            """);
            stmt.setInt(1, orderID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getBigDecimal(4), rs.getBigDecimal(5), rs.getInt(6),
                        rs.getInt(7), rs.getDate(8), rs.getString(9),
                        rs.getString(10), rs.getString(11)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<OrderItem> getListOrderItemByOrderID(int orderID) {
        ArrayList<OrderItem> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                         SELECT OrderItemID, OrderID, BookID, Quantity, LanguageID, Price, PriceDiscount, TotalPrice
                                                        FROM OrderItem  
                                                          where orderID=?
                                                            """);
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
    
       public Map<OrderItem, Book> getOrderItemsWithBooksMap() {
        Map<OrderItem, Book> itemsWithBooksMap = new HashMap<>();
        ArrayList<OrderItem> orderItems = getListOrderItemByOrderID(getOrderID());
        ArrayList<Book> books = getListBookByOrderID(getOrderID());
        
        // Populate the HashMap
        for (OrderItem item : orderItems) {
            for (Book book : books) {
                if (item.getBookID() == book.getBookID()) {
                    itemsWithBooksMap.put(item, book);
                    break;
                }
            }
        }
        return itemsWithBooksMap;
    }

    public int proceedCheckout(int userID, String voucherCode, BigDecimal originPrice, ArrayList<Integer> cartItemIDs) {
        int id = -1;
        try (Connection con = getConnect()) {
            PreparedStatement stmt;
            Voucher vou = new Voucher();
            vou = vou.getVoucherByCode(voucherCode);
            if (vou != null) {
                String sql = """
                 INSERT INTO Orders (UserID, VoucherID, originPrice, OrderDate)
                 OUTPUT inserted.OrderID
                 VALUES (?, ?, ?, ?)
                 """;
                stmt = con.prepareStatement(sql);
                stmt.setInt(1, userID);
                stmt.setBigDecimal(3, originPrice);
                stmt.setDate(4, java.sql.Date.valueOf(LocalDate.now()));
                stmt.setInt(2, vou.getVoucherID());
            } else {
                String sql = """
                 INSERT INTO Orders (UserID, originPrice, OrderDate)
                 OUTPUT inserted.OrderID
                 VALUES (?, ?, ?)
                 """;
                stmt = con.prepareStatement(sql);
                stmt.setInt(1, userID);
                stmt.setBigDecimal(2, originPrice);
                stmt.setDate(3, java.sql.Date.valueOf(LocalDate.now()));
            }
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }

            // Create the IN clause
            StringBuilder inClause = new StringBuilder();
            for (Integer cartItemID : cartItemIDs) {
                inClause.append("?,");
            }
            // Remove the trailing comma
            inClause.setLength(inClause.length() - 1);

            String sql2 = "Update OrderItem set OrderID=? where OrderItemID in (" + inClause.toString() + ")";
            PreparedStatement stmt2 = con.prepareStatement(sql2);
            stmt2.setInt(1, id);
            // Set each cartItemID
            for (int i = 0; i < cartItemIDs.size(); i++) {
                stmt2.setInt(i + 2, cartItemIDs.get(i));
            }
            stmt2.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public int deleteOrder(int orderID) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           DELETE OrderItem
                                                           WHERE OrderID =?
                                                           """);
            stmt.setInt(1, orderID);
            int rc = stmt.executeUpdate();

            PreparedStatement stmt2 = con.prepareStatement("Delete Orders where orderID=?");
            stmt2.setInt(1, orderID);
            stmt2.executeUpdate();
            con.close();
            return rc;
        } catch (Exception ex) {
            Logger.getLogger(CartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int placeOrder(int orderID, int shippingID, int addressID, int cardID) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           UPDATE Orders
                                                           SET ShippingMethodID = ?,
                                                               UserAddressID = ?,
                                                               CardID = ? WHERE OrderID=?
                                                           """);
            stmt.setInt(1, shippingID);
            stmt.setInt(2, addressID);
            if (cardID == 0) {
                stmt.setObject(3, null);
            } else {
                stmt.setInt(3, cardID);
            }
            stmt.setInt(4, orderID);
            stmt.executeUpdate();

            PreparedStatement stmt2 = con.prepareStatement("""
                                                           UPDATE Orders
                                                           SET 
                                                               TotalPrice = Orders.originPrice - ISNULL(VoucherOrder.VoucherValue, 0) + ShippingMethodInfo.Cost
                                                           FROM Orders
                                                           LEFT JOIN VoucherOrder ON Orders.VoucherID = VoucherOrder.VoucherID
                                                           INNER JOIN ShippingMethodInfo ON Orders.ShippingMethodID = ShippingMethodInfo.ShippingMethodID
                                                           WHERE OrderID =?""");
            stmt2.setInt(1, orderID);
            stmt2.executeUpdate();
            PreparedStatement stmt3 = con.prepareStatement("""
                                                            Delete CartItem
                                                           WHERE CartItemID in 
                                                           (select OrderItemID
                                                           from OrderItem where OrderID = ?)
                                                           """);
            stmt3.setInt(1, orderID);
            stmt3.executeUpdate();
            con.close();
            return orderID;
        } catch (Exception ex) {
            Logger.getLogger(CartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int afterPlaceOrder(int orderID) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt3 = con.prepareStatement("""
                                                            Delete CartItem
                                                           WHERE CartItemID in 
                                                           (select OrderItemID
                                                           from OrderItem where OrderID = ?)
                                                           """);
            stmt3.setInt(1, orderID);
            stmt3.executeUpdate();
            con.close();
            return orderID;
        } catch (Exception ex) {
            Logger.getLogger(CartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public double getRevenueByDate(String date) throws SQLException {
        double revenue = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = Order.getConnect(); // Giả sử bạn có lớp Database để lấy kết nối
            String query = "SELECT SUM(total_price) AS revenue FROM orders WHERE order_date = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, date);
            rs = ps.executeQuery();

            if (rs.next()) {
                revenue = rs.getDouble("revenue");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conn.close(); // Đảm bảo đóng kết nối, statement và result set
        }

        return revenue;
    }

    public static void main(String[] args) {
        Order instance = new Order();
//        System.out.println(instance.placeOrder(1,1,1,0));
//System.out.println("abc");
//        System.out.println(instance.placeOrder(1,1,1,0));
        ArrayList<OrderItem> l = instance.getListOrderItemByOrderID(28);
        for (OrderItem o : l) {
            System.out.println(o);
        }
    }

}
