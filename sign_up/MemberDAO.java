public int joinIdCheck(String id){
	int result = -1;
	try {
		//1. DB����
		con = getCon();
		//2. sql ���� & pstmt����
		sql = "select id from user where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);

		//3. ���� -> select -> rs����
		rs = pstmt.executeQuery();

		//4. ������ó��

		if(rs.next()){	
			result = 0;
		}else{
			result = 1;
		}

		System.out.println("���̵� �ߺ�üũ��� : "+result);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		closeDB();
	}
	return result;
}//joinIdCheck �޼������