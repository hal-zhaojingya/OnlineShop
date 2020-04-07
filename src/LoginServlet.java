

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String customer_name = "";

		Cookie cookies[] = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("customer_name")) {
					customer_name = cookie.getValue();
				}
			}
		}
		request.setAttribute("customer_name", customer_name);

    	request.setAttribute("message", "");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();


		String customer_name = request.getParameter("customer_name");
		String customer_pass = request.getParameter("customer_pass");
		String CustomerName = "";
		String CustomerId = "";

		if("on".equals("check")) {
			Cookie cookie = new Cookie("customer_name", customer_name);
			cookie.setMaxAge(600);
			response.addCookie(cookie);
		}
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

			String sql = "SELECT CustomerId, CustomerName FROM customers WHERE CustomerName = ? AND CustomerPass = ?";

			//SQL発行
			PreparedStatement smt = con.prepareStatement(sql);
			smt.setString(1, customer_name);
			smt.setString(2, customer_pass);

			//SQLの実行
			//・SELECT
			ResultSet rs = smt.executeQuery();


			if (rs.next()) {
				CustomerName = rs.getString("CustomerName");
				CustomerId = rs.getString("CustomerId");
			}else {
				rs.close();
				smt.close();
				String message = "IDまたはパスワードが違います";
				request.setAttribute("message", message);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			}
			rs.close();
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
		HttpSession session = request.getSession();
		session.setAttribute("CustomerId", CustomerId);
		session.setAttribute("customer_name", customer_name);
		session.setAttribute("customer_pass", customer_pass);

		request.getRequestDispatcher("success.jsp").forward(request, response);
	}

}
