using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReviewsController : ControllerBase
    {
        private readonly IReviewsDAO reviewsDAO;
        public ReviewsController(IReviewsDAO _reviewsDAO)
        {
            reviewsDAO = _reviewsDAO;
        }
        [HttpGet("beer/{beerId}")]
        public IActionResult GetReviewsByBeerId(int beerId)
        {
            try
            {
                List<Review> allBeerReviews = new List<Review>(reviewsDAO.GetAllReviewsByBeer(beerId));
                if(allBeerReviews.Count > 0)
                {
                    return Ok(allBeerReviews);
                }
                else
                {
                    return NotFound("No reviews found for this beer.");
                }
            }
            catch (System.Exception)
            {
                return StatusCode(500);
            }
        }

        [HttpGet("user/{userId}")]
        public IActionResult GetReviewsByUserId(int userId)
        {
            try
            {
                List<Review> allUserReviews = new List<Review>(reviewsDAO.GetAllReviewsByUser(userId));
                if (allUserReviews.Count > 0)
                {
                    return Ok(allUserReviews);
                }
                else
                {
                    return NotFound("You have not reviewed any beer.");
                }
            }
            catch (System.Exception)
            {
                return StatusCode(500);
            }
        }
        [HttpGet("topthree/{beerId}")]
        public IActionResult GetTopThreeReviewsByBeer(int beerId)
        {
            try
            {
                List<Review> threeBeerReviews = new List<Review>(reviewsDAO.GetTopThreeReviewsByBeer(beerId));
                if (threeBeerReviews.Count > 0)
                {
                    return Ok(threeBeerReviews);
                }
                else
                {
                    return NotFound("No reviews found for this beer.");
                }
            }
            catch (System.Exception)
            {
                return StatusCode(500);
            }
        }
        [HttpPost("add")]
        public IActionResult AddNewReview(Review review)
        {
            try
            {
                Review newReview = reviewsDAO.AddReview(review);
                return Ok(newReview);
            }
            catch
            {
                return StatusCode(500);
            }
        }
    }
}
