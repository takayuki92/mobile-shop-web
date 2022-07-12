package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Product;

public class ListProductDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//return the list of all products
	public List<Product> getAllProducts() {		
		try {
			List<Product> list = new ArrayList<>();
			String query = "Select * from Products"; //Write query
			DBContext db = new DBContext();//Open the connection to SQL Server
			conn = db.getConnection();
			ps = conn.prepareStatement(query);//Throw query statement to SQL Server
			rs = ps.executeQuery();//Execute query and get result
			while(rs.next()) { //get data from rs table -> transform into an object
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4),
						rs.getString(5), rs.getString(6), rs.getString(7)));
			}
			return list;
		} catch(Exception ex) {
			
		}
		return null;
	}
	
	
	//return the list of products by product name with pagination
	public List<Product> search(String txtSearch, int index, int size) throws Exception {
		String query = "with x as(SELECT ROW_NUMBER() over(order by Product_id) as r, * FROM Products\n"
				+ "WHERE product_name like ?)\n"
				+ "select * from x WHERE r BETWEEN ?*4-3 and ?*4";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%"+ txtSearch + "%");
			ps.setInt(2, index);
			ps.setInt(3, index);
			rs = ps.executeQuery();
			List<Product> list = new ArrayList<>();
			while(rs.next()) {
				list.add(new Product(rs.getInt(2), rs.getString(3), rs.getString(4), rs.getFloat(5),
						rs.getString(6), rs.getString(7), rs.getString(8)));
			}	
			return list;
		} catch(Exception ex) {
			System.out.println(ex);
		}
		return null;
	}
	
	//return the list of products by product name without pagination
		public List<Product> searchAjax(String txtSearch) throws Exception {
			String query = "SELECT * FROM Products WHERE product_name LIKE ?";
			try {
				conn = new DBContext().getConnection();
				ps = conn.prepareStatement(query);
				ps.setString(1, "%"+ txtSearch + "%");
				rs = ps.executeQuery();
				List<Product> list = new ArrayList<>();
				while(rs.next()) {
					list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4),
							rs.getString(5), rs.getString(6), rs.getString(7)));
				}	
				return list;
			} catch(Exception ex) {
				System.out.println(ex);
			}
			return null;
		}
	
	//get the product by id
	public Product getProduct(int id) throws Exception {
		String query = "select * from Products where product_id = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4),
						rs.getString(5), rs.getString(6), rs.getString(7));		
				return p;
			}	
		} catch(Exception ex) {
			System.out.println(ex);
		}
		return null;
	}
	
	//get total production in database
	public int getTotalProduct() {
		String query = "select count(*) from Products";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);
			}			
		} catch(Exception ex) {
			System.out.println(ex);
		}	
		return 0;
	}
	
	
	//get list of products for paging
	public List<Product> getPagingProduct(int index) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products \n" 
				+ "ORDER BY product_id \n"
				+ "OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, (index-1)*4);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4),
						rs.getString(5), rs.getString(6), rs.getString(7)));
			}				
		} catch(Exception ex) {
			System.out.println(ex);
		}	
		return list;
	}
	
	//return list of first 4 products for home page
	public List<Product> getTop4() {
		List<Product> list = new ArrayList<>();
		String query = "select top 4 * from Products";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4),
						rs.getString(5), rs.getString(6), rs.getString(7)));
			}
			return list;
		} catch(Exception ex) {
			System.out.println(ex);
		}	
		return null;
	}
	
	//return total count for search
	public int countSearch(String txtSearch) {
		try {
			String query = "SELECT COUNT(*) FROM Products WHERE product_name LIKE ?";
			DBContext db = new DBContext();
			conn = db.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + txtSearch + "%");
			rs = ps.executeQuery();	
			
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch(Exception ex) {}
		return 0;
	}
	
//	public static void main(String[] args) throws Exception {
//		ListProductDAO dao = new ListProductDAO();
//		Product p = dao.getProduct(1);
//			
//				System.out.println(p.toString());
//
//			
//	}
//		
////		int count = dao.getTotalProduct();
////		System.out.println(count);
////		List<Product> list = dao.search("xs");
////			for(Product p: list) {
////				System.out.println(p);
////
////			}
//	}
	
	
}
