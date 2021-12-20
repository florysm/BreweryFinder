using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class BeersSqlDAO : IBeersDAO
    {
        private readonly string connectionString;
        public BeersSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public List<Beer> GetBeers()
        {
            List<Beer> allBeer = new List<Beer>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "select beer_id, beers.brewery_id , beers.name, " +
                        "abv, ibu, style, beers.description, isActive, breweries.name as brewery " +
                        "from beers join breweries on beers.brewery_id=breweries.brewery_id where beers.isActive = 1 order by breweries.name, beers.name";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Beer tempBeer = GetBeersFromReader(reader);
                        tempBeer.Brewery = Convert.ToString(reader["brewery"]);
                        allBeer.Add(tempBeer);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            return allBeer;
        }

        public List<Beer> GetBeersByBrewery(int breweryId)
        {
            List <Beer> beerOnTap = new List <Beer>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "select * from beers join breweries on beers.brewery_id = breweries.brewery_id where breweries.brewery_id=@breweryId and beers.isActive = 1";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@breweryId", breweryId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Beer tempBeer = GetBeersFromReader(reader);
                        beerOnTap.Add(tempBeer);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            return beerOnTap;
        }

        public Beer GetBeerById (int beerId)
        {
            Beer beer = new Beer();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "select beer_id, beers.brewery_id , beers.name, " +
                        "abv, ibu, style, beers.description, isActive, breweries.name as brewery " +
                        "from beers join breweries on beers.brewery_id=breweries.brewery_id  where beer_id=@beerId";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@beerId", beerId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        beer = GetBeersFromReader(reader);
                        beer.Brewery= Convert.ToString(reader["brewery"]);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            return beer;
        }

        public Beer AddBeer (Beer beerToAdd)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "insert into beers (brewery_id, name, abv, ibu, style, description, isActive) " +
                        "OUTPUT INSERTED.beer_id " +
                        "VALUES(@breweryid, @name, @abv, @ibu, @style, @description, @isActive)";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@breweryid", beerToAdd.BreweryID);
                    cmd.Parameters.AddWithValue("@name", beerToAdd.Name);
                    cmd.Parameters.AddWithValue("@abv", beerToAdd.ABV);
                    cmd.Parameters.AddWithValue("@ibu", beerToAdd.IBU);
                    cmd.Parameters.AddWithValue("@style", beerToAdd.Style);
                    cmd.Parameters.AddWithValue("@description", beerToAdd.Description);
                    cmd.Parameters.AddWithValue("@isActive", beerToAdd.isActive);
                    int newId = Convert.ToInt32(cmd.ExecuteScalar());
                    return GetBeerById(newId);
                }
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public Beer UpdateBeer(Beer updatedBeer)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "UPDATE beers SET name=@name, abv=@abv, " +
                        "ibu=@ibu, style=@style, description=@description, isActive=@isActive " +
                        "where beer_id=@beerId";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@name", updatedBeer.Name);
                    cmd.Parameters.AddWithValue("@abv", updatedBeer.ABV);
                    cmd.Parameters.AddWithValue("@ibu", updatedBeer.IBU);
                    cmd.Parameters.AddWithValue("@style", updatedBeer.Style);
                    cmd.Parameters.AddWithValue("@description", updatedBeer.Description);
                    cmd.Parameters.AddWithValue("@isActive", updatedBeer.isActive);
                    cmd.Parameters.AddWithValue("@beerid", updatedBeer.BeerID);
                    if (cmd.ExecuteNonQuery() == 0)
                    {
                        throw new Exception("Could not update the record.");
                    }
                    return GetBeerById(updatedBeer.BeerID);
                }
            }
            catch (Exception e)
            {
                throw;
            }
        }
        public void RemoveBeer(int beerID)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "UPDATE beers SET isActive=@isActive where beer_id=@beerId";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@beerid", beerID);
                    cmd.Parameters.AddWithValue("@isActive", 0);
                    cmd.ExecuteNonQuery();
                }
                
            }
            catch (Exception e)
            {
                throw;
            }
        }


        private Beer GetBeersFromReader(SqlDataReader reader)
        {
            Beer beer = new Beer
            {
                BeerID = Convert.ToInt32(reader["beer_id"]),
                BreweryID = Convert.ToInt32(reader["brewery_id"]),
                Name = Convert.ToString(reader["name"]),
                ABV = Convert.ToDouble(reader["abv"]),

            };
            if (Convert.IsDBNull(reader["ibu"]))
            {
                beer.IBU = 0;
            }
            else
            {
                beer.IBU = Convert.ToInt32(reader["ibu"]);
            }
            beer.Style = Convert.ToString(reader["style"]);
            if (Convert.IsDBNull(reader["description"]))
            {
                beer.Description = "";
            }
            else {
                beer.Description = Convert.ToString(reader["description"]);
                    }
            if (Convert.ToInt32(reader["isActive"]) == 0)
            {
                beer.isActive = false;
            }
            else
            {
                beer.isActive = true;
            }
            return beer;
        }
    }
}
