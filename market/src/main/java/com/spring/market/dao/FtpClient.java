package com.spring.market.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.SocketException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

public class FtpClient {
	private String serverIp;
	private int serverPort;
	private String user;
	private String password;

	public FtpClient(String serverIp, int serverPort, String user, String password) {
		this.serverIp = serverIp;
		this.serverPort = serverPort;
		this.user = user;
		this.password = password;
	}

	public void upload(File fileObj, String fileName, int memberno) throws SocketException, IOException, Exception {
		FileInputStream fis = null;
		FTPClient ftpClient = new FTPClient();

		try {
			ftpClient.connect(serverIp, serverPort); // ftp 연결
			ftpClient.setControlEncoding("UTF-8"); // ftp 인코딩설정
			int reply = ftpClient.getReplyCode(); // 응답코드받기

			if (!FTPReply.isPositiveCompletion(reply)) { // 응답이 false 라면 연결 해제 exception 발생
				ftpClient.disconnect();
				throw new Exception(serverIp + " FTP 서버 연결 실패");
			}

			ftpClient.setSoTimeout(1000 * 10); // timeout 설정 10초
			ftpClient.login(user, password); // ftp 로그인
			if (ftpClient.login(user, password) == false) {
				throw new Exception("FTP서버에 로그인할 수 없습니다.");
			}
			
			FTPFile[] files = ftpClient.listFiles();
			
			DateFormat dateFormater=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			for(FTPFile file:files) {
				String details=file.getName();
				if(file.isDirectory()) {
					details="["+details+"]";
					
				}
				details+="\t\t"+file.getSize();
				details+="\t\t"+dateFormater.format(file.getTimestamp().getTime());
				System.out.println(details);
			}
			
			
			
			Date from =new Date();
			SimpleDateFormat nowDate = new SimpleDateFormat("yyyy-MM-dd");
			String now=nowDate.format(from);
			
			ftpClient.makeDirectory("html/"+memberno);
			ftpClient.makeDirectory("html/"+memberno+"/profile");
			ftpClient.makeDirectory("html/"+memberno+"/board");
			ftpClient.changeWorkingDirectory("/html/"+memberno+"/profile");
			
			

			ftpClient.setFileType(FTP.BINARY_FILE_TYPE); // 파일타입설정
			ftpClient.enterLocalActiveMode(); // active 모드 설정

			fis = new FileInputStream(fileObj);
			boolean isSuccess = ftpClient.storeFile(fileObj.getName(), fis);
			if (isSuccess) {
				System.out.print("업로드성공%");
				System.out.print(ftpClient + "%");
				System.out.print(ftpClient.getReplyCode() + "%");
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (ftpClient.isConnected()) {
				ftpClient.disconnect();
			}
			if (fis != null) {
				fis.close();
			}
		}

	}
	
	public void boardUpload(File fileObj, String fileName,int memberno,int boardno) throws SocketException, IOException, Exception {
		FileInputStream fis = null;
		FTPClient ftpClient = new FTPClient();
		System.out.println(memberno);
		System.out.println(boardno);
		

		try {
			ftpClient.connect(serverIp, serverPort); // ftp 연결
			ftpClient.setControlEncoding("UTF-8"); // ftp 인코딩설정
			int reply = ftpClient.getReplyCode(); // 응답코드받기

			if (!FTPReply.isPositiveCompletion(reply)) { // 응답이 false 라면 연결 해제 exception 발생
				ftpClient.disconnect();
				throw new Exception(serverIp + " FTP 서버 연결 실패");
			}

			ftpClient.setSoTimeout(1000 * 10); // timeout 설정 10초
			ftpClient.login(user, password); // ftp 로그인
			if (ftpClient.login(user, password) == false) {
				throw new Exception("FTP서버에 로그인할 수 없습니다.");
			}
			
			FTPFile[] files = ftpClient.listFiles();
			
			DateFormat dateFormater=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			for(FTPFile file:files) {
				String details=file.getName();
				if(file.isDirectory()) {
					details="["+details+"]";
					
				}
				details+="\t\t"+file.getSize();
				details+="\t\t"+dateFormater.format(file.getTimestamp().getTime());
				System.out.println(details);
			}

			ftpClient.makeDirectory("html/"+memberno);
			ftpClient.makeDirectory("html/"+memberno+"/board/");
			ftpClient.makeDirectory("html/"+memberno+"/board/"+boardno);
			ftpClient.changeWorkingDirectory("/html/"+memberno+"/board/"+boardno);
			
			

			ftpClient.setFileType(FTP.BINARY_FILE_TYPE); // 파일타입설정
			ftpClient.enterLocalActiveMode(); // active 모드 설정

			fis = new FileInputStream(fileObj);
			boolean isSuccess = ftpClient.storeFile(fileObj.getName(), fis);
			if (isSuccess) {
				System.out.print("업로드성공%");
				System.out.print(ftpClient + "%");
				System.out.print(ftpClient.getReplyCode() + "%");
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (ftpClient.isConnected()) {
				ftpClient.disconnect();
			}
			if (fis != null) {
				fis.close();
			}
		}

	}

}