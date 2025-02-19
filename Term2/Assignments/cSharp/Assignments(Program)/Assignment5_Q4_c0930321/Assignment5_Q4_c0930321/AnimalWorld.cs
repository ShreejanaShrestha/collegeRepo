using System;


namespace Assignment5_Q4_c0930321
{
    internal class AnimalWorld
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Question 4\n-----------------------------\n");
            Console.WriteLine("Enter the dog's name:");
            string dogName = Console.ReadLine();

            Dog dog = new Dog();
            dog.SetName(dogName);

            Console.WriteLine($"The dog's name is: {dog.GetName()}");
            dog.Eat();
        }
    }
}
