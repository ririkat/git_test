
package common.filerename;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {
	
	@Override
	public File rename(File oldFile) {
		File newFile=null;
		do {
			//파일 rename을 위한 준비값
			long currenTime=System.currentTimeMillis();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum=(int)(Math.random()*10000);
			
			//파일의 확장자 가져오기
			//rename시에 확장자까지 변경하면??? 안됨!
			String oldName=oldFile.getName();
			//확장자명까지 다 가져옴, abc.jsp
			String ext="";
			int dot=oldName.indexOf(".");
			if(dot>-1) {
				ext=oldName.substring(dot);
			}
			String newName=sdf.format(new Date(currenTime))+"_"+rndNum+ext;
			
			newFile=new File(oldFile.getParent(), newName);
		
		}while(!createNewFile(newFile));
		return newFile;
		
	}
	
	private boolean createNewFile(File newFile) {
		//파일이 있는지 확인하고 있으면 파일을 생성하지 않고 -> 다른이름으로 변경, 없으면 생성
		try{
			return newFile.createNewFile();
		}catch(IOException e) {
			e.printStackTrace();
			return false;
		}
	}

}
