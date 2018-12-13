using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp_Task_3
{
    class Three_dimensional
    {

        public static void Replacement()
        {
            int[,,] mass = new int[3, 3, 3];

            Random rnd = new Random();
            for (int x = 0; x < mass.GetLength(0); x++)
                for (int y = 0; y < mass.GetLength(1) ; y++)
                    for (int z = 0; z < mass.GetLength(2); z++)
                        mass[x, y, z] = rnd.Next(200)-100;

            for (int x = 0; x < mass.GetLength(0); x++)
            {
                for (int y = 0; y < mass.GetLength(1); y++)
                {
                    for (int z = 0; z < mass.GetLength(2); z++)
                    {
                        if (mass[x, y, z] > 0) { mass[x, y, z] = 0; }
                        Console.Write(mass[x, y, z] + ", ");
                    }
                    Console.WriteLine();
                }
                Console.WriteLine(); Console.WriteLine();
            }

        }
        
    }
}
