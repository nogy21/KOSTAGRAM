package org.kostagram.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.LikeDAO;

public class LikesController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberId = request.getParameter("memberId");	
		String postId = request.getParameter("postId");
			
		boolean didLike=LikeDAO.getInstance().liked(memberId,postId);
		
		ArrayList<String> list = new ArrayList<String>();
		
		int countLikes = LikeDAO.getInstance().likecnt(postId);
		
		if(didLike==false) {
			LikeDAO.getInstance().likePost(memberId,postId);
			list.add("좋아요취소");
			list.add(Integer.toString(countLikes));
			request.setAttribute("responsebody", list);
		}else if(didLike==true) {
			LikeDAO.getInstance().unLikePost(memberId, postId);
			list.add("좋아요추가");
			list.add(Integer.toString(countLikes));
			request.setAttribute("responsebody", list);
		}
		request.setAttribute("countLikes", countLikes);//responsebody에 list로 좋아요, countlikes 둘다 담아서 넘김
		return "AjaxView";
	}
}
