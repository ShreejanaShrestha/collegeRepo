using System;

namespace Assignment4_bank_account
{
    internal class BankAccount
    {
        private string accountNumber;
        private double balance;
        private string ownerName;

        public BankAccount(string accountNumber, string ownerName, double initialBalance)
        {
            this.accountNumber = accountNumber;
            this.ownerName = ownerName;
            if (initialBalance >= 0)
            {
                this.balance = initialBalance;
            }
            else
            {
                throw new ArgumentException("Initial balance cannot be negative.");
            }
        }

        public double Balance
        {
            get { return balance; }
        }

        public string OwnerName
        {
            get { return ownerName; }
        }

        public void Deposit(double amount)
        {
            if (amount > 0)
            {
                balance += amount;
                Console.WriteLine($"Deposited: ${amount}");
            }
            else
            {
                Console.WriteLine("!!!!!!ERROR!!!!!!!!");
                Console.WriteLine("Deposit amount must be positive.\n");
            }
        }

        public void Withdraw(double amount)
        {
            if (amount > 0)
            {
                if (amount <= balance)
                {
                    balance -= amount;
                    Console.WriteLine($"Withdrew: ${amount}");
                }
                else
                {
                    Console.WriteLine("Insufficient funds.");
                }
            }
            else
            {
                Console.WriteLine("!!!!!!ERROR!!!!!!!!");
                Console.WriteLine("Withdrawal amount must be positive.");
            }
        }

        public double GetBalance()
        {
            return balance;
        }
    }
}
