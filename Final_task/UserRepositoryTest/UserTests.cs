using System;
using System.Collections.Generic;
using DAL_Library;
using DAL_Library.Repositories;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace UserRepositoryTest
{
    [TestClass]
    public class UserTests
    {
        [TestMethod]
        public void TestSaveGetMethod()
        {
            UserRepository userRepository = new UserRepository();
            userRepository.Save(new User
                                    {
                                        FirstName = "Suyama",
                                        LastName = "Michael",
                                        RoleId = 4,
                                        City = "Moskow",
                                        Phone  = "3547",
                                        Password = "admin"
                                    });
            User user = userRepository.GetAll().Find(item => item.RoleId == 4);
            bool save = (user.FirstName.Equals("Suyama") && user.LastName.Equals("Michael")
                         && user.City.Equals("Moskow") && user.Phone.Equals("3547"));
            Assert.AreEqual(true, save, "user is saved correctly");
        }

        [TestMethod]
        public void TestGetAllMethod()
        {
            UserRepository userRepository = new UserRepository();
            List<User> users = userRepository.GetAll();
            bool get = users.Count == 1;
            Assert.AreEqual(true, get, "user is delete correctly");
        }

        [TestMethod]
        public void TestDeleteMethod()
        {
            UserRepository userRepository = new UserRepository();
            User user = userRepository.GetAll().Find(item => item.RoleId == 4);
            userRepository.Delete(user.UserID);
            bool delete = (userRepository.Get(user.UserID) == null);
            Assert.AreEqual(true, delete, "user is delete correctly");
        }

        [TestMethod]
        public void TestCheckLoginMethod()
        {
            UserRepository userRepository = new UserRepository();
            bool delete = userRepository.CheckLogin("Admin");
            Assert.AreEqual(true, delete, "user is login");
        }
    }
}
