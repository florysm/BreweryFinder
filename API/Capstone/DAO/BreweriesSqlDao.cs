using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class BreweriesSqlDao : IBreweriesDao
    {
        private readonly string connectionString;
        public BreweriesSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public List<Brewery> GetBreweries()
        {
            List<Brewery> allBreweries = new List<Brewery>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "select * from breweries";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Brewery tempBrewery = GetBreweryFromReader(reader);
                        allBreweries.Add(tempBrewery);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            return allBreweries;
        }
        public Brewery GetBreweryById(int breweryId)
        {
            Brewery foundBrewery = new Brewery();
            try
            {
                using(SqlConnection conn=new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "select * from breweries where brewery_id=@breweryId";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@breweryId", breweryId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        foundBrewery = GetBreweryFromReader(reader);
                    }
                }
            } 
            catch(Exception e)
            {
                Console.WriteLine(e.Message);
            }
            return foundBrewery;
        }
        public Brewery AddBrewery(Brewery breweryToAdd)
        {
            try
            {
                using (SqlConnection conn=new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "insert into breweries (name, street_address, city, zip_code , phone_number, website_url, social_url, description, is_pet_friendly, logo_url, taproom_picture, is_active) " +
                        "OUTPUT INSERTED.brewery_id " +
                        "VALUES(@name, @street_address, @city, @zip_code, @phone_number, @website_url, @social_url, @description, @is_pet_friendly, @logo_url, @taproom_picture, @is_active)";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                   
                    if (breweryToAdd.Description == null)
                    {
                         cmd.Parameters.AddWithValue("@description", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@description", breweryToAdd.Description);
                    }
                    if (breweryToAdd.PhoneNumber == null)
                    {
                        cmd.Parameters.AddWithValue("@phone_number", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@phone_number", breweryToAdd.PhoneNumber);
                    }
                    if (breweryToAdd.WebSiteUrl == null)
                    {
                        cmd.Parameters.AddWithValue("@website_url", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@website_url", breweryToAdd.WebSiteUrl);
                    }
                    if (breweryToAdd.SocialUrl == null)
                    {
                        cmd.Parameters.AddWithValue("@social_url", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@social_url", breweryToAdd.SocialUrl);
                    }
                    if (breweryToAdd.IsPetFriendly == null)
                    {
                        cmd.Parameters.AddWithValue("@is_pet_friendly", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@is_pet_friendly", breweryToAdd.IsPetFriendly);
                    }
                    if (breweryToAdd.LogoUrl == null)
                    {
                        cmd.Parameters.AddWithValue("@logo_url", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@logo_url", breweryToAdd.LogoUrl);
                    }
                    if (breweryToAdd.TaproomPicture == null)
                    {
                        cmd.Parameters.AddWithValue("@taproom_picture", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@taproom_picture", breweryToAdd.TaproomPicture);
                    }
                    cmd.Parameters.AddWithValue("@name", breweryToAdd.Name);
                    cmd.Parameters.AddWithValue("@street_address", breweryToAdd.StreetAddress);
                    cmd.Parameters.AddWithValue("@city", breweryToAdd.City);
                    cmd.Parameters.AddWithValue("@zip_code", breweryToAdd.ZipCode);
                    cmd.Parameters.AddWithValue("@is_active", breweryToAdd.IsActive);
                    int newId = Convert.ToInt32(cmd.ExecuteScalar());
                    return GetBreweryById(newId);
                }
            }
            catch(Exception e)
            {
                throw;
            }
        }
        public int AddBrewer(int breweryId,int userId )
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "insert into brewers (brewery_id, user_id)" +
                        " VALUES(@brewerId, @userId)";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@brewerId", breweryId);
                    cmd.Parameters.AddWithValue("@userId", userId);
                    return cmd.ExecuteNonQuery();
                    


                }
            }
            catch(Exception e)
            {
                throw;
            }
        }
        
        public int UpdateBrewery(Brewery updatedBrewery)
        {
            try
            {
                using(SqlConnection conn=new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "UPDATE breweries SET name=@name, street_address=@streetAddress, " +
                        "city=@city, zip_code=@zipCode, phone_number=@phoneNumber, website_url=@websiteUrl, " +
                        "social_url=@socialUrl, description=@description, " +
                        "is_pet_friendly=@isPetFriendly, logo_url=@logoUrl,taproom_picture=@taproomPicture, is_active=@isActive " +
                        "where brewery_id=@breweryId";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@name", updatedBrewery.Name);
                    cmd.Parameters.AddWithValue("@streetAddress", updatedBrewery.StreetAddress);
                    cmd.Parameters.AddWithValue("@city", updatedBrewery.City);
                    cmd.Parameters.AddWithValue("@zipCode", updatedBrewery.ZipCode);
                    cmd.Parameters.AddWithValue("@phoneNumber", updatedBrewery.PhoneNumber);
                    cmd.Parameters.AddWithValue("@socialUrl", updatedBrewery.SocialUrl);
                    cmd.Parameters.AddWithValue("@description", updatedBrewery.Description);
                    cmd.Parameters.AddWithValue("@isPetFriendly", updatedBrewery.IsPetFriendly);
                    cmd.Parameters.AddWithValue("@logoUrl", updatedBrewery.LogoUrl);
                    cmd.Parameters.AddWithValue("@isActive", updatedBrewery.IsActive);
                    cmd.Parameters.AddWithValue("@breweryId", updatedBrewery.BreweryId);
                    cmd.Parameters.AddWithValue("@websiteUrl", updatedBrewery.WebSiteUrl);
                    cmd.Parameters.AddWithValue("@taproomPicture", updatedBrewery.TaproomPicture);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected == 0)
                    {
                        throw new Exception("Could not update the record.");
                    }
                    return rowsAffected;
                }
            }
            catch(Exception e)
            {
                throw;
            }
        }
        public List<ReturnUser> GetBrewersForBrewery(int breweryId)
        {
            List<ReturnUser> allBrewers = new List<ReturnUser>();
            try
            {
                using (SqlConnection conn=new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "select b.user_id, username, user_role, email_address, is_active" +
                        " from users as u join " +
                        "brewers as b on u.user_id =b.user_id " +
                        "where brewery_id=@breweryId";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@breweryId", breweryId);
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
                        allBrewers.Add(tempUser);
                    }
                }
            }
            catch(Exception e)
            {
                throw;
            }
            return allBrewers;
        }
        private Brewery GetBreweryFromReader(SqlDataReader reader)
        {
            Brewery brewery = new Brewery
            {
                BreweryId = Convert.ToInt32(reader["brewery_id"]),
                Name = Convert.ToString(reader["name"]),
                StreetAddress = Convert.ToString(reader["street_address"]),
                City = Convert.ToString(reader["city"]),
                ZipCode = Convert.ToString(reader["zip_code"]),
                PhoneNumber = Convert.ToString(reader["phone_number"]),
                WebSiteUrl = Convert.ToString(reader["website_url"]),
                SocialUrl = Convert.ToString(reader["social_url"]),
                Description = Convert.ToString(reader["description"]),
                IsPetFriendly = Convert.ToString(reader["is_pet_friendly"]),
                LogoUrl = Convert.ToString(reader["logo_url"]),
                TaproomPicture = Convert.ToString(reader["taproom_picture"])


            };
            if( Convert.ToInt32(reader["is_active"]) == 0)
            {
                brewery.IsActive = false;
            }
            else
            {
                brewery.IsActive = true;
            }
            return brewery;
        }
    }
}
