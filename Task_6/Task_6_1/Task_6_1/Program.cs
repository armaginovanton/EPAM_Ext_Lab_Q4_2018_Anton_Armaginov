﻿using System;
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
            delegSort(data);//todo np ты не понял задания. Нужно передавать делегат сравнения, а не весь метод сортировки. "Реализовать метод сравнения строк отдельным методом, передаваемым в сортировку через делегат."

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
