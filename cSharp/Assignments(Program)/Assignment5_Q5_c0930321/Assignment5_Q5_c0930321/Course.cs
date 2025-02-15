namespace Assignment5_Q5_c0930321
{
    public abstract class Course
    {
        public string Name { get; private set; }
        public int Duration { get; private set; }
        public double CourseFee { get; private set; }

        public Course(string name, int duration, double courseFee)
        {
            Name = name;
            Duration = duration;
            CourseFee = courseFee;
        }

        public abstract double GetTotalFee();

        public virtual void Print()
        {
            Console.WriteLine($"Course: {Name}, Duration: {Duration} months, Course Fee: {CourseFee:C}\n");
        }
    }

    class PartTimeCourse : Course
    {
        public string Timing { get; private set; }

        public PartTimeCourse(string name, int duration, double courseFee, string timing)
            : base(name, duration, courseFee)
        {
            Timing = timing;
        }

        public override double GetTotalFee()
        {
            return CourseFee * 0.9;
        }

        public override void Print()
        {
            base.Print();
            Console.WriteLine($"Timing: {Timing}");
        }
    }

    class OnsiteCourse : Course
    {
        public string CompanyName { get; private set; }
        public int NumberOfCandidates { get; private set; }

        public OnsiteCourse(string name, int duration, double courseFee, string companyName, int numberOfCandidates)
            : base(name, duration, courseFee)
        {
            CompanyName = companyName;
            NumberOfCandidates = numberOfCandidates;
        }

        public override double GetTotalFee()
        {
            return CourseFee * 1.1;
        }

        public override void Print()
        {
            base.Print();
            Console.WriteLine($"Company: {CompanyName},\n Number of Candidates: {NumberOfCandidates}\n");
        }

    }
}
