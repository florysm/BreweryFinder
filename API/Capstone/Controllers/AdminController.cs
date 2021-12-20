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
    public class AdminController : ControllerBase
    {
        private readonly IUserDao userDao;
        private readonly IBreweriesDao breweriesDao;
        public AdminController(IUserDao _userDao, IBreweriesDao _breweriesDao)
        {
            userDao = _userDao;
            breweriesDao = _breweriesDao;
        }
        [HttpGet]
        public IActionResult ListAllUsers()
        {
            try
            {
                List<ReturnUser> allUsers = new List<ReturnUser>(userDao.GetAllUsers());
                if (allUsers.Count > 0)
                {
                    return Ok(allUsers);
                } else
                {
                    return NotFound();
                }
            }
            catch (System.UnauthorizedAccessException)
            {
                return StatusCode(401);
            }
            catch (System.Exception)
            {
                return StatusCode(500);
            }
        }
        [HttpGet ("{username}")]
        public IActionResult GetUserById(string username)
        {
            try
            {
                ReturnUser user = userDao.GetReturnUser(username);
                if (user != null)
                {
                    return Ok(user);
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
