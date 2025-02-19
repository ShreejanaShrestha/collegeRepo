namespace Lab09
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Person person1 = new Person("123654789", "Bruce", "Wayne", new DateTime(1999, 10, 20));
            Character c1 = new Character();
            
            //person1.Id = 1;
            //person1.Name = "Bruce Wayne";
            //person1.DateOfBirth = new DateTime(1999, 10, 20);

            Person person2 = new Person("545365789", "Barry", "Allen", new DateTime(2001, 11, 21));


            //Console.WriteLine(person1.FirstName);
            //Console.WriteLine("Age: "+ person1.Age);
            //Console.WriteLine("Id: " + person1.GetId());

            //Person person3 = new Person();
            //Console.WriteLine(person3.Name);
            //Console.WriteLine("Age: " + person3.Age);
            //Console.WriteLine("Id: " + person3.GetId());

            Character ironman = new Character();
            ironman.FirstName = "Tony";
            ironman.LastName = "Stark";
            ironman.DateOfBirth = new DateTime(1945, 12, 12);
            ironman.Alias = "Ironman";
            ironman.History = "Tony Stark is the wealthy son of industrialist and weapons manufacturer Howard Stark and his wife, Maria. Tony grew up a genius with a brilliant mind for technology and inventions and, naturally, followed in his father’s footsteps, inheriting Stark Industries upon his parents’ untimely death. Tony designed many weapons of war for Stark Industries, far beyond what any other company was creating, while living the lifestyle of a bon vivant.\r\n\r\n";
            ironman.Abilities.Add("Powered armor suit");
            ironman.Abilities.Add("Intelligence");
            ironman.Team = "Avengers";
            ironman.CreatedBy = new Person("569856546", "Gautam", "Beri", new DateTime(1857, 10, 19));
            ironman.PublishedBy = new Publisher("Marvel", 1901);
            Console.WriteLine(ironman.ReturnCharacter());
            
        }
    }
}
