package pb.pojo;

import java.sql.Timestamp;

public class Notification {
    private int noteID;
    private String title;
    private String content;
    private String type;
    private Timestamp releaseDate;
    private int publisherID;

    public Notification(int noteID, String title, String content, String type, Timestamp releaseDate, int publisherID) {
        this.noteID = noteID;
        this.title = title;
        this.content = content;
        this.type = type;
        this.releaseDate = releaseDate;
        this.publisherID = publisherID;
    }

    public Notification(String title, String content, String type, Timestamp releaseDate, int publisherID) {
        this.title = title;
        this.content = content;
        this.type = type;
        this.releaseDate = releaseDate;
        this.publisherID = publisherID;
    }

    public int getNoteID() {
        return noteID;
    }

    public void setNoteID(int noteID) {
        this.noteID = noteID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Timestamp getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Timestamp releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getPublisherID() {
        return publisherID;
    }

    public void setPublisherID(int publisherID) {
        this.publisherID = publisherID;
    }
}
