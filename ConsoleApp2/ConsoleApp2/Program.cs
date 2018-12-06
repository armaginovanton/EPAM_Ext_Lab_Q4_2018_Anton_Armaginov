using System;

namespace ConsoleApp_Task_3
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                
                int task_num;
                Console.Clear();
                Console.WriteLine("Введите код задачи");
                if (!Int32.TryParse(Console.ReadLine(), out task_num)) {
                    task_num = 0;
                    }

                while (true)
                {
                    switch (task_num)
                    {
                        case 0:
                            Console.Clear();
                            Console.WriteLine("Введите код задачи");
                            break;
                        case 1:
                            AreaOfRectangle.calculateArea();
                            break;
                        case 2:
                            TrianglePaint.Paint();
                            break;
                        case 3:
                            TrianglePaint.PaintDual();
                            break;
                        case 4:
                            TrianglePaint.PaintFactorDual();
                            break;
                        case 5:
                            Multiplies_of_3_and_5.Calculate();
                            break;
                        case 6:
                            TextEditor.Edit();
                            break;
                        case 7:
                            MassGenerate.Generate();
                            break;
                        case 8:
                            Three_dimensional.Replacement();
                            break;
                        case 9:
                            MassGenerate.Summ();
                            break;
                        case 10:
                            Two_dimensional.SummEvent();
                            break;
                        case 11:
                            StringWork.MiddleString();
                            break;
                        case 12:
                            StringWork.DoublingString();
                            break;
                        case 13:
                            TimeCheck.Cakculate();
                            break;
                        default:
                            Console.Clear();
                            Console.WriteLine("Вы ввели не верный код");
                            break;
                    }

                ConsoleKeyInfo task_keyKode = Console.ReadKey();
                if (task_keyKode.KeyChar == 27)
                {
                    break;
                }
            }

            ConsoleKeyInfo keyKode = Console.ReadKey();
                if (keyKode.KeyChar == 27)
                {
                    break;
                }
            }
        }
    }
}
