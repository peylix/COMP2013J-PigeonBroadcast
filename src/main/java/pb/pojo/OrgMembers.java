package pb.pojo;

public class OrgMembers {
    private int orgID;
    private int userID;

    public OrgMembers(int orgID, int userID) {
        this.orgID = orgID;
        this.userID = userID;
    }

    public int getOrgID() {
        return orgID;
    }

    public void setOrgID(int orgID) {
        this.orgID = orgID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
}
