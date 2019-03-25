﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace My_WebApp.Models
{
    public class LoginViewModel
    {
        [Required]
        public string Name { get; set; }

        [Required]
        public string Password { get; set; }
    }
}