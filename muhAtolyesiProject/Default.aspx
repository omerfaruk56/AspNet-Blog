﻿<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="muhAtolyesiProject.WebForm1" %>

<%@ Register Src="~/WUC/makaleSide.ascx" TagPrefix="uc1" TagName="makaleSide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <meta name="author" content="admin" />
    <meta name="robots" content="index, follow" />
    <meta itemprop="image" content="" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <uc1:makaleSide runat="server" ID="makaleSide" />

    <asp:Label ID="lblSayfalamaDefault" runat="server" Text=""></asp:Label>
    <br />
    <br />
    <br />
    <br />

</asp:Content>
