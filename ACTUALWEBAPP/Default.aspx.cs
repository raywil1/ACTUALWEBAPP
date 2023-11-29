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

        protected void Button3_Click(object sender, EventArgs e)
        {
            string password = TextBox7.Text; // plaintext

            string decryptKey = "keyPass"; // password for encryption (salt) - should change per user

            string encrypted = HashLib.PasswordEncryption.Hash(password, decryptKey);
            Label9.Text = HashLib.PasswordEncryption.Hash(password, decryptKey);
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
            }
            else
            {
                // CAPTCHA is not correct, set an error message
                SavedUsernameLabel.Text = "CAPTCHA is incorrect. Please try again.";
                // Ensure the password label is cleared if the CAPTCHA fails
                SavedPasswordLabel.Text = "";
            }
        }

        protected void btn_edit_Click(object sender, EventArgs e)
        {
            string usernameToEdit = tbx_username.Text.Trim();
            string newPassword = tbx_password.Text.Trim();

            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("Member.xml"));

            XmlNode memberNode = xmlDoc.SelectSingleNode("/Members/Member[Name='" + usernameToEdit + "']");

            if (memberNode != null)
            {
                XmlNode passwordNode = memberNode.SelectSingleNode("Password");
                passwordNode.InnerText = newPassword;

                xmlDoc.Save(Server.MapPath("Member.xml"));
                lbl_XML_output.Text = "Password updated successfully.";
            }
            else
            {
                lbl_XML_output.Text = "Member not found.";
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            string usernameToSearch = tbx_username.Text.Trim();
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("Member.xml"));

            XmlNodeList members = xmlDoc.SelectNodes("/Members/Member[Name='" + usernameToSearch + "']");

            if (members.Count > 0)
            {
                foreach (XmlNode member in members)
                {
                    string name = member.SelectSingleNode("Name").InnerText;
                    string password = member.SelectSingleNode("Password").InnerText;

                    lbl_XML_output.Text = $"Member found: {name}, Password: {password}";
                }
            }
            else
            {
                lbl_XML_output.Text = "Member not found.";
            }
        }

        protected void btn_addNewUser_Click(object sender, EventArgs e)
        {
            string newUsername = tbx_username.Text.Trim();
            string newPassword = tbx_password.Text.Trim();

            // Load XML document
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("Member.xml"));

            // Check if the username already exists
            XmlNode existingMember = xmlDoc.SelectSingleNode("/Members/Member[Name='" + newUsername + "']");
            if (existingMember != null)
            {
                lbl_XML_output.Text = "Error: User already exists.";
            }
            else
            {
                // Create a new member node
                XmlNode newMember = xmlDoc.CreateElement("Member");
                XmlNode nameNode = xmlDoc.CreateElement("Name");
                nameNode.InnerText = newUsername;
                XmlNode passwordNode = xmlDoc.CreateElement("Password");
                passwordNode.InnerText = newPassword;

                // Append name and password nodes to the new member node
                newMember.AppendChild(nameNode);
                newMember.AppendChild(passwordNode);

                // Append the new member node to the Members node
                xmlDoc.SelectSingleNode("/Members").AppendChild(newMember);

                // Save the changes to the XML file
                xmlDoc.Save(Server.MapPath("Member.xml"));

                lbl_XML_output.Text = "Member added successfully.";
            }
        }
    }
}


