namespace Assignment5_Q5_c0930321
{
    internal class Student
    {
        private static double serviceTax = 12.3;
        public static double ServiceTax
        {
            get { return serviceTax; }
            set { serviceTax = value; }
        }

        public int RollNo { get; private set; }
        public string Name { get; private set; }
        public Course CourseJoined { get; private set; }
        public double FeePaid { get; private set; }

        public Student(int rollNo, string name, Course course)
        {
            RollNo = rollNo;
            Name = name;
            CourseJoined = course;
            FeePaid = 0;
        }

        public void Payment(double amount)
        {
            FeePaid += amount;
        }

        public double DueAmount
        {
            get { return TotalFee - FeePaid; }
        }

        public double TotalFee
        {
            get { return CourseJoined.GetTotalFee() * (1 + ServiceTax / 100); }
        }

        public void Print()
        {
            Console.WriteLine($"Roll No: {RollNo}\n, Name: {Name}\n, Course: {CourseJoined.Name}\n, Fee Paid: {FeePaid:C}\n, Due Amount: {DueAmount:C}\n");
        }
    }
}
