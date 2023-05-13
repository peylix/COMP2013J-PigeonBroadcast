package pb.dao;

import pb.tool.JDBCTool;
import pb.pojo.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    public static List<Employee> getAllEmployees() {
        List<Employee> employees = new ArrayList<Employee>();

        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM employee");

            while (rs.next()) {

                int empno = rs.getInt("empno");
                String firstname = rs.getString("firstname");
                String familyname = rs.getString("familyname");
                String job = rs.getString("job");
                float salary = rs.getFloat("salary");
                int deptno = rs.getInt("deptno");

                Employee e = new Employee(empno, firstname, familyname, job, salary, deptno);

                employees.add(e);
            }

            rs.close();
            st.close();
            conn.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employees;
    }


    //TODO Question 2
    public static Employee getEmployeeByID(int eid) {
        Employee employee = null;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM employee WHERE empno = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, eid);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                int empno = rs.getInt("empno");
                String firstname = rs.getString("firstname");
                String familyname = rs.getString("familyname");
                String job = rs.getString("job");
                float salary = rs.getFloat("salary");
                int deptno = rs.getInt("deptno");

                employee = new Employee(empno, firstname, familyname, job, salary, deptno);

            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    //TODO Question 3
    public static boolean deleteEmployeeByID(int eid) {
        boolean deleted = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "DELETE FROM employee WHERE empno = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, eid);

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

    //TODO Question 4
    public static boolean updateEmployee(Employee e, int newEmpno) {
        boolean updated = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "UPDATE employee SET empno = ?, firstname = ?, familyname = ?, job = ?, salary = ?, deptno = ? WHERE empno = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, newEmpno);
            pst.setString(2, e.getFirstname());
            pst.setString(3, e.getFamilyname());
            pst.setString(4, e.getJob());
            pst.setFloat(5, e.getSalary());
            pst.setInt(6, e.getDeptno());
            pst.setInt(7, e.getEmpno());
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



    //TODO Question 5
    public static boolean insertEmployee(Employee e) {
        boolean inserted = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "INSERT INTO employee (empno, firstname, familyname, job, salary, deptno) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, e.getEmpno());
            pst.setString(2, e.getFirstname());
            pst.setString(3, e.getFamilyname());
            pst.setString(4, e.getJob());
            pst.setFloat(5, e.getSalary());
            pst.setInt(6, e.getDeptno());

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

    public static List<Employee> getEmployeesByPage(int offset, int recordsPerPage) {
        List<Employee> employees = new ArrayList<>();

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM employee LIMIT ? OFFSET ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, recordsPerPage);
            pst.setInt(2, offset);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                int empno = rs.getInt("empno");
                String firstname = rs.getString("firstname");
                String familyname = rs.getString("familyname");
                String job = rs.getString("job");
                float salary = rs.getFloat("salary");
                int deptno = rs.getInt("deptno");

                Employee e = new Employee(empno, firstname, familyname, job, salary, deptno);

                employees.add(e);
            }

            rs.close();
            pst.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employees;
    }

    public static int getNumOfRecords() {
        int numOfRecords = 0;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT COUNT(*) FROM employee";
            PreparedStatement pst = conn.prepareStatement(query);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                numOfRecords = rs.getInt(1);
            }

            rs.close();
            pst.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return numOfRecords;
    }



}
