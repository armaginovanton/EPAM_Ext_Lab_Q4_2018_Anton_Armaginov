using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp_Task_3
{
    class TrianglePaint
    {
        public static void Paint() {
            int n;

            Console.WriteLine("Enter the number of lines: ");
            if (!Int32.TryParse(Console.ReadLine(), out n)) { return; }

            if (n > 0)
            {
                string s="";
                for(int i=0; i < n; i++)
                {
                    s += "*";
                    Console.WriteLine(s);
                }
            }
            else
            {
                Console.WriteLine("Side must not be less than 1");
            }
        }

        public static void PaintDual()
        {
            int n;

            Console.WriteLine("Enter the number of lines: ");
            if (!Int32.TryParse(Console.ReadLine(), out n)) { return; }

            if (n > 0)
            {
                string s = new String(' ',n);
                for (int i = 0; i < n; i++)
                {
                    s += "*";
                    s = s.Remove(n-i, 1).Insert(n-i, "*");
                    Console.WriteLine(s);
                }
            }
            else
            {
                Console.WriteLine("Side must not be less than 1");
            }
        }

        public static void PaintFactorDual()
        {
            int n;

            Console.WriteLine("Enter the number of lines: ");
            if (!Int32.TryParse(Console.ReadLine(), out n)) { return; }

            if (n > 0)
            {
                for (int j = 0; j <= n; j++)
                {
                    string s = new String(' ', n);
                    for (int i = 0; i < j; i++)
                    {
                        s += "*";
                        s = s.Remove(n - i, 1).Insert(n - i, "*");
                        Console.WriteLine(s);
                    }
                }
            }
            else
            {
                Console.WriteLine("Side must not be less than 1");
            }
        }

    }
}
