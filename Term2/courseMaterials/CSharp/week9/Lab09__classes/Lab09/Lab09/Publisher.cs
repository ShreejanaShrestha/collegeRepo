using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab09
{
    public class Publisher
    {
        public string Name { get; set; }
        public int YearFounded { get; set; }
        public string Founder { get; set; }
        public string Country { get; set; }
        public string History { get; set; }
        public string Website { get; set; }
        public Publisher() { }
        public Publisher(string name, int yearFounded)
        {
            Name = name;
            YearFounded = yearFounded;
        }
        public Publisher(string name, int yearFounded, string founder, string country, string history, string website)
        {
            Name = name;
            YearFounded = yearFounded;
            Founder = founder;
            Country = country;
            History = history;
            Website = website;
        }
    }
}
