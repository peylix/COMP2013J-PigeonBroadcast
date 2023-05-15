package pb.dao;

import pb.pojo.Course;
import pb.tool.JDBCTool;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {
    public static List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();

        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM course");

            while (rs.next()) {
                int courseID = rs.getInt("courseId");
                String courseName = rs.getString("courseName");
                String description = rs.getString("description");
                int teacherID = rs.getInt("teacherId");

                Course c = new Course(courseID, courseName, description, teacherID);
                courses.add(c);
            }

            rs.close();
            st.close();
            conn.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courses;
    }

    public static Course getCourseByID(int cid) {
        Course course = null;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM course WHERE courseId = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, cid);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                int courseID = rs.getInt("courseId");
                String courseName = rs.getString("courseName");
                String description = rs.getString("description");
                int teacherID = rs.getInt("teacherId");

                course = new Course(courseID, courseName, description, teacherID);

            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return course;
    }

    public static boolean deleteCourseByID(int cid) {
        boolean deleted = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "DELETE FROM course WHERE courseId = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, cid);

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

    public static boolean updateCourse(Course course, int newID) {
        boolean updated = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "UPDATE course SET courseId = ?, courseName = ?, description = ?, teacherId = ? WHERE courseId = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, newID);
            pst.setInt(2, course.getCourseID());
            pst.setString(3, course.getCourseName());
            pst.setString(4, course.getDescription());
            pst.setInt(5, course.getTeacherID());
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

    public static boolean insertCourse(Course course) {
        boolean inserted = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "INSERT INTO course (courseId, courseName, description, teacherId) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, course.getCourseID());
            pst.setString(2, course.getCourseName());
            pst.setString(3, course.getDescription());
            pst.setInt(4, course.getTeacherID());

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
