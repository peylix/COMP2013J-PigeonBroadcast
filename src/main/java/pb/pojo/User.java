package pb.pojo;

public class User {
    private int userID;
    private String password;
    private String userName;
    private String profilePhoto;
    private String email;
    private String identity;

    public User(int userID, String password, String userName, String profilePhoto, String email, String identity) {
        this.userID = userID;
        this.password = password;
        this.userName = userName;
        this.profilePhoto = profilePhoto;
        this.email = email;
        this.identity = identity;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getProfilePhoto() {
        return profilePhoto;
    }

    public void setProfilePhoto(String profilePhoto) {
        this.profilePhoto = profilePhoto;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }
}