using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task_7_1
{
    class Program
    {
        static void Main(string[] args)
        {
            List<int> sss = new List<int> { 1, 2, 3, 4, 5, 6, 7 };
            Console.WriteLine(sss.Summ());
            Console.ReadKey();
        }
    }

    public static class ExtendingMethod 
    {
        public static int Summ(this List<int> collection)
        {
            int items = 0;
            foreach (var item in collection)
            {
                items += item;
            }
            return items;
        }
    }
}
