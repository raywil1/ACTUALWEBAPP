using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using HashLib;

namespace ACTUALWEBAPP
{
    public partial class _Default : Page
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

                // Redirect to Member.aspx page
                Response.Redirect("Member.aspx");
            }
            else
            {
                // CAPTCHA is not correct, set an error message
                SavedUsernameLabel.Text = "CAPTCHA is incorrect. Please try again.";
                // Ensure the password label is cleared if the CAPTCHA fails
                SavedPasswordLabel.Text = "";
            }
        }

        
    }
}


