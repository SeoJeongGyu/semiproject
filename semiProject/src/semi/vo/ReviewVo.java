package semi.vo;

import java.sql.Date;

public class ReviewVo {
	private int rno;
	private String rtitle;
	private String rcontent;
	private Date rdate;
	private int rhit;
	private int rgrade;
	private int rreport;
	private String orgfilename;
	private String savefilename;
	private String id;
	
	
	public ReviewVo(int rno, String rtitle, String rcontent, Date rdate, int rhit, int rgrade, int rreport,
			String orgfilename, String savefilename, String id) {
		super();
		this.rno = rno;
		this.rtitle = rtitle;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.rhit = rhit;
		this.rgrade = rgrade;
		this.rreport = rreport;
		this.orgfilename = orgfilename;
		this.savefilename = savefilename;
		this.id = id;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public int getRhit() {
		return rhit;
	}
	public void setRhit(int rhit) {
		this.rhit = rhit;
	}
	public int getRgrade() {
		return rgrade;
	}
	public void setRgrade(int rgrade) {
		this.rgrade = rgrade;
	}
	public int getRreport() {
		return rreport;
	}
	public void setRreport(int rreport) {
		this.rreport = rreport;
	}
	public String getOrgfilename() {
		return orgfilename;
	}
	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}
	public String getSavefilename() {
		return savefilename;
	}
	public void setSavefilename(String savefilename) {
		this.savefilename = savefilename;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	

}
