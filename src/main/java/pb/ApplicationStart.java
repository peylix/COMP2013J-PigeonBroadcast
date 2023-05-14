package pb;

import java.io.*;
import java.util.Scanner;

public class ApplicationStart {
    public static void main(String[] args) throws IOException {
        Scanner scanner = new Scanner(System.in);

        InputStream in = ApplicationStart.class.getClassLoader().getResourceAsStream("text/school_member.txt");
        assert in != null;
        BufferedReader reader = new BufferedReader(new InputStreamReader(in));
        String lin = scanner.nextLine();
        System.out.println(lin);
        String[] ids = lin.split(" ");


        String[] ss = new String[200];
        String line;
        int i = 0;
        while ((line = reader.readLine()) != null) {
            String[] s = line.split(" ");
            ss[i] = ids[i] + " " + s[1] + " " + s[2];
            System.out.println(ss[i]);
            i++;
        }
    }
}
