package pb.dao;

import pb.pojo.Notification;
import pb.pojo.Organization;
import pb.tool.JDBCTool;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrganizationDAO {
    public static List<Organization> getAllOrganizations() {
        List<Organization> organizations = new ArrayList<>();

        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM organization");

            while (rs.next()) {
                int orgID = rs.getInt("orgID");
                String orgName = rs.getString("orgName");
                String description = rs.getString("description");
                int adminID = rs.getInt("adminId");

                Organization o = new Organization(orgID, orgName, description, adminID);

                organizations.add(o);
            }

            rs.close();
            st.close();
            conn.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return organizations;
    }

    public static List<Organization> getOrganizationByUserID(int nid) {
        List<Organization> organizations = new ArrayList<>();

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM organization WHERE CAST(adminID as CHAR) LIKE ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, "%" + nid + "%");

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int orgID = rs.getInt("orgID");
                String orgName = rs.getString("orgName");
                String description = rs.getString("description");
                int adminID = rs.getInt("adminId");

                Organization organization = new Organization(orgID, orgName, description, adminID);
                organizations.add(organization);

            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return organizations;
    }


    public static Organization getOrganizationByID(int oid) {
        Organization organization = null;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "SELECT * FROM organization WHERE orgID = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, oid);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                int orgID = rs.getInt("orgID");
                String orgName = rs.getString("orgName");
                String description = rs.getString("description");
                int adminID = rs.getInt("adminId");

                organization = new Organization(orgID, orgName, description, adminID);

            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return organization;
    }


    public static boolean deleteOrganizationByID(int oid) {
        boolean deleted = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "DELETE FROM organization WHERE orgID = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, oid);

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

    public static boolean insertOrganization(Organization organization) {
        boolean inserted = false;

        try {
            Connection conn = JDBCTool.getConnection();
            String query = "INSERT INTO organization (orgID, orgName, description, adminId) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, organization.getOrgID());
            pst.setString(2, organization.getOrgName());
            pst.setString(3, organization.getDescription());
            pst.setInt(4, organization.getAdminID());

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
