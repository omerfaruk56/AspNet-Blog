using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace muhAtolyesiProject
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        Pageing p;
        accessDatabase da;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["kategoriid"] = 20;

            if (Request.QueryString["konu"] == null)
            {
                p = new Pageing("C Sharp", Convert.ToInt32(Request.QueryString["Sayfa"]));
                lblSayfalamaCsharp.Text = p.CreatePageing();
                Page.Title = "C Sharp";
                Page.MetaDescription = "C Sharp ile ilgili eğitici ve öğretici makale ve projeler";
                Page.MetaKeywords = "projeler,c#,otomasyon,visual studio";
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