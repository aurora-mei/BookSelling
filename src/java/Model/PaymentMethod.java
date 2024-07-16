/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PaymentMethod implements Serializable, DatabaseInfo {
    private int paymentMethodID;
    private String paymentName;

    // Default constructor
    public PaymentMethod() {
    }

    // Parameterized constructor
    public PaymentMethod(int paymentMethodID, String paymentName) {
        this.paymentMethodID = paymentMethodID;
        this.paymentName = paymentName;
    }

    // Getter for paymentMethodID
    public int getPaymentMethodID() {
        return paymentMethodID;
    }

    // Setter for paymentMethodID
    public void setPaymentMethodID(int paymentMethodID) {
        this.paymentMethodID = paymentMethodID;
    }

    // Getter for paymentName
    public String getPaymentName() {
        return paymentName;
    }

    // Setter for paymentName
    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    @Override
    public String toString() {
        return "PaymentMethod{" +
                "paymentMethodID=" + paymentMethodID +
                ", paymentName='" + paymentName + '\'' +
                '}';
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
  public ArrayList<PaymentMethod> getListPaymentMethod() {
        ArrayList<PaymentMethod> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           select PaymentMethodID,PaymentName
                                                            FROM PaymentMethod""");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new PaymentMethod(rs.getInt(1), rs.getString(2)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) {
        PaymentMethod p = new PaymentMethod();
        System.out.println(p.getListPaymentMethod());
    }
}
