using AutoMapper;
using DAL_Library;
using My_WebApp.Models;
using Ninject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;

namespace My_WebApp
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            DependencyResolver.SetResolver(new NinjectDependencyResolver(new StandardKernel()));
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Mapper.Initialize(cfg => {
                cfg.CreateMap<User, UserViewModel>();
                cfg.CreateMap<Role, RoleViewModel>();
                cfg.CreateMap<File, FileViewModel>();
            });
        }

        public override void Init()
        {
            base.AuthenticateRequest += OnAuthenticateRequest;
        }
        private void OnAuthenticateRequest(object sender, EventArgs eventArgs)
        {
            if (HttpContext.Current.Request.IsAuthenticated)
            {
                var cookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];
                var decodedTicket = FormsAuthentication.Decrypt(cookie.Value);
                var roles = decodedTicket.UserData.Split(new[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                var principal = new GenericPrincipal(HttpContext.Current.User.Identity, roles);
                HttpContext.Current.User = principal;
            }
        }

    }
}
