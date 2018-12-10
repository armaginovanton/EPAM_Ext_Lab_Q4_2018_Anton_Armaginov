using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp_Task_3
{
    class TrianglePaint
    {
        public static void Paint() {
            int n;

            Console.WriteLine("Введите кол-во строк: ");//todo pn в ресурсы. Было бы проще добавлять новый язык. Нужно переписать все русские сообщения на английские иначе - невозможно проверить работоспособность.
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
                Console.WriteLine("Число не должно быть меньше 1");//todo pn сильная связность компонентов приложения
            }
        }

        public static void PaintDual()
        {
            int n;

            Console.WriteLine("Введите кол-во строк: ");
            if (!Int32.TryParse(Console.ReadLine(), out n)) { return; }

            if (n > 0)
            {
                string s = new String(' ',n);
                for (int i = 0; i < n; i++)
                {
                    s += "*";//todo pn в константы
                    s = s.Remove(n-i, 1).Insert(n-i, "*");
                    Console.WriteLine(s);
                }
            }
            else
            {
                Console.WriteLine("Число не должно быть меньше 1");
            }
        }

        public static void PaintFactorDual()
        {
            int n;

            Console.WriteLine("Введите кол-во строк: ");
            if (!Int32.TryParse(Console.ReadLine(), out n)) { return; }

            if (n > 0)
            {
                for (int j = 0; j <= n; j++)
                {
                    string s = new String(' ', n);
                    for (int i = 0; i < j; i++)
                    {
                        s += "*";//todo pn в константы
                        s = s.Remove(n - i, 1).Insert(n - i, "*");
                        Console.WriteLine(s);
                    }
                }
            }
            else
            {
                Console.WriteLine("Число не должно быть меньше 1");
            }
        }

    }
}
