using EmployeePayRoll_WebForm;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace EmployeePayRoll_WebForm
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            RouteTable.Routes.MapPageRoute("Home Page", "homepage", "~/Home.aspx");
            RouteTable.Routes.MapPageRoute("Registration Page", "register", "~/EmployeeRegisterForms.aspx");
            RouteTable.Routes.MapPageRoute("LoginPage", "login", "~/EmployeeLogin.aspx");
            RouteTable.Routes.MapPageRoute("GetAllEmployeeDetails", "getempDetails", "~/EmployeeDetails.aspx");

            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}
