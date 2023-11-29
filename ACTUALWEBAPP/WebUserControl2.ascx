<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl2.ascx.cs" Inherits="ACTUALWEBAPP.WebUserControl2" %>
<asp:Panel ID="pnlStaffVerification" runat="server">
    <div>
        <label for="txtStaffUsername">Username:</label>
        <asp:TextBox ID="txtStaffUsername" runat="server" />
    </div>
    <div>
        <label for="txtStaffPassword">Password:</label>
        <asp:TextBox ID="txtStaffPassword" TextMode="Password" runat="server" />
    </div>
    <div>
        <asp:Button ID="btnVerifyStaffCredentials" Text="Verify Credentials" OnClick="btnVerifyStaffCredentials_Click" runat="server" />
    </div>
    <div>
        <asp:Label ID="lblVerificationStatus" runat="server" Text="" Visible="false" />
    </div>
</asp:Panel>