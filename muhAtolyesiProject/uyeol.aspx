<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="uyeol.aspx.cs" Inherits="muhAtolyesiProject.WebForm13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Üye Ol</title>
    <meta name="description" content="üyelik olu&#351;turarak tüm notlara ve sorulara eri&#351;ebilir ayr&#305;ca projeler indirip çal&#305;&#351;malar yapabilirsiniz." />
    <meta name="keywords" content="uye,member,üyeol,ol,kay&#305;t,uyelik" />
    <meta name="author" content="admin" />
    <meta name="robots" content="index, follow" />

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Üye Ol</h1>

    <asp:Panel ID="PanelIletisimGovde" BorderWidth="1px" BorderColor="#E9EEF1" Font-Size="Medium" BackColor="#EDFDCE" runat="server">
        <div style="padding: 10px">
             Detaylı bilgi için <a href="SSS">SSS </a>(S&#305;kça Sorulan Sorular ?) tıklayınız.
            <br />
            <br />
            <asp:Label ID="lblUyeAd" runat="server" Text="Ad: "></asp:Label>
            <br />
            <asp:TextBox ID="txtUyeAd" Font-Size="Medium" MaxLength="25" runat="server" Width="300px" BorderColor="Black"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblUyeSoyad" runat="server" Text="Soyad: "></asp:Label>
            <br />
            <asp:TextBox ID="txtUyeSoyad" Font-Size="Medium" MaxLength="25" runat="server" Width="300px" BorderColor="Black"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblUyeMail" runat="server" Text="E-posta: "></asp:Label>
            <br />
            <asp:TextBox ID="txtUyeMail" Font-Size="Medium" runat="server" Width="300px" BorderColor="Black"></asp:TextBox>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUyeMail" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" Display="Dynamic" ErrorMessage="Hatal&#305; e-posta girdiniz."></asp:RegularExpressionValidator>
            <br />
            <br />

            <asp:Label ID="lblUyeSifre" runat="server" Text="&#350;ifre: (6 haneli bir &#351;ifre belirleyiniz) "></asp:Label>
            <br />
            <asp:TextBox ID="txtUyeSifre" Font-Size="Medium" runat="server" MaxLength="6" Width="300px" BorderColor="Black" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblUyeSifreTekrar" runat="server" Text="&#350;ifre Tekrar: "></asp:Label>
            <br />
            <asp:TextBox ID="txtUyeSifreTekrar" Font-Size="Medium" runat="server" MaxLength="6" Width="300px" BorderColor="Black" TextMode="Password" OnTextChanged="txtUyeSifreTekrar_TextChanged"></asp:TextBox>
            <asp:Label ID="lblSifreDurum" runat="server"></asp:Label>
            <br />

          

            <br />
            <asp:Label ID="LabelGuvenlikSorusu" runat="server" Text="Güvenlik Sorusu: "></asp:Label>
            <asp:TextBox ID="TextBoxGuvenlikSorusu" Font-Size="Medium" runat="server" Width="49px" MaxLength="3" BorderColor="Black"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            
            <br />

            <br />
            <asp:Button ID="btnUyelikOlustur" CssClass="maviButon" runat="server" Text="Üyelik Olu&#351;tur" Height="30px" Width="305px" OnClick="btnUyelikOlustur_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="LabelBilgilendirme" ForeColor="Red" runat="server" Text=""></asp:Label>
            <br />
            <br />
        </div>
    </asp:Panel>
    <br />
</asp:Content>
