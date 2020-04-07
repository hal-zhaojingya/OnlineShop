

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
 * Servlet implementation class GoodsListServlet
 */
@WebServlet("/goodslist")
public class GoodsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsListServlet() {
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
		String CustomerName = "";
		String CusPortrait = "";
		String review_time = "";
		String review_title = "";
		String review_message = "";
		String ImgSrcMain = "";
		String ImgSrc02 = "";
		String ImgSrc03 = "";
		String ImgSrc04 = "";
		String GoodsName = "";
		String GoodsDescript = "";
		String GoodsUnitPrice = "";
		String GoodsBorrowDate = "";
		String GoodsReturnDate = "";
		String GoodsBrand = "";
		String GoodsMedia = "";
		String GoodsAmount = "";
		String GoodsIssue = "";
		String GoodsSize = "";
		String GoodsModel = "";
		String AreaName = "";


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

			String sql = "SELECT ImgSrc02, ImgSrc03, ImgSrc04, ImgSrcMain, GoodsName, GoodsDescript, GoodsUnitPrice, GoodsBorrowDate,GoodsReturnDate, GoodsBrand, AreaName, GoodsMedia, GoodsAmount, GoodsIssue, GoodsSize, GoodsModel, CustomerName, CusPortrait, review_time, review_title, review_message FROM GoodsImg, Area, Goods, customers, review WHERE GoodsImg.ImgId = Goods.ImgId AND Goods.GoodsAreaID = Area.GoodsAreaID AND review.customerid = customers.customerid AND goods.goodsid = review.goodsid AND goods.GoodsId = ?";
			//SQL発行

			PreparedStatement smt = con.prepareStatement(sql);
			smt.setString(1, GoodsId);

			ResultSet rs = smt.executeQuery();
			if (rs.next()) {
				CustomerName = rs.getString("CustomerName");
				CusPortrait = rs.getString("CusPortrait");
				review_time = rs.getString("review_time");
				review_title = rs.getString("review_title");
				review_message = rs.getString("review_message");
				ImgSrcMain = rs.getString("ImgSrcMain");
				ImgSrc02 = rs.getString("ImgSrc02");
				ImgSrc03 = rs.getString("ImgSrc03");
				ImgSrc04 = rs.getString("ImgSrc04");
				GoodsName = rs.getString("GoodsName");
				GoodsDescript = rs.getString("GoodsDescript");
				GoodsUnitPrice = rs.getString("GoodsUnitPrice");
				GoodsBorrowDate = rs.getString("GoodsBorrowDate");
				GoodsReturnDate = rs.getString("GoodsReturnDate");
				GoodsBrand = rs.getString("GoodsBrand");
				GoodsMedia = rs.getString("GoodsMedia");
				GoodsAmount = rs.getString("GoodsAmount");
				GoodsIssue = rs.getString("GoodsIssue");
				GoodsSize = rs.getString("GoodsSize");
				GoodsModel = rs.getString("GoodsModel");
				AreaName = rs.getString("AreaName");
				GoodsId = rs.getString("GoodsId");
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
		request.setAttribute("review_time", review_time);
		request.setAttribute("review_title", review_title);
		request.setAttribute("review_message", review_message);
		request.setAttribute("ImgSrcMain", ImgSrcMain);
		request.setAttribute("ImgSrc02", ImgSrc02);
		request.setAttribute("ImgSrc03", ImgSrc03);
		request.setAttribute("ImgSrc04", ImgSrc04);
		request.setAttribute("GoodsName", GoodsName);
		request.setAttribute("GoodsDescript", GoodsDescript);
		request.setAttribute("GoodsUnitPrice", GoodsUnitPrice);
		request.setAttribute("GoodsBorrowDate", GoodsBorrowDate);
		request.setAttribute("GoodsReturnDate", GoodsReturnDate);
		request.setAttribute("GoodsBrand", GoodsBrand);
		request.setAttribute("GoodsMedia", GoodsMedia);
		request.setAttribute("GoodsAmount", GoodsAmount);
		request.setAttribute("GoodsIssue", GoodsIssue);
		request.setAttribute("GoodsSize", GoodsSize);
		request.setAttribute("GoodsModel", GoodsModel);
		request.setAttribute("AreaName", AreaName);
		request.setAttribute("GoodsId", GoodsId);

		request.getRequestDispatcher("single.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
