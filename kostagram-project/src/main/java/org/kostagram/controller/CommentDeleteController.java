package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kostagram.model.CommentDAO;
import org.kostagram.model.MemberVO;

public class CommentDeleteController implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (request.getMethod().equals("POST") == false) {
            System.out.println("포스트 요청 방식이 아닙니다");
            return "redirect:MainController.do";
        }
        HttpSession session = request.getSession(false);
        MemberVO mvo = (MemberVO) session.getAttribute("loginVO");
        if (mvo == null) {
            return "redirect:MainController.do";
        }
        int postId = Integer.parseInt(request.getParameter("delCmtPostId"));
        int commentId = Integer.parseInt(request.getParameter("deleteCommentForm"));
        CommentDAO.getInstance().deleteComment(commentId);
        System.out.println(postId);
        System.out.println(commentId);
        return "PostDetailController.do?postId="+postId;
    }

}
