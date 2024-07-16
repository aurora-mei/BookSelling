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
import static Model.User.getConnect;
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

    public Address(String street, String buildingNo, String city) {
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
        return "[" + street + ", " + buildingNo + ", " + city + "]";
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

    public ArrayList<Address> getListAddress() {
        ArrayList<Address> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           select ai.AddressID,Street, BuildingNo, City
                                                             FROM AddressInfo ai inner join UserAddress ua on ai.AddressID=ua.AddressID
                                                             where ua.AddressStatus='A'""");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Address(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int checkExistedAddress(String street, String buildingNo, String city) {
        ArrayList<Address> list = getListAddress();
        for (Address d : list) {
            if (street.equals(d.getStreet()) && buildingNo.equals(d.getBuildingNo()) && city.equals(d.getCity())) {
                return d.getAddressID();
            }
        }
        return -1;
    }

    public int newAddress(Address ad, int userID) {
        int adID = -1;
        try (Connection con = getConnect()) {
            int idExisted = checkExistedAddress(ad.getStreet(), ad.getBuildingNo(), ad.getCity());
            if (idExisted == -1) {
                String sql = """
                     INSERT INTO AddressInfo (street, buildingNo, city)
                     OUTPUT inserted.addressID
                     VALUES (?, ?, ?)
                     """;
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setString(1, ad.getStreet());
                stmt.setString(2, ad.getBuildingNo());
                stmt.setString(3, ad.getCity());

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    adID = rs.getInt(1);
                }
            } else {
                adID = idExisted;
            }
            String sql2 = """
                     INSERT INTO UserAddress (userID, AddressID, addressStatus)
                     VALUES (?, ?, ?)
                     """;
            PreparedStatement stmt2 = con.prepareStatement(sql2);
            stmt2.setInt(1, userID);
            stmt2.setInt(2, adID);
            stmt2.setString(3, "A");
            stmt2.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return adID;
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
                list.add(new Address(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        Address a = new Address("Non Nuoc", "28 Billy", "Da Nang");
//        System.out.println(a.getListAddress());
        ArrayList<Address> l = a.getListAddress();
        for(Address sa: l){
            System.out.println(sa);
        }
        System.out.println(a.checkExistedAddress("73 Nguyen", "23B", "Da Nang"));
    }
}
