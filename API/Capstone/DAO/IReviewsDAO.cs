using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public interface IReviewsDAO
    {
        public List<Review> GetAllReviewsByUser(int userId);

        public List<Review> GetTopThreeReviewsByBeer(int beerId);
        public List<Review> GetAllReviewsByBeer(int beerId);
        public Review AddReview(Review reviewToAdd);

    }
}
