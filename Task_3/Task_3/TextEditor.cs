using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp_Task_3
{
    class TextEditor
    {
        public static bool bold=false;
        public static bool italic=false;
        public static bool underline=false;

        public static void Edit()
        {   
            if (bold)
            {
                 if (italic){
                    if (underline){
                        Console.WriteLine("Font options: bold, italic, underline");
                    }
                    else { Console.WriteLine("Font options: bold, italic"); }
                }
                else if (underline){
                    Console.WriteLine("Font options: bold, underline");
                }
                else { Console.WriteLine("Font options: bold"); }
            } else if (italic) {
                if (underline){
                    Console.WriteLine("Font options: italic, underline");
                }
                else { Console.WriteLine("Font options: italic"); }
            } else if (underline) {
                Console.WriteLine("Font options: underline");
            } else { Console.WriteLine("Font options: none"); }

            Console.WriteLine("Enter: ");
            Console.WriteLine("        1: bold");
            Console.WriteLine("        2: italic");
            Console.WriteLine("        3: underline");

            int selectType;
            if (!Int32.TryParse(Console.ReadLine(), out selectType))
            {
                selectType = 0;
            }

            switch (selectType)
            {
                case 1:
                    bold = !bold;
                    break;
                case 2:
                    italic = !italic;
                    break;
                case 3:
                    underline = !underline;
                    break;
                default:
                    Console.WriteLine("Invalid index entered!");
                    break;
            }
        }
    }
}
