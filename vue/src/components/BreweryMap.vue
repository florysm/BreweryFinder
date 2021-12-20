<template>
  <div class="mapBox">
    <!-- <img v-if="mapImg != null" :src="mapImg" /> -->
    <a :href="`${mapLink}`"> <img v-if="mapImg != null" :src="mapImg" /> </a>
    <p>{{brewery.streetAddress}}  {{brewery.city}}, PA {{brewery.zipCode}}</p>
    <!-- <div class="links">
    Directions: <a :href="'${mapLink}'"> MapQuest</a>
    </div> -->
  </div>
</template>

<script>
// import MapService from "@/services/MapService";
import BreweryService from "@/services/BreweryService";
export default {
  data() {
    return {
      brewery: {},
      mapImg: null,
      mapLink: "https://www.mapquest.com/search/result?query=",
    };
  },
  created() {
    BreweryService.getBrewery(this.$route.params.id)
      .then((response) => {
        this.brewery = response.data;
        let address = this.brewery.streetAddress + " " + this.brewery.zipCode;
        this.mapLink += this.brewery.name;
        this.mapImg =
          "https://www.mapquestapi.com/staticmap/v5/map?key=aGA4InIeew5ebXzyjnmNIG76uSSPlGxl&size=600,300&zoom=17&showicon=mcenter&locations=" +
          address;
      })
      .catch((error) => {
        if (error.response && error.response.status === 404) {
          alert("Error loading brewery info");
          this.$router.push("/");
        }
      });

    // MapService.getBreweryMap(address)
    //   .then((response) => {
    //     this.mapImg = response.data;
    //   })
    //   .catch((error) => {
    //     if (error.response) {
    //       alert("Error loading map data");
    //     }
    //   });
  },
  methods: {
    
  }
};
</script>

<style>
</style>