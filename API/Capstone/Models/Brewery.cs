using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Brewery
    {
        public int BreweryId { get; set; }
        [Required(ErrorMessage = "Name is required.")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Street address is required.")]
        public string StreetAddress { get; set; }
        [Required(ErrorMessage = "City is required.")]
        public string City { get; set; }
        [Required(ErrorMessage = "Zip code is required.")]
        public string ZipCode { get; set; }
        public string PhoneNumber { get; set; }
        public string WebSiteUrl { get; set; }
        public string SocialUrl { get; set; }
        public string Description { get; set; } 
        public string IsPetFriendly { get; set; }
        public string LogoUrl { get; set; }
        public string TaproomPicture { get; set; }
        public bool IsActive { get; set; }

    }
}
