using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public interface IBreweriesDao
    {
        Brewery GetBreweryById(int breweryId);
        List<Brewery> GetBreweries();
        Brewery AddBrewery(Brewery breweryToAdd);
        int AddBrewer(int breweryId, int userId);
        int UpdateBrewery(Brewery updatedBrewery);
        List<ReturnUser> GetBrewersForBrewery(int breweryId);
    }
}
