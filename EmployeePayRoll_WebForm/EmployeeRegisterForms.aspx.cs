using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeePayRoll_WebForm
{
    public partial class EmployeeRegisterForms : System.Web.UI.Page
    {
        string connectionString = @"Server=LAPTOP-I34SOOK0\SQLEXPRESS01;Database=DemoDB;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

            }

        }
        string Gender;
        protected void Create(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = new SqlCommand("InsertEmployee", connection);
            command.CommandType = CommandType.StoredProcedure;

            string impath = null;
            string path = Server.MapPath("Image/");
            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string extention = Path.GetExtension(FileUpload1.FileName);
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                int length = postedFile.ContentLength;
                if (extention.ToLower() == ".jpg" || extention.ToLower() == ".png" || extention.ToLower() == ".jpeg")
                {
                    FileUpload1.SaveAs(path + fileName);
                    impath = "Image/" + fileName;
                }

            
                command.Parameters.AddWithValue("@FullName", TextBox1.Text);
                command.Parameters.AddWithValue("@ImagePath", impath); // Save the absolute path to the image
                command.Parameters.AddWithValue("@Gender", Gender);
                command.Parameters.AddWithValue("@Department",CheckBoxList1.SelectedValue);
                command.Parameters.AddWithValue("@Salary", TextBox2.Text);
                command.Parameters.AddWithValue("@StartDate", TextBox5.Text);
                command.Parameters.AddWithValue("@Notes", TextBox4.Text);
                command.ExecuteNonQuery();
                connection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully inserted');", true);
                //GetDetails();
            }
            else
            {
                // Handle case where no file was uploaded
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please upload an image');", true);
            }
        }
        

        protected void rd1(object sender, EventArgs e)
        {
            Gender = "Male";

        }

        protected void rd2(object sender, EventArgs e)
        {
            Gender = "Female";
        }

        protected void rd3(object sender, EventArgs e)
        {
            Gender = "Others";
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void RadioButton8_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}