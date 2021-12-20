using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Capstone.Models;
using Capstone.Security;
using Capstone.Security.Models;

namespace Capstone.DAO
{
    public class UserSqlDao : IUserDao
    {
        private readonly string connectionString;

        public UserSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        
        public User GetUser(string username)
        {
            User returnUser = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT user_id, username, " +
                        "password_hash, salt, user_role, email_address, " +
                        "users.is_active, age, hometown, favorite_brewery_id, " +
                        "favorite_style, date_joined, profile_picture FROM users " +
                        "WHERE username = @username", conn);
                    cmd.Parameters.AddWithValue("@username", username);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        returnUser = GetUserFromReader(reader);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnUser;
        }

        public List<ReturnUser> GetAllUsers()
        {
            List<ReturnUser> allUsers = new List<ReturnUser>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "select * from users";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        ReturnUser tempUser = new ReturnUser()
                        {
                            UserId = Convert.ToInt32(reader["user_id"]),
                            Username = Convert.ToString(reader["username"]),
                           
                            Role = Convert.ToString(reader["user_role"]),
                            EmailAddress = Convert.ToString(reader["email_address"]),
                            IsActive = Convert.ToBoolean(reader["is_active"])
                        };
                        allUsers.Add(tempUser);
                    }
                }
            }
            catch(Exception)
            {
                throw;
            }
            return allUsers;
        }
        public ReturnUser GetReturnUser(string username)
        {
            ReturnUser user = new ReturnUser();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "SELECT user_id, username, " +
                        "user_role, email_address, " +
                        "users.is_active, age, hometown, name as favorite_brewery, " +
                        "favorite_style, date_joined, profile_picture FROM users " +
                        "join breweries on users.favorite_brewery_id=breweries.brewery_id " +
                        "WHERE username = @username and users.is_active=1";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@username", username);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        ReturnUser tempUser = new ReturnUser()
                        {
                            UserId = Convert.ToInt32(reader["user_id"]),
                            Username = Convert.ToString(reader["username"]),
                            Role = Convert.ToString(reader["user_role"]),
                            EmailAddress = Convert.ToString(reader["email_address"]),
                            IsActive = Convert.ToBoolean(reader["is_active"]),
                            Age = Convert.ToInt32(reader["age"]),
                            Hometown = Convert.ToString(reader["hometown"]),
                            FavoriteBrewery = Convert.ToString(reader["favorite_brewery"]),
                            FavoriteStyle = Convert.ToString(reader["favorite_style"]),
                            DateJoined = Convert.ToString(reader["date_joined"]),
                            ProfilePicture = Convert.ToString(reader["profile_picture"])

                        };
                        user = tempUser;
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
            return user;
        }

        public User AddUser(string username, string password, string role, string emailAddress, bool isActive, int age, string hometown, int favoriteBreweryId, string favoriteStyle, string profilePicture)
        {
            IPasswordHasher passwordHasher = new PasswordHasher();
            PasswordHash hash = passwordHasher.ComputeHash(password);

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO users (username, password_hash, salt, user_role, email_address, is_active, age, hometown, favorite_brewery_id, favorite_style, profile_picture) " +
                        "VALUES (@username, @password_hash, @salt, @user_role, @email_address, @is_active, @age, @hometown, @favorite_brewery_id, @favorite_style, @profile_picture)", conn);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password_hash", hash.Password);
                    cmd.Parameters.AddWithValue("@salt", hash.Salt);
                    cmd.Parameters.AddWithValue("@user_role", role);
                    cmd.Parameters.AddWithValue("@email_address", emailAddress);
                    cmd.Parameters.AddWithValue("@is_active", isActive);
                    if (age == 0)
                    {
                        cmd.Parameters.AddWithValue("@age", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@age", age);
                    }
                    if (hometown == null)
                    {
                        cmd.Parameters.AddWithValue("@hometown", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@hometown", hometown);
                    }
                    if (favoriteBreweryId == 0)
                    {
                        cmd.Parameters.AddWithValue("@favorite_brewery_id", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@favorite_brewery_id", favoriteBreweryId);
                    }
                    if (favoriteStyle == null)
                    {
                        cmd.Parameters.AddWithValue("@favorite_style", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@favorite_style", favoriteStyle);
                    }
                    if (profilePicture == null)
                    {
                        cmd.Parameters.AddWithValue("@profile_picture", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@profile_picture", profilePicture);
                    }

                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return GetUser(username);
        }
        public int GetUserIdFromUsername(string userName)
        {
            int userId=-1;
            try
            {
                using (SqlConnection conn=new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "select user_id from users where username = @username";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@username", userName);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        userId = Convert.ToInt32(reader["user_id"]);
                    }
                    return userId;
                }
            }
            catch(Exception e)
            {
                throw;
            }
        }
        
        private User GetUserFromReader(SqlDataReader reader)
        {
            User u = new User()
            {
                UserId = Convert.ToInt32(reader["user_id"]),
                Username = Convert.ToString(reader["username"]),
                PasswordHash = Convert.ToString(reader["password_hash"]),
                Salt = Convert.ToString(reader["salt"]),
                Role = Convert.ToString(reader["user_role"]),
                EmailAddress = Convert.ToString(reader["email_address"]),
                IsActive = Convert.ToBoolean(reader["is_active"]),
                
               
               
                
                ProfilePicture=Convert.ToString(reader["profile_picture"])
        };
            if (Convert.IsDBNull(reader["age"]))
            {
                u.Age = 0;
            }
            else
            {
                u.Age = Convert.ToInt32(reader["age"]);
            }
            if (Convert.IsDBNull(reader["hometown"]))
            {
                u.Hometown = null;
            }
            else
            {
                u.Hometown = Convert.ToString(reader["hometown"]);
            }
            if (Convert.IsDBNull(reader["favorite_brewery_id"]))
            {
                u.FavoriteBreweryId = 0;
            }
            else
            {
                u.FavoriteBreweryId = Convert.ToInt32(reader["favorite_brewery_id"]);
            }
            if (Convert.IsDBNull(reader["favorite_style"]))
            {
                u.FavoriteStyle = null;
            }
            else
            {
                u.FavoriteStyle = Convert.ToString(reader["favorite_style"]);
            }
            if (Convert.IsDBNull(reader["date_joined"]))
            {
                u.DateJoined = null;
            }
            else
            {
                u.DateJoined = Convert.ToString(reader["date_joined"]);
            }
            if (Convert.IsDBNull(reader["profile_picture"]))
            {
                u.ProfilePicture = null;
            }
            else
            {
                u.ProfilePicture = Convert.ToString(reader["profile_picture"]);
            }
            return u;
        }
    }
}
