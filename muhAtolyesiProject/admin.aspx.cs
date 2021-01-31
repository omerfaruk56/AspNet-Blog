using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace muhAtolyesiProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        AntiSqlInjection anti;

        protected void Page_Load(object sender, EventArgs e)
        {
           
                if ((string)Session["login"] == "admin" || (string)Session["yazar"] == "yazar")
                    Response.Redirect("icerik.aspx");
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Length > 100 && TextBox2.Text.Length > 8)
                return;

            anti = new AntiSqlInjection();
            TextBox1.Text = anti.tehlikeliIfadeleriTemizle(TextBox1.Text);
            TextBox2.Text = anti.tehlikeliIfadeleriTemizle(TextBox2.Text);

            accessDatabase a = new accessDatabase();
            OleDbConnection cnn = new OleDbConnection(accessDatabase.veritabaniYolu);
            cnn.Open();
            OleDbCommand cmd = new OleDbCommand("Select * from Login Where email='" + TextBox1.Text + "' and sifre='" + TextBox2.Text + "' and hesapDondur=false", cnn);
            OleDbDataReader oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                if ((int)a.TekVeriCekme("Select yetki from Login Where email = '" + TextBox1.Text + "' and sifre = '" + TextBox2.Text + "'") == 1)
                    Session["login"] = "admin";
                else
                    Session["login"] = "yazar";

                Response.Redirect("icerik.aspx");
            }
            else
                Label3.Text = "Hatalı giriş yapıldı";
        }
    }
}