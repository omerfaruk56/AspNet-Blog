using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI.WebControls;

namespace muhAtolyesiProject
{
    class accessDatabase
    {
        private OleDbConnection cnn;
        private OleDbDataAdapter da;
        private OleDbCommand cmd;
        //private DataSet ds;
        //private OleDbDataReader dr;
        private DataTable dt;

        public static string veritabaniYolu
        {
            get
            {
                return "Provider = Microsoft.ACE.OLEDB.12.0; Data source =" + HttpContext.Current.Server.MapPath("model/myBlog56Db.accdb");
            }
        }

        public void dropListDoldur(DropDownList dropList, string tabloAd, string alanAd, string alanDegeri)
        {
            cnn = new OleDbConnection(accessDatabase.veritabaniYolu);
            da = new OleDbDataAdapter("Select * from " + tabloAd, accessDatabase.veritabaniYolu);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dropList.DataSource = dt;
            dropList.DataTextField = alanAd; // Combobox ta görünecek olan hücre
            dropList.DataValueField = alanDegeri; // Arka Planda tutulacak olan id
            dropList.DataBind();
        }

        public void gridViewDoldur(Repeater rpt, String tableName, String komut)
        {
            cnn = new OleDbConnection(veritabaniYolu);
            da = new OleDbDataAdapter(komut, cnn);
            cnn.Open();
            dt = new DataTable();
            da.Fill(dt);
            rpt.DataSource = dt;
            rpt.DataBind();
            cnn.Close();
        }

        public object TekVeriCekme(string komut)
        {
            cnn = new OleDbConnection(veritabaniYolu);
            cmd = new OleDbCommand(komut, cnn);
            cnn.Open();
            object deger = (object)cmd.ExecuteScalar();
            cnn.Close();
            return deger;
        }

        public void ekle(string komut)
        {
            cnn = new OleDbConnection(veritabaniYolu);
            cmd = new OleDbCommand(komut, cnn);
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public void guncelle(string komut)
        {
            cnn = new OleDbConnection(veritabaniYolu);
            cmd = new OleDbCommand(komut, cnn);
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public void sil(string komut)
        {
            cnn = new OleDbConnection(veritabaniYolu);
            cmd = new OleDbCommand(komut, cnn);
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

    }
}