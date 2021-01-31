using muhAtolyesiProject.WUC;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace muhAtolyesiProject
{
    public partial class main : System.Web.UI.MasterPage
    {
        accessDatabase da;
        string getSinif;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                da = new accessDatabase();

                da.gridViewDoldur(rpt_kategoriler, "makale", "Select * from vw_KategoriListele");

                //da.gridViewDoldur(rpt_sonEklenenler_masaustu, "makale", "Select * from vw_SonEklenenlerListele");

                da.gridViewDoldur(rpt_sonEklenenler, "makale", "Select * from vw_SonEklenenlerListele");

            }

        }

        protected void ButtonAra_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBoxArama.Text == "" && DropDownList_siniflar.SelectedValue == "sinifYok")
                    return;

                if (TextBoxArama.Text.Length > 40)
                    return;

                da = new accessDatabase();
                if (TextBoxArama.Text == "")
                {
                    getSinif = DropDownList_siniflar.SelectedItem.ToString();
                }
                da.ekle("insert into aramaIstatistik (tarih,arananlar) values ('" + string.Format("{0:dd.MM.yyyy HH:mm:ss}", TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("Turkey Standard Time"))) + "', '" + (TextBoxArama.Text == "" ? getSinif : TextBoxArama.Text) + "')");
                Response.Redirect("Arama.aspx?gelen=" + TextBoxArama.Text + "&sinif=" + DropDownList_siniflar.SelectedValue + "&detayliArama=" + DropDownList_detayliAra.SelectedValue);

            }
            catch
            {


            }
        }

        protected void btnOn_Click(object sender, EventArgs e)
        {
            Response.Redirect("icerik.aspx");
        }

        protected void btnOff_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("admin.aspx");
        }

        protected void btnUyeCikis_Click1(object sender, EventArgs e)
        {
            Session.Abandon();
        

            Response.Redirect("girisyap.aspx");
        }
    }
}