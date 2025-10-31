using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruiterManagement.Candidates
{
    public partial class BulkUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            if (!fileUploadControl.HasFile)
            {
                lblCSVStatus.Text = "Please select a CSV file.";
                return;
            }

            string extension = Path.GetExtension(fileUploadControl.FileName);
            if (extension.ToLower() != ".csv" || extension.ToLower() != ".xlsx")
            {
                lblCSVStatus.Text = "Only .csv or .xlsx files are allowed.";
                return;
            }

            string folderPath = Server.MapPath("~/Uploads/Candidates_CSV_Data");
            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            string filePath = Path.Combine(folderPath, Path.GetFileName(fileUploadControl.FileName));
            fileUploadControl.SaveAs(filePath);
            lblMessage.Text = "File uploaded successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}