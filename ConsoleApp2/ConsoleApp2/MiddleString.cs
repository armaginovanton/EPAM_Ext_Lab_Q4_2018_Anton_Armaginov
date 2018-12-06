using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp_Task_3
{
    class StringWork 
    {
        public static void MiddleString()
        {
            int allWordLength = 0;
            Console.WriteLine("Введите строку");
            string str1 = Console.ReadLine();
            string[] mas = str1.Split(new char[] { ' ', ',' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < mas.Length; i++)
            {
                allWordLength = allWordLength + mas[i].Length;
            }
            Console.WriteLine("Средняя длина строки = {0}", allWordLength / mas.Length);
        }

        public static void DoublingString()
        {
            string FirstString = "";
            string SecondString = "";
            string FinalString = "";
            Console.WriteLine("Введите первую строку");
            FirstString = Console.ReadLine();
            Console.WriteLine("Введите вторую строку");
            SecondString = Console.ReadLine();
            foreach (char ch in FirstString)
                if (!SecondString.Contains(ch))
                    FinalString += ch;
                else
                {
                    FinalString += ch;
                    FinalString += ch;
                }
            Console.WriteLine("Результат = {0}", FinalString);
        }
    }
}
