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
                Console.WriteLine("время конкатенации строк в string = {0}", end - start);

                DateTime start1 = DateTime.Now;
                for (int i = 0; i < N; i++)
                {
                    sb.Append("*");
                }
                DateTime end1 = DateTime.Now;
                Console.WriteLine("время конкатенации строк в stringBuilder = {0}", end1 - start1);
                Console.WriteLine("время конкатенации в stringBuilder быстрее в {0} раз при N  = {1}", (end - start) / (end1 - start1), N);
            }
        }
    }
}
