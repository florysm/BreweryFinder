using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Review
    {
        public int ReviewID { get; set; }
        public string Subject { get; set; }
        public string Description { get; set; }
        public double Rating { get; set; }
        public string Date { get; set; }
        public int BeerID { get; set; }
        public int UserID { get; set; }
        public string BeerName { get; set; }
        public string BreweryName { get; set; }
    }
}
