<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="muhAtolyesiProject.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Giri&#351; Sayfas&#305;</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left: 35px; line-height:1.4">
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="Kullan&#305;c&#305; Ad&#305;: "></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" Font-Size="Medium" BorderColor="Black" runat="server" Width="300px" MaxLength="100"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" Font-Size="Medium" runat="server" Text="&#350;ifre: "></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" Font-Size="Medium" runat="server" BorderColor="Black" TextMode="Password" Width="300px" MaxLength="8"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" CssClass="maviButon" runat="server" Text="Giri&#351;" OnClick="Button1_Click" Width="305px" Height="30" />
        <br />
        <br />
        <asp:Label ID="Label3" Font-Size="Medium" runat="server" Text=""></asp:Label>
        <br />
        <br />

    </div>
</asp:Content>
