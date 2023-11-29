using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ACTUALWEBAPP
{
    public partial class Contact : Page
    {
        private CoordinateAndCostLivingService.Service1Client coordinateAndCostLivingService = new CoordinateAndCostLivingService.Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if UserProfile cookie exists and sets them to the label text 
            if (!IsPostBack)
            {
                HttpCookie userCookie = Request.Cookies["UserProfile"];
                if (userCookie != null)
                {
                    SavedUsernameLabel.Text = "Retrieved Username: " + userCookie["Username"];
                    SavedPasswordLabel.Text = "Retrieved Password: " + userCookie["Password"];
                }
            }
        }

        // ERICS SERVICES
        protected void Button1_Click(object sender, EventArgs e)
        {

            string city = TextBox1.Text;
            string state = TextBox2.Text;
            string country = TextBox3.Text;

            string[] output = coordinateAndCostLivingService.getCoordinates(city, state, country);

            Label1.Text = "Latitude" + output[1];
            Label8.Text = "Longitude" + output[2];
        }

        // ERICS SERVICES
        protected void Button2_Click(object sender, EventArgs e)
        {
            string city = TextBox4.Text;
            string state = TextBox5.Text;
            string country = TextBox6.Text;

            string[] output = coordinateAndCostLivingService.GetCostOfLiving(city, state, country);

            if (output.Length == 6)
            {
                Label2.Text = "Cost of Living Index: " + output[0];
                Label3.Text = "Rent Index: " + output[1];
                Label4.Text = "Cost of Living and Rent Index: " + output[2];
                Label5.Text = "Groceries Index: " + output[3];
                Label6.Text = "Restaurant Price Index: " + output[4];
                Label7.Text = "Local Purchasing Power Index: " + output[5];
            }
            else
            {
                Label2.Text = output[0];
            }

        }
        protected void LatitudeTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        protected void LongitudeTextBox_TextChanged(object sender, EventArgs e)
        {

        }
        //cookies component by rayhan and Captcha component by rayhan
        protected void SaveProfileButton_Click(object sender, EventArgs e)
        {
            // First, validate the CAPTCHA
            string inputCaptcha = ((TextBox)CaptchaControl.FindControl("CaptchaTextBox")).Text;
            string correctCaptcha = Session["CaptchaText"] as string;

            // Check if the CAPTCHA is correct
            if (inputCaptcha.Equals(correctCaptcha))
            {
                // CAPTCHA is correct, proceed with saving the profile
                HttpCookie userCookie = new HttpCookie("UserProfile");
                userCookie["Username"] = UsernameTextBox.Text;
                userCookie["Password"] = PasswordTextBox.Text;
                userCookie.Expires = DateTime.Now.AddDays(30); // Expires after 30 days
                Response.Cookies.Add(userCookie);

                // Immediately retrieve and show the saved username and password.
                SavedUsernameLabel.Text = "Saved Username: " + UsernameTextBox.Text;
                SavedPasswordLabel.Text = "Saved Password: " + PasswordTextBox.Text;
            }
            else
            {
                // CAPTCHA is not correct, set an error message
                SavedUsernameLabel.Text = "CAPTCHA is incorrect. Please try again.";
                // Ensure the password label is cleared if the CAPTCHA fails
                SavedPasswordLabel.Text = "";
            }
        }

        

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            if (double.TryParse(LatitudeTextBox.Text, out double latitude) && double.TryParse(LongitudeTextBox.Text, out double longitude))
            {
                var client = new ServiceReference1.Service1Client();
                try
                {
                    double result = client.CalculateSolarOutput(latitude, longitude);
                    ResultLabel.Text = $"Average annual kilowatt-hour at location: {result}";
                }
                catch (FaultException<string> fex)
                {
                    ResultLabel.Text = $"A service fault occurred: {fex.Detail}";
                }
                catch (Exception ex)
                {
                    ResultLabel.Text = $"An error occurred: {ex.Message}";
                }
                finally
                {
                    if (client.State == System.ServiceModel.CommunicationState.Faulted)
                        client.Abort();
                    else if (client.State == System.ServiceModel.CommunicationState.Opened)
                        client.Close();
                }
            }
            else
            {
                ResultLabel.Text = "Invalid latitude or longitude.";
            }
        }

        protected void CrimeButton_Click(object sender, EventArgs e)
        {
            string state = StateText.Text;
            if (int.TryParse(FromYearRangeTextBox.Text, out int fromYear) &&
                int.TryParse(ToYearRangeTextBox.Text, out int toYear))
            {
                var client = new ServiceReference1.Service1Client();
                try
                {
                    int totalCrimes = client.GetTotalCrimes(state, fromYear, toYear);
                    CrimeLabel.Text = "Total Crimes: " + totalCrimes;
                }
                catch (Exception ex)
                {
                    CrimeLabel.Text = "Error occurred: " + ex.Message;
                }
                finally
                {
                    if (client.State == System.ServiceModel.CommunicationState.Opened)
                        client.Close();
                }
            }
            else
            {
                CrimeLabel.Text = "Invalid year range.";
            }


        }
        protected void btn_enter_Click(object sender, EventArgs e)
        {
            //GOOD
            ForecastAndAlertService.Service1Client newService = new ForecastAndAlertService.Service1Client();
            lbl_output.Text = newService.Weather5day(tbx_zipcode.Text);

        }

        protected void btn_news_Click(object sender, EventArgs e)
        {
            //Change
            ForecastAndAlertService.Service1Client newService = new ForecastAndAlertService.Service1Client();
            string returnedAlert = newService.getWeatherAlerts(tbx_state.Text);

            if (returnedAlert.Length <= 2)
            {
                lbl_alerts.Text = "There are no headlines available.";

            }
            else
            {
                lbl_alerts.Text = returnedAlert;
            }
        }
    }
}