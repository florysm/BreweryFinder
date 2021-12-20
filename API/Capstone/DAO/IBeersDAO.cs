using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public interface IBeersDAO
    {
        List <Beer> GetBeers();

        List<Beer> GetBeersByBrewery(int breweryId);

        Beer GetBeerById(int beerId);

        Beer AddBeer(Beer beerToAdd);
        Beer UpdateBeer(Beer updatedBeer);

        void RemoveBeer(int beerID);
    }
}
