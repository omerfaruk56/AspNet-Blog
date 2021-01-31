using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace muhAtolyesiProject
{
    public partial class WebForm16 : System.Web.UI.Page
    {

        AntiSqlInjection anti;

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["giris"] == "uye")
                Response.Redirect("Default.aspx");
        }

        protected void btnGirisYap_Click(object sender, EventArgs e)
        {
            if (txtEmailAdresi.Text.Length > 100 && txtSifre.Text.Length > 6)
                return;

            anti = new AntiSqlInjection();
            txtEmailAdresi.Text = anti.tehlikeliIfadeleriTemizle(txtEmailAdresi.Text);
            txtSifre.Text = anti.tehlikeliIfadeleriTemizle(txtSifre.Text);

            accessDatabase a = new accessDatabase();
            OleDbConnection cnn = new OleDbConnection(accessDatabase.veritabaniYolu);
            cnn.Open();

            OleDbCommand cmd2 = new OleDbCommand("Select * from uyeol Where uyeMail='" + txtEmailAdresi.Text + "' and uyeSifre='" + txtSifre.Text + "' and uyelikAktifEt=false", cnn);
            OleDbDataReader oku2 = cmd2.ExecuteReader();
            if (oku2.Read())
            {
                lblUyari.Text = "Ödeme yapmadığınız için giriş yapamıyorsunuz.";
                return;
            }


            OleDbCommand cmd = new OleDbCommand("Select * from uyeol Where uyeMail='" + txtEmailAdresi.Text + "' and uyeSifre='" + txtSifre.Text + "' and uyelikAktifEt=true", cnn);
            OleDbDataReader oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                Session["giris"] = "uye";
                Session["isim"] = oku["uyeAd"];
                Response.Redirect("Default.aspx");
            }
            else
                lblUyari.Text = "Hatalı giriş yapıldı";
        }
    }
}