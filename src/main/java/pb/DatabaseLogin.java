package pb;

import java.io.*;

public class DatabaseLogin {
    private String username;
    private String password;

    public DatabaseLogin() {
        readUser();
    }
    public void readUser() {
        try {
            InputStream in = getClass().getClassLoader().getResourceAsStream("text/databaseLogin.txt");
            BufferedReader reader = new BufferedReader(new InputStreamReader(in));

            username = reader.readLine();
            password = reader.readLine();
            System.out.println(111);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}
