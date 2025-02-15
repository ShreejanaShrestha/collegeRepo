using System;


namespace Assignment5_c0930321_Q1
{
    internal class SchoolProgram
    {
        static void Main(string[] args)
        {
            Person[] people = new Person[3];

            Console.Write("Question 1\n ------------------------------------\n");
            Console.Write("Enter the name of the first student: ");
            string student1Name = Console.ReadLine();
            people[0] = new Student(student1Name);

            Console.Write("Enter the name of the second student: ");
            string student2Name = Console.ReadLine();
            people[1] = new Student(student2Name);

            Console.Write("Enter the name of the teacher: ");
            string teacherName = Console.ReadLine();
            people[2] = new Teacher(teacherName);

            foreach (var person in people)
            {
                Console.WriteLine(person);
                if (person is Student student)
                {
                    student.Study();
                }
                else if (person is Teacher teacher)
                {
                    teacher.Explain();
                }
            }
        }
    }
}
