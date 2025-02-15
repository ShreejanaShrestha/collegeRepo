using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment2Q2_930321
{
    internal class Assignment2Q2
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("**************************************");
            Console.WriteLine("Question no. 2");
            Console.WriteLine("**************************************");

            Console.WriteLine("Welcome!");

            // asking user to choose a format
            Console.WriteLine("Enter 'c' for 10x15cm, anything else for 8x11in: ");
            string formatChoice = Console.ReadLine().ToLower();
            double costPerPicture = 0;

            if (formatChoice == "c")
            {
                costPerPicture = 0.20;
            }
            else
            {
                costPerPicture = 0.25;
            }

            // Asking if it is the first time the customer orders through the company
            Console.WriteLine("Is this your first time here? Type 'y' for 'yes': ");
            string isFirstTimeInput = Console.ReadLine().ToLower();
            bool isFirstTimeCustomer = isFirstTimeInput == "y";

            // Asking for the number of copies
            Console.WriteLine("Enter a number of copies: ");
            int numberOfCopies = int.Parse(Console.ReadLine());

            // Calculate the total cost
            double totalCost = numberOfCopies * costPerPicture;
            bool hasDiscount = false;

            if (numberOfCopies > 50)
            {
                totalCost *= 0.9; 
                hasDiscount = true;
            }

            bool hasCoupon = false;
            if (isFirstTimeCustomer && totalCost > 5)
            {
                totalCost -= 3; 
                hasCoupon = true;
            }

            Console.WriteLine("We cherish our new customers, so we are giving you a $3 discount! Your total is: $" + totalCost.ToString("F2"));

            if (hasDiscount)
            {
                Console.WriteLine("You had a 10% discount!");
            }

        }
    }
}
