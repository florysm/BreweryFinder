using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Beer
    {
        public int BeerID { get; set; }
        public int BreweryID { get; set; }
        [Required(ErrorMessage = "Name is required.")]
        public string Name { get; set; }
        [Required(ErrorMessage = "ABV is required.")]
        public double ABV { get; set; }
        public int IBU { get; set; }
        [Required(ErrorMessage = "Style is required.")]
        public string Style { get; set; }
        public string Description { get; set; }
        public bool isActive { get; set; }
        public string Brewery { get; set; }
    }
}
