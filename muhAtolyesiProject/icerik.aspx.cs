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
    public partial class WebForm3 : System.Web.UI.Page
    {
        accessDatabase ad;
        string txtYazar = "Admin";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if ((string)Session["login"] == "yazar")
                {
                    btnMakaleSil.Visible = false;
                    btnMakaleGuncelle.Visible = false;
                    DropDownListKategoriSec.Visible = false;
                    DropDownListMakaleler.Visible = false;
                    LabelKategoriSec.Visible = false;
                    LabelMakaleSec.Visible = false;
                    ButtonGelenMesajAc.Visible = false;
                    ButtonYorumAc.Visible = false;
                    btnAramaAc.Visible = false;
                    ButtonZiyaretciAc.Visible = false;
                    LabelToplamMesajSayisi.Visible = false;
                    LabelToplamYorumSayisi.Visible = false;
                    ButtonYazarAc.Visible = false;
                }
                else if ((string)Session["login"] == "admin")
                {

                }
                else if (Session["login"] == null)
                    Response.Redirect("admin.aspx");

                ad = new accessDatabase();

                ad.dropListDoldur(DropDownList1, "kategoriler order by kategoriid desc", "kategori", "kategoriid");

                ad.dropListDoldur(DropDownListKategoriSec, "kategoriler", "kategori", "kategoriid");

                ad.gridViewDoldur(rpt_gelenMesajlar, "iletisim", "select * from iletisim order by iletisimid desc");

                ad.gridViewDoldur(rpt_uyelerim, "uyeol", "select * from uyeol order by uyeOlId desc");

                ad.gridViewDoldur(rpt_yorumlar, "Yorumlar", "select * from Yorumlar order by yorumid desc");

                ad.gridViewDoldur(rpt_aramalar, "Yorumlar", "select * from vw_gunlukAramalar");

                ziyaretciIstatistik();

                toplamMesajSayisi();

                toplamUyeSayisi();

                toplamYorumSayisi();

                toplamAramaSayisi();

                toplamYazarSayisi();

                DropDownList1.BorderColor = System.Drawing.Color.Black;

            }
        }

        void ziyaretciIstatistik()
        {
            ad = new accessDatabase();
            //ad.gridViewDoldur(rpt_ziyaretciler, "ziyaretciIstatistik", "select * from ziyaretciIstatistik");
            LabelOnline.Text = "Online Kişiler: " + Application["online"].ToString();
        }

        protected void btn_ac_Click(object sender, EventArgs e)
        {

            Panel1.Visible = true;
        }

        protected void btn_kapat_Click(object sender, EventArgs e)
        {

            Panel1.Visible = false;
        }

        //--------------------------------------------------------------------------------------------//

        protected void Button1_Click(object sender, EventArgs e)//makaleEkle
        {
            if (TextBox1.Text != "" &&
                DropDownList1.Text != "" &&
                CKEditorControl1.Text != "" &&
                TextBoxKucukResim.Text != "" &&
                DropDownList1.SelectedItem.ToString() != "Yok")
            {
                ad = new accessDatabase();
                ad.ekle("INSERT INTO makale (baslik,sinif,icerik,tarih,kategoriid,yazar,anahtarKelimeler,aciklama,kucukResim) VALUES ('" + TextBox1.Text + "'," + DropDownList_sinif.SelectedValue + ",'" + CKEditorControl1.Text + "','" + string.Format("{0:dd.MM.yyyy}", DateTime.Now) + ", " + CultureInfo.GetCultureInfo("tr-TR").DateTimeFormat.DayNames[(int)DateTime.Now.DayOfWeek] + "'," + DropDownList1.SelectedValue + ",'" + txtYazar + "','" + TextBoxKeywords.Text + "','" + TextBoxAciklama.Text + "','" + TextBoxKucukResim.Text + "')");
            }
            else
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Makale Ekleme Uyarısı", "<script>alert('Lütfen tüm kutucukları doldurun');</script>");
        }

        protected void btnMakaleSil_Click(object sender, EventArgs e)
        {
            ad = new accessDatabase();
            ad.sil("delete from makale where id=" + DropDownListMakaleler.SelectedValue);
            ad.dropListDoldur(DropDownListMakaleler, "makale", "baslik", "id");

        }

        protected void ButtonGelenMesajAc_Click(object sender, EventArgs e)
        {

            PanelGelenMesajlar.Visible = true;
        }

        protected void ButtonGelenMesajKapat_Click(object sender, EventArgs e)
        {
            PanelGelenMesajlar.Visible = false;
        }

        void toplamMesajSayisi()
        {
            LabelToplamMesajSayisi.Text = ad.TekVeriCekme("select count(*) from iletisim").ToString();
        }

        void toplamYorumSayisi()
        {
            LabelToplamYorumSayisi.Text = ad.TekVeriCekme("select count(*) from Yorumlar").ToString();

        }

        void toplamAramaSayisi()
        {
            lblToplamAramaSayisi.Text = ad.TekVeriCekme("select count(*) from aramaIstatistik").ToString();
        }

        void toplamYazarSayisi()
        {
            lblToplamYazarSayisi.Text = ad.TekVeriCekme("select count(*) from login").ToString();

        }
        void toplamUyeSayisi()
        {
            lblToplamUyeSayisi.Text = ad.TekVeriCekme("select count(*) from uyeol").ToString();

        }

        protected void ButtonYorumAc_Click(object sender, EventArgs e)
        {
            PanelYorumlar.Visible = true;
        }

        protected void ButtonYorumKapat_Click(object sender, EventArgs e)
        {
            PanelYorumlar.Visible = false;
        }

        protected void rpt_yorumlar_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            ad = new accessDatabase();
            if (e.CommandName == "Delete")
            {
                ad.sil("delete from Yorumlar where yorumid = " + e.CommandArgument);
            }
            if (e.CommandName == "link")
            {

                Response.Write("<script>window.open('/dersnotu.aspx?konu=" + e.CommandArgument + "','_blank');</script>");
            }

            toplamYorumSayisi();
            ad.gridViewDoldur(rpt_yorumlar, "Yorumlar", "select * from Yorumlar order by yorumid desc");
        }

        protected void rpt_gelenMesajlar_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            ad = new accessDatabase();
            if (e.CommandName == "Delete")
            {
                ad.sil("delete from iletisim where iletisimid = " + e.CommandArgument);
            }
            toplamMesajSayisi();
            ad.gridViewDoldur(rpt_gelenMesajlar, "iletisim", "select * from iletisim order by iletisimid desc");
        }

        protected void btnMakaleGuncelle_Click(object sender, EventArgs e)
        {
            ad = new accessDatabase();
            ad.guncelle("UPDATE makale SET icerik='" + CKEditorControl1.Text + "' , baslik='" + TextBox1.Text + "',sinif=" + DropDownList_sinif.SelectedValue + " , yazar='" + txtYazar + "', anahtarKelimeler='" + TextBoxKeywords.Text + "', aciklama='" + TextBoxAciklama.Text + "', kucukResim='" + TextBoxKucukResim.Text + "' WHERE id= " + DropDownListMakaleler.SelectedValue);
        }

        protected void DropDownListMakaleler_SelectedIndexChanged(object sender, EventArgs e)
        {
            temizlikYap();
            ad = new accessDatabase();
            CKEditorControl1.Text = ad.TekVeriCekme("select icerik from makale where id= " + DropDownListMakaleler.SelectedValue).ToString();
            TextBox1.Text = ad.TekVeriCekme("select baslik from makale where id= " + DropDownListMakaleler.SelectedValue).ToString();
            TextBoxKeywords.Text = ad.TekVeriCekme("select anahtarKelimeler from makale where id= " + DropDownListMakaleler.SelectedValue).ToString();
            TextBoxAciklama.Text = ad.TekVeriCekme("select aciklama from makale where id= " + DropDownListMakaleler.SelectedValue).ToString();
            TextBoxKucukResim.Text = ad.TekVeriCekme("select kucukResim from makale where id= " + DropDownListMakaleler.SelectedValue).ToString();
            DropDownList_sinif.SelectedIndex = (int)ad.TekVeriCekme("select sinif from makale where id= " + DropDownListMakaleler.SelectedValue);

        }

        //--------------------------ARAMA PANELİ-------------------------------------------------
        protected void BtnAramaKapat_Click(object sender, EventArgs e)
        {
            PanelAramalar.Visible = false;

        }

        protected void BtnAramaAc_Click(object sender, EventArgs e)
        {
            PanelAramalar.Visible = true;
        }

        protected void btnTemizle_Click(object sender, EventArgs e)
        {

            temizlikYap();
        }

        void temizlikYap()
        {
            TextBox1.Text = "";
            TextBoxKeywords.Text = "";
            TextBoxAciklama.Text = "";
            CKEditorControl1.Text = "";
        }

        protected void DropDownListKategoriSec_SelectedIndexChanged(object sender, EventArgs e)
        {
            temizlikYap();
            ad = new accessDatabase();
            ad.dropListDoldur(DropDownListMakaleler, "makale where kategoriid = " + DropDownListKategoriSec.SelectedValue, "baslik", "id");

            DropDownListMakaleler_SelectedIndexChanged(sender, e);

        }

        protected void ButtonZiyaretciAc_Click(object sender, EventArgs e)
        {
            ziyaretciIstatistik();
            PanelZiyaretciler.Visible = true;
        }

        protected void ButtonZiyaretciKapat_Click(object sender, EventArgs e)
        {
            PanelZiyaretciler.Visible = false;
        }

        protected void ButtonSifreDegistir_Click(object sender, EventArgs e)
        {
            ad = new accessDatabase();
            if (TextBoxYeniSifre.Text == TextBoxSifreTekrar.Text)
            {
                ad.guncelle("Update login set sifre = '" + TextBoxYeniSifre.Text + "' Where kullaniciAdi = '" + TextBoxMailAdres.Text + "' and sifre = '" + TextBoxMevcutSifre.Text + "'");
                if (ad.TekVeriCekme("select sifre from login where  kullaniciAdi = '" + TextBoxMailAdres.Text + "'").ToString() == TextBoxYeniSifre.Text)
                {
                    Response.AppendHeader("Refresh", "1;url=Admin.aspx");
                    LabelDurum.Text = "Şifre başarıyla değiştirildi.";

                }
                else
                    LabelDurum.Text = "Hata oluştu. Tekrar deneyin.";
            }
            else
                LabelDurum.Text = "Şifreler Uyuşmuyor";
        }

        protected void ButtonSifreDegistirKapat_Click(object sender, EventArgs e)
        {
            PanelSifreDegistir.Visible = false;
        }

        protected void ButtonSifreDegistirAc_Click(object sender, EventArgs e)
        {
            PanelSifreDegistir.Visible = true;
        }

        protected void ButtonYazarAc_Click(object sender, EventArgs e)
        {
            PanelYazar.Visible = true;
        }

        protected void ButtonYazarKapat_Click(object sender, EventArgs e)
        {
            PanelYazar.Visible = false;
        }

        protected void ButtonYazarEkle_Click(object sender, EventArgs e)
        {
            ad = new accessDatabase();
            ad.ekle("insert into login (email,sifre,yetki) values ('" + TextBoxYazarMail.Text + "','" + TextBoxYazarSifre.Text + "'," + DropDownListYazarYetki.SelectedValue.ToString() + ")");
            Response.Write(@"<script language='javascript'>alert('Yazar başarıyla eklendi.')</script>");
        }

        protected void ButtonResimYukle_Click(object sender, EventArgs e)
        {
            if (FileUploadResimEkle.HasFile)
            {

                if (Path.GetExtension(FileUploadResimEkle.PostedFile.FileName) != ".jpg")
                {
                    LabelrsmDurum.Text = "Sadece .jpg uzantılı dosya seçin";
                    return;
                }

                if (FileUploadResimEkle.PostedFile.ContentLength > 1000000)
                {
                    LabelrsmDurum.Text = "1 mb'dan daha küçük resim yükleyin";
                    return;
                }

                FileInfo fi = new FileInfo(Server.MapPath("images//") + FileUploadResimEkle.PostedFile.FileName);
                if (fi.Exists == false)
                {
                    FileUploadResimEkle.SaveAs(Server.MapPath("/images/" + FileUploadResimEkle.FileName));
                    LabelrsmDurum.Text = "Resim dosyası yüklendi...";
                    TextBoxKucukResim.Text = "/images/" + FileUploadResimEkle.PostedFile.FileName;
                }
                else
                    LabelrsmDurum.Text = "Dosya zaten var! (dosyanın adını değiştirin)";
            }
            else
            {
                LabelrsmDurum.Text = "Hata oluştu.";
            }
        }

        protected void rpt_aramalar_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            ad = new accessDatabase();
            if (e.CommandName == "Delete")
            {
                ad.sil("delete from aramaIstatistik where aramaid = " + e.CommandArgument);
            }
            toplamAramaSayisi();
            ad.gridViewDoldur(rpt_aramalar, "aramaIstatistik", "select * from vw_gunlukAramalar");
        }

        protected void btnTumAramalar_Click(object sender, EventArgs e)
        {
            ad = new accessDatabase();
            ad.gridViewDoldur(rpt_aramalar, "aramaIstatistik", "select * from vw_tumAramalar");
            toplamAramaSayisi();
        }

        protected void btnAylikAramalar_Click(object sender, EventArgs e)
        {
            ad = new accessDatabase();
            ad.gridViewDoldur(rpt_aramalar, "aramaIstatistik", "select * from vw_aylikAramalar");
            lblToplamAramaSayisi.Text = ad.TekVeriCekme("select * from vw_toplamAylikArama").ToString();
        }

        protected void btnGunlukAramalar_Click(object sender, EventArgs e)
        {
            ad = new accessDatabase();
            ad.gridViewDoldur(rpt_aramalar, "aramaIstatistik", "select * from vw_gunlukAramalar");
            lblToplamAramaSayisi.Text = ad.TekVeriCekme("select * from vw_toplamGunlukArama").ToString();

        }

        protected void btnMasaustuAramalar_Click(object sender, EventArgs e)
        {
            ad = new accessDatabase();
            ad.gridViewDoldur(rpt_aramalar, "aramaIstatistik", "select * from aramaIstatistik where arananlar not like \"%.\"");
            lblToplamAramaSayisi.Text = ad.TekVeriCekme("select count(*) from aramaIstatistik where arananlar not like \"%.\"").ToString();
        }

        protected void btnMobilAramalar_Click(object sender, EventArgs e)
        {
            ad = new accessDatabase();
            ad.gridViewDoldur(rpt_aramalar, "aramaIstatistik", "select * from aramaIstatistik where arananlar like \"%.\"");
            lblToplamAramaSayisi.Text = ad.TekVeriCekme("select count(*) from aramaIstatistik where arananlar like \"%.\"").ToString();
        }

        protected void btnUyePanelAc_Click(object sender, EventArgs e)
        {
            PanelUyeler.Visible = true;
        }

        protected void btnUyePanelKapat_Click(object sender, EventArgs e)
        {
            PanelUyeler.Visible = false;
        }

        protected void rpt_uyelerim_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            ad = new accessDatabase();
            if (e.CommandName == "update")
            {
                if ((Boolean)ad.TekVeriCekme("select uyelikAktifEt from uyeol where uyeOlId = " + e.CommandArgument))
                ad.guncelle("update uyeol set uyelikAktifEt = false where uyeOlId = " + e.CommandArgument);
                else
                    ad.guncelle("update uyeol set uyelikAktifEt = true where uyeOlId = " + e.CommandArgument);
            }

            ad.gridViewDoldur(rpt_uyelerim, "uyeol", "select * from uyeol order by uyeOlId desc");

        }

    }
}