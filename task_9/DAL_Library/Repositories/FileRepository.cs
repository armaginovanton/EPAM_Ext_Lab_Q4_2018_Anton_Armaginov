using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Library.Repositories
{
    public class FileRepository : Interfaces.IFileRepository
    {
        private List<File> users = new List<File>();

        public bool Delete(int id)
        {
            return users.Remove(Get(id));
        }

        public File Get(int id)
        {
            return users.Find(item => item.ID == id);
        }

        public List<File> GetAll()
        {
            return users.ToList();
        }

        public bool Save(File entity)
        {
            users.Add(entity);
            return users.Contains(entity);
        }

    }
}
