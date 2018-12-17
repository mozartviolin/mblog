package memo;

public class MemoDTO {    
	private int memono    ;
	private String title  ;
	private String content; 
	private String wdate  ;
	private int viewcnt;
	private int grpno;
	private int indent;
	private int ansnum;
	private String wname;
	private String passwd;
	private int refnum;
	
	public int getRefnum() {
		return refnum;
	}
	public void setRefnum(int refnum) {
		this.refnum = refnum;
	}
	public String getWname() {
		return wname;
	}
	public void setWname(String wname) {
		this.wname = wname;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getGrpno() {
		return grpno;
	}
	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public int getAnsnum() {
		return ansnum;
	}
	public void setAnsnum(int ansnum) {
		this.ansnum = ansnum;
	}
	public int getMemono() {
		return memono;
	}
	public void setMemono(int memono) {
		this.memono = memono;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}	
                          
}
