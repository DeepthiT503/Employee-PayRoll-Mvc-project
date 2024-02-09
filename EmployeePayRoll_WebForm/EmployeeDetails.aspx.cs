using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeePayRoll_WebForm
{
    public partial class EmployeeDetails : System.Web.UI.Page
    {
        string connectionString = @"Server=LAPTOP-I34SOOK0\SQLEXPRESS01;Database=DemoDB;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDetails();
            }
        }
        public void GetDetails()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = new SqlCommand("GetAllDetails", connection);
            command.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            connection.Close();
        }

    }
}