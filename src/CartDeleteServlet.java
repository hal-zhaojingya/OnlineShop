

import java.io.IOException;
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
 * Servlet implementation class CartDeleteServlet
 */
@WebServlet("/cartdelete")
public class CartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String customerid = request.getParameter("customerid");
		String goodsid = request.getParameter("goodsid");

		// JDBCドライバのロード
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection con = null;
		try {
			// コネクションの確立 mac
			con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/OnlineShop?characterEncoding=utf8&serverTimezone=JST",
				"root",
				""
			);

			String sql = "DELETE FROM cart WHERE customerid = ? AND goodsid = ?";
			PreparedStatement smt = con.prepareStatement(sql);
			smt.setString(1, customerid);
			smt.setString(2, goodsid);
			smt.executeUpdate();
			smt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			// コネクションのクローズ
			try {
				if (con != null) con.close();
			} catch(SQLException e) {
			}
		}

		request.getRequestDispatcher("cartdeletesuc.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
