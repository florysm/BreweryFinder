<template>
  <div id="whole-add-brewery-form">
    <h1 id="add-brewery-title">Add Brewery</h1>
    <div>
    <form v-on:submit.prevent="submitForm" id="brewery-add-form">
      
        <div>
          <label for="name" class="add-brewery-element">
              Brewery Name:
          </label>
          <input
          id="breweryName"
          name="breweryName"
          type="text"
          v-model="breweryToAdd.name"/>
      </div>
          
      <div>
        <label for="streetAddress" class="add-brewery-element"
          >Street Address:</label
        >
        <input
          id="streetAddress"
          name="streetAddress"
          type="text"
          v-model="breweryToAdd.streetAddress"
        />
      </div>
      <div>
        <label for="city" class="add-brewery-element">City:</label>
        <input
          id="city"
          name="city"
          type="text"
          v-model="breweryToAdd.city"
        />
      </div>
      <div>
        <label for="zipCode" class="add-brewery-element">Zip Code:</label>
        <input
          id="zipCode"
          name="zipCode"
          type="text"
          v-model="breweryToAdd.zipCode"
        />
      </div>
      <div>
        <label for="phoneNumber" class="add-brewery-element"
          >Phone Number:</label
        >
        <input
          id="phoneNumber"
          name="phoneNumber"
          type="tel"
          v-model="breweryToAdd.phoneNumber"
        />
      </div>
      <div>
        <label for="websiteUrl" class="add-brewery-element">Website URL:</label>
        <input
          id="websiteUrl"
          name="websiteUrl"
          type="url"
          v-model="breweryToAdd.webSiteUrl"
        />
      </div>
      <div>
        <label for="socialUrl" class="add-brewery-element"
          >Social Media URL:</label
        >
        <input
          id="socialURL"
          name="socialURL"
          type="url"
          v-model="breweryToAdd.socialUrl"
        />
      </div>
      <div>
        <label for="description" class="add-brewery-element"
          >Description:</label
        >
        <input
          id="description"
          name="description"
          type="text"
          v-model="breweryToAdd.description"
        />
      </div>
      <div>
        <label for="isPetFriendly" class="add-brewery-element"
          >Pet Friendly?:</label
        >
        <input
          id="isPetFriendly"
          name="isPetFriendly"
          type="text"
          v-model="breweryToAdd.isPetFriendly"
        />
      </div>
      <div>
        <label for="logoURL" class="add-brewery-element">Logo URL:</label>
        <input
          id="logoURL"
          name="logoURL"
          type="url"
          v-model="breweryToAdd.logoUrl"
        />
      </div>
      <div>
        <label for="taproomPicture" class="add-brewery-element"
          >Taproom Picture URL:</label
        >
        <input
          id="taproomPicture"
          name="taproomPicture"
          type="url"
          v-model="breweryToAdd.taproomPicture"
        />
      </div>
      <div>
        <button class="btn btn-submit">Submit</button>
        <button
          class="btn btn-cancel"
          v-on:click.prevent="cancelForm"
          type="cancel"
        >
          Cancel
        </button>
      </div>
    </form>
    </div>
  </div>
</template>

<script>
import breweryService from "../services/BreweryService";
import brewerService from "../services/BrewerService";
export default {
  name: "add-brewery-form",
  data() {
    return {
      breweryToAdd: {},
      brewers:[],
    };
  },
  created(){
    brewerService.getBrewers().then((response)=>{
      this.brewers=response.data;
      this.brewers.forEach((brewer)=>{
        if(brewer.userId==this.$store.state.user.userId){
          this.$router.push({
              path: `/`,
              query: { registration: "success" },
                });
        }
      })
    })
  },
  methods: {
    submitForm() {
      if (this.$store.state.user.role.toLowerCase()=="brewer"){
        this.breweryToAdd.isActive=false;
      }
      else{
        this.breweryToAdd.isActive=true;
      }
      
      breweryService
        .addBrewery(this.breweryToAdd)
        .then((newBrewery) => {
          if (newBrewery.status == 201) {
            breweryService.addBrewer(this.$store.state.user,newBrewery.data.breweryId).then((response)=>{
              if(response.status==200){
                 this.$router.push({
              path: `/`,
              query: { registration: "success" },
                });
              }
            })
          }
        })
        .catch((error) => {
          const response = error.response;
          this.registrationErrors = true;
          if (response.status === 400) {
            this.registrationErrorMsg = "Bad Request: Validation Errors";
          }
        });
    },
  },
};
</script>

<style>
#whole-add-brewery-form{
  display:inline-block;
  font-weight:bold;
  background-color:rgba(0,0,0,.466);

}


</style>