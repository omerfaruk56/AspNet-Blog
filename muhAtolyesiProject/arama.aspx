<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="arama.aspx.cs" Inherits="muhAtolyesiProject.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="mobilArama">
        <div class="mobilAramaUst">
            <asp:TextBox ID="txtMobilAra" runat="server" placeholder="Sitede ara.." CssClass="mobilAramaTextbox" MaxLength="40" OnTextChanged="btnMobilAra_Click"></asp:TextBox>
            <asp:Button ID="btnMobilAra" runat="server" CssClass="mobilAramaButton" Text="ARA" OnClick="btnMobilAra_Click" />
        </div>
        <br />
        <div class="mobilAramaFiltrele" style="background-color: white; width: 350px">
            <asp:DropDownList ID="DropDownList1" Font-Size="Medium" runat="server" Width="110px" BackColor="White" Height="25px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="siralamaYok">Menü</asp:ListItem>
                <asp:ListItem Value="http://www.dpuceng.com/dersnotu.aspx">Ders Notu</asp:ListItem>
                <asp:ListItem Value="http://www.dpuceng.com/java.aspx">Java</asp:ListItem>
                <asp:ListItem Value="http://www.dpuceng.com/csharp.aspx">C Sharp</asp:ListItem>
                <asp:ListItem Value="http://www.dpuceng.com/arduino.aspx">Arduino</asp:ListItem>
                <asp:ListItem Value="http://www.dpuceng.com/haberler.aspx">Haberler</asp:ListItem>
                <asp:ListItem Value="http://www.dpuceng.com/haberler.aspx?konu=235">Özel Ders</asp:ListItem>
                <asp:ListItem Value="http://www.dpuceng.com/hakkimizda">Hakk&#305;m&#305;zda</asp:ListItem>
                <asp:ListItem Value="http://www.dpuceng.com/reklamver">Reklam Ver</asp:ListItem>
                <asp:ListItem Value="http://www.dpuceng.com/iletisim">&#304;leti&#351;im</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList_m2DetayliAra" Font-Size="Medium" runat="server" Height="25px" Width="120px" BackColor="White">
                <asp:ListItem Value="siralamaYok">S&#305;ralama Seç</asp:ListItem>
                <asp:ListItem Value="tarihEnYeni">Tarihe Göre (En Yeni)</asp:ListItem>
                <asp:ListItem Value="tarihEnEski">Tarihe Göre (En Eski)</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList_m2Siniflar" CssClass="mobilAramaSinif" Font-Size="Medium" runat="server" Height="25px" Width="110px" BackColor="White">
                <asp:ListItem Value="sinifYok">S&#305;n&#305;f Seç</asp:ListItem>
                <asp:ListItem Value="1">1. S&#305;n&#305;f</asp:ListItem>
                <asp:ListItem Value="2">2. S&#305;n&#305;f</asp:ListItem>
                <asp:ListItem Value="3.">3. S&#305;n&#305;f</asp:ListItem>
                <asp:ListItem Value="4">4. S&#305;n&#305;f</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <asp:Panel BackColor="Blue" ID="Panel2" runat="server">
        <h1>Arama Sonuçlar&#305; - <%= Request.QueryString["gelen"] %> / S&#305;n&#305;f: <%= Request.QueryString["sinif"] %> / S&#305;ralama: <%= Request.QueryString["detayliArama"] %></h1>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel1" BorderWidth="0px" BackColor="#FFFFFF" runat="server">
        <asp:Label ID="lblSonucSayisi" runat="server" Font-Size="Medium" Text=""></asp:Label>
        <asp:Repeater ID="rpt_arama" runat="server">
            <HeaderTemplate>
                <ol>
            </HeaderTemplate>
            <ItemTemplate>
                <li style="font-size: 19px"><a href="<%# Eval("kategori").ToString().Trim().Replace(" ",string.Empty)%>.aspx?konu=<%# Eval("id") %>"><%# Eval("baslik")%></a></li>
                <span style="font-size: 15px"><%# Eval("aciklama")%> </span>
                <br />
            </ItemTemplate>
            <FooterTemplate>
                </ol>
            </FooterTemplate>
            <SeparatorTemplate>
                <br />
            </SeparatorTemplate>
        </asp:Repeater>
    </asp:Panel>
    <br />
    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <!-- SearchPageReklam -->
    <ins class="adsbygoogle"
        style="display: inline-block; width: 320px; height: 320px"
        data-ad-client="ca-pub-9380561475079743"
        data-ad-slot="3452359693"></ins>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
    </script>

</asp:Content>
