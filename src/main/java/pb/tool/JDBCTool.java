package pb.tool;

import java.sql.*;

public class JDBCTool {
    static TextTool textTool = new TextTool();
    static String url = "jdbc:mysql://localhost/";
    static String dbName = "pigeon_broadcast";
    static String username = textTool.getUsername();
    static String password = textTool.getPassword();


    public static void checkConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            // 检查数据库是否存在
            DatabaseMetaData meta = conn.getMetaData();
            ResultSet resultSet = meta.getCatalogs();

            boolean databaseExists = false;
            while (resultSet.next()) {
                String databaseName = resultSet.getString(1);
                if (databaseName.equals(dbName)) {
                    databaseExists = true;
                    System.out.println(1);
                    break;
                }

            }

            // 不存在，创建数据库和表格
            if (!databaseExists) {
                System.out.println("Cannot find database " + dbName + ", create one");
                String[] sqls = TextTool.readSQL();
                Statement stmt = conn.createStatement();
                // 创建数据库
                stmt.executeUpdate(sqls[0]);
                // 连接数据库
                conn = DriverManager.getConnection(url + dbName, username, password);
                // 创建表格
                stmt = conn.createStatement();
                for (int i = 1; i < sqls.length; i++) {
                    try {
                        stmt.executeUpdate(sqls[i]);
                    } catch (SQLException e) {
                        System.out.println("Failed to execute SQL: " + sqls[i]);
                        e.printStackTrace();
                    }
                }
                // 为SchoolMember添加信息
                String[] members = TextTool.readMembers();
                for (String line : members) {
                    String[] ss = line.split(" ");
                    String sql = "INSERT INTO SchoolMembers (memberId, lastName, firstName, identity) VALUES (?, ?, ?, ?)";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    String memberId = ss[0];
                    String lastName = ss[1];
                    String firstName = ss[2];
                    String identity = "";
                    switch (memberId.charAt(0)) {
                        case '1' -> identity = "admin";
                        case '2' -> identity = "teacher";
                        case '3' -> identity = "student";
                    }
                    ps.setString(1, memberId);
                    ps.setString(2, lastName);
                    ps.setString(3, firstName);
                    ps.setString(4, identity);
                    ps.execute();
                }
            }

            System.out.println(dbName + " initialized");
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url + dbName, username, password);
            System.out.println("Connected to database " + dbName);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        if (conn == null) {
            System.out.println("Failed to get database connection");
        }
        return conn;
    }
}
