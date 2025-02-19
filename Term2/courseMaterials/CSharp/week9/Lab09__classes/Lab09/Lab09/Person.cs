using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab09
{
    public class Person
    {
        private string Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DateOfBirth{ get; set; }
       
        public int Age
        {
            get
            {
                return DateTime.Now.Year - DateOfBirth.Year;
            }
        }
        
        // default constructor 
        public Person() 
        {
            Id = "999999999";
            FirstName = "John";
            LastName = "Doe";
            DateOfBirth = DateTime.Now;

        }
        public string GetId()
        {
            return "*** *** " + Id.Substring(6, 3);
        }
        public Person(string id, string fname, string lname, DateTime dateOfBirth)
        {
            Id = id;
            FirstName= fname; 
            LastName= lname;
            DateOfBirth = dateOfBirth;
        }
    }
}
