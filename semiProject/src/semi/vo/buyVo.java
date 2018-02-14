package semi.vo;

import java.sql.Date;

public class buyVo {
	private int bno;
	private String btitle;
	private String bcontent;
	private Date bdate;
	private int bgrade;
	private int bhit;
	private String id;
	private int breport;
	
	public buyVo() {}

	public buyVo(int bno, String btitle, String bcontent, Date bdate, int bgrade, int bhit, String id, int breport) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bdate = bdate;
		this.bgrade = bgrade;
		this.bhit = bhit;
		this.id = id;
		this.breport = breport;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public int getBgrade() {
		return bgrade;
	}

	public void setBgrade(int bgrade) {
		this.bgrade = bgrade;
	}

	public int getBhit() {
		return bhit;
	}

	public void setBhit(int bhit) {
		this.bhit = bhit;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBreport() {
		return breport;
	}

	public void setBreport(int breport) {
		this.breport = breport;
	}
	
	
	
	

}
