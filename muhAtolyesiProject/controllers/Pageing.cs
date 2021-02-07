using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Data.OleDb;

namespace muhAtolyesiProject
{
    public class Pageing
    {
        string sorgu;
        string aktifSorgu;
        int aktifSayfa;
        string sayfa;

        public Pageing()
        {

        }

        public Pageing(string _sayfa, int _aktifSayfa)
        {
            aktifSayfa = _aktifSayfa;
            sayfa = _sayfa;
        }

        public DataTable GetData(int sayfaNo, int gonderiSayisi, string sayfa, int kategoriid)
        {
            int baslangic = (sayfaNo * gonderiSayisi) + 1;
            int bitis = baslangic + gonderiSayisi - 1;


            if (sayfa != "Default")
                sorgu = "SELECT m.*, (select count(*) from makale where m.id <= id and kategoriid=" + kategoriid + ") AS RowNo, k.kategori FROM makale AS m INNER JOIN kategoriler AS k ON m.kategoriid = k.kategoriid WHERE m.kategoriid=" + kategoriid + " and ((((select count(*) from makale where m.id <= id and kategoriid=" + kategoriid + ")) Between " + baslangic + " And " + bitis + "))";
            else
                sorgu = "SELECT m.*, (select count(*) from makale where m.id <= id) AS RowNo, k.kategori FROM makale AS m INNER JOIN kategoriler AS k ON m.kategoriid = k.kategoriid WHERE((((select count(*) from makale where m.id <= id)) Between " + baslangic + " And " + bitis + "))";

            OleDbConnection cnn = new OleDbConnection(accessDatabase.veritabaniYolu);
            OleDbCommand cmd = new OleDbCommand(sorgu, cnn);
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public int ToplamKayitSayisi(string aktifSayfa)
        {
            OleDbConnection cnn = new OleDbConnection(accessDatabase.veritabaniYolu);
            if (aktifSayfa != "Default")
                aktifSorgu = "select count(*) from makale as m inner join kategoriler as k on m.kategoriid=k.kategoriid  where k.kategori='" + aktifSayfa + "'";
            else
                aktifSorgu = "select count(*) from makale";

            OleDbCommand cmd = new OleDbCommand(aktifSorgu, cnn);
            cnn.Open();
            int deger = (int)cmd.ExecuteScalar();
            cnn.Close();
            return deger;
        }

        public string CreatePageing()
        {
            int ToplamSayfaSayisi;
            StringBuilder sb = new StringBuilder();
            if (ToplamKayitSayisi(sayfa) % 3 == 0)
            {
                ToplamSayfaSayisi = ToplamKayitSayisi(sayfa) / 3;
            }
            else
            {
                ToplamSayfaSayisi = ToplamKayitSayisi(sayfa) / 3 + 1;
            }

            for (int i = 0; i < ToplamSayfaSayisi; i++)
            {
                if (aktifSayfa == i)
                    sb.Append("<a class=\"aktifSayfaNo active\" href =" + sayfa.ToString().Replace(" ", "") + ".aspx?Sayfa=" + (i) + ">" + (i + 1) + "</a>");
                else
                    sb.Append("<a class=\"aktifSayfaNo\" href =" + sayfa.ToString().Replace(" ", "") + ".aspx?Sayfa=" + (i) + ">" + (i + 1) + "</a>");

            }

            return sb.ToString();
        } // Top 3
    }
}