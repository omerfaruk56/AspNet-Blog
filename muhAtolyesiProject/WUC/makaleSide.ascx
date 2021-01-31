<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="makaleSide.ascx.cs" Inherits="muhAtolyesiProject.WUC.makaleSide" %>
<div class="mobilArama">
    <div class="mobilAramaUst">
        <asp:TextBox ID="TextBoxMobilAra" runat="server" placeholder="Sitede ara.." CssClass="mobilAramaTextbox" MaxLength="40" OnTextChanged="ButtonMobilAra_Click"></asp:TextBox>
        <asp:Button ID="ButtonMobilAra" runat="server" CssClass="mobilAramaButton" Text="ARA" OnClick="ButtonMobilAra_Click" />
    </div>
    <br />
    <div class="mobilAramaFiltrele" style="background-color: white; width: 350px">
        <asp:DropDownList ID="DropDownList1" Font-Size="Medium" runat="server" Width="110px" BackColor="White" Height="25px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem Value="siralamaYok">Menü</asp:ListItem>     
            <asp:ListItem Value="java.aspx">Java</asp:ListItem>
            <asp:ListItem Value="csharp.aspx">C Sharp</asp:ListItem>
            <asp:ListItem Value="arduino.aspx">Arduino</asp:ListItem>
            <asp:ListItem Value="haberler.aspx">Haberler</asp:ListItem>
            <asp:ListItem Value="/ozelders">Özel Ders</asp:ListItem>
            <asp:ListItem Value="SSS">SSS</asp:ListItem>
            <asp:ListItem Value="hakkimizda.aspx">Hakkımızda</asp:ListItem>
            <asp:ListItem Value="reklamver.aspx">Reklam Ver</asp:ListItem>
            <asp:ListItem Value="iletisim">İletişim</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList_mDetayliAra" Font-Size="Medium" runat="server" Width="120px" BackColor="White" Height="25px">
            <asp:ListItem Value="siralamaYok">Sıralama Seç</asp:ListItem>
            <asp:ListItem Value="tarihEnYeni">Tarihe Göre (En Yeni)</asp:ListItem>
            <asp:ListItem Value="tarihEnEski">Tarihe Göre (En Eski)</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList_mSiniflar" CssClass="mobilAramaSinif" Font-Size="Medium" runat="server" Width="110px" BackColor="White" Height="25px">
            <asp:ListItem Value="sinifYok">Sınıf Seç</asp:ListItem>
            <asp:ListItem Value="1">1. Sınıf</asp:ListItem>
            <asp:ListItem Value="2">2. Sınıf</asp:ListItem>
            <asp:ListItem Value="3">3. Sınıf</asp:ListItem>
            <asp:ListItem Value="4">4. Sınıf</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div style="margin-top: 10px">
        <%if ((string)Session["login"] == "admin")
            { %>
        <asp:Button ID="btnOn" runat="server" Text=" Admin Paneli" Font-Size="Large" Width="240px" BackColor="#2E91CA" ForeColor="White" OnClick="btnOn_Click" />
        &nbsp;
        <asp:Button ID="btnOff" runat="server" Text="Ç&#305;k&#305;&#351;" Font-Size="Large" BackColor="#2E91CA" ForeColor="White" Width="90px" OnClick="btnOff_Click" />
        <%} %>

        <%if ((string)Session["giris"] == "uye")
            { %>
        <center>
        <span style="font-size: medium"><b>Hoşgeldin,&nbsp;<%= (string)Session["isim"] %></b></span>
        &nbsp;
        <asp:Button ID="btnUyeCikis" runat="server" Text="Ç&#305;k&#305;&#351;" Font-Size="Large" BackColor="#2E91CA" ForeColor="White" Width="90px" OnClick="btnUyeCikis_Click"/>
      </center>
        <%} %>
    </div>
</div>

<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
    <ItemTemplate>
        <asp:Panel BackColor="Blue" ID="Panel2" runat="server">
            <a href="<%# Eval("kategori").ToString().ToLower().Replace(" ", "") %>.aspx?konu=<%# Eval("id") %>" style="text-decoration: none">
                <h1><%# Eval("baslik") %> - <%#Eval("kategori") %></h1>
                <asp:Label ID="Labelmid" Visible="false" runat="server" Text='<%# Eval("id") %>'></asp:Label><%--id ddğerini sakla--%>
            </a>
        </asp:Panel>
        <asp:Panel ID="Panel1" BorderWidth="1px" BorderColor="#E9EEF1" BackColor="#EDFDCE" runat="server">
            <br />
            <% if (Request.QueryString["konu"] == null)

                {%>

            <a href="<%# Eval("kategori").ToString().ToLower().Replace(" ", "") %>.aspx?konu=<%# Eval("id") %>" style="text-decoration: none">
                <img style="width: 130px; height: 100px; float: right; margin-left: 30px; margin-right: 10px; margin-top: 2px; border-radius: 20px; padding: 0px" src="<%# Eval("kucukResim") %>" alt="<%# Eval("baslik") %>" />
            </a>

            <%#  Eval("icerik").ToString().PadRight(100).Substring(0, 100)%> <%--eğer 140 karakterden az girilirse hata vermez !!!!--%>
            <%  }
                else
                {%>
            <%#Eval("icerik") %>
            <br />

            <br />
            <span style="font-size: 16px">&nbsp;&nbsp;Arkadaşlar, değerli <b>yorum</b>larınızı bekliyorum. 😃</span>
            <br />
            <br />
            <!-- Go to www.addthis.com/dashboard to customize your tools -->
            <div style="padding-left: 10px" class="addthis_inline_share_toolbox"></div>
            <br />
            <span style="font-size: 16px">&nbsp;&nbsp;Etiketler: <%#Eval("anahtarKelimeler")%></span>
            <br />
            <%--<div id="reklam_alani">--%>
            <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
            <!-- anaReklam -->
            <ins class="adsbygoogle"
                style="display: block"
                data-ad-client="ca-pub-9380561475079743"
                data-ad-slot="4859061001"
                data-ad-format="auto"
                data-full-width-responsive="true"></ins>
            <script>
                (adsbygoogle = window.adsbygoogle || []).push({});
            </script>
            <%--</div>--%>
            <br />
            <% }%>

            <br />
            <a href="<%# Eval("kategori").ToString().ToLower().Replace(" ", "") %>.aspx?konu=<%# Eval("id") %>">

                <asp:Label ID="Label1" Font-Size="16px" runat="server" Text="Devamını oku"></asp:Label>
            </a>

            <p class="post-footer align-right" style="background-color: #EDFDCE; font-size: 12px">
                <br />
                <asp:Label ID="Label3" runat="server" Text="👀 "></asp:Label><asp:Label ID="Label2" runat="server" Text='<%#Eval("okunmasayisi")%>'></asp:Label>
                &nbsp;|<asp:Label ID="LabelYorumSayisi" CssClass="comments" runat="server" Text=""></asp:Label>
                |<a href="<%# Eval("kategori").ToString().ToLower().Replace(" ", "")%>.aspx" class="readmore"><%# Eval("kategori") %></a>|<asp:Label CssClass="readmore" Visible="false" ID="Label4" runat="server" Text='<%#Eval("yazar")%>'></asp:Label>
                <span class="date"><%# Eval("tarih").ToString().Substring(0,10)%></span>
            </p>
        </asp:Panel>
        <br />
    </ItemTemplate>
</asp:Repeater>

<% if (Request.QueryString["konu"] != null)
    {%>


<asp:Panel BackColor="Blue" ID="Panel2" runat="server">
    <h1>
        <asp:Label ID="lblMesajGonder" runat="server" Text="Mesaj Gönder" Font-Size="Large"></asp:Label></h1>
</asp:Panel>

<asp:Panel ID="Panel1" BorderWidth="1px" BorderColor="#E9EEF1" BackColor="#EDFDCE" runat="server">

    <p style="line-height: 1.5">
        <asp:Label ID="lblAdSoyad" Font-Size="Medium" runat="server" Text="Ad Soyad: "></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxAdsoyad" Font-Size="Medium" runat="server" MaxLength="40" BorderColor="Black" ForeColor="Black" Width="315px"></asp:TextBox>
        <br />
        <asp:Label ID="lblMesaj" Font-Size="Medium" runat="server" Text="Mesaj:    "></asp:Label>
        <br />
        <textarea runat="server" id="TextAreaMesaj" wrap="hard" cols="20" rows="2" aria-multiline="True" style="resize: none; color: black; border-color: black; font-size: medium; width: 315px; height: 100px"></textarea>
        <br />
        <asp:Button ID="btnBegen" runat="server" Text="👍" Font-Size="20pt" BackColor="#EDFDCE" BorderColor="#EDFDCE" OnClick="btnBegen_Click" />
        <a href="yorumname"></a>
        <asp:Button ID="btnKalp" runat="server" Text="💖" Font-Size="20pt" BackColor="#EDFDCE" BorderColor="#EDFDCE" OnClick="Button2_Click" />
        <asp:Button ID="BtnKalpGoz" runat="server" Text="😍" Font-Size="20pt" BackColor="#EDFDCE" BorderColor="#EDFDCE" OnClick="Button3_Click" />
        <asp:Button ID="btnKahkaha" runat="server" Text="🤣" Font-Size="20pt" BackColor="#EDFDCE" BorderColor="#EDFDCE" OnClick="btnKahkaha_Click" />
        <asp:Button ID="btnSasirmis" runat="server" Text="😯" Font-Size="20pt" BackColor="#EDFDCE" BorderColor="#EDFDCE" OnClick="btnSasirmis_Click" />
        <asp:Button ID="btnAglayan" runat="server" Text="😥" Font-Size="20pt" BackColor="#EDFDCE" BorderColor="#EDFDCE" OnClick="btnAglayan_Click" />
        <asp:Button ID="btnSinirli" runat="server" Text="😡" Font-Size="20pt" BackColor="#EDFDCE" BorderColor="#EDFDCE" OnClick="btnSinirli_Click" />
        <br />
        <br />

        <asp:Label ID="LabelGuvenlikSorusu" Font-Size="Medium" runat="server" Text="Güvenlik Sorusu:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxGuvenlikSorusu" runat="server" BorderColor="Black" Font-Size="Medium" ForeColor="Black" MaxLength="3" Width="51px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
        <br />
        <br />


        <asp:Button ID="btnYorumEkle" CommandName="yorumname" runat="server" BorderColor="#2E91CA" BackColor="#2E91CA" Font-Size="Medium" ForeColor="White" OnClick="btnYorumEkle_Click" Width="320px" Font-Names="Trebuchet MS" Text="Yorum Yap" Font-Bold="true" UseSubmitBehavior="false" Height="35px" />
        <br />
        <asp:Label ID="LabelYorumDurum" Font-Size="Medium" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
    </p>
</asp:Panel>
<br />
<h1>
    <asp:Label ID="lblYorumlar" runat="server" Text="Yorumlar" Font-Size="Large"></asp:Label></h1>
<%}%>
<br />
<asp:Label ID="lblIlkYorumuYapin" Font-Size="Medium" runat="server" Text="Henüz yorum yapılmamış ilk yorumu siz yapabilirsiniz."></asp:Label>
<asp:Repeater ID="rpt_yorumlar" runat="server">
    <ItemTemplate>
        <p style="font-size: 15px; text-align: left; line-height: 1.5">
            <%--yorumları sola yasla --%>
            <b><%# Eval("adSoyad")%></b>, Tarih: <%# Eval("tarih") %><br />
            <%# Eval ("yorum") %>
        </p>
    </ItemTemplate>
    <SeparatorTemplate>
        <hr />
        <br />
    </SeparatorTemplate>
</asp:Repeater>
