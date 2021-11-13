package org.kostagram.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.PostDAO;

public class DeletePostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 요청방식 post 체크
		if (request.getMethod().equals("POST") == false) {
			throw new ServletException("게시글 삭제는 post 방식만 허용됩니다");
		}

		String postId = request.getParameter("postId");
		PostDAO.getInstance().deletePostByNo(Integer.parseInt(postId));
		return "redirect:MainController.do";
	}

}
