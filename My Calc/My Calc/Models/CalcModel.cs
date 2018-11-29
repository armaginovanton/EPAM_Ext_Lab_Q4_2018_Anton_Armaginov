using My_Calc.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace My_Calc.Models
{
    public class CalcModel
    {
        [Display(Name = "x", ResourceType = typeof(CalcResources))]
        [Required]
        public int X { get; set; }

        [Display(Name = "y", ResourceType = typeof(CalcResources))]
        [Required]
        public int Y { get; set; }

        [Display(Name = "Result", ResourceType = typeof(CalcResources))]
        public string Result { get; set; }

        [Display(Name = "OpName", ResourceType = typeof(CalcResources))]
        public Operation Op { get; set; }
    }
}