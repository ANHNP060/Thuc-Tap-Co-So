/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Describe {

    private int DesId;
    private String MauSac, KichThuoc, ChatLieu, NoiSanXuat;
    private String[] DacDiemNoiBat;

    public Describe() {
    }

    public Describe(int DesId, String MauSac, String KichThuoc, String ChatLieu, String NoiSanXuat, String[] DacDiemNoiBat) {
        this.DesId = DesId;
        this.MauSac = MauSac;
        this.KichThuoc = KichThuoc;
        this.ChatLieu = ChatLieu;
        this.NoiSanXuat = NoiSanXuat;
        this.DacDiemNoiBat = DacDiemNoiBat;
    }

    public int getDesId() {
        return DesId;
    }

    public void setDesId(int DesId) {
        this.DesId = DesId;
    }

    public String getMauSac() {
        return MauSac;
    }

    public void setMauSac(String MauSac) {
        this.MauSac = MauSac;
    }

    public String getKichThuoc() {
        return KichThuoc;
    }

    public void setKichThuoc(String KichThuoc) {
        this.KichThuoc = KichThuoc;
    }

    public String getChatLieu() {
        return ChatLieu;
    }

    public void setChatLieu(String ChatLieu) {
        this.ChatLieu = ChatLieu;
    }

    public String getNoiSanXuat() {
        return NoiSanXuat;
    }

    public void setNoiSanXuat(String NoiSanXuat) {
        this.NoiSanXuat = NoiSanXuat;
    }

    public String[] getDacDiemNoiBat() {
        return DacDiemNoiBat;
    }

    public void setDacDiemNoiBat(String[] DacDiemNoiBat) {
        this.DacDiemNoiBat = DacDiemNoiBat;
    }

}
