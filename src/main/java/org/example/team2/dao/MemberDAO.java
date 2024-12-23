package org.example.team2.dao;

import org.example.team2.bean.MemberBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;


    public void insertMember(MemberBean memberBean) {
        conn = DBConnectionDAO.getConnection();
        try {
            String sql = "insert into Member values(?,?,?,?,?,?,?,?,?,?)";
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
            String sql = "select * from Member where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                memberBean.setId(rs.getString("id"));
                memberBean.setPassword(rs.getString("password"));
                memberBean.setName(rs.getString("name"));
                memberBean.setGender(String.valueOf(rs.getObject("gender")).charAt(0));
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
            String sql = "update Member set email=?, zipcode=?, address=?, hobby=?, job=? where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberBean.getEmail());
            pstmt.setString(2, memberBean.getZipcode());
            pstmt.setString(3, memberBean.getAddress());
            pstmt.setString(4, memberBean.getHobby());
            pstmt.setString(5, memberBean.getJob());
            pstmt.setString(6, memberBean.getId());
            pstmt.executeUpdate();
            DBConnectionDAO.closeConnection(conn, pstmt);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteMember(String id) {
        conn = DBConnectionDAO.getConnection();

        try {
            String sql = "delete from Member where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
            DBConnectionDAO.closeConnection(conn, pstmt);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public MemberBean useLogin(String id, String password) {
        conn = DBConnectionDAO.getConnection();
        System.out.println("useLogin " + id + ", " + password);

        try {

            String sql = "SELECT * FROM Member WHERE id = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // 로그인 성공 시 MemberBean에 사용자 정보 저장
                MemberBean member = new MemberBean();
                member.setId(rs.getString("id"));
                member.setName(rs.getString("name"));
                member.setPassword(rs.getString("password"));

                // 다른 정보들도 추가적으로 담을 수 있습니다.

                return member;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 닫기
            DBConnectionDAO.closeConnection(conn, pstmt, rs);
        }

        // 로그인 실패 시 null 반환
        return null;
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
