using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public interface IUserDao
    {
        User GetUser(string username);
        List<ReturnUser> GetAllUsers();
        User AddUser(string username, string password, string role, string emailAddress, bool isActive, int age, string hometown, int favoriteBreweryId, string favorite_style, string profile_picture);
        int GetUserIdFromUsername(string userName);
        ReturnUser GetReturnUser(string username);
    }
}
