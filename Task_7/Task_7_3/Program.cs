using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace Task_7_3
{
    class Program
    {
        static List<int> arr = new List<int> { 1, 4, -43, 56, 0, 89, -56, 78, -80 };
        delegate bool Deleg(int number);

        static void Main(string[] args)
        {
            List<int> findArr = new List<int>();
            Stopwatch timer = new Stopwatch();

            DateTime start = DateTime.Now;
            for (int i = 0; i < 10000; i++)
            {
                findArr = FindPositive();
            }
            DateTime end = DateTime.Now;
            Console.WriteLine("Method 1 average: {0} msec", end - start);

            start = DateTime.Now;
            for (int i = 0; i < 10000; i++)
            {
                Deleg deleg = new Deleg(IsPositive);
                findArr = Find(deleg);
            }
            end = DateTime.Now;
            Console.WriteLine("Method 2 average: {0} msec", end - start);

            start = DateTime.Now;
            for (int i = 0; i < 10000; i++)
            {
                findArr = Find(delegate (int number)
                {
                    return number > 0;
                });
            }
            end = DateTime.Now;
            Console.WriteLine("Method 3 average: {0} msec", end - start);

            start = DateTime.Now;
            for (int i = 0; i < 10000; i++)
            {
                findArr = Find(number => number > 0);
            }
            end = DateTime.Now;
            Console.WriteLine("Method 4 average: {0} msec", end - start);

            start = DateTime.Now;
            for (int i = 0; i < 10000; i++)
            {
                findArr = (from number in arr
                          where number > 0
                          select number).ToList();
            }
            end = DateTime.Now;
            Console.WriteLine("Method 5 average: {0} msec", end - start);

            Console.ReadKey();
        }

        static List<int> FindPositive()
        {
            List<int> posArr = new List<int>();
            foreach (int element in arr)
            {
                if (IsPositive(element))
                {
                    posArr.Add(element);
                }
            }
            return posArr;
        }

        static List<int> Find(Deleg deleg)
        {
            List<int> result = new List<int>();

            foreach (int elem in arr)
            {
                if (deleg(elem)) result.Add(elem);
            }

            return result;
        }

        static bool IsPositive(int number)
        {
            return number > 0;
        }
    }
}
