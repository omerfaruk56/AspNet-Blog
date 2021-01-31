<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="girisyap.aspx.cs" Inherits="muhAtolyesiProject.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Üye Girişi</title>
    <meta name="description" content="dpü ceng üyelik girişi" />
    <meta name="keywords" content="giris,uyelik" />
    <meta name="author" content="admin" />
    <meta name="robots" content="index, follow" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="padding-left: 35px; line-height:1.4">
        <br />
        <br />
        <asp:Label ID="lblEmailAdresi" runat="server" Font-Size="Medium" Text="E-Mail Adresi: "></asp:Label>
        <br />
        <asp:TextBox ID="txtEmailAdresi" Font-Size="Medium" BorderColor="Black" runat="server" Width="300px" MaxLength="100"></asp:TextBox>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Hatal&#305; e-posta girdiniz." ControlToValidate="txtEmailAdresi" Display="Dynamic" Font-Size="Small" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
         <br />
        <asp:Label ID="lblSifre" Font-Size="Medium" runat="server" Text="&#350;ifre: "></asp:Label>
        <br />
        <asp:TextBox ID="txtSifre" Font-Size="Medium" runat="server" BorderColor="Black" TextMode="Password" Width="300px" MaxLength="6"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnGirisYap" CssClass="maviButon" runat="server" Text="Giri&#351;"  Width="305px" Height="30" OnClick="btnGirisYap_Click" />
        <br />
        <br />
        <asp:Label ID="lblUyari" Font-Size="Medium" runat="server" Text=""></asp:Label>
        <br />
        <br />

    </div>

</asp:Content>
