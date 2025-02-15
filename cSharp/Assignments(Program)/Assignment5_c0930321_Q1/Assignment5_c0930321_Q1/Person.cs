using System;


namespace Assignment5_c0930321_Q1
{
    internal class Person
    {
        public string Name { get; private set; }

        public Person(string name)
        {
            Name = name;
        }

        public override string ToString()
        {
            return Name;
        }
    }

    internal class Student : Person
    {
        public Student(string name) : base(name)
        {
        }

        public void Study()
        {
            Console.WriteLine($"{Name} is studying.");
        }
    }

    internal class Teacher : Person
    {
        public Teacher(string name) : base(name)
        {
        }

        public void Explain()
        {
            Console.WriteLine($"{Name} is explaining.");
        }
    }
}
