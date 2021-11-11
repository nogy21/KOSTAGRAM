package org.kostagram.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.MemberDAO;
import org.kostagram.model.MemberVO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProfileUpdateController implements Controller {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (request.getMethod().equals("POST") == false) {
            System.out.println("포스트 요청 방식이 아닙니다");
            return "redirect:index.jsp";
        }
        MemberVO vo = (MemberVO)request.getSession().getAttribute("loginVO");
        String memberId = vo.getMemberId();

        // String path = request.getContextPath();
        // String directory = request.getServletContext().getRealPath("/upload/");
        // 로컬 경로 지정
        String directory = "\\\\Mac\\Home\\Documents\\kosta\\kostagram-project\\src\\main\\webapp\\images";
        int maxSize = 1024 * 1024 * 100;
        String encoding = "utf-8";
    
        MultipartRequest multipartRequest 
        = new MultipartRequest(request, directory, maxSize, encoding
                , new DefaultFileRenamePolicy());
        
        String fileName = multipartRequest.getOriginalFileName("file");
        String fileRealName = multipartRequest.getFilesystemName("file");
        String introduce = multipartRequest.getParameter("introduce");
        MemberDAO.getInstance().updateProfile(fileName, fileRealName, introduce, memberId);
        return "redirect:MainController.do";
    }
}
