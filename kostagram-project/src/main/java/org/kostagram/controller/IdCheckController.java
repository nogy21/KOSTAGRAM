package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.MemberDAO;

public class IdCheckController implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("memberId");
        boolean result = MemberDAO.getInstance().checkId(id);
        String info = null;
        if(result) {
            info = "아이디 중복되어 사용불가합니다";
        }else {
            info = "아이디 사용가능합니다!";
        }
        request.setAttribute("responsebody", info);
        return "AjaxView";
    }

}
