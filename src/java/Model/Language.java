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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Language implements Serializable, DatabaseInfo {

    private int languageID;
    private String languageName;

    // Default constructor
    public Language() {
    }

    // Parameterized constructor
    public Language(int languageID, String languageName) {
        this.languageID = languageID;
        this.languageName = languageName;
    }

    // Getters and Setters
    public int getLanguageID() {
        return languageID;
    }

    public void setLanguageID(int languageID) {
        this.languageID = languageID;
    }

    public String getLanguageName() {
        return languageName;
    }

    public void setLanguageName(String languageName) {
        this.languageName = languageName;
    }

    // toString method (optional for debugging purposes)
    @Override
    public String toString() {
        return "Language{"
                + "languageID=" + languageID
                + ", languageName='" + languageName + '\''
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
     public Language getLanguage(int id) {
        Language s = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT LanguageID, LanguageName FROM BookLanguageInfo WHERE LanguageID=?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = new Language(rs.getInt("LanguageID"), rs.getString("LanguageName"));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
      public String getLanguageNameByOrderItemID(int OrderItemID) {
        String s = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                          SELECT LanguageName FROM BookLanguageInfo bl inner join OrderItem oi on bl.LanguageID=oi.LanguageID
                                                            WHERE oi.OrderItemID=?
                                                          """);
            stmt.setInt(1, OrderItemID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = rs.getString("LanguageName");
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
     public static void main(String[] args) {
        Language a = new Language();
         System.out.println(a.getLanguageNameByOrderItemID(1));
    }
}
