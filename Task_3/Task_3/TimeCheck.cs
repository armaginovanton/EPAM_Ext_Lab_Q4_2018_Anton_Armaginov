using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp_Task_3
{
    class TimeCheck
    {
        public static void Cakculate()
        {
            string str = "";
            StringBuilder sb = new StringBuilder();
            int N = 100;
            for (int j = 1; j < 4; j++)
            {
                N *= 10^j;
                DateTime start = DateTime.Now;
                for (int i = 0; i < N; i++)
                {
                    str += "*";
                }
                DateTime end = DateTime.Now;
                Console.WriteLine("String concatenation time in string = {0}", end - start);

                DateTime start1 = DateTime.Now;
                for (int i = 0; i < N; i++)
                {
                    sb.Append("*");
                }
                DateTime end1 = DateTime.Now;
                Console.WriteLine("String concatenation time in stringBuilder = {0}", end1 - start1);
                Console.WriteLine("StringBuilder concatenation time is { 0} times faster when N = {1}", 
                                    (end.Millisecond - start.Millisecond) / (end1.Millisecond - start1.Millisecond), N);
            }
        }
    }
}
