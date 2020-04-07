

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
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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

		int rowCount=1;

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

			String sql = "SELECT count(*) FROM cart where customerid = ?";
	        PreparedStatement smt = con.prepareStatement(sql);
	        smt.setString(1, customerid);

	        ResultSet rs = smt.executeQuery();

	        rs.next();

	        rowCount = rs.getInt(1);

			sql = "SELECT Goods.GoodsId, GoodsName, GoodsUnitPrice, ImgSrcMain, count FROM Goods, Cart, GoodsImg WHERE Goods.GoodsId = Cart.GoodsId AND Goods.ImgId = GoodsImg.ImgId AND CustomerId = ?";

			smt = con.prepareStatement(sql);
			smt.setString(1, customerid);

			ResultSet rs2 = smt.executeQuery();
			while (rs2.next()) {
				HashMap<String, String> row = new HashMap<String, String>();
				row.put("GoodsId", rs2.getString("GoodsId"));
				row.put("ImgSrcMain", rs2.getString("ImgSrcMain"));
				row.put("GoodsName", rs2.getString("GoodsName"));
				row.put("GoodsUnitPrice", rs2.getString("GoodsUnitPrice"));
				row.put("count", rs2.getString("count"));
				list.add(row);
			}
			rs2.close();
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

		request.setAttribute("cart", list);
		request.setAttribute("rowCount", rowCount);

		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
