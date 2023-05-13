package pb.tool;

import java.io.*;
import java.sql.SQLException;

public class TextTool {
    private String username;
    private String password;

    public TextTool() {
        readDatabase();
    }

    public void readDatabase() {
        try {
            InputStream in = getClass().getClassLoader().getResourceAsStream("text/database_info.txt");
            assert in != null;
            BufferedReader reader = new BufferedReader(new InputStreamReader(in));

            username = reader.readLine();
            password = reader.readLine();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String[] readSQL() {
        InputStream in = TextTool.class.getClassLoader().getResourceAsStream("text/init_database.sql");
        assert in != null;
        BufferedReader reader = new BufferedReader(new InputStreamReader(in));
        String line;
        StringBuilder sb = new StringBuilder();
        try {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return sb.toString().split(";");
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}
