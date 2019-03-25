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
    [Authorize(Roles = "Administrator")]
    public class RoleController : Controller
    {
        private IRoleRepository roleRepository;

        public RoleController(IRoleRepository roleRepository)
        {
            this.roleRepository = roleRepository;
        }

        // GET
        public ActionResult Details(int id)
        {
            var role = Mapper.Map<Role, RoleViewModel>(roleRepository.Get(id));
            return View(role);
        }

        // GET
        public ActionResult GetAll(string id)
        {
            var roles =
                Mapper.Map<IEnumerable<Role>, List<RoleViewModel>>(roleRepository.GetAll());
            if (id == "all") { return View(roles); }
            return View(roles.Where(x => x.RoleName == id));
        }

        // GET
        public ActionResult Create()
        {
            return View();
        }

        // POST
        [HttpPost]
        public ActionResult Create(RoleViewModel model)
        {
            if (ModelState.IsValid)
            {
                Role role = Mapper.Map<RoleViewModel, Role>(model);
                roleRepository.Save(role);
                return RedirectToAction("GetAll");
            }
            return View(model);
        }

        // GET
        public ActionResult Edit(int id)
        {
            var role = Mapper.Map<Role, RoleViewModel>(roleRepository.Get(id));
            return View(role);
        }

        // POST
        [HttpPost]
        public ActionResult Edit(RoleViewModel model)
        {
            if (ModelState.IsValid)
            {
                Role role = Mapper.Map<RoleViewModel, Role>(model);
                roleRepository.Save(role);
                return RedirectToAction("GetAll");
            }
            return View(model);
        }

        // GET
        public ActionResult Delete(int id)
        {
            var role = Mapper.Map<Role, RoleViewModel>(roleRepository.Get(id));
            return View(role);
        }

        // POST
        [HttpPost]
        public ActionResult Delete(RoleViewModel model)
        {
            if (ModelState.IsValid)
            {
                Role role = Mapper.Map<RoleViewModel, Role>(model);
                roleRepository.Delete(role.RoleId);
                return RedirectToAction("GetAll");
            }
            return View(model);
        }
    }
}
