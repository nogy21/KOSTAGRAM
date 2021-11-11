package org.kostagram.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.PostDAO;
import org.kostagram.model.PostVO;

public class UpdatePostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equals("POST") == false) {
			throw new ServletException("게시글 수정은 post 방식만 허용됩니다");
		}
		String postId = request.getParameter("postId");
		String content = request.getParameter("postUpdateContent");
		PostVO postVO = new PostVO();
		postVO.setPostId(Integer.parseInt(postId));
		postVO.setPostContent(content);
		PostDAO.getInstance().updatePostByNo(postVO);
		return "redirect:MainController.do";
	}

}
