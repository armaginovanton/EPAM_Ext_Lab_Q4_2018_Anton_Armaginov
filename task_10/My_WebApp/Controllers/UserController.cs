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
    public class UserController : Controller
    {

        private IUserRepository userRepository;

        public UserController(IUserRepository userRepository)
        {
            this.userRepository = userRepository;
        }

        // GET: User
        public ActionResult Index(int id)
        {
            var user = Mapper.Map<User, UserViewModel>(userRepository.Get(id));
            return View(user);
        }

        // GET: User/5/Details
        public ActionResult Details(string id)
        {
            var users =
                Mapper.Map<IEnumerable<User>, List<UserViewModel>>(userRepository.GetAll());
            if (id == "all") { return View(users); }
            return View(users.Where(x => x.FirstName == id));
        }

        // GET: User/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: User/Create
        [HttpPost]
        public ActionResult Create(UserViewModel model)
        {
            if (ModelState.IsValid)
            {
                User user = Mapper.Map<UserViewModel, User>(model);
                userRepository.Save(user);
                return RedirectToAction("Details");
            }
            return View(model);
        }

        // GET: User/5/edit
        public ActionResult Edit(int id)
        {
            var user = Mapper.Map<User, UserViewModel>(userRepository.Get(id));
            return View(user);
        }

        // POST: User/5/edit
        [HttpPost]
        public ActionResult Edit(int id, UserViewModel model)
        {
            try
            {
                User user = Mapper.Map<UserViewModel, User>(model);
                userRepository.Save(user);
                return RedirectToAction("Details");
            }
            catch
            {
                return View(model);
            }
        }

        // GET: User/5/Delete
        public ActionResult Delete(int id)
        {
            var user = Mapper.Map<User, UserViewModel>(userRepository.Get(id));
            return View(user);
        }

        // POST: User/5/Delete
        [HttpPost]
        public ActionResult Delete(int id, UserViewModel model)
        {
            try
            {
                User user = Mapper.Map<UserViewModel, User>(model);
                userRepository.Delete(user.UserID);
                return RedirectToAction("Details");
            }
            catch
            {
                return View(model);
            }
        }
    }
}
