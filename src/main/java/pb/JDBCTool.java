package pb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCTool {

    public static Connection getConnection(String url, String dbname, String username, String password) {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://" + url + "/" + dbname, username, password);
            System.out.println("Connected to database " + dbname + " on " + url);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return conn;
    }

    //TODO Question 1 Check user name and password
    public static Connection getConnection() {
        Connection conn = JDBCTool.getConnection("localhost", "employee", "root", "181818188");
        if (conn == null) {
            System.out.println("Failed to get database connection");
        }
        return conn;
    }
}
