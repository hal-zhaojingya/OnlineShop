

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
 * Servlet implementation class TestServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setAttribute("name_err", "");
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String customer_name = request.getParameter("customer_name");
		String customer_email = request.getParameter("customer_email");
		String customer_pass = request.getParameter("customer_pass");
		String confirm_password = request.getParameter("confirm_password");

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

			//登録済かチェック
			String sql = "SELECT CustomerName FROM Customers WHERE CustomerName = ? ";
			PreparedStatement smt = con.prepareStatement(sql);
			smt.setString(1, customer_name);
			ResultSet rs = smt.executeQuery();
			if (rs.next()) {
				rs.close();
				smt.close();
				// 登録済
				String name_err = "名前は既に登録されました、もう一度入力してください";
				request.setAttribute("name_err", name_err);
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}else {
				rs.close();
				smt.close();

				//未登録
				sql = "INSERT INTO Customers(CustomerName, CustomerPass, CustomerEmail, CusPortrait) VALUES(?, ?, ?, 'portrait.jpg')";

				//SQL発行
				smt = con.prepareStatement(sql);
				smt.setString(1, customer_name);
				smt.setString(2, customer_pass);
				smt.setString(3, customer_email);
				smt.executeUpdate();

				smt.close();
			}

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


		request.getRequestDispatcher("login").forward(request, response);
	}

}
