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
            </section>          
        </div>

        <!-- User Profile Section -->
        <div class="row">
            <section class="col-md-4" aria-labelledby="userProfileTitle">
                <h2>Create a Member account which will be saved using cookies</h2>
                <asp:Label ID="UserNameLabel" runat="server" Text="Username: "></asp:Label>
                <asp:TextBox ID="UsernameTextBox" runat="server"></asp:TextBox>
                <br/>
                <asp:Label ID="PasswordLabel" runat="server" Text="Password: "></asp:Label>
                <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                <br/>
                <uc:CaptchaControl ID="CaptchaControl" runat="server" />
                <br/>
                <asp:Button ID="SaveProfileButton" runat="server" Text="Create account" OnClick="SaveProfileButton_Click" />
                <br/>
                <asp:Label ID="SavedUsernameLabel" runat="server" Text=""></asp:Label>
                <br/>
                <asp:Label ID="SavedPasswordLabel" runat="server" Text=""></asp:Label>
            </section>

        



        <p>The application is deployed at <a href="http://webstrar48/fulton.asu.edu/page2/Default.aspx">http://webstrar48/fulton.asu.edu/page2/Default.aspx</a> </p>
    <p>Percentage of Contribution: Eric Yan: 33%, Rayhan Wilangkara: 33%, Miles Koehnemann: 33%</p>
    <h2>Service Directory</h2>
    <asp:Table ID="Table1" runat="server" Width="1044px">
        
        <asp:TableRow>
            <asp:TableHeaderCell>Name</asp:TableHeaderCell>
            <asp:TableHeaderCell>Page and Component Type</asp:TableHeaderCell>
            <asp:TableHeaderCell>Component Description</asp:TableHeaderCell>
            <asp:TableHeaderCell>Resources and Implementation Details</asp:TableHeaderCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Eric Yan</asp:TableCell>
            <asp:TableCell>SVC Service (Coordinates Service)</asp:TableCell>
            <asp:TableCell>
                This service will take in a city, country, and optional state as string and return the latitude and longitude coordinates of that location
                Input: String (city, country, state)
                Output : String
            </asp:TableCell>
            <asp:TableCell>Geocoding API, REST API calls</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Eric Yan</asp:TableCell>
            <asp:TableCell>SVC Service (Cost of Living Service)</asp:TableCell>
            <asp:TableCell>
                This service will take in a city, country, and optional state as strings and return common cost of living indices for that location
                Input: String (city, country, state)
                Output: String
            </asp:TableCell>
            <asp:TableCell>Cost of living dataset, derived from Numbeo and extracted/processed to hash table</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Eric Yan</asp:TableCell>
            <asp:TableCell>DLL Hashing Class</asp:TableCell>
            <asp:TableCell>
                DLL Library function takes in a string password as well as a standardized key (salt) to encrypt a password
                Input: String
                Output: String
            </asp:TableCell>
            <asp:TableCell>Library class and local component implemented as a DLL to hash / encrypt passwords</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Eric Yan</asp:TableCell>
            <asp:TableCell>Global.asax Event Handler (XML Loading), Default landing page</asp:TableCell>
            <asp:TableCell>Default landing page for application and links, load xml on startup</asp:TableCell>
            <asp:TableCell>ASPX GUI design, Global.asax startup event handler for xml loading</asp:TableCell>
        </asp:TableRow>


        <asp:TableRow>
            <asp:TableCell>Rayhan Wilangkara</asp:TableCell>
            <asp:TableCell>SVC Crime Service</asp:TableCell>
            <asp:TableCell>
                This service takes a state abbreviation as string and and year range as ints and then outputs an int of total crimes in that state.
            </asp:TableCell>
            <asp:TableCell>WCF Service Calls, federal bureau cde.ucr.cjis.gov api</asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>Rayhan Wilangkara</asp:TableCell>
            <asp:TableCell>User control</asp:TableCell>
            <asp:TableCell>
                Image captcha authentication
            </asp:TableCell>
            <asp:TableCell>Member.aspx Page, image captcha enter in the numbers in the image.
Button handler for user control and CaptchaControl.ascx
</asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>Rayhan Wilangkara</asp:TableCell>
            <asp:TableCell>Cookies</asp:TableCell>
            <asp:TableCell>
                Store user ID/Password
            </asp:TableCell>
            <asp:TableCell>Member.aspx Page, UserProfile cookie that stays even after refresh of page</asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>Rayhan Wilangkara</asp:TableCell>
            <asp:TableCell>SVC Solar Intensity Service</asp:TableCell>
            <asp:TableCell>
                Service takes lat long values and returns a double value that represents the annual kilowatt-hour at a location
            </asp:TableCell>
            <asp:TableCell>WCF Service Calls, PVWatts V8 API</asp:TableCell>
        </asp:TableRow>


        <asp:TableRow>
            <asp:TableCell>Miles Koehnemann</asp:TableCell>
            <asp:TableCell>User Control: Login Window</asp:TableCell>
            <asp:TableCell>
                Takes a Username and a Password, checks to see if its correct in the XML “Member.xml”
            </asp:TableCell>
            <asp:TableCell>WebUserControl2.ascx
(.cs portion has the logic)
Parses the XML and compares to user input</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Miles Koehnemann</asp:TableCell>
            <asp:TableCell>XML Manipulation</asp:TableCell>
            <asp:TableCell>
                Takes a Username and returns if its in the XML or not, OR it takes a Username and Password and update the XML so that the password is the one entered
            </asp:TableCell>
            <asp:TableCell>
                Default.aspx.
(.cs portion has the logic)
Parses the XML and compares to user input
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Miles Koehnemann</asp:TableCell>
            <asp:TableCell>Forecast Service</asp:TableCell>
            <asp:TableCell>
                Enter in the zipcode and get a 5 day weather forecast
            </asp:TableCell>
            <asp:TableCell>WCF Service
                        Calls weather.gov API
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Miles Koehnemann</asp:TableCell>
            <asp:TableCell>Weather Alert Service</asp:TableCell>
            <asp:TableCell>
                Enter in a capitalized state abbreviation (AZ) and get a list of weather alerts for that state
            </asp:TableCell>
            <asp:TableCell>WCF Service
                    Calls NWS API
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <div class="row">
        <div class="col-md-4">
            <h2>Eric Yan</h2>
            <p>Link to TryIt Page: <a href="http://webstrar48.fulton.asu.edu/page1/">http://webstrar48.fulton.asu.edu/page1/</a> </p>
        </div>
    </div>
        <div class="row">
        <div class="col-md-4">
            <h2>Rayhan Wilangkara</h2>
            <p>Link to TryIt Page: <a href="http://webstrar48.fulton.asu.edu/page6/Member.aspx">http://webstrar48.fulton.asu.edu/page6/Member.aspx</a> </p>
        </div>
    </div>
        <div class="row">
        <div class="col-md-4">
            <h2>Miles Koehnemann</h2>
            <p>Link to TryIt Page: 
            <a href="http://webstrar48.fulton.asu.edu/page7/Default.aspx">http://webstrar48.fulton.asu.edu/page7/Default.aspx</a> 
            </p>
        </div>
    </div>


                
    </main>

</asp:Content>
