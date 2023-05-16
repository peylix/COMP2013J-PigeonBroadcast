//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package pb.dao;

import pb.tool.JDBCTool;
import pb.pojo.User;

import java.sql.*;
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
}
