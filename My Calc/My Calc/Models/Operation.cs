using My_Calc.Resources;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace My_Calc.Models
{
    public enum Operation
    {
        [Display(Name = "Add", ResourceType = typeof(CalcResources))]
        Add,
        [Display(Name = "Diff", ResourceType = typeof(CalcResources))]
        Diff,
        [Display(Name = "Multiply", ResourceType = typeof(CalcResources))]
        Multiply,
        [Display(Name = "Share", ResourceType = typeof(CalcResources))]
        Share
    }
}