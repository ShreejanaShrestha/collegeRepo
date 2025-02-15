using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment3_0930321
{
    internal class StudentProfessorTest
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("************** Question I **************");
            Console.WriteLine("----------------------------------------");
            Person p1 = new Person("Raman", 25);
            p1.Greet();
            Console.WriteLine();

            Student s1 = new Student();
            s1.SetName("Nora");
            s1.SetAge(27);
            s1.Greet();
            s1.ShowAge();
            s1.Study();
            Console.WriteLine();

            Professor prof1 = new Professor();
            prof1.SetName("Prof. Veinna");
            prof1.SetAge(50);
            prof1.Greet();
            prof1.Explain();
        }
    }
}
