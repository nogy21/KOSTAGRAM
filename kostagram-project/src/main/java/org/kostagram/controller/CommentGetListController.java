package org.kostagram.controller;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.kostagram.model.CommentDAO;
import org.kostagram.model.CommentVO;

public class CommentGetListController implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String postId = request.getParameter("postId");
        ArrayList<CommentVO> commentList = (ArrayList<CommentVO>) CommentDAO.getInstance().getCommentList(Integer.parseInt(postId));
        JSONArray cmtList = new JSONArray(commentList);
        request.setAttribute("responsebody", cmtList);
        return "AjaxView";
    }

}
