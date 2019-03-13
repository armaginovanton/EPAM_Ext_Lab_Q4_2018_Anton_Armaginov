using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Library.Repositories
{
    public class UserRepository : Interfaces.IUserRepository
    {
        private List<User> users = new List<User>{ new User { UserID=1, FirstName="FirstName",LastName="LastName" },
                                                   new User { UserID=2, FirstName="FirstName",LastName="LastName" }};

        public bool Delete(int id)
        {
            return users.Remove(Get(id));
        }

        public User Get(int id)
        {
            return users.Find(item => item.UserID == id);
        }

        public List<User> GetAll()
        {
            return users.ToList();
        }

        public bool Save(User entity)
        {
            users.Add(entity);
            return users.Contains(entity);
        }

    }
}
