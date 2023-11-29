<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ACTUALWEBAPP._Default" %>
<%@ Register Src="~/CaptchaControl.ascx" TagPrefix="uc" TagName="CaptchaControl" %>
<%@ Register Src="~/WebUserControl2.ascx" TagPrefix="uc" TagName="StaffVerificationControl" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">MoveWise</h1>
            <p class="lead">This site will give memebers access to 6 different services that can help with your decision in moving to a different city/state</p>
            
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle">PLEASE CREATE AN ACCOUNT</h2>
                <p>
                    ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
                A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
                </p>
            </section>          
        </div>

        <!-- User Profile Section -->
        <div class="row">
            <section class="col-md-4" aria-labelledby="userProfileTitle">
                <h2>User Profile cookie with Captcha</h2>
                <asp:Label ID="UserNameLabel" runat="server" Text="Username: "></asp:Label>
                <asp:TextBox ID="UsernameTextBox" runat="server"></asp:TextBox>
                <br/>
                <asp:Label ID="PasswordLabel" runat="server" Text="Password: "></asp:Label>
                <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                <br/>
                <uc:CaptchaControl ID="CaptchaControl" runat="server" />
                <br/>
                <asp:Button ID="SaveProfileButton" runat="server" Text="Save Profile" OnClick="SaveProfileButton_Click" />
                <br/>
                <asp:Label ID="SavedUsernameLabel" runat="server" Text=""></asp:Label>
                <br/>
                <asp:Label ID="SavedPasswordLabel" runat="server" Text=""></asp:Label>
            </section>
        </div>

        <div class="row">
            <div class="col-md-4">
        <h2>Hashing Library (DLL)</h2>
        <p>This is a local dll library function that serves to hash / encrypt a provided password</p>
        <p>Methods: Hash(string password, string key) -> string</p>
        <div>
        <p>
            Password:&nbsp;
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;<asp:Button CssClass="btn btn-default" ID="Button3" runat="server" OnClick="Button3_Click" Text="Go" />
        </p>
        <p>
            <asp:Label ID="Label9" runat="server" Text="Encrypted Password will appear here"></asp:Label>
        </p>
        </div>
    </div>
</div>
                <br />
    <asp:Label ID="Label2" runat="server" Text="Login Page:"></asp:Label>
<br />
    <asp:Label ID="Label11" runat="server" Text="Test whether or not you are in the XML, if a password doesnt exist, search the user in the XML Manipulation and the password will appear
        You are able to change the password and validate it here"></asp:Label>
<br />
        <uc:StaffVerificationControl runat="server" ID="StaffVerificationControl" />

<br />




    <br />
    <asp:Label ID="Label3" runat="server" Text="XML Manipulation:"></asp:Label>
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
