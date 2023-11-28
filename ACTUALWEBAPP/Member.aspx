<%@ Page Title="Member" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="ACTUALWEBAPP.Contact" %>
<%@ Register Src="~/CaptchaControl.ascx" TagPrefix="uc" TagName="CaptchaControl" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>   
        <!-- Solar Intensity Service Section from project 3 -->
        <div class="row">
            <section class="col-md-4" aria-labelledby="solarIntensityTitle">
                <h2>Solar Intensity Service</h2>
                <p>This service provides the solar intensity at a given latitude and longitude.</p>
                <p><b>URL:</b> http://webstrar48.fulton.asu.edu/page3/Service1.svc</p>
                <p><b>Method:</b> GetSolarIntensity (double latitude, double longitude) -> string</p>
                <asp:Label ID="Label1" runat="server" Text="Latitude: "></asp:Label>
                <asp:TextBox ID="LatitudeTextBox" runat="server"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text="Longitude: "></asp:Label>
                <asp:TextBox ID="LongitudeTextBox" runat="server"></asp:TextBox>
                <asp:Button ID="SubmitButton" runat="server" Text="Get Solar Intensity" OnClick="SubmitButton_Click" Width="174px" />
                <asp:Label ID="ResultLabel" runat="server" Text=""></asp:Label>
            </section>
        </div>
        
        <!-- Crime Data Service Section from project 3-->
        <div class="row">
            <section class="col-md-4" aria-labelledby="crimeDataTitle">
                <h2>Crime Data Service</h2>
                <p>This service provides crime data for a given state abbreviation and year range.</p>
                <p><b>URL:</b> http://webstrar48.fulton.asu.edu/page3/Service1.svc</p>
                <p><b>Method:</b> GetTotalCrimes (string stateAbbreviation, int fromYear, int toYear) -> string</p>
                <asp:Label ID="Label3" runat="server" Text="State abbreviation: "></asp:Label>
                <asp:TextBox ID="StateText" runat="server"></asp:TextBox>
                <asp:Label ID="Label4" runat="server" Text="Year Range: "></asp:Label>
                <asp:TextBox ID="FromYearRangeTextBox" runat="server"></asp:TextBox>
                <asp:Label ID="Label5" runat="server" Text="to"></asp:Label>
                <asp:TextBox ID="ToYearRangeTextBox" runat="server"></asp:TextBox>
                <asp:Button ID="CrimeButton" runat="server" OnClick="CrimeButton_Click" Text="Get Crime Data" Width="159px" />
                <asp:Label ID="CrimeLabel" runat="server" Text=""></asp:Label>
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

   <%--  this section was fron Project 3   <!-- Food Recommendations Section -->
        <div class="row">
            <section class="col-md-4" aria-labelledby="foodRecTitle">
                <h2 id="foodRecTitle">Food Recommendations</h2>
                <p>Enter a city to get food recommendations. URl:http://webstrar48.fulton.asu.edu/page4/Service1.svc</p>
                <asp:TextBox ID="txtCity" runat="server" Placeholder="Enter City"></asp:TextBox>
                <asp:Button ID="btnGetRecommendations" runat="server" Text="Get Recommendations" OnClick="btnGetRecommendations_Click" />
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </section>
        </div>

        <!--this section was from project 3 Local Events Recommendations Section -->
        <div class="row">
            <section class="col-md-4" aria-labelledby="eventsTitle">
                <h2 id="eventsTitle">Local Events Recommendations</h2>
                <p>Enter a city. URL:http://webstrar48.fulton.asu.edu/page4/Service1.svc</p>
                <asp:TextBox ID="txtCityForEvents" runat="server" Placeholder="Enter City"></asp:TextBox>
                <asp:Button ID="btnGetEvents" runat="server" Text="Get Events" OnClick="btnGetEvents_Click" />
                <asp:Label ID="lblEventsResult" runat="server"></asp:Label>
            </section>
        </div>--%>
    </main>
</asp:Content>