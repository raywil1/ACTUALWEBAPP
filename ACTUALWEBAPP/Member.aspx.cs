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
    }
}