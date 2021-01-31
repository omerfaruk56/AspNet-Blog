<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="icerik.aspx.cs" Inherits="muhAtolyesiProject.WebForm3" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="scripts/ckeditor/ckeditor.js"></script>
    <script src="scripts/ckeditor/config.js"></script>
    <script src="scripts/ckeditor/styles.js"></script>

    <title>Admin Paneli</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 25px; background-color: #E5E5E5; font-weight: bolder; color: #88ac0b; font-size: medium">
        <asp:Button ID="btn_ac" Font-Size="Medium" runat="server" Text="+" OnClick="btn_ac_Click" Width="33px" ForeColor="Black" />
        &nbsp;
        <asp:Button ID="btn_kapat" Font-Size="Medium" runat="server" Text="-" OnClick="btn_kapat_Click" Width="33px" ForeColor="Black" />
        &nbsp;
       &#9997; &#304;çerik Olu&#351;tur
    </div>
    <asp:Panel ID="Panel1" runat="server" Visible="False">
        <div style="width: 494px; height: 1220px;">
            <br />
            &nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="Ba&#351;l&#305;k: "></asp:Label>
            <br />
            &nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" BorderColor="Black" Font-Size="Medium" Width="350px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;
        <asp:Label ID="Label7" runat="server" Font-Size="Medium" Text="Anahtar Kelimeler:"></asp:Label>
            <br />
            &nbsp;&nbsp;
        <asp:TextBox ID="TextBoxKeywords" runat="server" BorderColor="Black" Font-Size="Medium" Width="350px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;
        <asp:Label ID="Label8" runat="server" Font-Size="Medium" Text="Aç&#305;klama:"></asp:Label>
            <br />
            &nbsp;&nbsp;
        <asp:TextBox ID="TextBoxAciklama" runat="server" BorderColor="Black" Font-Size="Medium" Width="350px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;
        <asp:Label ID="LabelKucukResim" runat="server" Font-Size="Medium" Text="Küçük Resim Url:"></asp:Label>
            <br />
            &nbsp;&nbsp;
        <asp:TextBox ID="TextBoxKucukResim" runat="server" BorderColor="Black" Font-Size="Medium" Width="350px"></asp:TextBox>

            &nbsp;&nbsp;<br />
            &nbsp;&nbsp;
        <asp:Button ID="ButtonResimYukle" runat="server" BorderColor="Black" Font-Size="Small" ForeColor="Black" OnClick="ButtonResimYukle_Click" Text="Resim Yükle" Width="84px" />
            &nbsp;<asp:FileUpload ID="FileUploadResimEkle" runat="server" Width="170px" />
            <asp:Label ID="LabelrsmDurum" runat="server"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="Kategori: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label9" runat="server" Font-Size="Medium" Text="S&#305;n&#305;f:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
        <br />
            &nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Font-Size="Medium" Height="20px" Width="212px">
        </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList_sinif" runat="server" AutoPostBack="True" Font-Size="Small" Height="30px" Width="119px">
                <asp:ListItem Value="0">Yok</asp:ListItem>
                <asp:ListItem Value="1">1. S&#305;n&#305;f</asp:ListItem>
                <asp:ListItem Value="2">2. S&#305;n&#305;f</asp:ListItem>
                <asp:ListItem Value="3">3. S&#305;n&#305;f</asp:ListItem>
                <asp:ListItem Value="4">4. S&#305;n&#305;f</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            &nbsp;&nbsp;
        <asp:Label ID="Label3" Font-Size="Medium" runat="server" Text="&#304;çerik: "></asp:Label>
            <br />

            <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server" Height="320px" Width="361px"></CKEditor:CKEditorControl>
            &nbsp;&nbsp;&nbsp;
            <br />

            <asp:Button ID="btnMakaleEkle" runat="server" BorderColor="Black" Font-Size="Medium" OnClick="Button1_Click" Text="Ekle" Width="360px" Height="30px" ForeColor="Black" />
            <br />
            <br />
            <br />

            <asp:Button ID="ButtonTemizle" runat="server" BorderColor="Black" Font-Size="Medium" OnClick="btnTemizle_Click" Text="Temizle" Width="180px" Height="30px" ForeColor="Black" />
            &nbsp;&nbsp;
          
        <asp:Button ID="btnMakaleGuncelle" runat="server" Font-Size="Medium" BorderColor="Black" Text="Güncelle" Width="100px" Height="30px" OnClick="btnMakaleGuncelle_Click" ForeColor="Black" />
            &nbsp;&nbsp;
        <asp:Button ID="btnMakaleSil" runat="server" Font-Size="Medium" BorderColor="Black" Text="Sil" OnClick="btnMakaleSil_Click" Width="50px" Height="30px" ForeColor="Black" />

            <br />

            <br />
            &nbsp;&nbsp;&nbsp;<asp:Label ID="LabelKategoriSec" runat="server" Font-Size="Medium" Text="Kategori Seç:"></asp:Label>

            <br />
            &nbsp;&nbsp;
        <asp:DropDownList ID="DropDownListKategoriSec" runat="server" AutoPostBack="True" Font-Size="Medium" Height="19px" OnSelectedIndexChanged="DropDownListKategoriSec_SelectedIndexChanged" Width="355px">
        </asp:DropDownList>
            <br />
            <br />
            &nbsp;&nbsp;
        <asp:Label ID="LabelMakaleSec" runat="server" Font-Size="Medium" Text="Makale Seç:"></asp:Label>
            &nbsp;<br />
            &nbsp;&nbsp;
        <asp:DropDownList ID="DropDownListMakaleler" runat="server" AutoPostBack="true" Font-Size="Medium" Height="19px" OnSelectedIndexChanged="DropDownListMakaleler_SelectedIndexChanged" Width="355px">
        </asp:DropDownList>
            <br />
            <br />
            &nbsp;
        </div>
        <br />
        <br />
        <br />

    </asp:Panel>
    <br />
    <div style="height: 25px; background-color: #E5E5E5; font-weight: bolder; color: #88ac0b; font-size: medium">

        <asp:Button ID="ButtonGelenMesajAc" runat="server" Font-Size="Medium" Text="+" Width="33px" ForeColor="Black" OnClick="ButtonGelenMesajAc_Click" />
        &nbsp;
        <asp:Button ID="ButtonGelenMesajKapat" Font-Size="Medium" runat="server" Text="-" Width="33px" ForeColor="Black" OnClick="ButtonGelenMesajKapat_Click" />
        &nbsp;
       &#128231; Gelen Mesajlar -
        <asp:Label ID="LabelToplamMesajSayisi" runat="server" Text=""></asp:Label>
    </div>
    <asp:Panel ID="PanelGelenMesajlar" runat="server" Visible="False">
        <br />
        <asp:Repeater ID="rpt_gelenMesajlar" runat="server" OnItemCommand="rpt_gelenMesajlar_ItemCommand">
            <ItemTemplate>
                <b>Tarih:</b>
                <%# Eval("tarih") %>


                <br />
                <b>Ad Soyad:</b>
                <%# Eval("adsoyad") %>
                <br />

                <b>E-Posta:</b>
                <%# Eval("eposta") %>


                <br />

                <b>Konu:</b>
                <%# Eval("konu") %>
                <br />

                <b>&#304;leti:</b>
                <%# Eval("ileti") %>
                <br />
                <asp:Button ID="ButtonMesajSil" CommandName="Delete" Width="150px" Font-Size="Medium" CommandArgument=' <%# Eval("iletisimid") %>' runat="server" Text="Mesaj&#305; Sil" />

            </ItemTemplate>

            <SeparatorTemplate>
                <hr />
                <br />

            </SeparatorTemplate>
        </asp:Repeater>
    </asp:Panel>
    <br />
    <div style="height: 25px; background-color: #E5E5E5; font-weight: bolder; color: #88ac0b; font-size: medium">

        <asp:Button ID="ButtonYorumAc" Font-Size="Medium" runat="server" Text="+" Width="33px" ForeColor="Black" OnClick="ButtonYorumAc_Click" />
        &nbsp;
        <asp:Button ID="ButtonYorumKapat" Font-Size="Medium" runat="server" Text="-" Width="33px" ForeColor="Black" OnClick="ButtonYorumKapat_Click" />
        &nbsp;
      &#128172; Yorumlar -
        <asp:Label ID="LabelToplamYorumSayisi" runat="server" Text=""></asp:Label>

    </div>
    <asp:Panel ID="PanelYorumlar" runat="server" Visible="False">
        <br />
        <asp:Repeater ID="rpt_yorumlar" runat="server" OnItemCommand="rpt_yorumlar_ItemCommand">
            <ItemTemplate>
                <b>Tarih:</b>
                <%# Eval("tarih") %>
                <br />
                <b>Ad Soyad:</b>
                <%# Eval("adsoyad") %>
                <br />
                <b>Yorum:</b>
                <%# Eval("yorum") %>
                <br />
                <b>Ip Adresi:</b>
                <%# Eval("ipAdres") %>
                <br />
                <asp:Button ID="ButtonYorumSil" CommandName="Delete" Font-Size="Medium" Width="150px" CommandArgument=' <%# Eval("yorumid") %>' runat="server" Text="Yorumu Sil" />
                &nbsp; &nbsp; 
                <asp:Button ID="ButtonMakaleyeGit" CommandName="link" Font-Size="Medium" Width="150px" CommandArgument=' <%# Eval("makaleid") %>' runat="server" Text="Makaleye Git" />

            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
                <br />
            </SeparatorTemplate>

        </asp:Repeater>
    </asp:Panel>
    <br />
    <div style="height: 25px; background-color: #E5E5E5; font-weight: bolder; color: #88ac0b; font-size: medium">

        <asp:Button ID="btnAramaAc" Font-Size="Medium" runat="server" Text="+" Width="33px" ForeColor="Black" OnClick="BtnAramaAc_Click" />
        &nbsp;
        <asp:Button ID="btnAramaKapat" Font-Size="Medium" runat="server" Text="-" Width="33px" ForeColor="Black" OnClick="BtnAramaKapat_Click" />
        &nbsp;
       &#128269; Arama ist. - 
        <asp:Label ID="lblToplamAramaSayisi" runat="server" Text=""></asp:Label>
    </div>
    <asp:Panel ID="PanelAramalar" runat="server" Visible="False">
        <br />
        Filtre Uygula:
        <br />
        <asp:Button ID="btnTumAramalar" runat="server" Text="Tüm Aramalar" ForeColor="Black" BorderColor="Black" Width="340px" Height="30px" OnClick="btnTumAramalar_Click" />

        <br />
        <br />
        <asp:Button ID="btnAylikAramalar" runat="server" Width="165px" Height="30px" BorderColor="Black" ForeColor="Black" Text="Ayl&#305;k Aramalar" OnClick="btnAylikAramalar_Click" />
        &nbsp;
        <asp:Button ID="btnGunlukAramalar" runat="server" Width="165px" Height="30px" BorderColor="Black" ForeColor="Black" Text="Günlük Aramalar" OnClick="btnGunlukAramalar_Click" />
        <br />
        <br />
        <asp:Button ID="btnMasaustuAramalar" Width="165px" Height="30px" BorderColor="Black" ForeColor="Black" runat="server" Text="Masaüstü Aramalar" OnClick="btnMasaustuAramalar_Click" />
        &nbsp;
        <asp:Button ID="btnMobilAramalar" runat="server" Width="165px" Height="30px" ForeColor="Black" BorderColor="Black" Text="Mobil Aramalar" OnClick="btnMobilAramalar_Click" />

        <br />
        <br />

        <asp:Repeater ID="rpt_aramalar" runat="server" OnItemCommand="rpt_aramalar_ItemCommand">
            <ItemTemplate>
                <b>Tarih:</b>
                <%# Eval("tarih") %>
                <br />
                <b>Aranan: </b>
                <%# Eval("arananlar") %>
                <br />
                <asp:Button ID="ButtonAramaSil" CommandName="Delete" Font-Size="Medium" Width="150px" CommandArgument=' <%# Eval("aramaid") %>' runat="server" Text="Aramay&#305; Sil" />
            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
                <br />
            </SeparatorTemplate>

        </asp:Repeater>
    </asp:Panel>
    <br />
    <div style="height: 25px; background-color: #E5E5E5; font-weight: bolder; color: #88ac0b; font-size: medium">

        <asp:Button ID="ButtonZiyaretciAc" Font-Size="Medium" runat="server" Text="+" Width="33px" ForeColor="Black" OnClick="ButtonZiyaretciAc_Click" />
        &nbsp;
        <asp:Button ID="ButtonZiyaretciKapat" Font-Size="Medium" runat="server" Text="-" Width="33px" ForeColor="Black" OnClick="ButtonZiyaretciKapat_Click" />
        &nbsp;
        &#127757;
    <asp:Label ID="LabelOnline" runat="server" Text=""></asp:Label>

    </div>
    <asp:Panel ID="PanelZiyaretciler" runat="server" Visible="False">
        <%--  <asp:Repeater ID="rpt_ziyaretciler" runat="server" OnItemCommand="rpt_yorumlar_ItemCommand">
            <ItemTemplate>
                 <b>Tarih :</b>
                <%# Eval("tarih").ToString().Substring(0,10)%>
                <br />              
                <b>Bugün:</b>
                <%# Eval("gunluk") %>
                <b>Bu Ay:</b>
                <%# Eval("aylik") %>
                <b>Bu Y&#305;l:</b>
                <%# Eval("yillik") %>
                <b>Toplam:</b>
                <%# Eval("toplam") %>
            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
                <br />
            </SeparatorTemplate>
        </asp:Repeater>--%>
    </asp:Panel>
    <br />
    <div style="height: 25px; background-color: #E5E5E5; font-weight: bolder; color: #88ac0b; font-size: medium">

        <asp:Button ID="ButtonSifreDegistirAc" Font-Size="Medium" runat="server" Text="+" Width="33px" ForeColor="Black" OnClick="ButtonSifreDegistirAc_Click" />
        &nbsp;
        <asp:Button ID="ButtonSifreDegistirKapat" Font-Size="Medium" runat="server" Text="-" Width="33px" ForeColor="Black" OnClick="ButtonSifreDegistirKapat_Click" />
        &nbsp;
    &#128272; &#350;ifre De&#287;i&#351;tir
    </div>
    <asp:Panel ID="PanelSifreDegistir" runat="server" Visible="False">
        <br />
        <div style="width: 335px; height: 230px; margin: auto">


            <asp:Label ID="LabelMail" runat="server" Text="Mail Adresi: " Font-Size="Medium"></asp:Label>
            <br />

            <asp:TextBox ID="TextBoxMailAdres" BorderColor="Black" runat="server" Font-Size="Medium" Width="300px" MaxLength="100"></asp:TextBox>
            <br />

            <asp:Label ID="LabelMevcutSifre" runat="server" Font-Size="Medium" Text="Mevcut &#350;ifre: "></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxMevcutSifre" runat="server" BorderColor="Black" Font-Size="Medium" TextMode="Password" Width="300px" MaxLength="8"></asp:TextBox>
            <br />

            <asp:Label ID="LabelYeniSifre" runat="server" Font-Size="Medium" Text="Yeni &#350;ifre: "></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxYeniSifre" runat="server" BorderColor="Black" TextMode="Password" Font-Size="Medium" Width="300px" MaxLength="8"></asp:TextBox>
            <br />
            <asp:Label ID="LabelSifreTekrar" runat="server" Text="Yeni &#350;ifre Tekrar: " Font-Size="Medium"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxSifreTekrar" runat="server" BorderColor="Black" TextMode="Password" Font-Size="Medium" Width="300px" MaxLength="8"></asp:TextBox>
            <br />

            <br />
            <asp:Button ID="ButtonSifreDegistir" BorderColor="Black" runat="server" Text="&#350;ifre De&#287;i&#351;tir" OnClick="ButtonSifreDegistir_Click" Font-Size="Medium" ForeColor="Black" Width="305px" Height="30px" />
            <br />
            <asp:Label ID="LabelDurum" runat="server" Width="300px" Text="" Font-Size="Medium"></asp:Label>

        </div>
    </asp:Panel>
    <br />
    <div style="height: 25px; background-color: #E5E5E5; font-weight: bolder; color: #88ac0b; font-size: medium">

        <asp:Button ID="ButtonYazarAc" Font-Size="Medium" runat="server" Text="+" Width="33px" ForeColor="Black" OnClick="ButtonYazarAc_Click" />
        &nbsp;
        <asp:Button ID="ButtonYazarKapat" Font-Size="Medium" runat="server" Text="-" Width="33px" ForeColor="Black" OnClick="ButtonYazarKapat_Click" />
        &nbsp;
   &#128104;&#8205;&#128187; Yazarlar -
        <asp:Label ID="lblToplamYazarSayisi" runat="server" Text=""></asp:Label>
    </div>
    <asp:Panel ID="PanelYazar" runat="server" Visible="False" Height="197px">
        <br />
        <div style="width: 335px; height: 172px; margin: auto">
            <asp:Label ID="LabelMailAdres" runat="server" Text="Mail Adresi: " Font-Size="Medium"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxYazarMail" runat="server" BorderColor="Black" Font-Size="Medium" Width="300px" MaxLength="100"></asp:TextBox>
            <br />
            <asp:Label ID="LabelSifre" runat="server" Text="&#350;ifre: " Font-Size="Medium"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxYazarSifre" BorderColor="Black" runat="server" Font-Size="Medium" Width="300px" MaxLength="8" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Label ID="LabelYetki" runat="server" Text="Yetki: " Font-Size="Medium"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownListYazarYetki" Font-Size="Medium" Width="305" runat="server">
                <asp:ListItem Value="2">Yazar</asp:ListItem>
                <asp:ListItem>Admin</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="ButtonYazarEkle" BorderColor="Black" Font-Size="Medium" runat="server" Text="Yazar Ekle" ForeColor="Black" Width="305px" Height="30px" OnClick="ButtonYazarEkle_Click" />
        </div>
    </asp:Panel>
    <br />
    <div style="height: 25px; background-color: #E5E5E5; font-weight: bolder; color: #88ac0b; font-size: medium">

        <asp:Button ID="btnUyePanelAc" runat="server" Font-Size="Medium" Text="+" Width="33px" ForeColor="Black" OnClick="btnUyePanelAc_Click" />
        &nbsp;
        <asp:Button ID="btnUyePanelKapat" Font-Size="Medium" runat="server" Text="-" Width="33px" ForeColor="Black" OnClick="btnUyePanelKapat_Click" />
        &nbsp;
       🙋 Üyeler -
        <asp:Label ID="lblToplamUyeSayisi" runat="server" Text=""></asp:Label>
    </div>
    <asp:Panel ID="PanelUyeler" runat="server" Visible="false">
        <br />
        <asp:Repeater ID="rpt_uyelerim" runat="server" OnItemCommand="rpt_uyelerim_ItemCommand">
            <ItemTemplate>
                <b>Tarih:</b>
                <%# Eval("uyelikTarihi") %>
                <br />

                <b>Ad:</b>
                <%# Eval("uyeAd") %>
                <br />

                <b>Soyad:</b>
                <%# Eval("uyeSoyad") %>
                <br />

                <b>E-Mail:</b>
                <%# Eval("uyeMail") %>
                <br />

                <b>&#350;ifre:</b>
                <%# Eval("uyeSifre") %>
                <br />

                <span style=" font-size:medium"> <b>Üyelik Durumu:</b>
               <%# Eval("uyelikAktifEt")%></span>
         
                <br />
                <br />
                <asp:Button ID="btnUyelikAktifEt" CommandName="update" Width="220px" Font-Size="Medium" CommandArgument=' <%# Eval("uyeOlId") %>' runat="server" Text="Üyelik Durumunu Değiştir" />
                <br />

            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
                <br />

            </SeparatorTemplate>
        </asp:Repeater>
    </asp:Panel>
    <br />
</asp:Content>
