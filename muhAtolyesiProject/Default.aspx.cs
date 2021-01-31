using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace muhAtolyesiProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Pageing p;
        accessDatabase da;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["kategoriid"] = 0;

            if (Request.QueryString["konu"] == null)
            {
                p = new Pageing("Default", Convert.ToInt32(Request.QueryString["Sayfa"]));
                lblSayfalamaDefault.Text = p.CreatePageing();
                Page.Title = "Dpü Ceng - Vize Final ve Not Paylaşım Platformu";
                Page.MetaDescription = "Vize final soru paylaşımı yapılmaktadır. Çözümlü soru, final vize örnek sorulara bakmak için tıklayın.";
                Page.MetaKeywords = "projeler, yazılım, bilgisayar, mühendislik, dpü, ceng, vize, final, soru, paylaşım, ders, not, sorulari, üniversitesi, yaz okulu, vize sorulari, final sorulari, sinav";             
            }
            else
            {
                da = new accessDatabase();
                Page.Title = da.TekVeriCekme("select baslik from makale where id = " + Request.QueryString["konu"]).ToString();
                Page.MetaKeywords = da.TekVeriCekme("select anahtarKelimeler from makale where id = " + Request.QueryString["konu"]).ToString();
                Page.MetaDescription = da.TekVeriCekme("select aciklama from makale where id = " + Request.QueryString["konu"]).ToString();        
            }

        }
    }
}