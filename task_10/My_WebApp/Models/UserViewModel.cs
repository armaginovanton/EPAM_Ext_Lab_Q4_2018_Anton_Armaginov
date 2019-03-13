using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace My_WebApp.Models
{
    public class UserViewModel
    {
        [DisplayName("Имя")]
        public string FirstName { get; set; }
        [DisplayName("Фамилия")]
        public string LastName { get; set; }
        [DisplayName("Город")]
        public string City { get; set; }
        [DisplayName("Телефон")]
        public string Phone { get; set; }
        [DisplayName("Пароль")]
        public string Password { get; set; }
        [DisplayName("ID пользователя")]
        public int UserID { get; set; }
        [DisplayName("ID роли пользователя")]
        public int RoleId { get; set; }
    }
}