<template>
  <section>
    <form>
      <select name="dropdown">
        <option
          selected
          v-bind:brewery="brewery"
          v-for="brewery in breweries"
          v-bind:key="brewery.id"
        >
          {{ brewery.name }}
        </option>
      </select>
    </form>
  </section>
</template>

<script>
import breweryService from "../services/BreweryService";
export default {
  data() {
    return {
      breweries: [],
    };
  },
  created() {
    if (!this.$store.state.breweries) {
      breweryService.getBreweries().then((response) => {
        this.breweries = response.data;
        this.$store.commit("SET_BREWERIES", response.data);
      });
    } else {
      this.breweries = this.$state.store.breweries;
    }
  },
};
</script>

<style>
</style>