package pb.dao;

import pb.pojo.Employee;
import pb.pojo.Notification;
import pb.pojo.NotificationType;
import pb.tool.JDBCTool;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotificationDAO {
    public static List<Notification> getAllNotifications() {
        List<Notification> notifications = new ArrayList<>();

        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM notification");

            while (rs.next()) {
                int noteID = rs.getInt("noteId");
                String title = rs.getString("title");
                String content = rs.getString("content");
                NotificationType type = NotificationType.valueOf(rs.getString("type")); // This is a workaround since JDBC does not support enum.
                Timestamp releaseDate = rs.getTimestamp("releaseDate");
                int publisherID = rs.getInt("publisherId");

                Notification n = new Notification(noteID, title, content, type, releaseDate, publisherID);

                notifications.add(n);
            }

            rs.close();
            st.close();
            conn.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return notifications;
    }

    public static Notification getNotificationByID(int nid) {
        Notification notification = null;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM notification WHERE noteId = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, nid);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                int noteID = rs.getInt("noteId");
                String title = rs.getString("title");
                String content = rs.getString("content");
                NotificationType type = NotificationType.valueOf(rs.getString("type")); // This is a workaround since JDBC does not support enum.
                Timestamp releaseDate = rs.getTimestamp("releaseDate");
                int publisherID = rs.getInt("publisherId");

                notification = new Notification(noteID, title, content, type, releaseDate, publisherID);

            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notification;
    }

    public static Notification getNotificationByTitle(String nTitle) {
        Notification notification = null;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM notification WHERE title = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, nTitle);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                int noteID = rs.getInt("noteId");
                String title = rs.getString("title");
                String content = rs.getString("content");
                NotificationType type = NotificationType.valueOf(rs.getString("type")); // This is a workaround since JDBC does not support enum.
                Timestamp releaseDate = rs.getTimestamp("releaseDate");
                int publisherID = rs.getInt("publisherId");

                notification = new Notification(noteID, title, content, type, releaseDate, publisherID);

            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notification;
    }

    public static Notification getNotificationByPublisherID(int pid) {
        Notification notification = null;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM notification WHERE publisherId = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, pid);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                int noteID = rs.getInt("noteId");
                String title = rs.getString("title");
                String content = rs.getString("content");
                NotificationType type = NotificationType.valueOf(rs.getString("type")); // This is a workaround since JDBC does not support enum.
                Timestamp releaseDate = rs.getTimestamp("releaseDate");
                int publisherID = rs.getInt("publisherId");

                notification = new Notification(noteID, title, content, type, releaseDate, publisherID);

            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notification;
    }

    public static boolean deleteNotificationByID(int nid) {
        boolean deleted = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "DELETE FROM notification WHERE noteId = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, nid);

            int rows = pst.executeUpdate();

            if (rows > 0) {
                deleted = true;
            }

            pst.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return deleted;
    }

    public static boolean deleteNotificationByTitle(String nTitle) {
        boolean deleted = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "DELETE FROM notification WHERE title = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, nTitle);

            int rows = pst.executeUpdate();

            if (rows > 0) {
                deleted = true;
            }

            pst.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return deleted;
    }

    public static boolean deleteNotificationByPublisherID(int pid) {
        boolean deleted = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "DELETE FROM notification WHERE publisherId = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, pid);

            int rows = pst.executeUpdate();

            if (rows > 0) {
                deleted = true;
            }

            pst.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return deleted;
    }

    public static boolean updateNotification(Notification notification, int newID) {
        boolean updated = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "UPDATE notification SET noteId = ?, title = ?, content = ?, type = " + notification.getType() + ", releaseDate = ?, publisherId = ? WHERE noteId = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, newID);
            pst.setString(2, notification.getTitle());
            pst.setString(3, notification.getContent());
            pst.setTimestamp(4, notification.getReleaseDate());
            pst.setInt(5, notification.getPublisherID());
            pst.setInt(6, notification.getNoteID());
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

    public static boolean insertNotification(Notification notification) {
        boolean inserted = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "INSERT INTO notification (noteId, title, content, type, releaseDate, publisherId) VALUES (?, ?, ?, " + notification.getType() +", ?, ?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, notification.getTitle());
            pst.setString(2, notification.getContent());
            pst.setTimestamp(3, notification.getReleaseDate());
            pst.setInt(4, notification.getPublisherID());
            pst.setInt(5, notification.getNoteID());

            int rows = pst.executeUpdate();

            if (rows > 0) {
                inserted = true;
            }

            pst.close();
            conn.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return inserted;
    }
}
