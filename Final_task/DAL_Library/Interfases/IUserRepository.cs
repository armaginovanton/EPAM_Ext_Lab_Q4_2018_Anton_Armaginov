using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Library.Interfaces
{
    public interface IUserRepository : IBaseRepository<User>
    {
        bool CheckUser(string login, string password, out User user);
        bool CheckLogin(string login);
    }
}
