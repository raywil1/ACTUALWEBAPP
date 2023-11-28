using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ACTUALWEBAPP
{
    public partial class CaptchaControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GenerateCaptcha();
            }
        }
        private void GenerateCaptcha()
        {
            string captchaText = new Random().Next(1000, 9999).ToString(); // 4-digit random number
            Session["CaptchaText"] = captchaText; // Store the captcha in the session

            using (Bitmap bitmap = new Bitmap(80, 30))
            using (Graphics g = Graphics.FromImage(bitmap))
            {
                g.DrawString(captchaText, new Font("Arial", 15), Brushes.Black, 0, 0);
                MemoryStream stream = new MemoryStream();
                bitmap.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                stream.Position = 0;

                byte[] imageBytes = stream.ToArray();
                string base64String = Convert.ToBase64String(imageBytes);
                CaptchaImage.ImageUrl = "data:image/png;base64," + base64String;
            }
        }
    }

}