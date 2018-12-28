using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task_5.Repositories
{
    public class UserRepository : Interfaces.IUserRepository
    {
        private List<User> users = new List<User>();

        public UserRepository(List<User> users)
        {
            this.users = users;
        }

        public bool Delete(int id)
        {
            return users.Remove(Get(id));
        }

        public User Get(int id)
        {
            return users.Find(item => item.ID == id);
        }

        public List<User> GetAll()
        {
            return users.ToList();
        }

        public bool Save(User entity)
        {
            if (users.Exists(item => item.ID == entity.ID)) { return false; }
            users.Add(entity);
            return users.Contains(entity);
        }

    }
}
