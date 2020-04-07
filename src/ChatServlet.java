

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChatServlet
 */
@WebServlet("/chat")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();

		//時間を取る
		SimpleDateFormat date=new SimpleDateFormat("y/MM/dd HH:mm:ss");
		String time=date.format(new Date());
		//メッセージを取る
		String msg = request.getParameter("text");
		String mmsg = "";
		if(msg != null && msg.trim().length() > 0){
		    mmsg = (String) this.getServletContext().getAttribute("mmsg");
			if(mmsg == null){
				mmsg = "";
			}
			mmsg += time + "</br>" + msg + "</br>";
			getServletContext().setAttribute("mmsg", mmsg);
		}


		String context = (String) getServletContext().getAttribute("mmsg");
		if(context == null){
			context = "";
			getServletContext().setAttribute("mmsg", context);
		}
		String div = "";
		div += context;
		request.setAttribute("div", div);

		String chat="<form action='chat'method='post'><input type='text' name='text'><input type='submit' value='送信'></form>";

		request.setAttribute("chat", chat);
		request.getRequestDispatcher("index2.jsp").forward(request, response);

		out.flush();
		out.close();

	}


}
