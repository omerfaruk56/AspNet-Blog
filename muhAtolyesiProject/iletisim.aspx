<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="iletisim.aspx.cs" Inherits="muhAtolyesiProject.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>&#304;leti&#351;im</title>
    <meta name="description" content=" Otomasyon programlar&#305; , web sayfas&#305; tasar&#305;m&#305;, arduino projeleri ve özel amaçl&#305; programlar için buradan bize ula&#351;abilirsiniz." />
    <meta name="keywords" content="ileti&#351;im,bize ula&#351;&#305;n,ileti&#351;im formu,ula&#351;&#305;m" />
    <meta name="author" content="admin" />
    <meta name="robots" content="index, follow" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <%--<asp:Panel BackColor="Blue" ID="panelIletisimBaslik" runat="server">--%>
    <h1>&#304;leti&#351;im Formu
    </h1>
    <%--</asp:Panel>--%>
    <asp:Panel ID="PanelIletisimGovde" BorderWidth="1px" BorderColor="#E9EEF1" Font-Size="Medium" BackColor="#EDFDCE" runat="server">
        <div style="padding: 10px">
            Yorum ve sorular&#305;n&#305;z&#305; bekliyoruz.
            <br />
            * zorunlu alan&#305; gösterir.
            <br />
            <br />

            <asp:Label ID="LabelAdSoyad" runat="server" Text="Ad Soyad:* "></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxAdsoyad" Font-Size="Medium" MaxLength="40" runat="server" Width="300px" BorderColor="Black"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="LabelePosta" runat="server" Text="E-posta:* "></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxEposta" Font-Size="Medium" runat="server" Width="300px" BorderColor="Black"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEposta" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" Display="Dynamic" ErrorMessage="Hatal&#305; e-posta girdiniz."></asp:RegularExpressionValidator>
            <br />
            <br />

            <asp:Label ID="LabelKonu" runat="server" Text="Konu:* "></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxKonu" Font-Size="Medium" runat="server" MaxLength="100" Width="300px" BorderColor="Black"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Labelileti" runat="server" Text="&#304;leti:* "></asp:Label>
            <textarea id="TextAreaileti" runat="server" style="width: 300px; border-color: black; font-size: medium; resize: none; height: 150px" wrap="hard" cols="20" rows="2" maxlength="1000"></textarea>
            <br />
            <asp:Label ID="LabelGuvenlikSorusu" runat="server" Text="Güvenlik Sorusu: "></asp:Label>
            <asp:TextBox ID="TextBoxGuvenlikSorusu" Font-Size="Medium" runat="server" Width="49px" MaxLength="3" BorderColor="Black"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            
            <br />
            <br />
            <asp:Button ID="ButtonMesajGonder"  CssClass="maviButon" runat="server" Text="Gönder" OnClick="ButtonMesajGonder_Click" Height="30px" Width="305px" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="LabelBilgilendirme" ForeColor="Red" runat="server" Text=""></asp:Label>
            <br />
            <br />

           
        </div>

    </asp:Panel>
    <br />
</asp:Content>