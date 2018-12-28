using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using Task_5;
using Task_5.Repositories;

namespace Tests
{
    [TestClass]
    public class UserTests
    {
        [TestMethod]
        public void TestCheck()//todo pn не корректный тест. Каждый тест должен тестировать только одно действие (get, update etc), нужно разбить на разные методы.
        {
            List<User> userList = new List<User>() {  };
            userList.Add(new User { Name = "Ivan", ID = 1 });
            userList.Add(new User { Name = "Egor", ID = 2 });
            userList.Add(new User { Name = "Lena", ID = 3 });
            UserRepository userRepository = new UserRepository(userList);

            User userMisha = new User { Name = "Misha", ID = 2 };

            bool save = userRepository.Save(userMisha);
            Assert.AreEqual(false, save, "user is saved correctly");

            userMisha.ID = 4;
            save = userRepository.Save(userMisha);//todo pn сохранение нужно проверять не только на то, что исключений не выпало, но и на то, что все поля сохранились. Т.е. после сохранения нужно выполнять get и сравнивать сохраненную запись с полученной.
            Assert.AreEqual(true, save, "user is saved correctly");

            int count = userRepository.GetAll().Count;
            Assert.AreEqual(4, count, 0.001, "incorrect number of elements");

            String name = userRepository.Get(3).Name;
            Assert.AreEqual("Lena", name, "incorrect item definition");

        }
    }
}
