/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import static Model.DatabaseInfo.DBURL;
import static Model.DatabaseInfo.DRIVERNAME;
import static Model.DatabaseInfo.PASSDB;
import static Model.DatabaseInfo.USERDB;
import static Model.ShippingMethod.getConnect;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Address implements Serializable, DatabaseInfo {

    private int addressID;
    private String street;
    private String buildingNo;
    private String city;

    // Default constructor
    public Address() {
    }

    // Parameterized constructor
    public Address(int addressID, String street, String buildingNo, String city) {
        this.addressID = addressID;
        this.street = street;
        this.buildingNo = buildingNo;
        this.city = city;
    }

    // Getter and Setter for addressID
    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }

    // Getter and Setter for street
    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    // Getter and Setter for buildingNo
    public String getBuildingNo() {
        return buildingNo;
    }

    public void setBuildingNo(String buildingNo) {
        this.buildingNo = buildingNo;
    }

    // Getter and Setter for city
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

  @Override
    public String toString() {
        return "["+street +", "+buildingNo+", "+city+"]";
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
        public ArrayList<Address> getListAddressByUserID(int userID) {
        ArrayList<Address> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           select ai.AddressID,Street, BuildingNo, City
                                                             FROM AddressInfo ai inner join UserAddress ua on ai.AddressID=ua.AddressID
                                                             where ua.AddressStatus='A' and ua.UserID=?""");
            stmt.setInt(1, userID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Address(rs.getInt(1),rs.getString(1), rs.getString(2),rs.getString(3)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) {
        Address a = new Address();
        System.out.println(a.getListAddressByUserID(1));
    }
}
