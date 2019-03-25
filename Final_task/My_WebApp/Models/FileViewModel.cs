using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace My_WebApp.Models
{
    public class FileViewModel
    {
        [ScaffoldColumn(false)]
        public int ID { get; set; }
        [DisplayName("ID пользователя")]
        public int UserID { get; set; }
        [Required]
        [StringLength(255)]
        [DisplayName("ссылка на файл")]
        public string referense { get; set; }
        [Required]
        [StringLength(255)]
        [DisplayName("Наимеование файла")]
        public string Name { get; set; }
    }
}