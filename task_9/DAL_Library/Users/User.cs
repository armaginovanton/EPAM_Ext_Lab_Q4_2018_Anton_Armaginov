using System;
using System.Collections.Generic;
using System.Linq;

namespace DAL_Library
{
    public class User
    {
        public string Name { get; set; }
        public int ID { get; set; }

        public List<File> FilesFilter(FileType category, Rating rating) { return null; }
        public void AddFile(File File) { }
    }
}