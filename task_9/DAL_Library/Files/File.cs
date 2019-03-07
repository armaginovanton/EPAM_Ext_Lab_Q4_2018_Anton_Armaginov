using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL_Library
{
    public enum FileType
    {
        Multimedia, Document, Programm
    }

    public enum Extention
    {
        AVI,
        MP3,
        JPG,
        DOC,
        TXT
    }

    public class File 
    {
        public int ID;
        public int UserID;
        public string referense;

        public Rating Rating
        {
            get => default(Rating);
            set
            {
            }
        }

        public FileType Category
        {
            get => default(FileType);
            set
            {
            }
        }


        public User User
        {
            get => default(User);
            set
            {
            }
        }

        public Extention Extention
        {
            get => default(Extention);
            set
            {
            }
        }

        public void Push() { }
        public void ReferenseGnerate(){}

    }

    
}