using System;
using System.Collections.Generic;
using DAL_Library;
using DAL_Library.Repositories;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace UserRepositoryTest
{
    [TestClass]
    public class UserTests//todo pn для проекта тестов лучше создавать клон реальной базы и перед каждым запуском тестов обнулять и/или заполнять её известными тестовыми данными. Так тесты будут проходить корректнее
    {
        [TestMethod]
        public void TestSaveMethod()
        {
            UserRepository userRepository = new UserRepository(new List<User>());
            User userMisha = new User { Name = "Ivan", ID = 1 };
            bool save = userRepository.Save(userMisha);
            Assert.AreEqual(true, save, "user is saved correctly");//todo pn чтобы проверить корректность сохранения, надо проверить совпадение всех полей в базе с userMisha
        }

        [TestMethod]
        public void TestDeleteMethod()
        {
            List<User> userList = new List<User>() {};
            userList.Add(new User { Name = "Ivan", ID = 1 });
            UserRepository userRepository = new UserRepository(userList);
            bool delete =  userRepository.Delete(1);
            Assert.AreEqual(true, delete, "user is delete correctly");//todo pn аналогично. По Ид Ивана не должно ничего возвращаться
        }

        [TestMethod]
        public void TestGetAllMethod()
        {
            List<User> userList = new List<User>() { };
            userList.Add(new User { Name = "Ivan", ID = 1 });
            UserRepository userRepository = new UserRepository(userList);
            User user = userRepository.Get(1);
            bool getall = userList.Contains(user);
            Assert.AreEqual(true, getall, "user is delete correctly");//todo pn здесь тебе нужно в идеале очистить всю базу, создать с десяток записей и посмотреть, все ли 10 вернутся.
        }

        [TestMethod]
        public void TestGetMethod()
        {
            UserRepository userRepository = new UserRepository(new List<User>());
            List<User> users = userRepository.GetAll();
            bool get = users.Count >= 0;
            Assert.AreEqual(true, get, "user is delete correctly");//todo pn не понял, что тестирует этот метод.
        }

    }
}
