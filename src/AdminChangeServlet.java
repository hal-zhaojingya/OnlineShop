

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminChangeServlet
 */
@WebServlet("/adminchange")
public class AdminChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();

		String customerid = request.getParameter("customerid");
		String admin_user = request.getParameter("admin_user");

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

			//登録されているか確認
			String sql = "UPDATE Customers SET CustomerName = ? WHERE CustomerId = ?";
			PreparedStatement smt = con.prepareStatement(sql);
			smt.setString(1, admin_user);
			smt.setString(2, customerid);
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

		request.getRequestDispatcher("adchangesuc.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
