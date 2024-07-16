/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import static Model.DatabaseInfo.DBURL;
import static Model.DatabaseInfo.DRIVERNAME;
import static Model.DatabaseInfo.PASSDB;
import static Model.DatabaseInfo.USERDB;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDate;
import java.util.stream.Collectors;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.sql.Date;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

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

    public Book(int bookID, String title, BigDecimal price, BigDecimal priceDiscount, int avaQuantity, String imageURL) {
        this.bookID = bookID;
        this.title = title;
        this.price = price;
        this.priceDiscount = priceDiscount;
        this.avaQuantity = avaQuantity;
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
//==================sort list book

    public ArrayList<Book> sortLatest(ArrayList<Book> bList) {
        LocalDate sixtyDaysAgo = LocalDate.now().minusDays(60);
        ArrayList<Book> filteredBooks = bList.stream()
                .filter(b -> b.getPublishDate().toLocalDate().isAfter(sixtyDaysAgo))
                .collect(Collectors.toCollection(ArrayList::new));
        return filteredBooks;
    }

//============get List Book 
    public ArrayList<Book> searchByKeyWord(String key) {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            String query = """
                       select bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity,
                       bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL
                       from BookInfo bi
                       where bi.Title like ? or bi.descriptions like ? or bi.publishDate like ?""";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, "%" + key + "%");
            stmt.setString(2, "%" + key + "%");
            stmt.setString(3, "%" + key + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getBigDecimal(4), rs.getBigDecimal(5), rs.getInt(6),
                        rs.getInt(7), rs.getDate(8), rs.getString(9),
                        rs.getString(10), rs.getString(11)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Book> searchByName(String name) {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            String query = """
                       select bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity,
                       bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL
                       from BookInfo bi
                       where bi.Title like ? """;
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, "%" + name + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getBigDecimal(4), rs.getBigDecimal(5), rs.getInt(6),
                        rs.getInt(7), rs.getDate(8), rs.getString(9),
                        rs.getString(10), rs.getString(11)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

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

    public ArrayList<Book> getListBookByTime(String minY, String maxY) {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            String query = "SELECT bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity, bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL"
                    + " FROM BookInfo bi"
                    + " WHERE bi.publishDate BETWEEN ? AND ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setDate(1, java.sql.Date.valueOf(minY));
            stmt.setDate(2, java.sql.Date.valueOf(maxY));
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

    public ArrayList<Book> getListBookByPrice(BigDecimal minP, BigDecimal maxP) {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            String query = "SELECT bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity, bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL"
                    + " FROM BookInfo bi"
                    + " WHERE bi.priceDiscount BETWEEN ? AND ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setBigDecimal(1, minP);
            stmt.setBigDecimal(2, maxP);
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

    public ArrayList<Book> getListBookByTitle(String nameSeries) {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            String query = "SELECT bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity, bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL"
                    + " FROM BookInfo bi"
                    + " WHERE bi.title LIKE ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, nameSeries + "%");
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

    public ArrayList<Book> getListBook() {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                           SELECT bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity, bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL
                                                            FROM BookInfo bi 
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

    public String getImageURLByBook(int bookID) {
        String imgURL = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                          SELECT bi.ImageURL
                                                                FROM BookInfo bi WHERE bi.BookID=?""");
            stmt.setInt(1, bookID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                imgURL = rs.getString("imageURL");
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return imgURL;
    }

    public boolean addBook(Book book) {
        try (Connection con = getConnect()) {
            String query = "INSERT INTO BookInfo (publisherID, title, price, priceDiscount, pages, avaQuantity, publishDate, descriptions, longDescriptions, imageURL) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, book.getPublisherID());
            stmt.setString(2, book.getTitle());
            stmt.setBigDecimal(3, book.getPrice());
            stmt.setBigDecimal(4, book.getPriceDiscount());
            stmt.setInt(5, book.getPages());
            stmt.setInt(6, book.getAvaQuantity());
            stmt.setDate(7, book.getPublishDate());
            stmt.setString(8, book.getDescriptions());
            stmt.setString(9, book.getLongDescriptions());
            stmt.setString(10, book.getImageURL());
            int rowsInserted = stmt.executeUpdate();
            con.close();
            return rowsInserted > 0;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Delete a book
    public boolean deleteBook(int bookID) {
        try (Connection con = getConnect()) {
            String query = "DELETE FROM BookInfo WHERE bookID=?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, bookID);
            int rowsDeleted = stmt.executeUpdate();
            con.close();
            return rowsDeleted > 0;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Update a book
    public boolean updateBook(Book book) {
        try (Connection con = getConnect()) {
            String query = "UPDATE BookInfo SET publisherID=?, title=?, price=?, priceDiscount=?, pages=?, avaQuantity=?, publishDate=?, descriptions=?, longDescriptions=?, imageURL=? WHERE bookID=?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, book.getPublisherID());
            stmt.setString(2, book.getTitle());
            stmt.setBigDecimal(3, book.getPrice());
            stmt.setBigDecimal(4, book.getPriceDiscount());
            stmt.setInt(5, book.getPages());
            stmt.setInt(6, book.getAvaQuantity());
            stmt.setDate(7, book.getPublishDate());
            stmt.setString(8, book.getDescriptions());
            stmt.setString(9, book.getLongDescriptions());
            stmt.setString(10, book.getImageURL());
            stmt.setInt(11, book.getBookID());
            int rowsUpdated = stmt.executeUpdate();
            con.close();
            return rowsUpdated > 0;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // View daily revenue
    public BigDecimal getDailyRevenue(LocalDate date) {
        BigDecimal revenue = BigDecimal.ZERO;
        try (Connection con = getConnect()) {
            String query = "SELECT SUM(totalPrice) FROM Orders WHERE orderDate=?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setDate(1, Date.valueOf(date));
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                revenue = rs.getBigDecimal(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return revenue;
    }

    public ArrayList<Book> sortByPopularity(ArrayList<Book> books) {
        ArrayList<Book> list = new ArrayList<>();
        ArrayList<Book> finalList = new ArrayList<>();
        try (Connection con = getConnect()) {
            String query = """
                      select bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity,
                                              bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL
                                              from BookInfo bi
                                                JOIN (
                                                      SELECT BookID, SUM(Quantity) AS TotalQuantity
                                                      FROM OrderItem
                                                      GROUP BY BookID
                                                      HAVING SUM(Quantity) > 4
                                                  ) r ON bi.BookID = r.BookID;  
                       """;
            PreparedStatement stmt = con.prepareStatement(query);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getBigDecimal(4), rs.getBigDecimal(5), rs.getInt(6), rs.getInt(7), rs.getDate(8), rs.getString(9),
                        rs.getString(10), rs.getString(11)));
            }
            con.close();

            for (Book book : books) {
                for (Book bestRating : list) {
                    if (bestRating.getBookID() == book.getBookID()) {
                        finalList.add(book);
                    }
                }
            }
            return finalList;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Book> sortBestrating(ArrayList<Book> books) {
        ArrayList<Book> list = new ArrayList<>();
        ArrayList<Book> finalList = new ArrayList<>();
        try (Connection con = getConnect()) {
            String query = """
                       select bi.BookID, bi.publisherID, bi.title, bi.price,bi.priceDiscount, bi.pages, bi.avaQuantity,
                       bi.publishDate, bi.descriptions, bi.longDescriptions, bi.imageURL
                       from BookInfo bi
                         JOIN (
                               SELECT BookID
                               FROM Comment
                               GROUP BY BookID
                               HAVING AVG(Rating) > 4.5
                           ) r ON bi.BookID = r.BookID;  
                       """;
            PreparedStatement stmt = con.prepareStatement(query);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getBigDecimal(4), rs.getBigDecimal(5), rs.getInt(6),
                        rs.getInt(7), rs.getDate(8), rs.getString(9),
                        rs.getString(10), rs.getString(11)));
            }
            con.close();

            for (Book book : books) {
                for (Book bestRating : list) {
                    if (bestRating.getBookID() == book.getBookID()) {
                        finalList.add(book);
                        break;
                    }
                }
            }
            return finalList;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        Book a = new Book();
//        System.out.println(a.getListBook());
//        ArrayList<Book> bl = a.searchByName("hoàng");
//        for (Book b : bl) {
//            System.out.println(b);
//        }
System.out.println(a.getListImagesBook(3));
    }

}
