package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kostagram.model.CommentDAO;
import org.kostagram.model.MemberVO;

public class CommentWriteController implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (request.getMethod().equals("POST") == false) {
            System.out.println("포스트 요청 방식이 아닙니다");
            return "redirect:MainController.do";
        }
        HttpSession session = request.getSession(false);
        MemberVO mvo = (MemberVO) session.getAttribute("loginVO");
        String memberId = mvo.getMemberId();
        int postId = Integer.parseInt(request.getParameter("postId"));
        String commentContent = request.getParameter("commentContent");
        CommentDAO.getInstance().writeComment(memberId, postId, commentContent);
        return "redirect:AjaxView.do";
    }

}
