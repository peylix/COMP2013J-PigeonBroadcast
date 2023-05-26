package pb.tool;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ServletTool implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Initialize the database before the server starts
        JDBCTool.checkConnection();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
