using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp_Task_3
{
    class Two_dimensional 
    {
        public static void SummEvent()
        {
            int[,] mass = new int[5, 10];
            Random rnd = new Random();
            for (int x = 0; x < mass.GetLength(0); x++)
            {
                for (int y = 0; y < mass.GetLength(1); y++)
                {
                    mass[x, y] = rnd.Next(200) - 100;
                    Console.Write(mass[x, y] + ", ");
                }
                Console.WriteLine();
            }

            int summ = 0;
            for (int x = 0; x < mass.GetLength(0); x++)
            {
                for (int y = 0; y < mass.GetLength(1); y++)
                {
                    if (IsEven(x + y)) { summ += mass[x,y]; }
                }
            }
            Console.WriteLine("The sum of even elements = " + summ);
        }

        static bool IsEven(int a)
        {
            return (a % 2) == 0;
        }
    }
}
