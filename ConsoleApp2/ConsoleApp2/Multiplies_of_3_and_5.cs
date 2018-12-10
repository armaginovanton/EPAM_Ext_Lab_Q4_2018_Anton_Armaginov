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
            while (iterValue < n) { summ += iterValue; iterValue = iter++ * 5; }//todo pn я говорил, что нужно написать универсальное решение, а не для конкретного случая.
            iter = 0;
            iterValue = 0;
            while (iterValue < n) { summ += iterValue; iterValue = iter++ * 3; }

            Console.WriteLine("Сумма чисел кратных 3 или 5 и меньше 1000 равна "+summ);
        }
    }
}
