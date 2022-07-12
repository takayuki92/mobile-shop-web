package dao;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import context.DBContext;
import model.Account;
import model.Cart;
import model.Orders;
import model.Product;

public class OrdersDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	

	//insert information of Order to data source, that including list of
	//products in cart (c) and information of buyer in Orders
	public void insertOrder(Orders o) throws Exception {
		String query = "INSERT INTO [dbo].[Orders] ([user_mail]\n"
				+ "      ,[order_status]\n"
				+ "      ,[order_discount_code]\n"
				+ "      ,[order_address])\n"
				+ "      VALUES (?,?,?,?)";
		try {
			DBContext db = new DBContext();
			conn = db.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, o.getUserMail());
			ps.setInt(2, o.getStatus());
			ps.setString(3, o.getDiscount());
			ps.setString(4,o.getAddress());
			ps.executeUpdate();
			
		} catch(Exception ex) {
			
		}
	}
	
	public void insertOrderDetail(Orders o, Cart c) throws Exception {
		
		try {
			for(Product p: c.getItems()) {
				String query = "INSERT INTO [dbo].[Orders_detail] ([order_id]\n"
				+ "      ,[product_id]\n"
				+ "      ,[amount_product]\n"
				+ "      ,[price_product])\n"
				+ "      VALUES (?,?,?,?)";
		
			DBContext db = new DBContext();
			conn = db.getConnection();
			ps = conn.prepareStatement(query);
				ps.setInt(1, o.getOrderId());
				ps.setInt(2, p.getId());
				ps.setInt(3, p.getNumber());
				ps.setInt(4, (int) p.getPrice());
				ps.executeUpdate();
			}
			
		} catch(Exception ex) {
			
		}
	}
	
	//return login account
	public Account getAccount(String username, String password) throws Exception {
		String query = "select * from Account where user_mail = ? and password = ?";
		try {
			DBContext db = new DBContext();			
			conn = db.getConnection();
			ps = conn.prepareStatement(query);	
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();			
			while(rs.next()) {
				Account a = new Account(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4),
						rs.getString(5), rs.getString(6));
				return a;
			}	
		} catch(Exception ex) {
			System.out.println(ex);
		}
		return null;
	}
	
	//return the list of account by user name
		public List<Account> getAccounts() throws Exception {
			String query = "select * from Account";
			try {
				DBContext db = new DBContext();			
				conn = db.getConnection();
				ps = conn.prepareStatement(query);				
				rs = ps.executeQuery();
				List<Account> list = new ArrayList<>();
				while(rs.next()) {
					list.add(new Account(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4),
							rs.getString(5), rs.getString(6)));
				}	
				return list;
			} catch(Exception ex) {
				System.out.println(ex);
			}
			return null;
		}
		
		
//		public static void main(String[] args) throws Exception {
//			OrdersDAO dao = new OrdersDAO();
//			Account acc = dao.getAccount("taka@gmail.com", "123");
//			
//				System.out.println(acc.toString());
//			
//		}
	
}
