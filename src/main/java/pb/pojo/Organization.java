package pb.pojo;

public class Organization {
    private int orgID;
    private String orgName;
    private String description;
    private int adminId;

    public Organization(int orgID, String orgName, String description, int adminId) {
        this.orgID = orgID;
        this.orgName = orgName;
        this.description = description;
        this.adminId = adminId;
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

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }
}
