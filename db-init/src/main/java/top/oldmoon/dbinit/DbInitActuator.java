package top.oldmoon.dbinit;

import io.netty.util.internal.StringUtil;
import lombok.extern.slf4j.Slf4j;
import reactor.util.annotation.NonNull;
import top.oldmoon.file.FileUtilOm;

import javax.sql.DataSource;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * 数据库初始化配置
 *
 * @author hupg
 * @date `2022/5/9` 13:33
 */
@Slf4j
public class DbInitActuator implements InitInterface {
    private final String name;
    private final DataSource dataSource;

    public DbInitActuator(@NonNull String name, @NonNull DataSource dataSource) {
        this.name = name;
        this.dataSource = dataSource;
    }

    /**
     * 正式开始指定数据库的初始化
     *
     * @author hupg
     * @date 2022/5/11 17:21
     */
    @Override
    public void init() {
        // 创建 数据库连接 和 sql执行器
        try (Connection conn = dataSource.getConnection();
             Statement statement = conn.createStatement()) {
            // 关闭自动提交
            conn.setAutoCommit(false);
            // 执行更新类sql
            updateSql(conn, statement);
            // 执行覆盖类sql脚本
            coverBySqlFile(conn, statement);
        } catch (SQLException | IOException e) {
            log.error("数据库初始化失败：初始化出错：{}", e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * 覆盖执行sql脚本文件
     *
     * @param conn      数据库连接，传入是为了控制事务提交、回滚
     * @param statement sql执行器
     * @author hupg
     * @date 2022/5/11 17:19
     */
    private void coverBySqlFile(Connection conn, Statement statement) throws SQLException, IOException {
        File[] files = FileUtilOm.getRootFiles(name);
        log.info("-=-=-=-=-=-=-=-=覆盖数据开始=-=-=-=-=-=-=-=-=-");
        for (File file : files) {
            String name = file.getName();
            if (name.endsWith(".sql")) {
                try {
                    List<String> sqlList = getEffectiveSql(file);
                    executeSql(sqlList, statement);
                } catch (SQLException | IOException e) {
                    log.error("{}执行出错！", name);
                    conn.rollback();
                    throw e;
                }
            }
        }
        conn.commit();
        log.info("-=-=-=-=-=-=-=-=覆盖数据结束=-=-=-=-=-=-=-=-=-");
    }

    /**
     * 处理sql脚本，获取其中有效的sql
     * <p>并返回有效sql集合</p>
     *
     * @param file sql脚本文件对象
     * @return List<String> 有效的sql集合
     * @author hupg
     * @date 2022/5/11 17:24
     */
    private List<String> getEffectiveSql(File file) throws IOException {
        List<String> sqlList = new ArrayList<>();
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(file))) {
            String line;
            boolean inNotes = false;
            StringBuilder sql = new StringBuilder();
            while ((line = bufferedReader.readLine()) != null) {
                if (line.contains("/*")) {
                    inNotes = true;
                }
                if (inNotes || line.startsWith("-- ")) {
                    if (line.contains("*/")) {
                        inNotes = false;
                    }
                    continue;
                }
                sql.append(line);
                if (line.contains(";")) {
                    sqlList.add(sql.toString());
                    sql.setLength(0);
                }
            }
        }
        return sqlList;
    }

    /**
     * 批量执行sql：
     * <p>遍历sql集合，单独执行每一个sql</p>
     *
     * @param sqlList   sql集合
     * @param statement sql执行器
     * @author hupg
     * @date 2022/5/11 17:27
     */
    private void executeSql(List<String> sqlList, Statement statement) throws SQLException {
        for (String sql : sqlList) {
            if (!StringUtil.isNullOrEmpty(sql.trim())) {
                statement.execute(sql);
            }
        }
    }

    private void updateSql(Connection conn, Statement statement) {
    }

    @Override
    public void close() {

    }
}