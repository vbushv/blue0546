package com.bbs;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.service.BbsService;
import com.bbs.service.BbsServiceImpl;
import com.bbs.service.NoticeBbsServiceImpl;
import com.vo.BbsVo;

@WebServlet("/bbs/BBS")
public class bbsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BbsService bbsService = new BbsServiceImpl(); // 우리 공부했었죠?
	private BbsService noticeBbsService = new NoticeBbsServiceImpl(); // 우리 공부했었죠?
	//인터페이스 인스턴스를 만들면서 이 인터페이스를 구현한 객체를 
	
    public bbsServlet() {
        super();
    }
    
    // 리팩토링 하고 보니까
    // 서블릿에서는 그냥 파라미터값 받아와주고 service으로 보내주고 받아와서 jsp으로 보내주고 딱 이런 역할만 해주죠>
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//분기처리 해줄까요 if문으로
		String cate = request.getParameter("cate");
		RequestDispatcher view = request.getRequestDispatcher("/bbs/write.jsp"); //기본적으로 write를 가져옴
		
		
		if("list".equals(cate)){// cate값에 list 들어가면 이걸 호출해주고
			
			List<BbsVo> list = bbsService.list();
			
			request.setAttribute("list", list);
			
			view = request.getRequestDispatcher("/bbs/list.jsp");
		}else if("write".equals(cate)){ // cate에 write 들어가면 이걸
			view = request.getRequestDispatcher("/bbs/write.jsp");
		}else{// 그외는 무조건 write
			view = request.getRequestDispatcher("/bbs/write.jsp");
		}
		
		
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");		
		BbsVo bbsVo = new BbsVo();
		bbsVo.setId(request.getParameter("id"));
		bbsVo.setName(request.getParameter("name"));
		
		bbsService.bbsWriteAction(bbsVo);
		
		response.sendRedirect("/bbs/BBS?cate=list");
	}

}
