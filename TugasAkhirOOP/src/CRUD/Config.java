/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CRUD;
import java.sql.*;

/**
 *
 * @author irfan
 */
    public class Config {
    private static Connection mysqlconfig;
    public Connection configDB()throws SQLException{
        try {
            String url="jdbc:mysql://localhost:3306/ta_oop"; //url database
            String user="root"; //user database
            String pass="";
            String driver = "com.mysql.jdbc.Driver";
            Class.forName(driver);
            mysqlconfig =  DriverManager.getConnection(url, user, pass);
            System.out.println("Sukses");            
        } catch (Exception e) {
            System.err.println(e); //perintah menampilkan error pada koneksi
        }
        return mysqlconfig;
    }      
}
