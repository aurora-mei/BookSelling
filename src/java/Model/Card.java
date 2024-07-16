/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import static Model.DatabaseInfo.DBURL;
import static Model.DatabaseInfo.DRIVERNAME;
import static Model.DatabaseInfo.PASSDB;
import static Model.DatabaseInfo.USERDB;
import static Model.PaymentMethod.getConnect;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Card implements Serializable, DatabaseInfo {

    private int cardID;
    private int paymentMethodID;
    private int userID;
    private String cardCode;
    private Date expireDates;

    // Default constructor
    public Card() {
    }

    // Parameterized constructor
    public Card(int cardID, int paymentMethodID, int userID, String cardCode, Date expireDates) {
        this.cardID = cardID;
        this.paymentMethodID = paymentMethodID;
        this.userID = userID;
        this.cardCode = cardCode;
        this.expireDates = expireDates;
    }

    // Getter for cardID
    public int getCardID() {
        return cardID;
    }

    // Setter for cardID
    public void setCardID(int cardID) {
        this.cardID = cardID;
    }

    // Getter for paymentMethodID
    public int getPaymentMethodID() {
        return paymentMethodID;
    }

    // Setter for paymentMethodID
    public void setPaymentMethodID(int paymentMethodID) {
        this.paymentMethodID = paymentMethodID;
    }

    // Getter for userID
    public int getUserID() {
        return userID;
    }

    // Setter for userID
    public void setUserID(int userID) {
        this.userID = userID;
    }

    // Getter for cardCode
    public String getCardCode() {
        return cardCode;
    }

    // Setter for cardCode
    public void setCardCode(String cardCode) {
        this.cardCode = cardCode;
    }

    // Getter for expireDates
    public Date getExpireDates() {
        return expireDates;
    }

    // Setter for expireDates
    public void setExpireDates(Date expireDates) {
        this.expireDates = expireDates;
    }

    @Override
    public String toString() {
        return "Card{"
                + "cardID=" + cardID
                + ", paymentMethodID=" + paymentMethodID
                + ", userID=" + userID
                + ", cardCode='" + cardCode + '\''
                + ", expireDates=" + expireDates
                + '}';
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
     

    public ArrayList<Card> getListCards(int userID, String paymentMethodName) {
        ArrayList<Card> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           select CardID,pm.PaymentMethodID,c.UserID,CardCode,ExpireDates
                                                             FROM Cards c inner join Users u on c.UserID = u.UserID
                                                             inner join PaymentMethod pm on c.PaymentMethodID=pm.PaymentMethodID
                                                             where c.UserID = ? and pm.PaymentName=?""");
            stmt.setInt(1, userID);
            stmt.setString(2, paymentMethodName);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Card(rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getString(4), rs.getDate(5)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) {
        Card c = new Card();
        System.out.println(c.getListCards(1, "Credit Card"));
    }

}
