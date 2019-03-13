using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace My_WebApp.Models
{
    public class RoleViewModel
    {
        [DisplayName("ID роли")]
        public int RoleId { get; set; }
        [DisplayName("Название роли")]
        public string RoleName { get; set; }
    }
}