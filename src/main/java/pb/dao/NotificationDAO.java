package pb.dao;

import pb.pojo.Notification;
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
                String type = rs.getString("type"); // This is a workaround since JDBC does not support enum.
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

    public static List<Notification> getNotificationByID(int nid) {
        List<Notification> notifications = new ArrayList<>();

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM notification WHERE CAST(noteId as CHAR) LIKE ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, "%" + nid + "%");

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                int noteID = rs.getInt("noteId");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String type = rs.getString("type");
                Timestamp releaseDate = rs.getTimestamp("releaseDate");
                int publisherID = rs.getInt("publisherId");

                Notification notification = new Notification(noteID, title, content, type, releaseDate, publisherID);
                notifications.add(notification);

            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }

    public static List<Notification> getNotificationByTitle(String nTitle) {
        List<Notification> notifications = new ArrayList<>();

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM notification WHERE title LIKE ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, "%" + nTitle + "%");

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                int noteID = rs.getInt("noteId");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String type = rs.getString("type");
                Timestamp releaseDate = rs.getTimestamp("releaseDate");
                int publisherID = rs.getInt("publisherId");

                Notification notification = new Notification(noteID, title, content, type, releaseDate, publisherID);
                notifications.add(notification);

            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }

    public static List<Notification> getNotificationByContent(String nContent) {
        List<Notification> notifications = new ArrayList<>();

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM notification WHERE content LIKE ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, "%" + nContent + "%");

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                int noteID = rs.getInt("noteId");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String type = rs.getString("type");
                Timestamp releaseDate = rs.getTimestamp("releaseDate");
                int publisherID = rs.getInt("publisherId");

                Notification notification = new Notification(noteID, title, content, type, releaseDate, publisherID);
                notifications.add(notification);

            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }

    public static List<Notification> getNotificationByType(String nType) {
        List<Notification> notifications = new ArrayList<>();

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM notification WHERE type LIKE ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, "%" + nType + "%");

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                int noteID = rs.getInt("noteId");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String type = rs.getString("type");
                Timestamp releaseDate = rs.getTimestamp("releaseDate");
                int publisherID = rs.getInt("publisherId");

                Notification notification = new Notification(noteID, title, content, type, releaseDate, publisherID);
                notifications.add(notification);

            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }

    public static List<Notification> getNotificationByReleaseTime(Timestamp nTime) {
        List<Notification> notifications = new ArrayList<>();

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM notification WHERE releaseDate LIKE ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setTimestamp(1, nTime);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                int noteID = rs.getInt("noteId");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String type = rs.getString("type");
                Timestamp releaseDate = rs.getTimestamp("releaseDate");
                int publisherID = rs.getInt("publisherId");

                Notification notification = new Notification(noteID, title, content, type, releaseDate, publisherID);
                notifications.add(notification);

            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }

    public static List<Notification> getNotificationByPublisherID(int pid) {
        List<Notification> notifications = new ArrayList<>();

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM notification WHERE CAST(publisherId as CHAR) LIKE ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, "%" + pid + "%");

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                int noteID = rs.getInt("noteId");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String type = rs.getString("type"); // This is a workaround since JDBC does not support enum.
                Timestamp releaseDate = rs.getTimestamp("releaseDate");
                int publisherID = rs.getInt("publisherId");

                Notification notification = new Notification(noteID, title, content, type, releaseDate, publisherID);
                notifications.add(notification);

            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
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

    public static boolean updateNotification(Notification notification) {
        boolean updated = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "UPDATE notification SET title = ?, content = ? WHERE noteId = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, notification.getTitle());
            pst.setString(2, notification.getContent());
            pst.setInt(2, notification.getNoteID());
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
