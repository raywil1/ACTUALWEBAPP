<%@ Page Title="Member" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="ACTUALWEBAPP.Contact" %>
<%@ Register Src="~/CaptchaControl.ascx" TagPrefix="uc" TagName="CaptchaControl" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>   

        <!-- RAYHAN SERVICES -->
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

   



         <!--ERIC'S SERVICES -->
        <div class="row">
        <div class="col-md-4">
            <h2>Latitude and Longitude</h2>
            <p>Latitude and Longitude Service will take in a location (city, state, country) and return the latitude and longitude of that location. State may be optional depending on location (outside of the United States).</p>
            <p>Methods: GetLatitudeLongitude(string city, string state, string country) -&gt; string[]</p>
            <p>url : localhost</p>
            <div>
                <h3>Enter City</h3>
                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                <h3>Enter State</h3>
                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server"></asp:TextBox>
                <h3>Enter Country</h3>
                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server"></asp:TextBox>
                <br />
                <asp:Button CssClass="btn btn-default" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Latitude: "></asp:Label>
                <br />
                <asp:Label ID="Label8" runat="server" Text="Longitude: "></asp:Label>
            </div>
        </div>
        <div class="col-md-4">
            <h2>Cost of Living</h2>
            <p>Cost of living service will take location as input and return the cost of living indices of that location. Data is parsed from a csv file and returned here. State may be optional depending on location.</p>
            <p>Methods: GetCostOfLiving(string city, string state, string country) -&gt; string[]</p>
            <p>url : localhost</p>
            <p>
                NOTE: Please use full country name format e.g.
            </p>
            <p>
                Boston, MA, United States</p>
            <p>
                Hamilton, Bermuda (if no State)</p>
            <div>
                <h3>Enter City</h3>
                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>
                <h3>Enter State (optional)</h3>
                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server"></asp:TextBox>
                <h3>Enter Country</h3>
                <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server"></asp:TextBox>
                <br />
                <asp:Button CssClass="btn btn-default" ID="Button2" runat="server" OnClick="Button2_Click" Text="Go" />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Cost of Living Index: "></asp:Label>
                <br />
                <asp:Label ID="Label9" runat="server" Text="Rent Index: "></asp:Label>
                <br />
                <asp:Label ID="Label10" runat="server" Text="Cost of Living and Rent Index: "></asp:Label>
                <br />
                <asp:Label ID="Label11" runat="server" Text="Groceries Index: "></asp:Label>
                <br />
                <asp:Label ID="Label12" runat="server" Text="Restaurant Price Index: "></asp:Label>
                <br />
                <asp:Label ID="Label13" runat="server" Text="Local Purchasing Power Index: "></asp:Label>
                <br />
            </div>     
    </div>
            <!--Miles'S SERVICES -->

                <span style="color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration: underline; display: inline !important; float: none;">Forecast Service:</span><br />
    <span style="color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">url:<span>&nbsp;</span></span><a href="http://webstrar48.fulton.asu.edu/page9/Service1.svc" style="box-sizing: border-box; color: var(--bs-link-color); text-decoration: underline; font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255);">http://webstrar48.fulton.asu.edu/page9/Service1.svc</a><br style="box-sizing: border-box; color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" />
    <span style="color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Returns a 5 day weather forecast of a given zipcode, some newer zipcodes may not be on it</span><br />
    <span style="color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
    <br />
    &lt;enter a zipcode&gt;</span><br />
    <asp:TextBox ID="tbx_zipcode" runat="server">zipcode</asp:TextBox>
    <asp:Button ID="btn_enter" runat="server" OnClick="btn_enter_Click" Text="Weather Forecast" Height="33px" Width="150px" />
    <br />
    <br />
    <asp:Label ID="lbl_output" runat="server" Text="output"></asp:Label>
    <br />
    <br />
    <br />
    <span class="text-decoration-underline" style="box-sizing: border-box; text-decoration-line: underline !important; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255);">Alert Service:</span><br style="box-sizing: border-box; color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" />
    <span style="color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">url:<span>&nbsp;</span></span><a href="http://webstrar48.fulton.asu.edu/page9/Service1.svc" style="box-sizing: border-box; color: var(--bs-link-color); text-decoration: underline; font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255);">http://webstrar48.fulton.asu.edu/page9/Service1.svc</a><br style="box-sizing: border-box; color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" />
    <span style="color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Returns any weather alerts about a given state, if none, there is no output</span><br style="box-sizing: border-box; color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" />
    <br style="box-sizing: border-box; color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" />
    <span style="color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&lt;use state abreviations ie. AZ for Arizona, or FL for Florida&gt;</span><br />
    <asp:TextBox ID="tbx_state" runat="server" Width="123px">state</asp:TextBox>
  
    <asp:Button ID="btn_news" runat="server" OnClick="btn_news_Click" Text="Weather Alerts" Height="34px" Width="125px" />
<br />
    <br />
    <asp:Label ID="lbl_alerts" runat="server" Text="alerts"></asp:Label>
<br />
<br />

    </main>
    </div>
</asp:Content>