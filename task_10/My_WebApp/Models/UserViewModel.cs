using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace My_WebApp.Models
{
    public class UserViewModel
    {
        [DisplayName("Имя")]//todo pn строки лучше в ресурсы. И ни одного обязательного поля нет? а огранчиения на длину? в базе же они есть, значит, должны быть и в моделях
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