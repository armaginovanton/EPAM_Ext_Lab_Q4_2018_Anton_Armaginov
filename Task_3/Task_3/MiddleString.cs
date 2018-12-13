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
            Console.WriteLine("Write line");
            string str1 = Console.ReadLine();
            string[] mas = str1.Split(new char[] { ' ', ',' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < mas.Length; i++)
            {
                allWordLength = allWordLength + mas[i].Length;
            }
            Console.WriteLine("Middle length = {0}", allWordLength / mas.Length);
        }

        public static void DoublingString()
        {
            string FirstString = "";
            string SecondString = "";
            string FinalString = "";
            Console.WriteLine("Write first line");
            FirstString = Console.ReadLine();
            Console.WriteLine("Write second line");
            SecondString = Console.ReadLine();
            foreach (char ch in FirstString)
                if (!SecondString.Contains(ch.ToString()))
                    FinalString += ch;
                else
                {
                    FinalString += ch;
                    FinalString += ch;
                }
            Console.WriteLine("Result = {0}", FinalString);
        }
    }
}
