using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Library.Repositories
{
    public class UserRepository : Interfaces.IUserRepository
    {
        public string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Integrated Security=True;Connect Timeout=60;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        private List<User> users = new List<User>();//todo pn это плохой подход. Если у тебя будет 100000 бользователей, тоже в список выгружать будешь? всех? лучше реализовать отдельными запросами к бд.

        public UserRepository(List<User> users)
        {
            this.users = users;
        }

        public bool Delete(int id)
        {
            return users.Remove(Get(id));//todo pn не понял прикола, а как из базы удалить?
        }

        public User Get(int id)
        {
            return users.Find(item => item.ID == id);
        }

        public List<User> GetAll()
        {
            string sqlExpression = "SiteDB.dbo.GetAllUsers";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlParameter nameParam = new SqlParameter
                {
                    ParameterName = "@top",
                    Value = 7
                };
                command.Parameters.Add(nameParam);
                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        users.Add(new User { ID = reader.GetInt32(0), Name = reader.GetString(1) });
                    }
                }
                reader.Close();
            }
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
