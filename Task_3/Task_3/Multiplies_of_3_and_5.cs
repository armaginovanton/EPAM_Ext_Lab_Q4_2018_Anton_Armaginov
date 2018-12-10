using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp_Task_3
{
    class Multiplies_of_3_and_5
    {
        public static void Calculate()
        {
            int n = 1000;
            int summ = 0;
            int iter = 0;
            int iterValue = 0;
            while (iterValue < n) { summ += iterValue; iterValue = iter++ * 5; }
            iter = 0;
            iterValue = 0;
            while (iterValue < n) { if (iterValue % 5 != 0){summ += iterValue; } iterValue = iter++ * 3; }

            Console.WriteLine("The sum of multiples of 3 or 5 and less than 1000 is "+summ);
        }
    }
}
