package pb.pojo;

public class Organization {
    private int orgID;
    private String orgName;
    private String description;
    private int adminID;

    public Organization(int orgID, String orgName, String description, int adminID) {
        this.orgID = orgID;
        this.orgName = orgName;
        this.description = description;
        this.adminID = adminID;
    }

    public int getOrgID() {
        return orgID;
    }

    public void setOrgID(int orgID) {
        this.orgID = orgID;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminId) {
        this.adminID = adminId;
    }
}