package org.kostagram.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.MemberVO;
import org.kostagram.model.PostDAO;
import org.kostagram.model.PostVO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PostUploadController implements Controller {
    //서버 새로고침시 이미지파일 유지를 위해 Stream을 적용한 메서드
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
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        if (request.getMethod().equals("POST") == false) {
            System.out.println("포스트 요청 방식이 아닙니다");
            return "redirect:index.jsp";
        }
        //원래코드 : String serverDirectory = request.getServletContext().getRealPath("upload");
        //인자값 upload, /upload/ 모두 가능?
        String serverDirectory = request.getServletContext().getRealPath("/upload/"); //서버 폴더 경로
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
        MemberVO vo = (MemberVO)request.getSession().getAttribute("loginVO");
        String memberId = vo.getMemberId();

        // 로컬 경로 지정
        // 원래 코드 : String directory = "\\images\\";
        
        //★★★ localDirectory 는 각 팀원별 디렉토리로 수정하여 실행할 것!! 
        String localDirectory = "\\\\Mac\\Home\\Documents\\kosta\\kostagram-project\\src\\main\\webapp\\images";
        int maxSize = 1024 * 1024 * 100;
        String encoding = "utf-8";
        
        MultipartRequest multipartRequest 
        = new MultipartRequest(request, serverDirectory, maxSize, encoding
                , new DefaultFileRenamePolicy());
        
        String fileName = multipartRequest.getOriginalFileName("file");
        String fileRealName = multipartRequest.getFilesystemName("file");
        String introduce = multipartRequest.getParameter("introduce");
        PostDAO.getInstance().uploadPost(fileName, fileRealName, introduce, memberId);
        
        //파일 새로고침 코드1 : 파일 복사 붙여넣기 수행
        copyAndPasteFile(serverDirectory, localDirectory, fileName);
        
        PostVO postVO = PostDAO.getInstance().getPostId(memberId);
        int postId = postVO.getPostId();
        
        //파일 새로고침 업로드 (Generic Page) 수정코드 
        //Upload는 post 방식, generic.jsp 포스트 디테일 페이지 이동시 querystring 으로 postId 값 전다 
        
        
        //request.setAttribute("postVO", postVO);
        request.setAttribute("postId", postId);
        //return "redirect:post/PostDetailController.do";
        
        return "redirect:PostDetailController.do?postId="+postId;
        //return "redirect:PostDetailController.do";
    }
    
    /*
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        if (request.getMethod().equals("POST") == false) {
            System.out.println("포스트 요청 방식이 아닙니다");
            return "redirect:index.jsp";
        }
        
        MemberVO vo = (MemberVO)request.getSession().getAttribute("loginVO");
        String memberId = vo.getMemberId();
        

        // String path = request.getContextPath();
        //String directory = request.getServletContext().getRealPath("upload");
        // 로컬 경로 지정
        // String directory = "\\images\\";
        String directory = "C:\\Semi-project-git\\kostagram-project\\src\\main\\webapp\\images\\";
        int maxSize = 1024 * 1024 * 100;
        String encoding = "utf-8";
        
        MultipartRequest multipartRequest 
        = new MultipartRequest(request, directory, maxSize, encoding
                , new DefaultFileRenamePolicy());
        
        String fileName = multipartRequest.getOriginalFileName("file");
        String fileRealName = multipartRequest.getFilesystemName("file");
        String introduce = multipartRequest.getParameter("introduce");
        PostDAO.getInstance().uploadPost(fileName, fileRealName, introduce, memberId);
        
        PostVO postVO = PostDAO.getInstance().getPostId(memberId);
        int postId = postVO.getPostId();
        //수정 코드 
        //HttpSession session = request.getSession();
        //session.setAttribute("postId", postId);
        System.out.println(postId);
        
        //request.setAttribute("postVO", postVO);
        request.setAttribute("postId", postId);
        //return "redirect:post/PostDetailController.do";
        
        return "redirect:PostDetailController.do?postId="+postId;
        //return "redirect:PostDetailController.do";
    }
    */
}


















