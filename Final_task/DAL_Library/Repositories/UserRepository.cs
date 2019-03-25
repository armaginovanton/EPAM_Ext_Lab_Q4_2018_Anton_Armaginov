using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace DAL_Library.Repositories
{
    public class UserRepository : Interfaces.IUserRepository
    {
        public string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        private List<User> users = new List<User>();

        public bool Delete(int id)
        {
            string sqlExpression = "dbo.DeleteUser";
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

        public User Get(int id)
        {
            string sqlExpression = "dbo.GetUser";
            User result = null;
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
                    result = new User
                    {
                        UserID = reader.GetInt32(0),
                        LastName = reader.GetString(1),
                        FirstName = reader.GetString(2),
                        City = reader.GetString(5),
                        Phone = reader.GetString(8),
                        RoleId = reader.GetInt32(10),
                        Password = reader.GetString(11),
                        Login = reader.GetString(12)
                    };
                }
                reader.Close();
            }
            return result;
        }

        public List<User> GetAll()
        {
            string sqlExpression = "dbo.GetAllUsers";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlParameter nameParam = new SqlParameter { ParameterName = "@top", Value = 20 };
                command.Parameters.Add(nameParam);
                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        users.Add(new User
                        {
                            UserID = reader.GetInt32(0),
                            LastName = reader.GetString(1),
                            FirstName = reader.GetString(2),
                            City = reader.GetString(5),
                            Phone = reader.GetString(8),
                            RoleId = reader.GetInt32(10),
                            Password = reader.GetString(11),
                            Login = reader.GetString(12)
                        });
                    }
                }
                reader.Close();
            }
            return users.ToList();
        }

        public bool Save(User entity)
        {
            string sqlExpression = "dbo.SaveUser";
            int result = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@LastName", entity.LastName);
                command.Parameters.AddWithValue("@FirstName", entity.FirstName);
                command.Parameters.AddWithValue("@City", entity.City);
                command.Parameters.AddWithValue("@Phone", entity.Phone);
                command.Parameters.AddWithValue("@UserID", entity.UserID);
                command.Parameters.AddWithValue("@RoleID", entity.RoleId);
                command.Parameters.AddWithValue("@Password", GetHash(entity.Password));
                command.Parameters.AddWithValue("@login", entity.Login);
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

        public User GetUser(string login, string password)
        {
            string sqlExpression = "dbo.GetAutorizeUser";
            User result = null;
            using (SqlConnection connection = new SqlConnection(connectionString))

            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@login", login);
                command.Parameters.AddWithValue("@password", GetHash(password));
                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    result = new User
                    {
                        UserID = reader.GetInt32(0),
                        LastName = reader.GetString(1),
                        FirstName = reader.GetString(2),
                        City = reader.GetString(5),
                        Phone = reader.GetString(8),
                        RoleId = reader.GetInt32(10),
                        Password = reader.GetString(11),
                        Login = reader.GetString(12)
                    };
                }
                reader.Close();
            }
            return result;
        }

        public bool CheckUser(string login, string password, out User user)
        {
            user = GetUser(login, password);
            return user != null;
        }

        public bool CheckLogin(string login)
        {
            string sqlExpression = "dbo.[CheckLogin]";
            string result = "";
            using (SqlConnection connection = new SqlConnection(connectionString))

            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@login", login);
                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    result = reader.GetString(0);
                }
                reader.Close();
            }
            return !result.Equals(login);
        }

        public string GetHash(string input)
        {
            var md5 = MD5.Create();
            var hash = md5.ComputeHash(Encoding.UTF8.GetBytes(input));
            string pass = Convert.ToBase64String(hash);
            return pass.Substring(0, 15);
        }
    }
}
