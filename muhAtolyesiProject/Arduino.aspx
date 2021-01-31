<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Arduino.aspx.cs" Inherits="muhAtolyesiProject.WebForm6" %>

<%@ Register Src="~/WUC/makaleSide.ascx" TagPrefix="uc1" TagName="makaleSide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="author" content="admin" />
    <meta name="robots" content="index, follow" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 

    <uc1:makaleSide runat="server" ID="makaleSide" />
    <asp:Label ID="lblSayfalamaArduino" runat="server" Text=""></asp:Label>
    <br />
    <br />
    <br />
    <br />

</asp:Content>