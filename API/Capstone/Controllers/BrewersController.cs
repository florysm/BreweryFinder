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
    public class BrewersController : ControllerBase
    {
        private readonly IBrewersDao brewersDao;
        

        public BrewersController(IBrewersDao _brewersDao)
        {
            brewersDao = _brewersDao;
        }
        [HttpGet]
        public IActionResult GetAllBrewers()
        {
            try
            {
                List<Brewer> allBrewers = new List<Brewer>(brewersDao.GetAllBrewers());
                if (allBrewers.Count > 0)
                {
                    return Ok(allBrewers);
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
    }
}
