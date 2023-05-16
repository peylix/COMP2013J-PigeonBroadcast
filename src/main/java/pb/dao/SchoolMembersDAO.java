package pb.dao;

import pb.pojo.SchoolMembers;
import pb.pojo.User;
import pb.tool.JDBCTool;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SchoolMembersDAO {
    public SchoolMembersDAO() {

    }

//    public static SchoolMembers createAccount(int memberID, String lastname, String firstName, String password, String email) {
//        Connection conn = null;
//
//        try {
//            conn = JDBCTool.getConnection();
//            Statement st = conn.createStatement();
//            String sql = "SELECT * FROM schoolmembers WHERE memberID=? AND lastName=? AND firstName=? AND email=?";
//            ResultSet rs = st.executeQuery("");
//            if (rs.next()) {
//                String un = rs.getString("username");
//                String p = rs.getString("password");
//                String email = rs.getString("email");
//                User u = new User(un, p, email);
//                User var9 = u;
//                return var9;
//            }
//        } catch (SQLException var20) {
//            var20.printStackTrace();
//        } finally {
//            if (conn != null) {
//                try {
//                    conn.close();
//                } catch (SQLException var19) {
//                    var19.printStackTrace();
//                }
//            }
//
//        }

//        return null;
//    }
}
