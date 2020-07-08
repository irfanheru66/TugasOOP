/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CRUD;

/**
 *
 * @author irfan
 */
import java.sql.*;
public class Create {

    public String create(String qry) throws SQLException{
        
        Config config = new Config();
        Connection kon = config.configDB();
        java.sql.PreparedStatement pst = kon.prepareStatement(qry);
        
        try {
            pst.executeUpdate();
            return "Berhasil Buat!";
        
        } catch (Exception e) {
            return e.getMessage();
                }
    }

    
}