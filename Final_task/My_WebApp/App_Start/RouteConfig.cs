using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace My_WebApp
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "LoginOn",
                url: "Account/{action}/{id}",
                defaults: new { controller = "Account", action = "LogOn", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "CreateRoute",
                url: "create-{controller}",
                defaults: new { controller = "User", action = "Create", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "GetList",
                url: "{controller}s/{id}",
                defaults: new { controller = "User", action = "GetAll", id = "all" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{id}/{action}",
                defaults: new { controller = "Home", action = "Details", id = UrlParameter.Optional }
            );
        }
    }
}
