using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BreweriesController : ControllerBase
    {
        private readonly IBreweriesDao breweriesDao;
        private readonly IUserDao userDao;

        public BreweriesController(IBreweriesDao _breweriesDao, IUserDao _userDao)
        {
            breweriesDao = _breweriesDao;
            userDao = _userDao;
        }
        [HttpGet]
        public IActionResult GetAllBreweries()
        {
            try
            {
                List<Brewery> allBreweries = new List<Brewery>(breweriesDao.GetBreweries());
                if (allBreweries.Count > 0)
                {
                    return Ok(allBreweries);
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

        [HttpGet("{id}")]
        public IActionResult GetBreweryById(int id)
        {
            try
            {
                Brewery brewery = breweriesDao.GetBreweryById(id);
                if (brewery != null)
                {
                    return Ok(brewery);
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
        public IActionResult AddBrewery(Brewery breweryToAdd)
        {
            try
            {
                Brewery newBrewery = breweriesDao.AddBrewery(breweryToAdd);
                return Created("Brewery added.",newBrewery);
            }
            catch
            {
                return StatusCode(500);
            }
        }
        [HttpPut ("{id}")]
        public IActionResult UpdateBrewery(Brewery updatedBrewery, int id)
        {
            if (id != updatedBrewery.BreweryId)
            {
                return BadRequest();
            }
            Brewery tempBrewery = breweriesDao.GetBreweryById(id);
            if (tempBrewery == null)
            {
                return NotFound("Could not find that brewery");
            }
            tempBrewery.BreweryId = id;
            if (breweriesDao.UpdateBrewery(updatedBrewery) == 0)
            {
                return StatusCode(500);
            }
            return Ok(breweriesDao.GetBreweryById(id));
            
        }
        [HttpPost("{breweryId}/brewers")]
        public IActionResult AddBrewer(int breweryId, ReturnUser newBrewer)
        {

            User newUser = userDao.GetUser(newBrewer.Username);
            try
            {
                if ((breweriesDao.AddBrewer(breweryId, newUser.UserId ))== 1)
                {
                    return Ok();
                }
                else
                {
                    return BadRequest();
                }
            }
            catch
            {
                return StatusCode(500);
            }
            
        }
        [HttpGet ("{breweryId}/brewers")]
        public IActionResult GetBrewersForBrewery(int breweryId)
        {
            try
            {
                List<ReturnUser> allBrewers = breweriesDao.GetBrewersForBrewery(breweryId);
                if (allBrewers.Count > 0)
                {
                    return Ok(allBrewers);
                }
                else
                {
                    return Ok();
                }
            }
            catch
            {
                return StatusCode(500);
            }
        }

    }
}
