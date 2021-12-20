<template>
<section>
  <div class="beer-container">
      
      <beer-card v-bind:beer="beer" v-for="beer in beers" v-bind:key="beer.id" />
  </div> 
</section>

</template>

<script>
import beerService from '../services/BeerService';
import BeerCard from './BeerCard.vue';
export default {
  components: { BeerCard },
    data() {
        return {
            beers: [],
            
        };
    },
    created() {
      if(this.$store.state.breweries != [])
        beerService.getBeerByBrewery(this.$route.params.id).then(response => {
            this.beers = response.data;
        })
        .catch(error => {
          if (error.response && error.response.status === 404) {
            alert(
              "Error loading beer info"
            );
            this.$router.push("/");
          }
        })
    }
};
</script>

<style>
.beer-container {
    display:flex;
    flex-direction: row;
    justify-content: space-evenly;
    flex-wrap:wrap
}
</style>