/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import static Model.CartItem.getConnect;
import static Model.DatabaseInfo.DBURL;
import static Model.DatabaseInfo.DRIVERNAME;
import static Model.DatabaseInfo.PASSDB;
import static Model.DatabaseInfo.USERDB;
import static Model.User.getConnect;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Comment implements Serializable, DatabaseInfo {

    private int commentID;
    private int bookID;
    private int userID;
    private String comment;
    private BigDecimal rating;
    private Date commentDate;

    // Default constructor
    public Comment() {
    }

    // Parameterized constructor
    public Comment(int commentID, int bookID, int userID, String comment, BigDecimal rating, Date commentDate) {
        this.commentID = commentID;
        this.bookID = bookID;
        this.userID = userID;
        this.comment = comment;
        this.rating = rating;
        this.commentDate = commentDate;
    }

    // Getters and setters
    public int getCommentID() {
        return commentID;
    }
    
    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }
    
    public int getBookID() {
        return bookID;
    }
    
    public void setBookID(int bookID) {
        this.bookID = bookID;
    }
    
    public int getUserID() {
        return userID;
    }
    
    public void setUserID(int userID) {
        this.userID = userID;
    }
    
    public String getComment() {
        return comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }
    
    public BigDecimal getRating() {
        return rating;
    }
    
    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }
    
    public Date getCommentDate() {
        return commentDate;
    }
    
    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    // toString method
    @Override
    public String toString() {
        return "Comment{"
                + "commentID=" + commentID
                + ", bookID=" + bookID
                + ", userID=" + userID
                + ", comment='" + comment + '\''
                + ", rating=" + rating
                + ", commentDate=" + commentDate
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

    public Comment getLargestRatingComment(int bookID) {
        Comment s = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                          SELECT TOP 1 c.CommentID, c.UserID,c.BookID,c.Comment,c.Rating,c.CommentDate
                                                          FROM Users u 
                                                          INNER JOIN Comment c ON u.UserID = c.UserID
                                                          WHERE c.BookID = ? AND c.Rating = (
                                                              SELECT MAX(Rating) FROM Comment WHERE BookID = ?
                                                          )
                                                          ORDER BY c.Rating DESC
                                                                       """);
            stmt.setInt(1, bookID);
            stmt.setInt(2, bookID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = new Comment(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getString(4), rs.getBigDecimal(5), rs.getDate(6));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
     public BigDecimal getAverageRating(int bookID) {
        BigDecimal s = new BigDecimal("0");
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                          SELECT AVG(Rating) as AverageRating
                                                          FROM Comment
                                                          WHERE BookID =? 
                                                          """);
            stmt.setInt(1, bookID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = rs.getBigDecimal(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
         public int noReviewsByBookID(int bookID) {
        int res = -1;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           select count(CommentID) as noComment
                                                           	from Comment where BookID= ?""");
            stmt.setInt(1, bookID);
            ResultSet rc = stmt.executeQuery();
            
            while (rc.next()) {
                res = rc.getInt(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(CartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    public static void main(String[] args) {
        Comment c = new Comment();
        System.out.println(c.noReviewsByBookID(5));
    }
}
