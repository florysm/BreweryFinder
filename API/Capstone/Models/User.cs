using System;
using System.ComponentModel.DataAnnotations;

namespace Capstone.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string Username { get; set; }
        public string PasswordHash { get; set; }
        public string Salt { get; set; }
        public string Role { get; set; }
        public string EmailAddress { get; set; }
        public bool IsActive { get; set; }
        public int Age { get; set; }
        public string Hometown { get; set; }
        public int FavoriteBreweryId { get; set; }
        public string FavoriteStyle { get; set; }
        public string DateJoined { get; set; }
        public string ProfilePicture { get; set; }

    }

    /// <summary>
    /// Model of user data to return upon successful login
    /// </summary>
    public class ReturnUser
    {
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Role { get; set; }
        public string EmailAddress { get; set; }
        public bool IsActive { get; set; }
        public int Age { get; set; }
        public string Hometown { get; set; }
        public string FavoriteBrewery { get; set; }
        public string FavoriteStyle { get; set; }
        public string DateJoined { get; set; }
        public string ProfilePicture { get; set; }
    }

    /// <summary>
    /// Model to return upon successful login (user data + token)
    /// </summary>
    public class LoginResponse
    {
        public ReturnUser User { get; set; }
        public string Token { get; set; }
    }

    /// <summary>
    /// Model to accept login parameters
    /// </summary>
    public class LoginUser
    {
        [Required]
        public string Username { get; set; }
        [Required]
        public string Password { get; set; }
    }

    /// <summary>
    /// Model to accept registration parameters
    /// </summary>
    public class RegisterUser
    {
        [Required]
        public string Username { get; set; }
        [Required]
        public string Password { get; set; }
        [Compare("Password")]
        public string ConfirmPassword { get; set; }
        public string Role { get; set; }

        public string EmailAddress { get; set; }
        public bool IsActive { get; set; }
        public int Age { get; set; }
        public string Hometown { get; set; }
        public int FavoriteBreweryId { get; set; }
        public string FavoriteStyle { get; set; }
        public string DateJoined { get; set; }
        public string ProfilePicture { get; set; }

    }
}
