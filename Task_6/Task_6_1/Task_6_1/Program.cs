using System;
using System.Linq;

namespace Task_6_1
{

    class Program
    {
        delegate void Deleg(string[] arr);

        private static void Main(string[] args)
        {
            Deleg delegSort = Sort;

            string[] data = { "ss", "aa", "a", "abc" };

            Console.WriteLine(string.Join(" ", data));
            delegSort(data);

            Console.ReadKey();

        }
        static void Sort(string[] arr)
        {
            var sortedElements = from arrElement in arr.Distinct()
                                    orderby arrElement.Length, arrElement
                                    select arrElement;

           Console.WriteLine(string.Join(" ", sortedElements)); ;
                     
        }
    }

}
