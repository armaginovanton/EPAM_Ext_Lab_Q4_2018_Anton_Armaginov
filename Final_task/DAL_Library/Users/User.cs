using DAL_Library.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DAL_Library
{
    public class User
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string City { get; set; }
        public string Phone { get; set; }
        public int UserID { get; set; }
        public int RoleId { get; set; }
        public string Password { get; set; }
        public string Login { get; set; }

        public List<File> FilesFilter(FileType category, Rating rating) { return null; }
        public void AddFile(File File) { }
    }
}