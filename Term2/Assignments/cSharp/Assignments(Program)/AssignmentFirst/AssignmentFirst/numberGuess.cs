using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentFirst
{
    internal class numberGuess
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("**********************************");
            Console.WriteLine("----- Number Guessing Game! ------");
            Console.WriteLine("**********************************");
            int randomNumber = new Random().Next(1, 100);

            // Console.WriteLine(randomNumber);

            int guess = 0;
            int numberOfAttempts = 0;

            Console.WriteLine("Please guess the number between 1 and 100. Try to guess in few attempts!");

            // logic to check the guessed number (continue asking for the guess until it is correct)
            while (guess != randomNumber)
            {
                Console.WriteLine("What's your guess? ");

                // user's input and convert it to an integer
                string readGuess = Console.ReadLine();

                // converting the guess input from user into int using tryParse
                if (int.TryParse(readGuess, out guess))
                {
                    numberOfAttempts++;
                    Console.WriteLine($"Attempt {numberOfAttempts}");
                    if (guess >= 0 && guess <= 100)
                    {
                        if (guess < randomNumber)
                        {
                            Console.WriteLine("Your guess is too low! Try again!");
                        }
                        else if (guess > randomNumber)
                        {
                            Console.WriteLine("Your guess is too high! Try again!");
                        }
                        else
                        {
                            Console.WriteLine($"Yay!!! Congratulations! Your guess {guess} matched and you took {numberOfAttempts} tries.");
                        }
                    } 
                    else
                    {
                        Console.WriteLine("Please enter a number between 0 and 100");
                    }
                }
                else
                {
                    Console.WriteLine("Invalid input. Please enter a number between 1 and 100.");
                }
            }

        }
    }
}
