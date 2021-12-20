using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class ReviewsSqlDao : IReviewsDAO
    {
        private readonly string connectionString;
        public ReviewsSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public Review GetReview(int reviewId)
        {
            Review review = new Review(); 
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "select * from beer_reviews where review_id=@reviewId";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@reviewId", reviewId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        review = GetReviewsFromReader(reader);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            return review;

        }
        public List<Review> GetAllReviewsByBeer(int beerId)
        {
            List<Review> allReviews = new List<Review>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "select * from beer_reviews join beers on beer_reviews.beer_id = beers.beer_id where beer_reviews.beer_id = @beerId order by review_id desc";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@beerId", beerId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Review tempReview = GetReviewsFromReader(reader);
                        allReviews.Add(tempReview);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            return allReviews;
        }
        public List<Review> GetTopThreeReviewsByBeer(int beerId)
        {
            List<Review> allReviews = new List<Review>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "select top 3 * from beer_reviews join beers on beer_reviews.beer_id = beers.beer_id where beer_reviews.beer_id = @beerId";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@beerId", beerId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Review tempReview = GetReviewsFromReader(reader);
                        allReviews.Add(tempReview);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            return allReviews;
        }

        public List<Review> GetAllReviewsByUser(int userId)
        {
            List<Review> allReviews = new List<Review>();
           
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "select beer_reviews.subject, beer_reviews.description, beer_reviews.rating, beer_reviews.date, beers.name as beer_name, breweries.name as brewery_name " +
                        "from beer_reviews join beers on beer_reviews.beer_id = beers.beer_id join breweries on " +
                        "beers.brewery_id = breweries.brewery_id where beer_reviews.user_id = @userId";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@userId", userId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Review tempReview = new Review();
                        tempReview.Subject = Convert.ToString(reader["subject"]);
                        tempReview.Description = Convert.ToString(reader["description"]);
                        tempReview.Rating = Convert.ToDouble(reader["rating"]);
                        tempReview.Date = Convert.ToDateTime(reader["date"]).ToString("MM-dd-yyyy");
                        tempReview.BeerName = Convert.ToString(reader["beer_name"]);
                        tempReview.BreweryName = Convert.ToString(reader["brewery_name"]);
                        allReviews.Add(tempReview);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            return allReviews;
        }
        public Review AddReview(Review reviewToAdd)
        {
           
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sqlString = "insert into beer_reviews (subject, description, rating, date, beer_id, user_id) output inserted.review_id " +
                        "values (@subject, @description, @rating, @date, @beer_id, @user_id)";
                    SqlCommand cmd = new SqlCommand(sqlString, conn);
                    cmd.Parameters.AddWithValue("@subject", reviewToAdd.Subject);
                    cmd.Parameters.AddWithValue("@description", reviewToAdd.Description);
                    cmd.Parameters.AddWithValue("@rating", reviewToAdd.Rating);
                    cmd.Parameters.AddWithValue("@date", reviewToAdd.Date);
                    cmd.Parameters.AddWithValue("@beer_id", reviewToAdd.BeerID);
                    cmd.Parameters.AddWithValue("@user_id", reviewToAdd.UserID);
                    int newId = Convert.ToInt32(cmd.ExecuteScalar());
                    return GetReview(newId);
                }
            }
            catch (Exception e)
            {
                throw;
            }
        }

        //public int GetAverageRatingByBeer(int beerId)
        //{
        //    Review review = new Review();
        //    try
        //    {
        //        using (SqlConnection conn = new SqlConnection(connectionString))
        //        {
        //            conn.Open();
        //            string sqlString = "select AVG(rating) as avg_rating from beer_reviews where beer_id = @beerId";
        //            SqlCommand cmd = new SqlCommand(sqlString, conn);
        //            cmd.Parameters.AddWithValue("@beerId", beerId);
        //            SqlDataReader reader = cmd.ExecuteReader();
        //           if (reader.Read())
        //            {

        //            }
        //        }
        //    }
        //}

        private Review GetReviewsFromReader(SqlDataReader reader)
        {
            Review review = new Review
            {
                ReviewID = Convert.ToInt32(reader["review_id"]),
                Subject = Convert.ToString(reader["subject"]),
                Description = Convert.ToString(reader["description"]),
                Rating = Convert.ToDouble(reader["rating"]),
                Date = Convert.ToDateTime(reader["date"]).ToString("MM-dd-yyyy"),
                BeerID = Convert.ToInt32(reader["beer_id"]),
                UserID = Convert.ToInt32(reader["user_id"]),
                
            };
            return review;
        }
    }
}
