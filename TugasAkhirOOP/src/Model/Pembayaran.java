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
public class Pembayaran {

    String psn;
    String dkter;
    String hrg;
    String id;

    public Pembayaran(String psn, String dkter, String hrg) {
        this.psn = psn;
        this.dkter = dkter;
        this.hrg = hrg;
    }
    
        public void write(){
                         String sql = "INSERT INTO pembayaran (id_pasien,id_dokter,jumlah_bayar)";
        String koma = ",";
        String petik = "'";
        String tutup = ")";
        sql = sql.concat("VALUES( ");
        sql = sql.concat(psn +koma);
        
        sql = sql.concat(dkter+koma);
        
        sql = sql.concat(hrg+tutup);
        
        
           try {
            System.out.print(new Create().create(sql));
        } catch (SQLException ex) {
            Logger.getLogger(Pendaftaran.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
           public void delete(){
   String sql = "delete from pembayaran where id_pasien =";
   sql = sql.concat(psn);
   sql = sql.concat(" AND id_dokter =");
   sql = sql.concat(dkter);
   System.out.print(sql);
   
         try {
             System.out.print(new Update().update(sql));
         } catch (SQLException ex) {
             Logger.getLogger(Pasien.class.getName()).log(Level.SEVERE, null, ex);
         }
   
   }
           public void edit(String byr){
           
    String sql = "update pembayaran \n";
        String koma = ",";
        String petik = "'";
           
        
        sql = sql.concat("set id_pasien=" +psn + koma);
        sql = sql.concat("id_dokter=" +dkter +"\n");
          sql = sql.concat(" where no_bayar =");
          
        sql = sql.concat(byr);
        System.out.print(sql);
        
         try {
             System.out.print(new Update().update(sql));
         } catch (SQLException ex) {
             Logger.getLogger(Pasien.class.getName()).log(Level.SEVERE, null, ex);
         }
    
           
           
           };

}