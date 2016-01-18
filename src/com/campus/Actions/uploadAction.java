package com.campus.Actions;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.campus.utils.commonUtil;

public class uploadAction {
	private File myFile;
	private String myFileContentType;
	private String myFileFileName;
	private String destPath;
	
	public void execute()
	{
		/* Copy file to a safe location */
		destPath  = ServletActionContext.getServletContext().getRealPath("/")+"/upload/";
		try{
			String ext = myFileFileName.substring(myFileFileName.indexOf("."));
			System.out.println(ext);
			//setMyFileFileName(new Date().getTime()+"."+name[1]);
			long time = new Date().getTime();
			String tmpString = time+ext;
			File destFile  = new File(getDestPath()+tmpString);
			FileUtils.copyFile(myFile, destFile);
			commonUtil.getPrintWriter().print("upload/"+tmpString);
			System.out.println("成功保存图片：upload/"+tmpString);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	public File getMyFile() {
		return myFile;
	}
	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}
	public String getMyFileContentType() {
		return myFileContentType;
	}
	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}
	public String getMyFileFileName() {
		return myFileFileName;
	}
	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}
	public String getDestPath() {
		return destPath;
	}
	public void setDestPath(String destPath) {
		this.destPath = destPath;
	}
	
}
