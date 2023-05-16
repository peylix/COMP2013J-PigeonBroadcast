package pb.dao;

import pb.pojo.SchoolMembers;
import pb.pojo.User;
import pb.tool.JDBCTool;

import java.sql.*;
import java.util.Objects;

public class SchoolMembersDAO {
    public SchoolMembersDAO() {

    }

    public static boolean createAccount(int memberID, String lastName, String firstName, String password, String email) {
        Connection conn = null;

        try {
            conn = JDBCTool.getConnection();
            String sql = "SELECT * FROM schoolmembers WHERE memberID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, memberID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String l = rs.getString("lastName");
                String f = rs.getString("firstName");
                String i = rs.getString("identity");
                if (Objects.equals(l, lastName) && Objects.equals(f, firstName)) {
                    String username = l + " " + f;
                    String sql1 = "INSERT INTO User (userId, password, userName, email, identity) VALUES (?, ?, ?, ?, ?)";
                    PreparedStatement ps1 = conn.prepareStatement(sql1);
                    ps1.setInt(1, memberID);
                    ps1.setString(2, password);
                    ps1.setString(3, username);
                    ps1.setString(4, email);
                    ps1.setString(5, i);
                    return ps1.execute();
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
        return false;
    }
}
