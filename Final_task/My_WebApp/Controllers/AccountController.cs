using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Mvc;
using My_WebApp.Models;
using System.Net.Http;
using DAL_Library;
using DAL_Library.Interfaces;

namespace My_WebApp.Controllers
{
    public class AccountController : Controller
    {

        private IUserRepository userRepository;
        private IRoleRepository roleRepository;

        public AccountController(IUserRepository userRepository, IRoleRepository roleRepository)
        {
            this.userRepository = userRepository;
            this.roleRepository = roleRepository;
        }

        public ActionResult LogOn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogOn(LoginViewModel userAndPassword, string ReturnUrl)
        {

            if (!string.IsNullOrEmpty(userAndPassword.Name) && !string.IsNullOrEmpty(userAndPassword.Password))
            {
                if (userRepository.CheckUser(userAndPassword.Name, userAndPassword.Password, out User user))
                {
                    var ticket = new FormsAuthenticationTicket(
                        version: 1,
                        name: user.UserID.ToString(),
                        issueDate: DateTime.Now,
                        expiration: DateTime.Now.AddMinutes(5),
                        isPersistent: false,
                        userData: roleRepository.Get(user.RoleId).RoleName);

                    var encryptedTicket = FormsAuthentication.Encrypt(ticket);
                    var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

                    HttpContext.Response.Cookies.Add(cookie);

                    return Redirect(ReturnUrl);
                }
            }

            return View(userAndPassword);
        }

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();

            return Redirect("~/");
        }

    }
}