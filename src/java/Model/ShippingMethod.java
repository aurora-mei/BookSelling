/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import static Model.Book.getConnect;
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

public class ShippingMethod implements Serializable, DatabaseInfo{
    private int shippingMethodID;
    private String methodName;
    private BigDecimal cost;

    // Default constructor
    public ShippingMethod() {
    }

    // Parameterized constructor
    public ShippingMethod(int shippingMethodID, String methodName, BigDecimal cost) {
        this.shippingMethodID = shippingMethodID;
        this.methodName = methodName;
        this.cost = cost;
    }

    // Getter and setter for shippingMethodID
    public int getShippingMethodID() {
        return shippingMethodID;
    }

    public void setShippingMethodID(int shippingMethodID) {
        this.shippingMethodID = shippingMethodID;
    }

    // Getter and setter for methodName
    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    // Getter and setter for cost
    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    @Override
    public String toString() {
        return "ShippingMethodInfo{" +
                "shippingMethodID=" + shippingMethodID +
                ", methodName='" + methodName + '\'' +
                ", cost=" + cost +
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
       public ShippingMethod getShippingMethodByID(int id) {
        ShippingMethod s = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                          SELECT ShippingMethodID,MethodName, Cost 
                                                          FROM ShippingMethodInfo 
                                                          WHERE ShippingMethodID=?
                                                          """);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = new ShippingMethod(rs.getInt(1), rs.getString(2),rs.getBigDecimal(3));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

       public ArrayList<ShippingMethod> getListShippingMethod() {
        ArrayList<ShippingMethod> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           select ShippingMethodID,MethodName, Cost
                                                            FROM ShippingMethodInfo""");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new ShippingMethod(rs.getInt(1), rs.getString(2),rs.getBigDecimal(3)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
       public static void main(String[] args) {
        ShippingMethod sm = new ShippingMethod();
           System.out.println(sm.getListShippingMethod());
    }
}
