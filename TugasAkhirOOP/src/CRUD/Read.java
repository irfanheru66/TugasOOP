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
public class Read {
    public ResultSet exec(String qry) throws SQLException{
       
        Config config = new Config();
        Connection kon = config.configDB();
        java.sql.Statement query = kon.createStatement();
        java.sql.ResultSet res;     
        res = query.executeQuery(qry);
        return res;
            
    }
}