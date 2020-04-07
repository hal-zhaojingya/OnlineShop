

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
 * Servlet implementation class NewAddressServlet
 */
@WebServlet("/newaddress")
public class NewAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String customerid = request.getParameter("customerid");
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

				String sql = "INSERT INTO Address(CustomerAddress, CustomerPost, AddressName, CustomerTel, CustomerId) VALUES(?, ?, ?, ?, ?)";

				//SQL発行
				PreparedStatement smt = con.prepareStatement(sql);
				smt.setString(1, customer_address);
				smt.setString(2, customer_post);
				smt.setString(3, address_name);
				smt.setString(4, customer_tel);
				smt.setString(5, customerid);
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

		request.getRequestDispatcher("newadssuccess.jsp").forward(request, response);
	}

}
