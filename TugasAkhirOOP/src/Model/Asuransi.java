/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import CRUD.Create;
import CRUD.Update;
import GUI.Pendaftaran;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author irfan
 */
public class Asuransi {

    String id;
    String nama;
    String ptng;

    public Asuransi(String id, String nama, String ptng) {
        this.id = id;
        this.nama = nama;
        this.ptng = ptng;
    }
        public void write(){
    String sql = "INSERT INTO asuransi (no_asuransi,nama_asuransi,potongan) \n";
        String koma = ",";
        String petik = "'";
        String tutup = ")";
        sql = sql.concat("VALUES( ");
                sql = sql.concat(id+koma);
        sql = sql.concat(petik +nama +petik + koma);
        sql = sql.concat(ptng+ tutup);
           try {
            System.out.print(new Create().create(sql));
        } catch (SQLException ex) {
            Logger.getLogger(Pendaftaran.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        
           public void delete(){
   String sql = "delete from asuransi where no_asuransi=";
   sql = sql.concat(id);
   
         try {
             System.out.print(new Update().update(sql));
         } catch (SQLException ex) {
             Logger.getLogger(Pasien.class.getName()).log(Level.SEVERE, null, ex);
         }
   
   }
       public void edit(){
       
    String sql = "update asuransi \n";
        String koma = ",";
        String petik = "'";
           
        
        sql = sql.concat("set nama_asuransi="+ petik +nama +petik + koma);
        sql = sql.concat("potongan="+ ptng +"\n");
          sql = sql.concat("where no_asuransi =");
          
        sql = sql.concat(id);
        System.out.print(sql);
        
         try {
             System.out.print(new Update().update(sql));
         } catch (SQLException ex) {
             Logger.getLogger(Pasien.class.getName()).log(Level.SEVERE, null, ex);
         }
    };    
           
}