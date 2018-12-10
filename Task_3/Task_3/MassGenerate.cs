using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp_Task_3
{
    class MassGenerate
    {
        static int[] mass = new int[50];

        public static void Generate()
        {
            Generate_mass();
            Console.WriteLine("Generated array: ");
            PrintArray(mass);
            Sort(mass);
            Console.WriteLine("Sorted array: ");
            PrintArray(mass);
            Console.WriteLine("Max value: "+Max(mass));
            Console.WriteLine("Min value: "+Min(mass));
        }

        public static void Summ()
        {
            int summ = 0;
            Generate_mass();
            PrintArray(mass);
            for (int i = 0; i < mass.Length; i++)
            {
                if (mass[i] > 0) { summ += mass[i]; }
            }
            Console.WriteLine("Sum of elements greater than zero = "+summ);
        }

        static void Generate_mass()
        {
            Random rnd = new Random();
            for (int i = 0; i < mass.Length; i++)
            {
                mass[i] = rnd.Next(200)-100;
            }
        }

        static int[] Sort(int[] mas)
        {

            for (int i = 0; i < mas.Length - 1; i++)
            {
                int min = i;
                for (int j = i + 1; j < mas.Length; j++)
                {
                    if (mas[j] < mas[min])
                    {
                        min = j;
                    }
                }
                int temp = mas[min];
                mas[min] = mas[i];
                mas[i] = temp;
            }
            return mas;
        }

        static int Max(int[] mas)
        {
            int max = mas[0];
            for (int i = 0; i < mas.Length - 1; i++)
            {
                if (mas[i] > max)
                {
                    max = mas[i];
                }
            }         
            return max;
        }

        static int Min(int[] mas)
        {
            int min = mas[0];
            for (int i = 0; i < mas.Length - 1; i++)
            {
                if (mas[i] < min)
                {
                    min = mas[i];
                }
            }
            return min;
        }

        static void PrintArray(int[] mas)
        {
            Console.Write(mas[0]);
            for (int i = 1; i < mas.Length - 1; i++)
            {
                Console.Write(", "+mas[i]);
            }
            Console.WriteLine();
        }
    }
}
