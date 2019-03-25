using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace My_WebApp.Models
{
    public class UserViewModel
    {
        [Required]
        [StringLength(10)]
        [DisplayName("Логин")]
        public string Login { get; set; }
        [Required]
        [StringLength(10)]
        [DisplayName("Имя")]
        public string FirstName { get; set; }
        [Required]
        [StringLength(20)]
        [DisplayName("Фамилия")]
        public string LastName { get; set; }
        [Required]
        [StringLength(15)]
        [DisplayName("Город")]
        public string City { get; set; }
        [Required]
        [StringLength(24)]
        [DisplayName("Телефон")]
        public string Phone { get; set; }
        [Required]
        [StringLength(15)]
        [DataType(DataType.Password)]
        [DisplayName("Пароль")]
        public string Password { get; set; }
        [ScaffoldColumn(false)]
        public int UserID { get; set; }
        [DisplayName("ID роли пользователя")]
        public int RoleId { get; set; }
    }
}