

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
 * Servlet implementation class CartInsertServlet
 */
@WebServlet("/cartinsert")
public class CartInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartInsertServlet() {
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
		String GoodsId = request.getParameter("GoodsId");
		String customerid = request.getParameter("customerid");
		int shopCount = Integer.parseInt(request.getParameter("shopCount"));
		String ImgSrcMain = "";
		String GoodsName = "";
		String GoodsUnitPrice = "";
		int count;

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

			String sql = "SELECT GoodsId, count FROM cart WHERE GoodsId = ? AND customerid = ?";
			PreparedStatement smt = con.prepareStatement(sql);
			smt.setString(1, GoodsId);
			smt.setString(2, customerid);
			ResultSet rs = smt.executeQuery();

			if (rs.next()) {

				count = rs.getInt("count");

				count = count + shopCount;
				request.setAttribute("count", count);

				sql = "UPDATE cart SET count = ? WHERE goodsid = ? AND customerid = ?";
				smt = con.prepareStatement(sql);
				smt.setInt(1, count);
				smt.setString(2, GoodsId);
				smt.setString(3, customerid);
				smt.executeUpdate();

				smt.close();
			}else {
				rs.close();
				smt.close();

				//未登録
				sql = "INSERT INTO cart(GoodsId, CustomerId, count) VALUES (?, ?, ?)";

				//SQL発行
				smt = con.prepareStatement(sql);
				smt.setString(1, GoodsId);
				smt.setString(2, customerid);
				smt.setInt(3, shopCount);
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
		request.setAttribute("GoodsId", GoodsId);
		request.setAttribute("shopCount", shopCount);


		request.getRequestDispatcher("cartsuccess.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
