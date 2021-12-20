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
    public class BeersController : ControllerBase
    {
        private readonly IBeersDAO beersDAO;

        public BeersController(IBeersDAO _beersDAO)
        {
            beersDAO = _beersDAO;
        }
        [HttpGet]
        public IActionResult GetAllBeers()
        {
            try
            {
                List<Beer> allBeers = new List<Beer>(beersDAO.GetBeers());
                if (allBeers.Count > 0)
                {
                    return Ok(allBeers);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (System.Exception)
            {
                return StatusCode(500);
            }
        }

        [HttpGet("brewery/{breweryId}")]
        public IActionResult GetBeerByBreweryId(int breweryId)
        {
            try
            {
                List<Beer> allBreweryBeers = new List<Beer>(beersDAO.GetBeersByBrewery(breweryId));
                if (allBreweryBeers.Count > 0)
                {
                    return Ok(allBreweryBeers);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (System.Exception)
            {
                return StatusCode(500);
            }
        }
        
        [HttpGet("{beerId}")]
        public IActionResult GetBeerDetails(int beerId)
        {
            try
            {
                Beer beer = beersDAO.GetBeerById(beerId);
                if (beer != null)
                {
                    return Ok(beer);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (System.Exception)
            {
                return StatusCode(500);
            }
        }
        
        [HttpPost]
        public IActionResult AddBeer(Beer beerToAdd)
        {
            try
            {
                Beer newBeer = beersDAO.AddBeer(beerToAdd);
                return Ok(newBeer);
            }
            catch
            {
                return StatusCode(500);
            }
        }

        [HttpPut ("{beerId}")]
        public IActionResult UpdateBeerDetails(Beer beerToUpdate, int beerId)
        {
            try
            {
                if(beerId != beerToUpdate.BeerID)
                {
                    return BadRequest();
                }
                Beer tempBeer = beersDAO.GetBeerById(beerId);
                if(tempBeer == null)
                {
                    return NotFound("Could not find that beer");
                }
                tempBeer.BeerID = beerId;
                beersDAO.UpdateBeer(beerToUpdate);
                return Ok(beersDAO.GetBeerById(beerId));
            }
            catch
            {
                return BadRequest();
            }
        }
        //[HttpPut("{beerId}")]
        //public IActionResult RemoveBeer(int beerId)
        //{
        //    try
        //    {
        //        beersDAO.RemoveBeer(beerId);
        //        return Ok("Beer removed");
        //    }
        //    catch
        //    {
        //        return BadRequest();
        //    }
        //}
    }
}
