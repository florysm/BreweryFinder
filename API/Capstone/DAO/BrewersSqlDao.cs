using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class BrewersSqlDao: IBrewersDao
    {
        private readonly string connectionString;
        public BrewersSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public List<Brewer> GetAllBrewers()
        {
            List<Brewer> allBrewers = new List<Brewer>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "select * from brewers";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Brewer tempBrewer = new Brewer()
                        {
                            BreweryId = Convert.ToInt32(reader["brewery_id"]),
                            UserId = Convert.ToInt32(reader["user_id"])
                        };
                        allBrewers.Add(tempBrewer);
                    }

                }
            }
            catch(Exception e)
            {
                throw;
            }
            return allBrewers;
        }
    }
}
