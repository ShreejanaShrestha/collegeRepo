using System;

namespace Assignment5_Q4_c0930321
{
    public abstract class Animal
    {
        public string Name { get; private set; }

        public void SetName(string name)
        {
            Name = name;
        }

        public string GetName()
        {
            return Name;
        }

        public abstract void Eat();
        
    }

    public class Dog : Animal
    {
        public override void Eat()
        {
            Console.WriteLine($"{GetName()} is eating.");
        }
    }
}
