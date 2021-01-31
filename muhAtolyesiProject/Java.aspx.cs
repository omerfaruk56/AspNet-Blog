using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace muhAtolyesiProject
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        Pageing p;
        accessDatabase da;
        protected void Page_Load(object sender, EventArgs e)


        {
            Session["kategoriid"] = 19;


            if (Request.QueryString["konu"] == null)
            {
                p = new Pageing(Request.Url.Segments.Last().Substring(0, Request.Url.Segments.Last().Length - 5), Convert.ToInt32(Request.QueryString["Sayfa"]));

                lblSayfalamaJava.Text = p.CreatePageing();
                Page.Title = "Java";
                Page.MetaDescription = "Java ile ilgili öğretici makale ve projeler";
                Page.MetaKeywords = "java,eclipse,console proje,android studio";
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