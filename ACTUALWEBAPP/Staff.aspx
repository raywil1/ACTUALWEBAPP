<%@ Page Title="Staff" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="ACTUALWEBAPP.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Your application description page.</h3>
        <p>&nbsp;</p>
            <br />
    <asp:Label ID="Label3" runat="server" Text="User Checks:"></asp:Label>
    <br />
    <asp:Label ID="Label6" runat="server" Text="Enter in a Username and search to see if it that user exists in the XML, enter a New Password and hit edit to change the password to update them to a new password or add a user that cannot add themselves"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="UserName"></asp:Label>
    <br />
    <asp:TextBox ID="tbx_username" runat="server" placeholder="Username"></asp:TextBox>
    <br />
    <asp:Label ID="Label5" runat="server" Text="New Password"></asp:Label>
    <br />
    <asp:TextBox ID="tbx_password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
    <br />
    <asp:Button ID="btn_search" runat="server" OnClick="btn_search_Click" Text="Search" />
    <asp:Button ID="btn_edit" runat="server" OnClick="btn_edit_Click" Text="Edit" />
    <asp:Button ID="btn_addNewUser" runat="server" OnClick="btn_addNewUser_Click" Text="Add User" />    
    <br />
    <asp:Label ID="lbl_XML_output" runat="server" Text=""></asp:Label>

    </main>
</asp:Content>
