

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/message")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();

		String msg = request.getParameter("msg");
		String customerid = request.getParameter("customerid");
		String title = request.getParameter("title");

		// JDBCドライバのロード	DB接続
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}

				Connection con = null;
				try {
					// DBとのコネクションの確立
					con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/OnlineShop?characterEncoding=utf8&serverTimezone=JST",
						"root",
						"");
					//時間を取る
					SimpleDateFormat date = new SimpleDateFormat("y/MM/dd HH:mm:ss");
					String time = date.format(new Date());

					String sql = "INSERT INTO message(CustomerId, mes_time, mes_title, mes_message) VALUES(?, ?, ?, ?) ";

					PreparedStatement smt = con.prepareStatement(sql);
					smt.setString(1, customerid);
					smt.setString(2, time);
					smt.setString(3, title);
					smt.setString(4, msg);
					smt.executeUpdate();

					smt.close();

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					// コネクションのクローズ
					try {
						/*
						 * DB切断
						 * con.close();
						 */
						if (con != null) con.close();
					} catch (SQLException e) {
					}
				}
				request.getRequestDispatcher("msgsuccess.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				doGet(request, response);
	}

}
