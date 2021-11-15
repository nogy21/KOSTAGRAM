package org.kostagram.controller;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.MemberDAO;
import org.kostagram.model.MemberVO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProfileUpdateController implements Controller {

	public void copyAndPasteFile(String orgFilePath, String localFilepath, String fileName) throws IOException {
        BufferedInputStream bis=null;
        BufferedOutputStream bos=null; 
        try {
          bis = new BufferedInputStream(new FileInputStream(orgFilePath+File.separator+fileName));
          bos = new BufferedOutputStream(new FileOutputStream(localFilepath + File.separator + fileName));
          int data = bis.read();
          
          while(data != -1) {
              bos.write(data);
              data = bis.read();
          }
        }finally {
            if(bos != null) { bos.close(); }
            if(bis != null) { bis.close(); }
        }
    }//copyAndPasteFile method
	
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	 if (request.getMethod().equals("POST") == false) {
             System.out.println("포스트 요청 방식이 아닙니다");
             return "redirect:index.jsp";
         }
         MemberVO vo = (MemberVO)request.getSession().getAttribute("loginVO");
         String memberId = vo.getMemberId();

         // String path = request.getContextPath();
         String serverDirectory = request.getServletContext().getRealPath("upload"); //서버 폴더 경로
         File Folder = new File(serverDirectory);

         // upload 디렉토리가 없을경우 디렉토리를 생성합니다.
         if (!Folder.exists()) {
            try{
                Folder.mkdir(); //폴더 생성합니다.
                 } 
                 catch(Exception e){
                e.getStackTrace();
            }        
         }
         // 로컬 경로 지정
         // 원래 코드 : String directory = "\\images\\";
         
         //★★★ localDirectory 는 각 팀원별 디렉토리로 수정하여 실행할 것!!
         String localDirectory = "C:\\Users\\Yong Lee\\git\\KOSTAGRAM\\kostagram-project\\src\\main\\webapp\\images";
         int maxSize = 1024 * 1024 * 100;
         String encoding = "utf-8";
         
         MultipartRequest multipartRequest 
         = new MultipartRequest(request, serverDirectory, maxSize, encoding
                 , new DefaultFileRenamePolicy());
         
         String fileName = multipartRequest.getOriginalFileName("file");
         String fileRealName = multipartRequest.getFilesystemName("file");
         String introduce = multipartRequest.getParameter("introduce");
        MemberDAO.getInstance().updateProfile(fileName, fileRealName, introduce, memberId);
        copyAndPasteFile(serverDirectory, localDirectory, fileName);
        return "redirect:MainController.do";
    }
}
