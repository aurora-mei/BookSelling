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

/**
 *
 * @author THANH HUYEN
 */
public class Publisher implements Serializable, DatabaseInfo {
    private int publisherID;
    private String publisherName;
    private String publisherEmail;

    // Constructor
    public Publisher() {
        // Default constructor
    }

    public Publisher(int publisherID, String publisherName, String publisherEmail) {
        this.publisherID = publisherID;
        this.publisherName = publisherName;
        this.publisherEmail = publisherEmail;
    }

    // Getters and Setters
    public int getPublisherID() {
        return publisherID;
    }

    public void setPublisherID(int publisherID) {
        this.publisherID = publisherID;
    }

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public String getPublisherEmail() {
        return publisherEmail;
    }

    public void setPublisherEmail(String publisherEmail) {
        this.publisherEmail = publisherEmail;
    }

    // toString method (optional for debugging purposes)
    @Override
    public String toString() {
        return "Publisher{" +
                "publisherID=" + publisherID +
                ", publisherName='" + publisherName + '\'' +
                ", publisherEmail='" + publisherEmail + '\'' +
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
     
    
      public static void main(String[] args) {
        Book s = new Book();
          System.out.println(s.getPublisherByBookID(1));
    }
}

