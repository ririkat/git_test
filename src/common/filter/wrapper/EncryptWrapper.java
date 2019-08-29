package common.filter.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		String value="";
		if(name!=null && name.equals("password")) {
			super.getParameter(name);//client 보낸 실제값
			//SHA512 암호화 방식 사용
			value=getSha512(super.getParameter(name));
			System.out.println("암호화된 비번 : "+value);
			return value;
		}else {
			return super.getParameter(name);
		}
	}
	
	private String getSha512(String val) {
		String encPwd="";
		MessageDigest md = null;
		try {
			md=MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes= val.getBytes(Charset.forName("UTF-8"));
		md.update(bytes);
		encPwd=Base64.getEncoder().encodeToString(md.digest());//byte를 string으로 인코딩
		
		return encPwd;
	}
}
