using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task_6_2
{
    class Program
    {
        static void Main(string[] args)
        {
            Office office = new Office();
            office.add("Misha", 3);
            office.add("Masha", 15);
            office.add("Kate", 22);

            office.del(1);
            office.del(0);
            office.del(0);

            Console.ReadKey();
        }

        class Office
        {
            List<Person> Persons = new List<Person>();

            public delegate void personCame(Person person, int time);
            public event personCame onPersonCame;

            public delegate void personOut(Person person);
            public event personOut onpersonOut;

            public void add(string name, int time)
            {
                Person per = new Person { Name = name };
                Console.WriteLine("[{0} come in]", per.Name);
                if (Persons.Count > 0) onPersonCame(per, time);
                onPersonCame += per.Hello;
                onpersonOut += per.GoodBye;
                Persons.Add(per);
            }

            public void del(int id)
            {
                if (Persons.Count < id) return;
                Person per = Persons[id];
                Persons.RemoveAt(id);
                Console.WriteLine("[{0} is out]", per.Name);
                onPersonCame -= per.Hello;
                onpersonOut -= per.GoodBye;
                if (Persons.Count > 0) onpersonOut(per);
            }
        }

        class Person
        {
            public string Name { get; set; }

            public void Hello(Person person, int time)
            {
                if (time <= 12)
                    Console.WriteLine("'Good morning', {0}, - said {1}", person.Name, Name);
                else
                    if (time <= 17)
                    Console.WriteLine("'Good day', {0}, - said {1}", person.Name, Name);
                else
                    Console.WriteLine("'Good evening', {0}, - said {1}", person.Name, Name);
            }
            public void GoodBye(Person person)
            {
                Console.WriteLine("'Good bye, {0}!' - said {1}", person.Name, Name);
            }
        }
    }
}
