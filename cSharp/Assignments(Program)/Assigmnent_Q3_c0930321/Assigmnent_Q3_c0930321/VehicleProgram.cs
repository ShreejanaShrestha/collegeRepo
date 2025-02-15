using System;


namespace Assigmnent_Q3_c0930321
{
    internal class VehicleProgram
    {
        static void Main(string[] args)
        {
            Car car = new Car(0);

            Console.WriteLine("Question 3 \n----------------------------- \n");
            Console.WriteLine("Enter the amount of gasoline to refuel:");
            if (int.TryParse(Console.ReadLine(), out int amount))
            {
                car.Refuel(amount);
            }
            else
            {
                Console.WriteLine("Invalid input. Please enter a valid integer.");
            }

            car.Drive();

            Console.WriteLine($"Remaining gasoline: {car.GetGasoline()} units.");
        }
    }
}
