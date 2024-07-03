/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import static Model.DatabaseInfo.DBURL;
import static Model.DatabaseInfo.DRIVERNAME;
import static Model.DatabaseInfo.PASSDB;
import static Model.DatabaseInfo.USERDB;
import static Model.Publisher.getConnect;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Book implements Serializable, DatabaseInfo {

    private int bookID;
    private int publisherID;
    private String title;
    private BigDecimal price;
    private BigDecimal priceDiscount;
    private int pages;
    private int avaQuantity;
    private Date publishDate;
    private String descriptions;
    private String longDescriptions;
    private String imageURL;

    // Default constructor
    public Book() {
    }

    // Parameterized constructor
    public Book(int bookID, int publisherID, String title, BigDecimal price, BigDecimal priceDiscount, int pages, int avaQuantity, Date publishDate, String descriptions, String longDescriptions, String imageURL) {
        this.bookID = bookID;
        this.publisherID = publisherID;
        this.title = title;
        this.price = price;
        this.priceDiscount = priceDiscount;
        this.pages = pages;
        this.avaQuantity = avaQuantity;
        this.publishDate = publishDate;
        this.descriptions = descriptions;
        this.longDescriptions = longDescriptions;
        this.imageURL = imageURL;
    }

    // Getters and setters
    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public int getPublisherID() {
        return publisherID;
    }

    public void setPublisherID(int publisherID) {
        this.publisherID = publisherID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPriceDiscount() {
        return priceDiscount;
    }

    public void setPriceDiscount(BigDecimal priceDiscount) {
        this.priceDiscount = priceDiscount;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getAvaQuantity() {
        return avaQuantity;
    }

    public void setAvaQuantity(int avaQuantity) {
        this.avaQuantity = avaQuantity;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getLongDescriptions() {
        return longDescriptions;
    }

    public void setLongDescriptions(String longDescriptions) {
        this.longDescriptions = longDescriptions;
    }

    @Override
    public String toString() {
        return "Book{" + "bookID=" + bookID + ", publisherID=" + publisherID + ", title=" + title + ", price=" + price + ", priceDiscount=" + priceDiscount + ", pages=" + pages + ", avaQuantity=" + avaQuantity + ", publishDate=" + publishDate + ", descriptions=" + descriptions + ", longDescriptions=" + longDescriptions + ", imageURL=" + imageURL + '}';
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
//============get List Book 

    public ArrayList<Book> getListBookByYears(String minY, String maxY) {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            String query = "SELECT bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity, bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL"
                    + " FROM BookInfo bi"
                    + " WHERE bi.publishDate BETWEEN ? AND ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setDate(1, java.sql.Date.valueOf(minY + "-01-01"));
            stmt.setDate(2, java.sql.Date.valueOf(maxY + "-12-31"));
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getBigDecimal(4), rs.getBigDecimal(5), rs.getInt(6),
                        rs.getInt(7), rs.getDate(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Book> getListBookByCategoryName(String category) {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           SELECT bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity, bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL
                                                             FROM BookInfo bi inner join BookCategory bc on bi.BookID = bc.BookID
                                                             inner join CategoryInfo ci on bc.CategoryID=ci.CategoryID
                                                            WHERE ci.CategoryName=?""");
            stmt.setString(1, category);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getBigDecimal(4), rs.getBigDecimal(5), rs.getInt(6),
                        rs.getInt(7), rs.getDate(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Book> getListBookByAllCategory() {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           SELECT bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity, bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL
                                                             FROM BookInfo bi inner join BookCategory bc on bi.BookID = bc.BookID
                                                             inner join CategoryInfo ci on bc.CategoryID=ci.CategoryID
                                                            """);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getBigDecimal(4), rs.getBigDecimal(5), rs.getInt(6),
                        rs.getInt(7), rs.getDate(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Book> getListBookByAuthorName(String name) {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           SELECT bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity, bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL
                                                            FROM BookInfo bi inner join BookAuthor ba on bi.BookID = ba.BookID
                                                            inner join Author a on ba.AuthorID=a.AuthorID
                                                            WHERE a.AuthorName=?""");
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getBigDecimal(4), rs.getBigDecimal(5), rs.getInt(6),
                        rs.getInt(7), rs.getDate(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Book> getListBookByAllAuthor() {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           SELECT bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity, bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL
                                                            FROM BookInfo bi inner join BookAuthor ba on bi.BookID = ba.BookID
                                                            inner join Author a on ba.AuthorID=a.AuthorID
                                                            """);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getBigDecimal(4), rs.getBigDecimal(5), rs.getInt(6),
                        rs.getInt(7), rs.getDate(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
//===========get book

    public Book getBook(int id) {
        Book s = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT bookID, publisherID, title, price,priceDiscount, pages, avaQuantity, publishDate, descriptions, longDescriptions, imageURL FROM BookInfo WHERE bookID=?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = new Book(rs.getInt("bookID"), rs.getInt("publisherID"), rs.getString("title"), rs.getBigDecimal("price"), rs.getBigDecimal("priceDiscount"), rs.getInt("pages"), rs.getInt("avaQuantity"), rs.getDate("publishDate"), rs.getString("descriptions"), rs.getString("longDescriptions"), rs.getString("imageURL"));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public Book getBookByTitle(String title) {
        Book s = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT bookID, publisherID, title, price,priceDiscount, pages, avaQuantity, publishDate, descriptions,longDescriptions, imageURL FROM BookInfo WHERE title=?");
            stmt.setString(1, title);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = new Book(rs.getInt("bookID"), rs.getInt("publisherID"),
                        rs.getString("title"), rs.getBigDecimal("price"),
                        rs.getBigDecimal("priceDiscount"), rs.getInt("pages"),
                        rs.getInt("avaQuantity"), rs.getDate("publishDate"),
                        rs.getString("descriptions"), rs.getString("longDescriptions"),
                        rs.getString("imageURL"));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public Book getBookByImage(String img) {
        Book s = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT bookID, publisherID, title, price,priceDiscount, pages, avaQuantity, publishDate, descriptions,longDescriptions, imageURL FROM BookInfo WHERE imageURL=?");
            stmt.setString(1, img);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = new Book(rs.getInt("bookID"), rs.getInt("publisherID"),
                        rs.getString("title"), rs.getBigDecimal("price"),
                        rs.getBigDecimal("priceDiscount"), rs.getInt("pages"),
                        rs.getInt("avaQuantity"), rs.getDate("publishDate"),
                        rs.getString("descriptions"), rs.getString("longDescriptions"),
                        rs.getString("imageURL"));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
//=======get thuộc tính dựa trên book ID

    public Publisher getPublisherByBookID(int id) {
        Publisher s = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                          SELECT p.PublisherID,p.PublisherName,p.PublisherEmail
                                                          FROM BookInfo b inner join Publisher p on b.PublisherID = p.PublisherID
                                                          WHERE bookID=?""");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = new Publisher(rs.getInt("PublisherID"), rs.getString("PublisherName"), rs.getString("PublisherEmail"));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public Category getCategoryByBookID(int id) {
        Category s = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           SELECT ci.CategoryID,ci.CategoryName,ci.Quantity
                                                              FROM BookCategory bc inner join CategoryInfo ci on bc.CategoryID=ci.CategoryID
                                                             WHERE bc.BookID=?""");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"), rs.getInt("Quantity"));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public ArrayList<String> getListImagesBook(int bookID) {
        ArrayList<String> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                          SELECT i.ImageURL
                                                          FROM BookImage bi inner join ImageInfo i on bi.ImageID = i.ImageID
                                                          WHERE bi.bookID=?""");
            stmt.setInt(1, bookID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Language> getListLanguagesBook(int bookID) {
        ArrayList<Language> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                          SELECT bl.LanguageID,bli.LanguageName
                                                          FROM BookLanguage bl inner join BookLanguageInfo bli on bl.LanguageID = bli.LanguageID
                                                          WHERE bl.bookID=?""");
            stmt.setInt(1, bookID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Language(rs.getInt(1), rs.getString(2)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Author> getListAuthorsBook(int bookID) {
        ArrayList<Author> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                          SELECT a.AuthorID,a.AuthorName,a.AuthorDOB,a.AuthorImageURL,a.AuthorEmail, a.AuthorDescript
                                                           FROM BookAuthor ba inner join Author a on ba.AuthorID=a.AuthorID
                                                           WHERE ba.BookID = ?""");
            stmt.setInt(1, bookID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Author(rs.getInt(1), rs.getString(2),
                        rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }


    public static void main(String[] args) {
        Book a = new Book();
        System.out.println(a.getBookByImage("images/sale1.jpg"));
    }
}
