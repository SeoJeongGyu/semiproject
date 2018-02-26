package semi.dao;

public class NoticesDao {
    private static NoticesDao instance=new NoticesDao();
    private NoticesDao() {}
    public static NoticesDao getInstance() {
        return instance;
    }
    
}
