using System;


namespace Assigmnent_Q3_c0930321
{
        public class Car : IVehiculo
        {
            private int gasoline;

            public Car(int initialGasoline)
            {
                gasoline = initialGasoline;
            }

            public void Drive()
            {
                if (gasoline > 0)
                {
                    Console.WriteLine("The car is driving.");
                    gasoline--; 
                }
                else
                {
                    Console.WriteLine("Cannot drive, the car is out of gasoline.");
                }
            }

            public bool Refuel(int amount)
            {
                if (amount > 0)
                {
                    gasoline += amount;
                    Console.WriteLine($"Car refueled with {amount} units of gasoline.");
                    return true;
                }
                else
                {
                    Console.WriteLine("Invalid amount of gasoline to refuel.");
                    return false;
                }
            }

            public int GetGasoline()
            {
                return gasoline;
            }
        }
    }

