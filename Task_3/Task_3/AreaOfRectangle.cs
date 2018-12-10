using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp_Task_3
{
    class AreaOfRectangle
    {
        public static void calculateArea()
        {
            int a;
            int b;

            Console.WriteLine("Write first number:");
            if (!Int32.TryParse(Console.ReadLine(), out a)) { return; }

            Console.WriteLine("Write second number:");
            if (!Int32.TryParse(Console.ReadLine(), out b)) { return; }

            if ((a > 0) & (b > 0))
            {
                Console.WriteLine("Square area: " + a * b);
            }
            else
            {
                Console.WriteLine("Side must not be less than 1");
            }

        }
    }
}
