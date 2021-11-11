package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterResultController implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setAttribute("url", "member/register-result.jsp");
        return "layout.jsp";
    }

}
