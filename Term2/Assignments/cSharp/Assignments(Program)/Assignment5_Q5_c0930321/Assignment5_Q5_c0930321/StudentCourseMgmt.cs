namespace Assignment5_Q5_c0930321
{
    internal class StudentCourseMgmt
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Question 5\n Student Course Management\n-----------------------------------\n");
            // Creating courses
            Course csharpCourse = new PartTimeCourse("C#", 6, 2000, "Evening");
            Course aspNetCourse = new OnsiteCourse("ASP.NET", 4, 3000, "ABC Corp", 10);
            Course pythonCourse = new PartTimeCourse("Python", 5, 1500, "Morning");

            // Creating students
            Student student1 = new Student(1, "Alish", csharpCourse);
            Student student2 = new Student(2, "Alishma", aspNetCourse);
            Student student3 = new Student(3, "Karishma", pythonCourse);

            // Simulate payments flow
            student1.Payment(500);
            student2.Payment(1000);
            student3.Payment(1500);

            // Printing student details
            student1.Print();
            student2.Print();
            student3.Print();

            // Printing course details
            csharpCourse.Print();
            aspNetCourse.Print();
            pythonCourse.Print();
        }
    }
}
