package semi.vo;

import java.sql.Date;

public class memberVo {
    private String id;
    private String pw;
    private String nickname;
    private String name;
    private String phone;
    private String email;
    private Date regdate;
    memberVo(){}
    public memberVo(String id, String pw, String nickname, String name, String phone, String email, Date regdate) {
        super();
        this.id = id;
        this.pw = pw;
        this.nickname = nickname;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.regdate = regdate;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPw() {
        return pw;
    }
    public void setPw(String pw) {
        this.pw = pw;
    }
    public String getNickname() {
        return nickname;
    }
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public Date getRegdate() {
        return regdate;
    }
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
}
