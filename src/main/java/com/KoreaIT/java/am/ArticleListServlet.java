package com.KoreaIT.java.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.KoreaIT.java.am.util.DBUtil;
import com.KoreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/article/list")
public class ArticleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		}

		String url = "jdbc:mysql://127.0.0.1:3307/JSPTest?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeNehavior=convertToNull";

		try {
			conn = DriverManager.getConnection(url, "root", "");
			response.getWriter().append("Success");
			
			SecSql sql = new SecSql();
			
			sql.append("SELECT *FROM article");
//			불러오기
			List<Map<String,Object>> articlesRows = DBUtil.selectRows(conn, sql);
//			묶어서 보낸다
			request.setAttribute("articleRows", articlesRows);
//			db에 연결하고 jsp에 넘겨주는 거
			request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);
			
			response.getWriter().append(articlesRows.toString());
		} catch (SQLException e) {
			System.out.println("에러: " + e);
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		
	}

}
