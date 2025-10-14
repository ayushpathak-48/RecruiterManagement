<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RecruiterManagement._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>Name: 
        <%= Session["name"] %>
    </div>
    <div>Email: 
    <%= Session["email"] %>
</div>
    <div>Role: 
    <%= Session["role"] %>
</div>
</asp:Content>
