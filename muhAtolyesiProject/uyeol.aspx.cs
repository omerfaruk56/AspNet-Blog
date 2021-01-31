using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace muhAtolyesiProject
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["giris"] == "uye")
                Response.Redirect("Default.aspx");

            if (!Page.IsPostBack)
                sayiUret();
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

        protected void btnUyelikOlustur_Click(object sender, EventArgs e)
        {
            accessDatabase ad;
            try
            {
                if (TextBoxGuvenlikSorusu.Text == Session["sonuc"].ToString()
                                  && txtUyeAd.Text != ""
                                  && txtUyeSoyad.Text != ""
                                  && txtUyeMail.Text != ""
                                  && txtUyeSifre.Text != ""
                                  && txtUyeSifreTekrar.Text != ""
                                  && txtUyeSifre.Text == txtUyeSifreTekrar.Text)
                {
                    ad = new accessDatabase();
                    ad.ekle("INSERT INTO uyeol (uyelikTarihi,uyeAd,uyeSoyad,uyeMail,uyeSifre) VALUES ('" + string.Format("{0:dd.MM.yyyy HH:mm}", TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("Turkey Standard Time"))) + "','" + txtUyeAd.Text + "','" + txtUyeSoyad.Text + "','" + txtUyeMail.Text + "','" + txtUyeSifre.Text + "')");
                    Page.Response.Redirect(Page.Request.Url.ToString(), false);
                    Response.Redirect("hosgeldiniz.aspx");
                }
                else
                    LabelBilgilendirme.Text = "Kutucukları boş bırakmayınız !";
            }
            catch
            {
                LabelBilgilendirme.Text = "Mesajınız gönderilemedi !";
            }
        }

        protected void txtUyeSifreTekrar_TextChanged(object sender, EventArgs e)
        {
            if (txtUyeSifre.Text == txtUyeSifreTekrar.Text)
                lblSifreDurum.Text = "✔";
            else
                lblSifreDurum.Text = "❌";
        }
       
    }
}