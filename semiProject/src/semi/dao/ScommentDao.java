package semi.dao;



public class ScommentDao {
	private static ScommentDao instance=new ScommentDao();
	private ScommentDao() {}
	public static ScommentDao getInstance() {
		return instance;
	}
	
	
	
}
