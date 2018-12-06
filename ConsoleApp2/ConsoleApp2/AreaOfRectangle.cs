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

            Console.WriteLine("Введите первое число:");
            if (!Int32.TryParse(Console.ReadLine(), out a)) { return; }

            Console.WriteLine("Введите второе число:");
            if (!Int32.TryParse(Console.ReadLine(), out b)) { return; }

            if ((a > 0) & (b > 0))
            {
                Console.WriteLine("Площадь квадрата: " + a * b);
            }
            else
            {
                Console.WriteLine("Сторона не должна быть меньше 1");
            }

        }
    }
}
