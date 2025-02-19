using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab09
{
    public class Character : Person
    {
        public string Alias { get; set; }
        public string History { get; set; } // background story
        public List<string> Abilities { get; set; }
        public string Team { get; set; }
        public Person CreatedBy { get; set; }
        public Publisher PublishedBy { get; set; }
        public Character() { 
            Abilities = new List<string>();
            CreatedBy= new Person();
            PublishedBy = new Publisher();
        }

        public string ReturnCharacter()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Full Name: " + FirstName + " " + LastName);
            sb.AppendLine("Back Story:");
            sb.AppendLine(History);
            sb.AppendLine("Alias: " + Alias);
            sb.AppendLine("Created by: " + CreatedBy.FirstName + " " + CreatedBy.LastName);
            sb.AppendLine("Publisher: " + PublishedBy.Name);
            return sb.ToString();
        }
    }
}
