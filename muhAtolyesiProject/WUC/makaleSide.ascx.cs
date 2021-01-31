using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace muhAtolyesiProject.WUC
{
    public partial class makaleSide : System.Web.UI.UserControl
    {
        accessDatabase ad;
        string getMsinif;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {            
                ad = new accessDatabase();
                if (Request.QueryString["konu"] == null)

                {
                    int SayfaNo = Convert.ToInt32(Request.QueryString["Sayfa"]);
                    Pageing p = new Pageing();
                    Repeater1.DataSource = p.GetData(SayfaNo, 7, Request.Url.Segments.Last().Substring(0, Request.Url.Segments.Last().Length - 5), (int)Session["kategoriid"]);
                    Repeater1.DataBind();
                    lblIlkYorumuYapin.Visible = false;
                }
                else
                {
                    if ((string)Session["login"] != "admin" && (string)Session["giris"] != "uye")
                        Response.Redirect("uyeol.aspx");

                    okunmaSayisi();
                    ad.gridViewDoldur(Repeater1, "makale", "select m.okunmasayisi ,m.icerik, m.baslik,m.tarih,k.kategori, m.id, m.yazar,m.kucukResim, m.anahtarKelimeler from makale as m inner join kategoriler as k on k.kategoriid = m.kategoriid WHERE m.id = " + Request.QueryString["konu"]);
                    ad.gridViewDoldur(rpt_yorumlar, "Yorumlar", "select * from Yorumlar where makaleid=" + Request.QueryString["konu"] + " order by yorumid desc");
                    lblIlkYorumuYapin.Visible = (string)Session["lblYorum"] == "0" ? true : false; //turnary if
                    sayiUret();
                }
            }
         
        }

        void sayiUret()
        {
            Random rnd = new Random();
            TextBoxGuvenlikSorusu.Text = "";
            int sayi1 = rnd.Next(50, 100);
            int sayi2 = rnd.Next(1, 10);
            Session["sonuc"] = sayi1 + sayi2;
            LabelGuvenlikSorusu.Text = "Sayıların Toplamı: " +
                sayi1.ToString() + " + " +
                sayi2.ToString() + " = ?";
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (Request.QueryString["konu"] != null)
            {
                Label lbl = (Label)e.Item.FindControl("Label1");
                lbl.Visible = false;

                Label lbl2 = (Label)e.Item.FindControl("Label2");
                lbl2.Visible = true;

                Label lbl3 = (Label)e.Item.FindControl("Label3");
                lbl3.Visible = true;

                //Label lbl5 = (Label)e.Item.FindControl("Label5");
                //lbl5.Visible = true;

                //Label lbl4 = (Label)e.Item.FindControl("Label4");
                //lbl4.Visible = true;


                //Label lbl5 = (Label)e.Item.FindControl("Label5");
                //lbl5.Visible = true;
            }
            Label lblYorum = (Label)e.Item.FindControl("LabelYorumSayisi");
            Label lblmid = (Label)e.Item.FindControl("Labelmid");

            lblYorum.Text = ad.TekVeriCekme("select count(*) from Yorumlar where makaleid = " + lblmid.Text).ToString();
            Session["lblYorum"] = lblYorum.Text;

        }

        void okunmaSayisi()
        {
            ad = new accessDatabase();
            ad.guncelle("UPDATE makale SET okunmasayisi = okunmasayisi + 1 WHERE  id=" + Request.QueryString["konu"]);
        }

        protected void btnYorumEkle_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBoxGuvenlikSorusu.Text == Session["sonuc"].ToString()
                    && TextAreaMesaj.InnerText != ""
                    && TextBoxAdsoyad.Text != ""
                    && TextBoxAdsoyad.Text.Length <= 40)
                {
                    ad = new accessDatabase();

                    ad.ekle("INSERT INTO Yorumlar (adSoyad,yorum,tarih,makaleid,ipAdres) VALUES ('" + TextBoxAdsoyad.Text + "','" + TextAreaMesaj.InnerText + "','" + string.Format("{0:dd.MM.yyyy HH:mm}", TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("Turkey Standard Time"))) + "'," + Request.QueryString["konu"] + ",'" + getIpAdress() + "')");
                    ad.gridViewDoldur(rpt_yorumlar, "Yorumlar", "select * from Yorumlar where makaleid=" + Request.QueryString["konu"] + " order by yorumid desc");
                    Page.Response.Redirect(Page.Request.Url.ToString(), false);
                }
                else
                    LabelYorumDurum.Text = "Kutucukları boş geçmeyiniz!";
            }
            catch
            {


            }

        }

        string getIpAdress()
        {
            WebRequest SiteyeBaglantiTalebi = HttpWebRequest.Create("https://ip-adresim.net/");
            WebResponse GelenCevap = SiteyeBaglantiTalebi.GetResponse();
            StreamReader CevapOku = new StreamReader(GelenCevap.GetResponseStream());
            string KaynakKodlar = CevapOku.ReadToEnd();
            int IcerikBaslangicIndex = KaynakKodlar.IndexOf("<strong class=\"mycurrentip\">") + 28;
            int IcerikBitisIndex = KaynakKodlar.Substring(IcerikBaslangicIndex).IndexOf("</strong>");
            return KaynakKodlar.Substring(IcerikBaslangicIndex, IcerikBitisIndex).Trim();
        }

        protected void ButtonMobilAra_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBoxMobilAra.Text == "" && DropDownList_mSiniflar.SelectedValue == "sinifYok")
                    return;

                if (TextBoxMobilAra.Text.Length > 40)
                    return;

                ad = new accessDatabase();
                if (TextBoxMobilAra.Text == "")
                {
                    getMsinif = DropDownList_mSiniflar.SelectedItem.ToString();
                }

                ad.ekle("insert into aramaIstatistik (tarih,arananlar) values ('" + string.Format("{0:dd.MM.yyyy HH:mm:ss}", TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("Turkey Standard Time"))) + "', '" + (TextBoxMobilAra.Text == "" ? getMsinif + "." : TextBoxMobilAra.Text + ".") + "')");
                Response.Redirect("Arama.aspx?gelen=" + TextBoxMobilAra.Text + "&sinif=" + DropDownList_mSiniflar.SelectedValue + "&detayliArama=" + DropDownList_mDetayliAra.SelectedValue);

            }
            catch
            {


            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(DropDownList1.SelectedValue);
        }


        //*******************EMOJİLER****************************//

        protected void btnBegen_Click(object sender, EventArgs e)
        {
            TextAreaMesaj.InnerText += btnBegen.Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextAreaMesaj.InnerText += btnKalp.Text;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            TextAreaMesaj.InnerText += BtnKalpGoz.Text;
        }

        protected void btnKahkaha_Click(object sender, EventArgs e)
        {
            TextAreaMesaj.InnerText += btnKahkaha.Text;
        }

        protected void btnSasirmis_Click(object sender, EventArgs e)
        {
            TextAreaMesaj.InnerText += btnSasirmis.Text;
        }

        protected void btnAglayan_Click(object sender, EventArgs e)
        {
            TextAreaMesaj.InnerText += btnAglayan.Text;
        }

        protected void btnSinirli_Click(object sender, EventArgs e)
        {
            TextAreaMesaj.InnerText += btnSinirli.Text;
        }

        protected void btnOn_Click(object sender, EventArgs e)
        {        
            Response.Redirect("icerik.aspx");
        }

        protected void btnOff_Click(object sender, EventArgs e)
        {
            //Application.Remove("login");
            Session.Abandon();
            Response.Redirect("admin.aspx");
        }

        protected void btnUyeCikis_Click(object sender, EventArgs e)
        {
            //Application.Remove("giris");
            Session.Abandon();

            Response.Redirect("girisyap");
        }

        //*********************************************************//
    }
}