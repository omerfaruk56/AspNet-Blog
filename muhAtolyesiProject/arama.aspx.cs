using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace muhAtolyesiProject
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        accessDatabase da;
        string sorguOlusur;
        string sonucSayisi;
        string getM2sinif;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                da = new accessDatabase();
                sorguOlusur = "";

                if ((Request.QueryString["sinif"] != "sinifYok" && Request.QueryString["gelen"] != null) || ((Request.QueryString["gelen"] != null && Request.QueryString["gelen"] != "")))
                {
                    string[] keyWords = Request.QueryString["gelen"].ToString().Split(' ');
                    sorguOlusur = "m.baslik LIKE '%" + keyWords[0] + "%'";//tek kelime için sorgu

                    for (int i = 1; i < keyWords.Length; i++)//birden fazla kelime sorgusu
                        sorguOlusur += " or m.baslik LIKE '%" + keyWords[i] + "%'";

                    //Detaylı Arama
                    if (Request.QueryString["sinif"] != "sinifYok")
                        sorguOlusur += " and sinif=" + Request.QueryString["sinif"];

                    if (Request.QueryString["detayliArama"] != "siralamaYok")
                    {
                        if (Request.QueryString["detayliArama"] == "tarihEnYeni")
                            sorguOlusur += " order by  m.id desc";
                        else if (Request.QueryString["detayliArama"] == "tarihEnEski")
                            sorguOlusur += " order by m.id asc";

                    }

                    if (Request.QueryString["detayliArama"] == "tarihEnYeni")
                        sonucSayisi = da.TekVeriCekme("select top 50 count(*) from makale as m inner join kategoriler as k on m.kategoriid=k.kategoriid  where " + sorguOlusur.Replace("order by  m.id desc", "")).ToString();
                    else if (Request.QueryString["detayliArama"] == "tarihEnEski")
                        sonucSayisi = da.TekVeriCekme("select  top 50 count(*) from makale as m inner join kategoriler as k on m.kategoriid=k.kategoriid  where " + sorguOlusur.Replace("order by m.id asc", "")).ToString();
                    else
                        sonucSayisi = da.TekVeriCekme("select  top 50 count(*) from makale as m inner join kategoriler as k on m.kategoriid=k.kategoriid  where " + sorguOlusur).ToString();



                    if (lblSonucSayisi.Visible = sonucSayisi == "0")
                    {
                        lblSonucSayisi.Visible = true;
                        lblSonucSayisi.Text = "Sonuç bulunamadı. <br/> <br/> Bulmak istediğiniz bilgiyle ilgili <a href=\"http://www.dpuceng.com/iletisim\"> mesaj</a> yazabilirsiniz <br/> <br/> <ul>Öneriler:<br/><br/>•Tüm kelimeleri doğru yazdığınızdan emin olun.<br/>•Başka anahtar kelimeleri deneyin.<br/>•Daha genel anahtar kelimeleri deneyin.<br/>•Daha az anahtar kelime deneyin.<ul/>";
                    }
                    else
                    {
                        da.gridViewDoldur(rpt_arama, "makale", "select  top 50 * from makale as m inner join kategoriler as k on m.kategoriid=k.kategoriid  where " + sorguOlusur);
                        lblSonucSayisi.Visible = false;
                    }


                    Page.Title = Request.QueryString["gelen"].ToString() + " - DpuCeng'de Ara";
                }
                else
                    Page.Title = "Arama";
            }
        }

        protected void btnMobilAra_Click(object sender, EventArgs e)
        {

            try
            {
                if (txtMobilAra.Text == "" && DropDownList_m2Siniflar.SelectedValue == "sinifYok")
                    return;

                if (txtMobilAra.Text.Length > 40)
                    return;

                da = new accessDatabase();
                if (txtMobilAra.Text == "")
                {
                    getM2sinif = DropDownList_m2Siniflar.SelectedItem.ToString();
                }
                da.ekle("insert into aramaIstatistik (tarih,arananlar) values ('" + string.Format("{0:dd.MM.yyyy HH:mm:ss}", TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("Turkey Standard Time"))) + "', '" + (txtMobilAra.Text == "" ? getM2sinif + "." : txtMobilAra.Text + ".") + "')");
                Response.Redirect("Arama.aspx?gelen=" + txtMobilAra.Text + "&sinif=" + DropDownList_m2Siniflar.SelectedValue + "&detayliArama=" + DropDownList_m2DetayliAra.SelectedValue);
            }
            catch
            {


            }




        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(DropDownList1.SelectedValue);
        }
    }
}