<template>
  <section>
    <form>

      <!-- <a type="submit" v-show="isSearch" @click="showAll">Show All Breweries</a> -->
              <input
          class="searchBar"
          type="text"
          v-model="searchString"
          placeholder="Search Sitewide"
        />
      <select name="dropdown">
        <input
          class="searchBar"
          type="text"
          v-model="searchString"
          placeholder="Search Sitewide"
        />
      </select>
      <option
          selected
          v-bind:beer="brewery"
          v-for="brewery in breweries"
          v-bind:key="brewery.id"
        >
          {{ brewery.name }}
        </option>
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
    if (!this.$store.state.breweries != []) {
      breweryService.getBreweries().then((response) => {
        this.breweries = response.data;
        this.$store.commit("SET_BREWERIES", response.data);
      });
    } else {
      this.breweries = this.$state.store.breweries;
    }
  },
  methods: {
    search() {
      const query = this.searchString;
      this.$store.commit("SET_SEARCH_QUERY", query);
      this.searchString = "";
      this.isSearch = true;
    },
    showAll() {
      this.$store.commit("RESET_SEARCH_QUERY");
      this.isSearch = false;
    },
  },
};
</script>

<style>
</style>