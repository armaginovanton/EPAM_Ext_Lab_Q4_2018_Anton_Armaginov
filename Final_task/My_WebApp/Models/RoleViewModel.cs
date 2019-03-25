using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace My_WebApp.Models
{
    public class RoleViewModel
    {
        [ScaffoldColumn(false)]
        public int RoleId { get; set; }
        [Required]
        [StringLength(50)]
        [DisplayName("Название роли")]
        public string RoleName { get; set; }
    }
}