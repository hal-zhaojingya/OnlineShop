

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
 * Servlet implementation class FavoriteInsertServlet
 */
@WebServlet("/favoriteinsert")
public class FavoriteInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoriteInsertServlet() {
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
		String GoodsId = request.getParameter("GoodsId");
		String customerid = request.getParameter("customerid");

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
			String sql = "SELECT GoodsId FROM Favorite WHERE GoodsId = ? AND CustomerId = ?";
			PreparedStatement smt = con.prepareStatement(sql);
			smt.setString(1, GoodsId);
			smt.setString(2, customerid);
			ResultSet rs = smt.executeQuery();
			if (rs.next()) {
				rs.close();
				smt.close();
				// 登録済
				request.setAttribute("GoodsId", GoodsId);
				String goods_err = "商品はもうリストに入りました";
				request.setAttribute("goods_err", goods_err);
				request.getRequestDispatcher("favfalse.jsp").forward(request, response);
			}else {
				rs.close();
				smt.close();

				//未登録
				sql = "INSERT INTO Favorite(GoodsId, CustomerId) VALUES (?, ?)";

				//SQL発行
				smt = con.prepareStatement(sql);
				smt.setString(1, GoodsId);
				smt.setString(2, customerid);
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
		request.getRequestDispatcher("favsuccess.jsp").forward(request, response);
	}

}
