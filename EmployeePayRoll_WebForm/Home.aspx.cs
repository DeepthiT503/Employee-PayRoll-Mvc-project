using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Linq.Expressions;

namespace EmployeePayRoll_WebForm
{
    public partial class Home : System.Web.UI.Page
    {
        string connectionString = @"Server=LAPTOP-I34SOOK0\SQLEXPRESS01;Database=DemoDB;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                // {
                //    // Check if the "UserInfo" cookie exists
               
                GetDetails(); // Call the GetDetails method to populate GridView
            }
        }
        string Gender;
        protected void Update(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string directoryPath = @"C:\Users\deept\Desktop\pictures\"; 
                string filePath = Path.Combine(directoryPath, fileName);
                FileUpload1.SaveAs(filePath);

                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = new SqlCommand("UpdateEmployee", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@EmployeeId", TextBox5.Text);
                command.Parameters.AddWithValue("@FullName", TextBox1.Text);
                command.Parameters.AddWithValue("@ImagePath", filePath); 
                command.Parameters.AddWithValue("@Gender", Gender);
                command.Parameters.AddWithValue("@Department", CheckBoxList1.SelectedValue);
                command.Parameters.AddWithValue("@Salary", TextBox2.Text);
                command.Parameters.AddWithValue("@StartDate", TextBox3.Text);
                command.Parameters.AddWithValue("@Notes", TextBox4.Text);
                command.ExecuteNonQuery();
                connection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully inserted');", true);
                GetDetails();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please upload an image');", true);
            }
        }
        protected void Delete(object sender, EventArgs e)
        {
            try
            {
                int employeeId; // Declare the variable within the method for scope localization

                if (!int.TryParse(TextBox5.Text, out employeeId))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Employee ID.');", true);
                    return; // Return if the Employee ID is invalid
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("DeleteEmployee", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@EmployeeId", employeeId);
                    //int.Parse(TextBox5.Text)
                    int rows = command.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully deleted.');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('EmployeeId not found.');", true);
                    }
                    GetDetails();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", $"alert('An error occurred: {ex.Message}');", true);
            }

        }

        public void GetDetails()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = new SqlCommand("GetEmployeeDetails", connection);
            command.CommandType = CommandType.StoredProcedure; 
            SqlDataAdapter adapter = new SqlDataAdapter(command); 
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            connection.Close();
        }
        
        

        protected void ListData(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeDetails");

        }

        protected void Search(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = new SqlCommand("GetByNameAndId", connection);

            command.CommandType = CommandType.StoredProcedure;

            // Check if TextBox5.Text is empty, if not, search by ID
            if (!string.IsNullOrEmpty(TextBox5.Text))
            {
                command.Parameters.AddWithValue("@EmployeeId", Convert.ToInt32(TextBox5.Text));
            }
            else
            {
                // If TextBox5.Text is empty, pass NULL as the parameter value
                command.Parameters.AddWithValue("@EmployeeId", DBNull.Value);
            }

            // Check if TextBox1.Text is empty, if not, search by FullName
            if (!string.IsNullOrEmpty(TextBox1.Text))
            {
                command.Parameters.AddWithValue("@FullName", TextBox1.Text);
            }
            else
            {
                // If TextBox1.Text is empty, pass NULL as the parameter value
                command.Parameters.AddWithValue("@FullName", DBNull.Value);
            }

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Details.');", true);
            }
            else
            {
                // Records found, bind data to GridView
                GridView1.DataSource = dt;
                GridView1.DataBind();
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
        protected void Others(object sender, EventArgs e)
        {
            Gender = "Others";
        }

        }
}