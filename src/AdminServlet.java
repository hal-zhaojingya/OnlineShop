

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
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
		String CustomerName = "";
		String CustomerId = "";
		String CustomerPass = "";
		String CustomerEmail = "";
		String CusPortrait = "";

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

			String sql = "SELECT * FROM customers WHERE CustomerId = ?";

			//SQL発行
			PreparedStatement smt = con.prepareStatement(sql);
			smt.setString(1, customerid);

			//SQLの実行
			//・SELECT
			ResultSet rs = smt.executeQuery();


			if (rs.next()) {
				CustomerName = rs.getString("CustomerName");
				CustomerId = rs.getString("CustomerId");
				CustomerPass = rs.getString("CustomerPass");
				CustomerEmail = rs.getString("CustomerEmail");
				CusPortrait = rs.getString("CusPortrait");
				String str1 = CustomerPass;
				String pass = str1.substring(0,str1.length()-(str1.substring(3)).length())+"****"+str1.substring(7);
				request.setAttribute("pass", pass);
				String str2 = CustomerEmail;
				String email = str2.substring(0,str2.length()-(str2.substring(0)).length())+"****"+str2.substring(4);
				request.setAttribute("email", email);
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

		request.setAttribute("CustomerName", CustomerName);
		request.setAttribute("CusPortrait", CusPortrait);

		request.getRequestDispatcher("admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
