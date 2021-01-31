<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="reklamlarkapali.aspx.cs" Inherits="muhAtolyesiProject.WebForm15" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Reklamlar Kapal&#305;</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <p style="font-size: 20px; padding-left: 30px; font-weight: bold; line-height: 1.5">Neden Dpü Ceng'e Eri&#351;emiyorsunuz ?</p>
    <p style="font-size: 15px; padding-left: 30px">
        Adblocker Kulland&#305;&#287;&#305;n&#305;z için Dpü Ceng'e giri&#351; yapam&#305;yorsunuz.
       <br />
        <br />
        Mühendislik notlar&#305;n&#305;n, proje ve makalelerin devam edebilmesi için reklam kazanc&#305;na ihtiyac&#305; vard&#305;r.
    </p>
    <br />

    <p style="font-size: 20px; padding-left: 30px; color: red; font-weight: bold; line-height: 1.5">AdBlock Kapatma  </p>


    <p style="padding-left: 30px; font-size: 16px;">
        <img src="images/adblocker.jpg" width="320" height="250" />
        <br />
        <br />
        <b>1. </b>Adblock simgesine t&#305;klay&#305;n&#305;z.
        <br />
        <br />
        <b>2. </b>Ç&#305;kan menüden "Bu Sitede Duraklat" yazısına tıklayınız.
        <br />
        <br />
        <b>3. </b>Art&#305;k siteye eri&#351;im sa&#287;layabilirsiniz. Geri dön butonuna t&#305;klayabilir veya ana sayfaya geçebilirsiniz.
        <br />
        <br />
        <input id="Button1" type="button" value="Geri Dön" onclick="history.back(-1)" style="width:300px; height:30px; color:white;background-color:#649917" />
        <br />
    </p>
    <br />
    <br />
    <br />
</asp:Content>
