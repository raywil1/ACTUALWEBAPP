using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace ACTUALWEBAPP
{
    public partial class WebUserControl2 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnVerifyStaffCredentials_Click(object sender, EventArgs e)
        {
            string enteredUsername = txtStaffUsername.Text.Trim();
            string enteredPassword = txtStaffPassword.Text.Trim();

            bool isAuthenticated = VerifyCredentials(enteredUsername, enteredPassword);

            if (isAuthenticated)
            {
                lblVerificationStatus.Text = "Verification SUCCEEDED. Logging you in.";
                lblVerificationStatus.ForeColor = System.Drawing.Color.Green;
                lblVerificationStatus.Visible = true;
                txtStaffPassword.Text = string.Empty;
            }
            else
            {
                lblVerificationStatus.Text = "Verification FAILED. Please retry.";
                lblVerificationStatus.ForeColor = System.Drawing.Color.Red;
                lblVerificationStatus.Visible = true;
                txtStaffPassword.Text = string.Empty;
            }
        }

        // Method to verify credentials against XML data
        private bool VerifyCredentials(string enteredUsername, string enteredPassword)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("Member.xml"));

            XmlNode memberNode = xmlDoc.SelectSingleNode("/Members/Member[Name='" + enteredUsername + "']");

            if (memberNode != null)
            {
                string storedPassword = memberNode.SelectSingleNode("Password").InnerText;

                // Check both username and password
                return enteredPassword.Equals(storedPassword, StringComparison.Ordinal);
            }

            return false;
        }
    }
}