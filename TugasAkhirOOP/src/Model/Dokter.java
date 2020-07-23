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

public class Dokter {
    String id;
    String nama;
    String hrg;
    String jdwl;
    String spsls;
    String jam;

    public Dokter(String id, String nama, String hrg, String jdwl, String spsls, String jam) {
        this.id = id;
        this.nama = nama;
        this.hrg = hrg;
        this.jdwl = jdwl;
        this.spsls = spsls;
        this.jam = jam;
    }
    
    public void Write(){
    String sql = "INSERT INTO dokter (id_dokter,nama,harga,jadwal,spesialis,jam) \n";
        String koma = ",";
        String petik = "'";
        String tutup = ")";
        sql = sql.concat("VALUES( ");
        sql = sql.concat(id+koma);
        sql = sql.concat(petik +nama +petik + koma);
        sql = sql.concat(hrg + koma);
        sql = sql.concat(petik +jdwl +petik + koma);
        sql = sql.concat(spsls + koma);
        sql = sql.concat(petik +jam +petik + tutup);
        
           try {
            System.out.print(new Create().create(sql));
        } catch (SQLException ex) {
            Logger.getLogger(Pendaftaran.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
       public void delete(){
   String sql = "delete from dokter where id_dokter=";
   sql = sql.concat(id);
   
         try {
             System.out.print(new Update().update(sql));
         } catch (SQLException ex) {
             Logger.getLogger(Pasien.class.getName()).log(Level.SEVERE, null, ex);
         }
   
   }
       public void edit(){
       
    String sql = "update dokter \n";
        String koma = ",";
        String petik = "'";
           
        
        sql = sql.concat("set nama="+ petik +nama +petik + koma);
        sql = sql.concat("harga="+ hrg  + koma);
        sql = sql.concat("jadwal="+petik +jdwl+ petik + koma);
        sql = sql.concat("jam="+petik +jam +petik + koma);
        sql = sql.concat("spesialis="+spsls  + "\n");
          sql = sql.concat("where id_dokter =");
          
        sql = sql.concat(id);
        System.out.print(sql);
        
         try {
             System.out.print(new Update().update(sql));
         } catch (SQLException ex) {
             Logger.getLogger(Pasien.class.getName()).log(Level.SEVERE, null, ex);
         }
    
       
       
       };
    
}