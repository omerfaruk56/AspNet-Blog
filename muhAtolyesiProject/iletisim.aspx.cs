using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace muhAtolyesiProject
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                sayiUret();
            }
        }


        protected void ButtonMesajGonder_Click(object sender, EventArgs e)
        {
            accessDatabase ad;
            try
            {
                if (TextBoxGuvenlikSorusu.Text == Session["sonuc"].ToString()
                                  && TextBoxAdsoyad.Text != ""
                                  && TextBoxEposta.Text != ""
                                  && TextBoxKonu.Text != ""
                                  && TextAreaileti.InnerText != "")
                           
                {
                    ad = new accessDatabase();
                    ad.ekle("INSERT INTO iletisim (adsoyad,eposta,konu,ileti,tarih) VALUES ('" + TextBoxAdsoyad.Text + "','" + TextBoxEposta.Text + "','" + TextBoxKonu.Text + "','" + TextAreaileti.InnerText + "','" + string.Format("{0:dd.MM.yyyy HH:mm}", TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("Turkey Standard Time"))) + "')");
                    Page.Response.Redirect(Page.Request.Url.ToString(), false);
                }
                else
                    LabelBilgilendirme.Text = "Kutucukları boş bırakmayınız !";
            }
            catch
            {
                LabelBilgilendirme.Text = "Mesajınız gönderilemedi !";
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
    }
}