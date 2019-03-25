using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Library.Repositories
{
    public class FileRepository : Interfaces.IFileRepository
    {
        public string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        private List<File> roles = new List<File>();

        public bool Delete(int id)
        {
            string sqlExpression = "dbo.DeleteFile";
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

        public File Get(int id)
        {
            string sqlExpression = "dbo.GetFile";
            File result = null;
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
                    result = new File
                    {
                        ID = reader.GetInt32(0),
                        UserID = reader.GetInt32(1),
                        referense = reader.GetString(2),
                        Name = reader.GetString(3)
                    };
                }
                reader.Close();
            }
            return result;
        }

        public List<File> GetAll()
        {
            string sqlExpression = "dbo.GetAllFiles";
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
                        roles.Add(new File
                        {
                            ID = reader.GetInt32(0),
                            UserID = reader.GetInt32(1),
                            referense = reader.GetString(2),
                            Name = reader.GetString(3)

                        });
                    }
                }
                reader.Close();
            }
            return roles.ToList();
        }

        public bool Save(File entity)
        {
            string sqlExpression = "dbo.SaveFile";
            int result = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID", entity.ID);
                command.Parameters.AddWithValue("@UserID", entity.UserID);
                command.Parameters.AddWithValue("@referense", entity.referense);
                command.Parameters.AddWithValue("@Name", entity.Name);
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
