package org.kostagram.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.MemberDAO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProfileUpdateController implements Controller {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (request.getMethod().equals("POST") == false) {
            System.out.println("포스트 요청 방식이 아닙니다");
            return "redirect:index.jsp";
        }
        // String path = request.getContextPath();
        // String directory = request.getServletContext().getRealPath("/upload/");
        String directory = "C:\\Users\\Yong Lee\\git\\KOSTAGRAM\\kostagram-project\\src\\main\\webapp\\images";
        int maxSize = 1024 * 1024 * 100;
        String encoding = "utf-8";
    
        MultipartRequest multipartRequest 
        = new MultipartRequest(request, directory, maxSize, encoding
                , new DefaultFileRenamePolicy());
                
        System.out.println("ProfileUpdateController - directory 확인: " + directory);
        
        String fileName = multipartRequest.getOriginalFileName("file");
        String fileRealName = multipartRequest.getFilesystemName("file");
        String introduce = request.getParameter("introduce");
        
        MemberDAO.getInstance().updateProfile(fileName, fileRealName, introduce);
        System.out.println("테스트 출력 파일명: " + fileName);
        System.out.println("테스트 출력 실제 파일명: " + fileRealName);
        return "redirect:MainController.do";
    }
}
