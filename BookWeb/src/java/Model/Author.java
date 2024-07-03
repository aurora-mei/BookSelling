/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import static Model.DatabaseInfo.DBURL;
import static Model.DatabaseInfo.DRIVERNAME;
import static Model.DatabaseInfo.PASSDB;
import static Model.DatabaseInfo.USERDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Author {
    private int authorID;
    private String authorName;
    private Date authorDOB;
    private String authorImageURL;
    private String authorEmail;
    private String authorDescript;

    // Constructor
    public Author() {
    }

    public Author(int authorID, String authorName, Date authorDOB, String authorImageURL, String authorEmail, String authorDescript) {
        this.authorID = authorID;
        this.authorName = authorName;
        this.authorDOB = authorDOB;
        this.authorImageURL = authorImageURL;
        this.authorEmail = authorEmail;
        this.authorDescript = authorDescript;
    }

    // Getters and Setters
    public int getAuthorID() {
        return authorID;
    }

    public void setAuthorID(int authorID) {
        this.authorID = authorID;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public Date getAuthorDOB() {
        return authorDOB;
    }

    public void setAuthorDOB(Date authorDOB) {
        this.authorDOB = authorDOB;
    }

    public String getAuthorImageURL() {
        return authorImageURL;
    }

    public void setAuthorImageURL(String authorImageURL) {
        this.authorImageURL = authorImageURL;
    }

    public String getAuthorEmail() {
        return authorEmail;
    }

    public void setAuthorEmail(String authorEmail) {
        this.authorEmail = authorEmail;
    }

    public String getAuthorDescript() {
        return authorDescript;
    }

    @Override
    public String toString() {
        return "Author{" + "authorID=" + authorID + ", authorName=" + authorName + ", authorDOB=" + authorDOB + ", authorImageURL=" + authorImageURL + ", authorEmail=" + authorEmail + ", authorDescript=" + authorDescript + '}';
    }

    public void setAuthorDescript(String authorDescript) {
        this.authorDescript = authorDescript;
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
            public ArrayList<Author> listAllAuthor() {
        ArrayList<Author> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("Select AuthorID,AuthorName,AuthorDOB,AuthorEmail,AuthorDescript,AuthorImageURL from Author");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Author(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Author.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
            public static void main(String[] args) {
        Author r = new Author();
        ArrayList<Author> s = r.listAllAuthor();
                for(Author a : s){
                    System.out.println(a);
                }
    }

}

