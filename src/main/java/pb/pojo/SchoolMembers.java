package pb.pojo;

public class SchoolMembers {
    private int memberID;
    private String lastName;
    private String firstName;
    private String identity;

    public SchoolMembers(int memberID, String lastName, String firstName, String identity) {
        this.memberID = memberID;
        this.lastName = lastName;
        this.firstName = firstName;
        this.identity = identity;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }
}
