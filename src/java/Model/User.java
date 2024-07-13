package Model;


import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User implements Serializable, DatabaseInfo {

    private int userID;
    private String userName;
    private String password;
    private String roles;
    private String email;
    private String phoneNum;
    private String name;
    private Date dob;
    private String gender;
    private String avatar;

    // Default constructor
    public User() {
    }

    // Parameterized constructor
    public User(int userID, String userName, String password, String roles, String email, String phoneNum, String name, Date dob, String gender, String avatar) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.roles = roles;
        this.email = email;
        this.phoneNum = phoneNum;
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.avatar = avatar;
    }
    public User( String userName, String password, String roles, String email, String phoneNum, String name, Date dob, String gender, String avatar) {

        this.userName = userName;
        this.password = password;
        this.roles = roles;
        this.email = email;
        this.phoneNum = phoneNum;
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.avatar = avatar;
    }
    // Getters and setters
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDateDob() {
        return dob;
    }

    public String getDob() {
        if (this.dob != null) {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            return df.format(this.dob);
        } else {
            return null;
        }
    }

    public void setDob(String dob) {
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        try {
            this.dob = new java.sql.Date(sd.parse(dob).getTime());
        } catch (ParseException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("Invalid BD");
        }
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = "";
        if (dob != null) {
            formattedDate = sdf.format(dob);
        }
        return "User{"
                + "userID=" + userID
                + ", userName='" + userName + '\''
                + ", password='" + password + '\''
                + ", roles='" + roles + '\''
                + ", email='" + email + '\''
                + ", phoneNum='" + phoneNum + '\''
                + ", name='" + name + '\''
                + ", dob=" + formattedDate
                + ", gender='" + gender + '\''
                + ", avatar='" + avatar + '\''
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

    public User login(String username) throws Exception {
        User s = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT UserID, UserName, Passwords, Roles, Email, PhoneNum, Names, DOB, Gender, Avatar FROM Users WHERE UserName=?");
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int userIDs = rs.getInt("UserID");
                String userNames = rs.getString("UserName");
                String passwords = rs.getString("Passwords");
                String roless = rs.getString("Roles");
                String emails = rs.getString("Email");
                String phoneNums = rs.getString("PhoneNum");
                String names = rs.getString("Names");
                java.sql.Date dobs = rs.getDate("DOB");
                String genders = rs.getString("Gender");
                String avatars = rs.getString("Avatar");

                s = new User(userIDs, userNames, passwords, roless, emails, phoneNums, names, dobs, genders, avatars);
            }

        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public int newUser(User u) {
        int id = -1;
        try (Connection con = getConnect()) {
            String sql = """
                     INSERT INTO Users (UserName, Passwords, Roles, Email, PhoneNum, Names, DOB, Gender, Avatar)
                     OUTPUT inserted.UserID
                     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
                     """;
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, u.getUserName());
            stmt.setString(2, u.getPassword());
            stmt.setString(3, "User");
            stmt.setString(4, u.getEmail());
            stmt.setString(5, u.getPhoneNum());
            stmt.setString(6, u.getName());
            stmt.setDate(7, u.getDateDob());
            stmt.setString(8, u.getGender());
            stmt.setString(9, u.getAvatar());

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public User getLargestRatingUser(int bookID) {
        User s = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("""
                                                          SELECT TOP 1 u.UserID, u.UserName, u.Passwords, u.Roles, u.Email, u.PhoneNum, u.Names, u.DOB, u.Gender, u.Avatar
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
                s = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), 
                        rs.getString(7), rs.getDate(8), rs.getString(9), rs.getString(10));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public ArrayList<Address> getListAdressByUserID(int userID) {
        ArrayList<Address> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            String query = """
                           SELECT ai.AddressID, Street, BuildingNo, City
                                              FROM AddressInfo ai inner join UserAddress ua on ai.AddressID = ua.AddressID
                                               WHERE ua.UserID =?""";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, userID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Address(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) throws Exception {
        // Đối tượng Date được tạo bằng cách sử dụng phương thức Date.valueOf("YYYY-MM-DD")
        // Giá trị thời gian là một ngày cụ thể

       User s = new User("ad", "123", "", "huyen@gmail.com", "1234567890","thanh", Date.valueOf("2022-10-01"), "female", "de.jpg");
        System.out.println(s.newUser(s));
    }

}
