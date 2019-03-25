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
        public string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        private List<Role> roles = new List<Role>();

        public bool Delete(int id)
        {
            string sqlExpression = "dbo.DeleteRole";
            int result = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID", id);
                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    result = reader.GetInt32(0);
                }
                reader.Close();
            }
            return result == 0;
        }

        public Role Get(int id)
        {
            string sqlExpression = "dbo.GetRole";
            Role result = null;
            using (SqlConnection connection = new SqlConnection(connectionString))

            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID", id);
                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    result = new Role
                    {
                        RoleId = reader.GetInt32(0),
                        RoleName = reader.GetString(1)
                    };
                }
                reader.Close();
            }
            return result;
        }

        public List<Role> GetAll()
        {
            string sqlExpression = "dbo.GetAllRoles";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        roles.Add(new Role
                        {
                            RoleId = reader.GetInt32(0),
                            RoleName = reader.GetString(1)
                        });
                    }
                }
                reader.Close();
            }
            return roles.ToList();
        }

        public bool Save(Role entity)
        {
            string sqlExpression = "dbo.SaveRole";
            int result = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@RoleName", entity.RoleName);
                command.Parameters.AddWithValue("@RoleID", entity.RoleId);
                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    result = reader.GetInt32(0);
                }
                reader.Close();
            }
            return result == 0;
        }

    }
}
