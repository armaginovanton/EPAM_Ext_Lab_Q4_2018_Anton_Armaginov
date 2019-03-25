using AutoMapper;
using DAL_Library;
using DAL_Library.Interfaces;
using My_WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace My_WebApp.Controllers
{
    [Authorize]
    public class UserController : Controller
    {

        private IUserRepository userRepository;

        public UserController(IUserRepository userRepository)
        {
            this.userRepository = userRepository;
        }

        // GET
        public ActionResult Details(int id)
        {
            var user = Mapper.Map<User, UserViewModel>(userRepository.Get(id));
            return View(user);
        }

        // GET
        public ActionResult GetAll(string id)
        {
            if (!string.IsNullOrEmpty(id))
            {
                var users =
                    Mapper.Map<IEnumerable<User>, List<UserViewModel>>(userRepository.GetAll());
                if (id == "all") { return View(users); }
                return View(users.Where(x => x.FirstName == id));
            }
            return View();
        }

        // GET
        [Authorize(Roles = "Admin,Administrator")]
        public ActionResult Create()
        {
            return View();
        }

        // POST
        [HttpPost]
        public ActionResult Create(UserViewModel model)
        {
            if (ModelState.IsValid)
            {
                if (userRepository.CheckLogin(model.Login))
                {
                    User user = Mapper.Map<UserViewModel, User>(model);
                    userRepository.Save(user);
                    return RedirectToAction("GetAll");
                }
            }
            return View(model);
        }

        // GET
        [Authorize(Roles = "Admin,Administrator")]
        public ActionResult Edit(int id)
        {
            var user = Mapper.Map<User, UserViewModel>(userRepository.Get(id));
            return View(user);
        }

        // POST
        [HttpPost]
        public ActionResult Edit(UserViewModel model)
        {
            if (ModelState.IsValid)
            {
                User user = Mapper.Map<UserViewModel, User>(model);
                userRepository.Save(user);
                return RedirectToAction("GetAll");
            }
            return View(model);
        }

        // GET
        [Authorize(Roles = "Admin,Administrator")]
        public ActionResult Delete(int id)
        {
            userRepository.Delete(id);
            return RedirectToAction("GetAll");
        }

        // POST
        [HttpPost]
        public ActionResult Delete(UserViewModel model)
        {
            if (ModelState.IsValid)
            {
                User user = Mapper.Map<UserViewModel, User>(model);
                userRepository.Delete(user.UserID);
                return RedirectToAction("GetAll");
            }
            return View(model);
            
        }
    }
}
