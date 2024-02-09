using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace EmployeePayRoll_WebForm
{
    public partial class EmployeeLogin : System.Web.UI.Page
    {
        string connectionString = @"Server=LAPTOP-I34SOOK0\SQLEXPRESS01;Database=DemoDB;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true";

        //we check if session variables exist. If they don't, we check if the cookies exist and populate the text boxes with their values.
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["EmployeeId"] != null && Session["FullName"] != null)
                {
                    Tb1.Text = Session["EmployeeId"].ToString();
                    Tb2.Text = Session["FullName"].ToString();
                }
                else if (Request.Cookies["Emplooyee"] != null)
                {
                    Tb1.Text = Request.Cookies["Emplooyee"]["EmployeeId"];
                    Tb2.Text = Request.Cookies["Emplooyee"]["FullName"];
                }
            }
        }

        protected void Login(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("getempdetails1", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@EmployeeId", Tb1.Text);
                command.Parameters.AddWithValue("@FullName", Tb2.Text);

                using (var dataReader = command.ExecuteReader())
                {
                    if (dataReader.Read())
                    {
                        // Check if the checkbox is checked
                        if (ChkMe.Checked)
                        {
                            // Store data in session
                            Session["EmployeeId"] = Tb1.Text;
                            Session["FullName"] = Tb2.Text;

                            // Create and store data in cookies
                            HttpCookie userInfoCookie = new HttpCookie("Emplooyee");
                            userInfoCookie["EmployeeId"] = Tb1.Text;
                            userInfoCookie["FullName"] = Tb2.Text;
                            userInfoCookie.Expires = DateTime.Now.AddMinutes(1);
                            Response.Cookies.Add(userInfoCookie);
                        }
                        else
                        {
                            // If checkbox is not checked, remove existing cookie
                            HttpCookie userInfoCookie = Request.Cookies["Emplooyee"];
                            if (userInfoCookie != null)
                            {
                                userInfoCookie.Expires = DateTime.Now.AddDays(-1);
                                Response.Cookies.Add(userInfoCookie);
                            }
                        }

                        // Redirect to Home.aspx
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Login Unsuccessful');", true);
                    }
                }
            }
        }

        protected void Register(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeRegisterForms.aspx");
        }
    }
}
