package pb.dao;

import pb.pojo.Notification;
import pb.tool.JDBCTool;
import pb.pojo.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class UserDAO {
    public UserDAO() {
    }

    public static User login(int userID, String password) {
        Connection conn = null;

        try {
            conn = JDBCTool.getConnection();
            String sql = "SELECT * FROM user WHERE userID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String p = rs.getString("password");
                String u = rs.getString("userName");
                String pp = rs.getString("profilePhoto");
                String e = rs.getString("email");
                String i = rs.getString("identity");
                if (Objects.equals(p, password)) {
                    return new User(userID, p, u, pp, e, i);
                }
            }
        } catch (SQLException var20) {
            var20.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException var19) {
                    var19.printStackTrace();
                }
            }

        }
        return null;
    }

    public static boolean updateUserInfo(User user, String password, String profilePhoto, String email) {
        boolean updated = false;
        int userID = user.getUserID();
        try {
            Connection conn = JDBCTool.getConnection();
            String query = "UPDATE user SET password = ?, profilePhoto = ?, email = ? WHERE userID = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, password);
            pst.setString(2, profilePhoto);
            pst.setString(3, email);
            pst.setInt(4, userID);
            int rows = pst.executeUpdate();
            if (rows > 0) {
                updated = true;
            }
            pst.close();
            conn.close();
        } catch (SQLException var6) {
            var6.printStackTrace();
        }

        return updated;
    }

    public static User getUserByID(int id) {
        User user = null;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM user WHERE userID = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, id);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                int userID = rs.getInt("userID");
                String password = rs.getString("password");
                String userName = rs.getString("userName");
                String profilePhoto = rs.getString("profilePhoto");
                String email = rs.getString("email");
                String identity = rs.getString("identity");

                user = new User(userID, password, userName, profilePhoto, email, identity);
            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
