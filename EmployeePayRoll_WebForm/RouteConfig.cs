using System.Web.Routing;

public static class RouteConfig
{
    public static void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute("homeroute", "HomePage", "~/EmployeeDetails.aspx");
        // Add more routes as needed
    }
}
