using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment3_0930321
{
    internal class Student: Person
    {
        public Student() { 
            
        }
        public void Study()
        {
            Console.WriteLine("I'm studying");
        }

        public void ShowAge()
        {
            Console.WriteLine("My age is: " + this.GetAge() + " years old" );
        }

    }
}
