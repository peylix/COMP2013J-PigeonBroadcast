package pb.tool;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ServletTool implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        JDBCTool.checkConnection();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // 这里是应用停止时运行的代码
    }
}
