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
        public ActionResult Index(int id)//todo pn обычно Index либо вообще ничего не возвращает, либо возвращает список сущностей. В твоём случае лучше на GetAll переименовать
        {
            var user = Mapper.Map<User, UserViewModel>(userRepository.Get(id));
            return View(user);
        }

        // GET: User/5/Details
        public ActionResult Details(string id)//todo pn очень не хватает проверки на null
        {
            var users =
                Mapper.Map<IEnumerable<User>, List<UserViewModel>>(userRepository.GetAll());
            if (id == "all") { return View(users); }// todo pn хардкод. Вообще подход выгрузить всё, а потом искать в нем - это самое неоптимальное решение из тех, которые можно было бы выбрать. Нужно переделать на отдельный вызов по ИД.
            return View(users.Where(x => x.FirstName == id));//todo pn если задумка была связать этот экшн с Delete, от неё стоит отказаться. Экшены по общему правилу должны быть слабо связаны между собой.
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
            if (ModelState.IsValid)//todo pn почему ты здесь проверяешь валидность, а в Edit - нет?
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
        public ActionResult Edit(int id, UserViewModel model)//todo pn очень не хватает проверки на null + не понял, а зачем тебе здесь ИД? у тебя же сущность передается в экшн, в которой уже есть ИД
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
        public ActionResult Delete(int id)//todo pn очень не хватает проверки на null
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
                return RedirectToAction("Details");//todo pn я правильно понимаю, что в случае успешного удаления ты перенаправляешь пользователя на детальную информацию об удаленном пользователе? которого уже нет в базе? дичь какая-то
            }
            catch
            {
                return View(model);//todo pn ну, вернул ты в случае ошибки вьюшку, а как пользователю понять, что пошло не так? всё это дело через ModelState и кастомные ошибки надо показывать. Понятно, что не реальный текст ошибки, а какую нибудь общую ("К сожалению, что-то пошло не так. Мы работает над этой проблемой").
            }
        }
    }
}
