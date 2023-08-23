package kr.farmstory1.dao;

import java.util.List;

import kr.farmstory1.db.DBHelper;
import kr.farmstory1.db.SQL;
import kr.farmstory1.dto.OrderDTO;

public class OrderDAO extends DBHelper{
	
	// 기본  crud메서드
	public void insertOrder(OrderDTO dto) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_ORDER);
			psmt.setInt(1, dto.getOrderProduct());
			psmt.setInt(2, dto.getOrderCount());
			psmt.setInt(3, dto.getOrderDelivery());
			psmt.setInt(4, dto.getOrderPrice());
			psmt.setInt(5, dto.getOrderTotal());
			psmt.setInt(6, dto.getReceiver());
			psmt.setInt(7, dto.getHp());
			psmt.setInt(8, dto.getZip());
			psmt.setInt(9, dto.getAddr1());
			psmt.setInt(10, dto.getAddr2());
			psmt.setInt(11, dto.getOrderEtc());
			psmt.setInt(12, dto.getOrderUser());
			psmt.setInt(13, dto.getOrderDate());
			psmt.executeUpdate();
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public OrderDTO selectOrder(int orderNo) {
		return null;
	}
	public List<OrderDTO> selectOrders() {
		return null;
	}
	public void updateOrder(OrderDTO dto) {}
	public void deleteOrder(int orderNo) {}
	
	
}
