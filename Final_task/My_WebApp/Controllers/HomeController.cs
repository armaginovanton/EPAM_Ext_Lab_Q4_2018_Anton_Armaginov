using DAL_Library;
using Ninject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace My_WebApp.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Details()
        {
            return View();
        }
    }
}