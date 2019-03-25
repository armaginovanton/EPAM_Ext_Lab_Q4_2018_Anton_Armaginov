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
    public class FileController : Controller
    {
        private IFileRepository fileRepository;

        public FileController(IFileRepository fileRepository)
        {
            this.fileRepository = fileRepository;
        }

        [AllowAnonymous]
        public ActionResult Details(int id)
        {
            var file = Mapper.Map<File, FileViewModel>(fileRepository.Get(id));
            return View(file);
        }

        [AllowAnonymous]
        public ActionResult GetAll(string id)
        {
            var files =
                Mapper.Map<IEnumerable<File>, List<FileViewModel>>(fileRepository.GetAll());
            if (id == "all") { return View(files); }
            return View(files.Where(x => x.UserID.ToString() == id));
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(HttpPostedFileBase upload)
        {
            if (upload != null)
            {
                string fileName = System.IO.Path.GetFileName(upload.FileName);
                string refer = Server.MapPath("~/UsersFile/" + fileName);
                upload.SaveAs(refer);
                File file = new File { UserID = Convert.ToInt32(User.Identity.Name), referense = refer, Name = fileName };
                fileRepository.Save(file);
                return RedirectToAction("GetAll");
            }
            return View();
        }
        
        public ActionResult Edit(int id)
        {
            var file = Mapper.Map<File, FileViewModel>(fileRepository.Get(id));
            return View(file);
        }
        
        [HttpPost]
        public ActionResult Edit(HttpPostedFileBase upload, FileViewModel model)
        {
            if (upload != null)
            {
                string fileName = System.IO.Path.GetFileName(upload.FileName);
                string refer = Server.MapPath("~/UsersFile/" + fileName);
                upload.SaveAs(refer);
                File file = new File { UserID = Convert.ToInt32(User.Identity.Name), referense = refer, ID = model.ID, Name = fileName };
                fileRepository.Save(file);
                return RedirectToAction("GetAll");
            }
            return View();
        }
        
        public ActionResult Delete(int id)
        {
            fileRepository.Delete(id);
            return RedirectToAction("GetAll");
        }
        
        [HttpPost]
        public ActionResult Delete(FileViewModel model)
        {
            if (ModelState.IsValid)
            {
                File file = Mapper.Map<FileViewModel, File>(model);
                fileRepository.Delete(file.UserID);
                return RedirectToAction("GetAll");
            }
            return View(model);
        }
    }
}
