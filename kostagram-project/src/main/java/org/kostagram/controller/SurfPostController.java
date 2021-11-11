package org.kostagram.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.PostDAO;
import org.kostagram.model.PostVO;

public class SurfPostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<PostVO> list = PostDAO.getInstance().surfpost();
		
		request.setAttribute("postList", list);
		request.setAttribute("url", "post/surf-post.jsp");
		return "layout.jsp";
	}

}
