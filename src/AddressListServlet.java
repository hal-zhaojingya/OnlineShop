

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddressListServlet
 */
@WebServlet("/addresslist")
public class AddressListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressListServlet() {
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

		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();

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

			String sql = "SELECT CustomerAddressId, CustomerAddress, CustomerPost, AddressName, CustomerTel from Address WHERE CustomerId = ?";

			//SQL発行
			PreparedStatement smt = con.prepareStatement(sql);
			smt.setString(1, customerid);

			ResultSet rs = smt.executeQuery();
			while (rs.next()) {
				HashMap<String, String> row = new HashMap<String, String>();
				row.put("CustomerAddressId", rs.getString("CustomerAddressId"));
				row.put("CustomerAddress", rs.getString("CustomerAddress"));
				row.put("CustomerPost", rs.getString("CustomerPost"));
				row.put("AddressName", rs.getString("AddressName"));
				row.put("CustomerTel", rs.getString("CustomerTel"));
				list.add(row);
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

		request.setAttribute("address", list);

		request.getRequestDispatcher("address.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
