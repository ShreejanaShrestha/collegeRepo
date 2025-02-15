using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment2_930321
{
    internal class Assignment2
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("************************************");
            Console.WriteLine("Q.1 Mortgage Payment Calculator");
            Console.WriteLine("************************************");
            // taking inputs from user
            double loanAmount = GetValidDoubleInput("Enter the loan amount: ", 100000, 10000000);
            double interestRate = GetValidDoubleInput("Enter the annual interest rate: ", 0.25, 25);
            int years = GetValidIntInput("Enter the loan term: ", 15, 35);
            double downPayment = GetValidDoubleInput("Enter the down payment: ", 0, loanAmount);

            // call the function to calculate the mortgage
            double monthlyMortgagePayment = CalculateMonthlyMortgagePayment(loanAmount, interestRate, years, downPayment);
            Console.WriteLine($"Your monthly mortgage payment is: {monthlyMortgagePayment:C}");

            Console.WriteLine("************************************");
            Console.WriteLine("Q.2 ");
            Console.WriteLine("************************************");

        }

        public static double GetValidDoubleInput(string prompt, double min, double max)
        {
            double value;
            bool isValid = false;

            do
            {
                Console.Write(prompt);
                string input = Console.ReadLine();

                if (double.TryParse(input, out value))
                {
                    if (value >= min && value <= max)
                    {
                        isValid = true;
                    }
                    else
                    {
                        Console.WriteLine($"Value must be between {min} and {max}.");
                    }
                }
                else
                {
                    Console.WriteLine("Invalid input. Please enter a numeric value.");
                }
            } while (!isValid);

            return value;
        }

        public static int GetValidIntInput(string prompt, int min, int max)
        {
            int value;
            bool isValid = false;

            do
            {
                Console.Write(prompt);
                string input = Console.ReadLine();

                if (int.TryParse(input, out value))
                {
                    if (value >= min && value <= max)
                    {
                        isValid = true;
                    }
                    else
                    {
                        Console.WriteLine($"Value must be between {min} and {max}.");
                    }
                }
                else
                {
                    Console.WriteLine("Invalid input. Please enter an integer value.");
                }
            } while (!isValid);

            return value;
        }

        public static double CalculateMonthlyMortgagePayment(double loanAmount, double interestRate, int years, double downPayment)
        {
            double monthlyInterestRate = interestRate / 12 / 100;
            double monthlyLoanTerm = years * 12;
            // double intermediate = Math.Pow((1 + interestRate), monthlyLoanTerm);
            double remainingLoanAmount = loanAmount - downPayment;

            double mortgageAmount = remainingLoanAmount * (monthlyInterestRate * Math.Pow(1 + monthlyInterestRate, monthlyLoanTerm)) /
                                    (Math.Pow(1 + monthlyInterestRate, monthlyLoanTerm) - 1);
            return mortgageAmount;
        }

    }
}
