

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
 * Servlet implementation class AddressUpdateServlet
 */
@WebServlet("/addressupdate")
public class AddressUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("changeaddress.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();

		String CustomerAddressId = request.getParameter("CustomerAddressId");
		String address_name = request.getParameter("address_name");
		String customer_post = request.getParameter("customer_post");
		String customer_address = request.getParameter("customer_address");
		String customer_tel = request.getParameter("customer_tel");

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
			String sql = "UPDATE Address SET AddressName = ?, CustomerPost = ?, CustomerAddress = ?, CustomerTel = ? WHERE CustomerAddressId = ?";
			PreparedStatement smt = con.prepareStatement(sql);
			smt.setString(1, address_name);
			smt.setString(2, customer_post);
			smt.setString(3, customer_address);
			smt.setString(4, customer_tel);
			smt.setString(5, CustomerAddressId);
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


		request.getRequestDispatcher("updatesuccess.jsp").forward(request, response);
	}

}
