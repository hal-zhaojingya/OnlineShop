

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
 * Servlet implementation class KategorieServlet
 */
@WebServlet("/kategorie")
public class KategorieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KategorieServlet() {
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

		String kategorieid = request.getParameter("kategorieid");
		String GoodsTypeName ="";

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

			String sql = "SELECT GoodsId, ImgSrcMain, GoodsName, GoodsUnitPrice, GoodsTypeName , Goods.GoodsTypeId FROM GoodsImg, Goods, GoodsType WHERE GoodsImg.ImgId = Goods.ImgId AND Goods.GoodsTypeID = GoodsType.GoodsTypeID AND GoodsType.GoodsTypeId = ?";

			PreparedStatement smt = con.prepareStatement(sql);
			smt.setString(1, kategorieid);

			ResultSet rs = smt.executeQuery();
			while (rs.next()) {
				GoodsTypeName = rs.getString("GoodsTypeName");

				HashMap<String, String> row = new HashMap<String, String>();
				row.put("GoodsId", rs.getString("GoodsId"));
				row.put("ImgSrcMain", rs.getString("ImgSrcMain"));
				row.put("GoodsName", rs.getString("GoodsName"));
				row.put("GoodsUnitPrice", rs.getString("GoodsUnitPrice"));
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

		request.setAttribute("GoodsTypeName", GoodsTypeName);

		request.setAttribute("kategorie", list);

		request.getRequestDispatcher("kategorie.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
