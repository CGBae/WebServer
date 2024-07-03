<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
    String articleId = request.getParameter("articleId");
    String userId = request.getParameter("userId");
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // 사용자가 이미 좋아요를 눌렀는지 확인
        String checkLikeSql = "SELECT * FROM likes WHERE article_id = ? AND user_id = ?";
        pstmt = conn.prepareStatement(checkLikeSql);
        pstmt.setString(1, articleId);
        pstmt.setString(2, userId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // 이미 좋아요를 눌렀다면, 좋아요 취소
            String deleteLikeSql = "DELETE FROM likes WHERE article_id = ? AND user_id = ?";
            pstmt = conn.prepareStatement(deleteLikeSql);
            pstmt.setString(1, articleId);
            pstmt.setString(2, userId);
            pstmt.executeUpdate();
        } else {
            // 좋아요 추가
            String insertLikeSql = "INSERT INTO likes (article_id, user_id, likes_count) VALUES (?, ?, 1)";
            pstmt = conn.prepareStatement(insertLikeSql);
            pstmt.setString(1, articleId);
            pstmt.setString(2, userId);
            pstmt.executeUpdate();
        }

        // 좋아요 수 업데이트
        String likeCountSql = "SELECT SUM(likes_count) AS total_likes FROM likes WHERE article_id = ?";
        pstmt = conn.prepareStatement(likeCountSql);
        pstmt.setString(1, articleId);
        rs = pstmt.executeQuery();

        int totalLikes = 0;
        if (rs.next()) {
            totalLikes = rs.getInt("total_likes");
        }

        out.print(totalLikes + "개");

    } catch (SQLException e) {
        e.printStackTrace();
        out.print("Error: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
