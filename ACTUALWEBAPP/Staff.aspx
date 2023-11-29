<%@ Page Title="Staff" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="ACTUALWEBAPP.About" %>
<%@ Register Src="~/WebUserControl2.ascx" TagPrefix="uc" TagName="StaffVerificationControl" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
                        <br />
    <asp:Label ID="Label2" runat="server" Text="STAFF LOGIN:"></asp:Label>
<br />
    <asp:Label ID="Label11" runat="server" Text="Search for staff member usernames below to find the staff login password associated to a staff member. then use this to login thank you."></asp:Label>
<br />
        <uc:StaffVerificationControl runat="server" ID="StaffVerificationControl" />

<br />

    <br />
    <asp:Label ID="Label3" runat="server" Text="XML Manipulation: Try TA in username and see password thats associated with it."></asp:Label>
    <br />
    <asp:Label ID="Label6" runat="server" Text="Enter in a Username and search to see if it exists in the XML, enter a New Password and hit edit to change the password to the new password"></asp:Label>
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
    <br />
    </main>
</asp:Content>
