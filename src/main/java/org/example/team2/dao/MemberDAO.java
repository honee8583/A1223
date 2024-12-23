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
        conn = DBConnectionDAO.getConnection();
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

    public MemberBean selectMember(String id) {
        conn = DBConnectionDAO.getConnection();
        MemberBean memberBean = new MemberBean();

        try {
            String sql = "select * from member where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                memberBean.setId(rs.getString("id"));
                memberBean.setPassword(rs.getString("password"));
                memberBean.setName(rs.getString("name"));
                memberBean.setGender((Character) rs.getObject("gender"));
                memberBean.setEmail(rs.getString("email"));
                memberBean.setBirth(rs.getString("birth"));
                memberBean.setZipcode(rs.getString("zipcode"));
                memberBean.setAddress(rs.getString("address"));
                memberBean.setHobby(rs.getString("hobby"));
                memberBean.setJob(rs.getString("job"));
            }
            DBConnectionDAO.closeConnection(conn, pstmt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return memberBean;
    }

    public void updateMember(MemberBean memberBean) {
        conn = DBConnectionDAO.getConnection();

        try {
            String sql = "update member set password=?, email=?, zipcode=?, address=? where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberBean.getPassword());
            pstmt.setString(2, memberBean.getEmail());
            pstmt.setString(4, memberBean.getZipcode());
            pstmt.setString(5, memberBean.getId());
            pstmt.executeUpdate();
            DBConnectionDAO.closeConnection(conn, pstmt);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteMember(String id) {
        conn = DBConnectionDAO.getConnection();

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

    public void updatePwd(String id, String password) {
        conn = DBConnectionDAO.getConnection();
        String sql = "update Member set password = ? where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, password);
            pstmt.setString(2, id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnectionDAO.closeConnection(conn, pstmt);
        }
    }

}
