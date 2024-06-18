



public class Registration {
	private int _sid;
	private String _sname;
	private String _email;
	private String _password;
	
	public Registration(int sid,String  sname,String email,String password) {
		set_sid(sid);
		set_sname(sname);
		set_email(email);
		set_password(password);
	
	}
	 @Override
    public String toString() {
        return "{" +
                "\"sid\":" + get_sid() +
                ", \"sname\":\"" + get_sname() + '\"' +
                ", \"email\":\"" + get_email() + '\"' +
                ", \"password\":\"" + get_password() + '\"' +
               
                '}';
    }
	public int get_sid() {
		return _sid;
	}
	public void set_sid(int _sid) {
		this._sid = _sid;
	}
	public String get_sname() {
		return _sname;
	}
	public void set_sname(String _sname) {
		this._sname = _sname;
	}
	public String get_email() {
		return _email;
	}
	public void set_email(String _email) {
		this._email = _email;
	}
	public String get_password() {
		return _password;
	}
	public void set_password(String _password) {
		this._password = _password;
	}
	
}
