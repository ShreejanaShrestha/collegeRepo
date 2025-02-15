using System;

namespace labSessionWeek5
{
    class labSession
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("************ Exercise 1 **************");
            Console.WriteLine("Use of random method / get user Input");
            Console.WriteLine("---------------------------------------");
            Console.WriteLine("Enter your name: ");
            string name = Console.ReadLine();
            Console.WriteLine("Welcome " + name + "!!!");

            Console.WriteLine("************ Exercise 2 **************");
            Console.WriteLine("program to get 10 values (positive integer numbers only.)");
            Console.WriteLine("----------------------------------------");

            int[] numArray = new int[10];
            for(int i = 0; i < 10; i++)
            {
                Console.WriteLine("Enter positive integer number: ");
                numArray[i] = int.Parse(Console.ReadLine());
            }
            

            Console.WriteLine("********** Exercise 3 ******************");
            Console.WriteLine("Finding even and odd in the above inputed numbers.");
            Console.WriteLine("----------------------------------------");
            for (int j = 0; j < 10; j++)
            {
                if (numArray[j] % 2 == 0)
                {
                    Console.WriteLine(numArray[j] + " is even.");
                }
                else
                {
                    Console.WriteLine(numArray[j] + " is odd.");
                }
            }

            Console.WriteLine("*********** Exercise 4 ****************");
            Console.WriteLine("Counting even/odd numbers found in the above input.");
            Console.WriteLine("---------------------------------------");
            int evenCount = 0, oddCount = 0;
            for(int i = 0; i < 10; i++)
            {
                if (numArray[i] % 2 == 0)
                {
                    evenCount++;
                } else
                {
                    oddCount++;
                }
            }
            Console.WriteLine("There are " + evenCount + " even numbers and " + oddCount + " odd numbers.");

            Console.WriteLine("----------------------------------------");
            Console.WriteLine("Use of METHODS");
            Console.WriteLine("*************** Exercise 5 ***************");
            Console.WriteLine("Use Method to find even/odd number");
            int[] even = new int[] { };
            int[] odd = new int[] { };
            even = findEvenOdd(numArray, even, odd);
            even(even);
            odd(odd);
        }

        public static int findEvenOdd(int[] numbers, int[] even, int[] odd)
        {
            
            for (int i = 0;i < numbers.Length; i++)
            {
                if (numbers[i] % 2 == 0)
                {
                    Console.WriteLine(numbers[i] + " is even");
                    even[i] = numbers[i];
                } 
                else
                {
                    Console.WriteLine(numbers[i] + " is odd");
                    odd[i] = numbers[i];
                }
            }
            return even;
        }

        public static void Even(int[] evenNumbers)
        {

        }

        public static void Odd(int[] oddNumbers)
        {

        }

        public static void Greatest(evenSum, oddSum) { 
        }
    }
}
