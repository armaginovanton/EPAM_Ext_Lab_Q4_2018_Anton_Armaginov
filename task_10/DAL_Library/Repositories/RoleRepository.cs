using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Library.Repositories
{
    public class RoleRepository : Interfaces.IRoleRepository
    {
        private List<Role> users = new List<Role>{ new Role { RoleId=1, RoleName="referense" },
                                                   new Role { RoleId=2, RoleName="referense" }};

        public bool Delete(int id)
        {
            return users.Remove(Get(id));
        }

        public Role Get(int id)
        {
            return users.Find(item => item.RoleId == id);
        }

        public List<Role> GetAll()
        {
            return users.ToList();
        }

        public bool Save(Role entity)
        {
            users.Add(entity);
            return users.Contains(entity);
        }

    }
}
