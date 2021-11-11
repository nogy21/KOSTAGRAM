package org.kostagram.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.PostDAO;
import org.kostagram.model.PostVO;

public class MainController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<PostVO> postList = PostDAO.getInstance().mainPostList();
		request.setAttribute("postList", postList);
		//template layout 페이지를 이용해 리스트 화면을 제공 
		request.setAttribute("url", "main.jsp");
		return "layout.jsp";
	}
}
