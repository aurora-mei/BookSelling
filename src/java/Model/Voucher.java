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
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Voucher implements Serializable, DatabaseInfo {

    private int voucherID;
    private String voucherCode;
    private BigDecimal voucherValue;

    // No-argument constructor
    public Voucher() {
    }

    // Parameterized constructor
    public Voucher(int voucherID, String voucherCode, BigDecimal voucherValue) {
        this.voucherID = voucherID;
        this.voucherCode = voucherCode;
        this.voucherValue = voucherValue;
    }

    // Getter and setter for voucherID
    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

    // Getter and setter for voucherCode
    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }

    // Getter and setter for voucherValue
    public BigDecimal getVoucherValue() {
        return voucherValue;
    }

    public void setVoucherValue(BigDecimal voucherValue) {
        this.voucherValue = voucherValue;
    }

    @Override
    public String toString() {
        return "Voucher{"
                + "voucherID=" + voucherID
                + ", voucherCode='" + voucherCode + '\''
                + ", voucherValue=" + voucherValue
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

    public Voucher getVoucherByCode(String voucherCode) {
        Voucher s = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                         SELECT VoucherID,VoucherValue
                                                          FROM VoucherOrder WHERE VoucherCode=?""");
            stmt.setString(1, voucherCode);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s= new Voucher(rs.getInt(1),voucherCode,rs.getBigDecimal(2));
            }
            con.close();
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(Book.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return s;
    }
     public ArrayList<Voucher> getListVoucher() {
        ArrayList<Voucher> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           SELECT VoucherID,VoucherCode,VoucherValue
                                                            FROM VoucherOrder
                                                          """);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Voucher(rs.getInt(1),rs.getString(2),rs.getBigDecimal(3)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(Book.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) {
        Voucher s= new Voucher();
        System.out.println(s.getListVoucher());
    }
}
