using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task_7_2
{
    class Program
    {
        static void Main(string[] args)
        {
            string s = Console.ReadLine();
            int num;
            if (s.PositiveNumber(out num))
            {
                Console.WriteLine("Positive {0}", s );
            }else
            {
                Console.WriteLine("Un positive or failed to convert");
            }
            Console.ReadKey();
        }
    }

    public static class ExtendingMethod
    {
        public static bool PositiveNumber(this String param, out int number)
        {
            try
            {
                number = Convert.ToInt32(param);
            }
            catch(Exception e)//todo pn раз уж определил исключение - залогируй его
            {
                number = 0;
                return false;
            }

            if (number >= 0)//todo pn написать это ветвление в одну строку без использования if и тернарного оператора.
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }
    }
}
