package semi.dao;

public class AdminDao {
    private static AdminDao instance  = new AdminDao();
    private AdminDao() {}
    public static AdminDao getInstance() {
        return instance;
    }
}
