package com.codewale.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class DynamicMenu {
	
	public Map getMenuItems()
	{
		
		
		Map menuMap=null;
		Connection connection=null;
		
		menuMap=new HashMap();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", "CHRIST",
					"CHRIST");
			Statement st=connection.createStatement();
		
			ResultSet rs= st.executeQuery("select menu_item from dynamic_menu where item_type='header'  order by item_order");
			while(rs.next())
			{
				
				
				Statement st1=connection.createStatement();
				String group=rs.getString("menu_item");
				ResultSet rs1= st1.executeQuery("select menu_item,link_page,tool_tip,item_order from dynamic_menu where item_type='item' and item_group='"+group+"' order by item_order");
				List menuList=new ArrayList();
				while(rs1.next())
				{
					Map columnMap= new HashMap();
					columnMap.put("menu_item", rs1.getString("menu_item"));
					columnMap.put("link_page", rs1.getString("link_page"));
					columnMap.put("tool_tip", rs1.getString("tool_tip"));
					menuList.add((rs1.getInt("item_order")-1), columnMap);
					
				}
				menuMap.put(group, menuList);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return menuMap;
		
	}
	

}
