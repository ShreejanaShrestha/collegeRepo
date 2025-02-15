using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace week9_class_and_objects
{
    internal class Student
    {
        private int Id;
        private string Name;
        private int Age;
        private string Major;
        private double GPA;

        public Student()
        {

        }
        public Student(int id, string name, int age, string major, double gpa) { 
            Id = id;
            Name = name;
            Age = age;
            Major = major;
            GPA = gpa;
        }

        public int getID() { return Id; }
    }
}
