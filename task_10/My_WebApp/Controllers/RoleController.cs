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
    public class RoleController : Controller
    {
        private IRoleRepository roleRepository;

        public RoleController(IRoleRepository roleRepository)
        {
            this.roleRepository = roleRepository;
        }

        // GET: Role
        public ActionResult Index(int id)
        {
            var role = Mapper.Map<Role, RoleViewModel>(roleRepository.Get(id));
            return View(role);
        }

        // GET: Roles
        public ActionResult Details(string id)
        {
            var roles =
                Mapper.Map<IEnumerable<Role>, List<RoleViewModel>>(roleRepository.GetAll());
            if (id == "all") { return View(roles); }
            return View(roles.Where(x => x.RoleName == id));
        }

        // GET: Role/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Role/Create
        [HttpPost]
        public ActionResult Create(RoleViewModel model)
        {
            if (ModelState.IsValid)
            {
                Role role = Mapper.Map<RoleViewModel, Role>(model);
                roleRepository.Save(role);
                return RedirectToAction("Details");
            }
            return View(model);
        }

        // GET: Role/Edit/5
        public ActionResult Edit(int id)
        {
            var role = Mapper.Map<Role, RoleViewModel>(roleRepository.Get(id));
            return View(role);
        }

        // POST: Role/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, RoleViewModel model)
        {
            try
            {
                Role role = Mapper.Map<RoleViewModel, Role>(model);
                roleRepository.Save(role);
                return RedirectToAction("Details");
            }
            catch
            {
                return View(model);
            }
        }

        // GET: Role/Delete/5
        public ActionResult Delete(int id)
        {
            var role = Mapper.Map<Role, RoleViewModel>(roleRepository.Get(id));
            return View(role);
        }

        // POST: Role/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, RoleViewModel model)
        {
            try
            {
                Role role = Mapper.Map<RoleViewModel, Role>(model);
                roleRepository.Delete(role.RoleId);
                return RedirectToAction("Details");
            }
            catch
            {
                return View(model);
            }
        }
    }
}
