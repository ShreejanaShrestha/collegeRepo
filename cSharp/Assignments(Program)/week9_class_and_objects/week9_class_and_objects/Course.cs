using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace week9_class_and_objects
{
    internal class Course
    {
        private string courseCode;
        private string title;
        private string instructor;
        private int credits;

        public Course() { }

        public Course(string code, string title, string instructor, int credit)
        {
            courseCode = code;
            this.title = title;
            this.instructor = instructor;
            credits = credit;
        }

        public string Name { 
            get { return courseCode; }
            set { courseCode = value; }
        }

    }
}
