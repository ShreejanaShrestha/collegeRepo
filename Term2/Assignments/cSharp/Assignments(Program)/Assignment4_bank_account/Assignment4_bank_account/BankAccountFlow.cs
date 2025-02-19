using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment4_bank_account
{
    internal class BankAccountFlow
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("********* Bank Account Flow *********\n");

            BankAccount account = new BankAccount("123456789", "Shreejana Shrestha", 1400);
            // Displaying initial account information(name and current amount)
            Console.WriteLine($"Account Owner: {account.OwnerName}");
            Console.WriteLine($"Initial Balance: ${account.GetBalance()}");
            Console.WriteLine();

            // Bank account operations flow
            account.Deposit(-100);

            account.Deposit(500);
            Console.WriteLine($"Balance after deposit: ${account.GetBalance()}");

            account.Withdraw(200);
            Console.WriteLine($"Balance after withdrawal: ${account.GetBalance()}");

            account.Withdraw(1500);
            Console.WriteLine($"Balance after attempted over-withdrawal: ${account.GetBalance()}");
        }
    }
}
