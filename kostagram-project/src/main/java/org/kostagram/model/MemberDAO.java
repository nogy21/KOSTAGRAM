package org.kostagram.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MemberDAO {
    private static MemberDAO instance = new MemberDAO();
    private DataSource dataSource;
    private MemberDAO() {
        this.dataSource = DataSourceManager.getInstance().getDataSource();
    }
    public static MemberDAO getInstance() {
        return instance;
    }
    public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
        if (rs != null)
            rs.close();
        closeAll(pstmt, con);
    }
    public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
        if (pstmt != null)
            pstmt.close();
        if (con != null)
            con.close();
    }

    public void modifypassword(String id, String password) throws SQLException {
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	try {
    		con=dataSource.getConnection();
    		String modifyPasswordSql = "update MEMBER set password=? where member_id=?";
    		pstmt=con.prepareStatement(modifyPasswordSql);
    		pstmt.setString(1, password);
    		pstmt.setString(2, id);
    		pstmt.executeUpdate();
    	}finally {
    		closeAll(pstmt,con);
    	}
    }
    
    public MemberVO login(String id, String password) throws SQLException {
		MemberVO loginVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String loginSql="select * from member where member_id=? and password=?";
			pstmt = con.prepareStatement(loginSql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next())
				loginVO = new MemberVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
		} finally {
			closeAll(rs, pstmt, con);
		}
		return loginVO;
   }
    
	public MemberVO UpdateMember(String memberId, String email, String name) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		MemberVO memberVO = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String UpdateMemberSql = null;
			
			if(email =="") {
				UpdateMemberSql = "UPDATE member SET name=? WHERE member_id=?";
				pstmt = con.prepareStatement(UpdateMemberSql);
				pstmt.setString(1, name);
				pstmt.setString(2, memberId);
			}else if(name == "") {
				UpdateMemberSql = "UPDATE member SET email=? WHERE member_id=?";
				pstmt = con.prepareStatement(UpdateMemberSql);
				pstmt.setString(1, email);
				pstmt.setString(2, memberId);
			}else {
				UpdateMemberSql = "UPDATE member SET email=?, name=? WHERE member_id=?";
				pstmt = con.prepareStatement(UpdateMemberSql);
				pstmt.setString(1, email);
				pstmt.setString(2, name);
				pstmt.setString(3, memberId);
			}
			
			pstmt.executeUpdate();
			pstmt.close();
			
			String updateSessionSql = "SELECT * FROM member WHERE member_id = ?";
			pstmt = con.prepareStatement(updateSessionSql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberVO = new MemberVO(rs.getString(1), null, rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),rs.getString(8));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(pstmt, con);
		}
				
		return memberVO;
	}
	public void updateProfile(String fileName, String fileRealName, String introduce, String memberId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = dataSource.getConnection();
            String updateProfileSql = "update member set profile_img=?, org_profile_img=?, introduce=? where member_id=?";
            pstmt = con.prepareStatement(updateProfileSql);
            pstmt.setString(1, fileName);
            pstmt.setString(2, fileRealName);
            pstmt.setString(3, introduce);
            pstmt.setString(4, memberId);
            pstmt.executeUpdate();
        }finally {
            closeAll(pstmt, con);
        }
    }
	//회원가입 메서드
	public void registerMember(MemberVO registerVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
    	try {
        	con = dataSource.getConnection();
        	StringBuilder registerSql = new StringBuilder();
            registerSql.append("insert into MEMBER(member_id, password, email, name, register_date) ");
            registerSql.append("values (?, ?, ?, ?, sysdate)");
            pstmt = con.prepareStatement(registerSql.toString());
            pstmt.setString(1, registerVO.getMemberId());
            pstmt.setString(2, registerVO.getPassword());
            pstmt.setString(3, registerVO.getEmail());
            pstmt.setString(4, registerVO.getName());
            pstmt.executeUpdate();
        }finally {
            closeAll(pstmt, con);
        }
    }
    //아이디 중복확인 체크 메서드 
    public boolean checkId(String id) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = dataSource.getConnection();
            String checkIdSql = "select count(*) from member where member_id=?";
            pstmt = con.prepareStatement(checkIdSql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()&&rs.getInt(1)==1)
                result=true;
        }finally {
            closeAll(rs, pstmt, con);
        }
        return result;
    }

    public ArrayList<MemberVO> getMemberDetail(String id) throws SQLException {
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	MemberVO mvo = null;
    	ArrayList<MemberVO> list = new ArrayList<MemberVO>();
    	try {
    		con=dataSource.getConnection();
    		String memberDetailSql = "select * from member where member_id=?";
    		pstmt=con.prepareStatement(memberDetailSql);
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			mvo = new MemberVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
    			list.add(mvo);
    		}
    	}finally {
    		closeAll(rs, pstmt, con);
    	}
		return list;
    }
    public ArrayList<PostVO> myPost(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PostVO vo = null;
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		try {
			con = dataSource.getConnection();
			String postSql = "select * from post where member_id=?";
			pstmt = con.prepareStatement(postSql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new PostVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
    }
	// member 검색 메서드
	public ArrayList<MemberVO> searchMemberByWord(String searchWord) throws SQLException {
		ArrayList<MemberVO> searchMemberList=new ArrayList<MemberVO>();
		String sqlSearchWord="%"+searchWord+"%"; 
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String searchMemberSql="select * from member where member_id like ?";
			pstmt=con.prepareStatement(searchMemberSql);
			pstmt.setString(1, sqlSearchWord);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberVO mvo=new MemberVO();
				mvo.setMemberId(rs.getString("member_id"));
				mvo.setName(rs.getString("name"));
				mvo.setProfileImgPath("org_profile_img");
				searchMemberList.add(mvo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return searchMemberList;
	}
 }
