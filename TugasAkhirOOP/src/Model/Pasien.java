/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import CRUD.Create;
import GUI.Pendaftaran;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import CRUD.Update;

/**
 *
 * @author irfan
 */
public class Pasien {
    
     String nama ;
    String alamat ;
    String no_ktp ;
    String asuransi;
    String hp;
    String tgl_lahir;

    public Pasien(String nama, String alamat, String no_ktp, String asuransi, String hp, String tgl_lahir) {
        this.nama = nama;
        this.alamat = alamat;
        this.no_ktp = no_ktp;
        this.asuransi = asuransi;
        this.hp = hp;
        this.tgl_lahir = tgl_lahir;
    }

   public void write(){
        String respon = "gagal";
        String sql = "INSERT INTO pasien (no_ktp,nama,alamat,no_asuransi,no_hp,tgl_lahir) \n";
        String koma = ",";
        String petik = "'";
        String tutup = ")";
        sql = sql.concat("VALUES( ");
               System.out.print(sql);
        
        sql = sql.concat(no_ktp+koma);
        sql = sql.concat(petik +nama +petik + koma);
        sql = sql.concat(petik +alamat +petik + koma);
        sql = sql.concat(asuransi+ koma);
        sql = sql.concat(petik +hp +petik + koma);
        sql = sql.concat(petik +tgl_lahir +petik + tutup);
        
        System.out.print(sql);
        
        try {
            System.out.print(new Create().create(sql));
        } catch (SQLException ex) {
            Logger.getLogger(Pendaftaran.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
   
   public void delete(){
   String sql = "delete from pasien where no_ktp=";
   sql = sql.concat(no_ktp);
   
         try {
             System.out.print(new Update().update(sql));
         } catch (SQLException ex) {
             Logger.getLogger(Pasien.class.getName()).log(Level.SEVERE, null, ex);
         }
   
   }
    public void edit(){
    String sql = "update pasien \n";
        String koma = ",";
        String petik = "'";
           
        
        sql = sql.concat("set nama="+ petik +nama +petik + koma);
        sql = sql.concat("alamat="+petik +alamat +petik + koma);
        sql = sql.concat("no_asuransi="+asuransi+ koma);
        sql = sql.concat("no_hp="+petik +hp +petik + koma);
        sql = sql.concat("tgl_lahir="+petik +tgl_lahir +petik + "\n");
          sql = sql.concat("where no_ktp =");
          
        sql = sql.concat(no_ktp);
        System.out.print(sql);
        
         try {
             System.out.print(new Update().update(sql));
         } catch (SQLException ex) {
             Logger.getLogger(Pasien.class.getName()).log(Level.SEVERE, null, ex);
         }
    
    
    };
    
}
