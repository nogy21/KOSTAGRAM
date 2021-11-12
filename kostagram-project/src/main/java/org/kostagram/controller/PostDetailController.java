package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.servlet.http.HttpSession;

import org.kostagram.model.LikeDAO;
import org.kostagram.model.MemberVO;
import org.kostagram.model.PostDAO;
import org.kostagram.model.PostVO;

public class PostDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String postId = request.getParameter("postId");
		
		PostVO postVO = PostDAO.getInstance().getPostDetail(postId);
		request.setAttribute("postVO", postVO);
		
		String memberId = postVO.getMemberId();
		MemberVO memberVO = PostDAO.getInstance().getMemberInfo(memberId);
		request.setAttribute("memberVO", memberVO);
		
		int likeCount = PostDAO.getInstance().likeCount(postId);
		request.setAttribute("likeCount", likeCount);
		
		HttpSession session = request.getSession(false);
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		boolean isLiked = LikeDAO.getInstance().liked(loginVO.getMemberId(), postId);
		request.setAttribute("isLiked", isLiked);
		
		request.setAttribute("url", "post/detail-post.jsp");
		return "layout.jsp";
	}

}
