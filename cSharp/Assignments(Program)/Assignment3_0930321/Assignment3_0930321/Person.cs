using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment3_0930321
{
    internal class Person
    {
        private string name;
        private int age;

        public Person() {
            this.age = 20;
            this.name = "John";
        }

        public Person(string name)
        {
            this.name = name;
        }

        public Person(string name, int age)
        {
            this.name = name;
            this.age = age;
        }

        public void Greet()
        {
            Console.WriteLine("Hello " + this.name + "! Welcome to the coding Assignment!");
        }

        public int GetAge()
        {
            return age;
        }
        public int SetAge(int age)
        {
            this.age = age;
            return this.age;
        }

        public string SetName(string name)
        {
            this.name = name;
            return this.name;
        }
    }
}
