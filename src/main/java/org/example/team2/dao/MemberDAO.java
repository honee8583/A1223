package org.example.team2.dao;

import org.example.team2.bean.MemberBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;


    public void insertMember(MemberBean memberBean) {
        DBConnectionDAO.getConnection();
        try {
            String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberBean.getId());
            pstmt.setString(2, memberBean.getPassword());
            pstmt.setString(3, memberBean.getName());
            pstmt.setString(4, String.valueOf(memberBean.getGender()));
            pstmt.setString(5, memberBean.getEmail());
            pstmt.setString(6, memberBean.getBirth());
            pstmt.setString(7, memberBean.getZipcode());
            pstmt.setString(8, memberBean.getAddress());
            pstmt.setString(9, memberBean.getHobby());
            pstmt.setString(10, memberBean.getJob());
            pstmt.executeUpdate();

            DBConnectionDAO.closeConnection(conn, pstmt);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateMember(MemberBean memberBean) {
        DBConnectionDAO.getConnection();

        try {
            String sql = "update member set password=?, email=?, birth=?, zipcode=?, address=? where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberBean.getPassword());
            pstmt.setString(2, memberBean.getEmail());
            pstmt.setString(3, memberBean.getBirth());
            pstmt.setString(4, memberBean.getZipcode());
            pstmt.setString(5, memberBean.getAddress());
            pstmt.setString(6, memberBean.getId());
            pstmt.executeUpdate();
            DBConnectionDAO.closeConnection(conn, pstmt);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteMember(String id) {
        DBConnectionDAO.getConnection();

        try {
            String sql = "delete from member where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
            DBConnectionDAO.closeConnection(conn, pstmt);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
