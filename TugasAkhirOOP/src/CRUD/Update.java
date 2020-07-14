/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CRUD;

import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author irfan
 */
public class Update {
         public String update(String sql) throws SQLException {
       
            Config config = new Config();
            Connection kon = config.configDB();
            java.sql.Statement st = kon.createStatement();
            st.executeUpdate(sql);
            return "berhasil dibuat!";
    }
    
}
