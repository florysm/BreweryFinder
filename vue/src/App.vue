<template>
  <div id="app">
    <div id="nav">
      <div id="left-group">
        <img id="beer-icon" src="@/assets/beer-icon.png" />
        <router-link v-bind:to="{ name: 'home' }" class="toplink"
          >Home
        </router-link>
        &nbsp; | &nbsp;
        <router-link
          v-bind:to="{ name: 'logout' }"
          class="toplink"
          v-if="$store.state.token != ''"
        >
          Logout</router-link
        >
        &nbsp; | &nbsp;
        <router-link
          v-bind:to="{ name: 'login' }"
          class="toplink"
          v-if="$store.state.token == ''"
          >Login</router-link
        >
        &nbsp; | &nbsp;

        <router-link
          v-bind:to="{ name: 'admin' }"
          class="toplink"
          v-if="$store.state.user.role == 'admin'"
        >
          Admin
        </router-link>
        &nbsp; | &nbsp;

        <router-link
          v-bind:to="{ name: 'register' }"
          v-if="$store.state.token == ''"
          class="toplink"
          >Register</router-link
        >
        <!-- &nbsp; | &nbsp; -->
      </div>

      <div id="search-bar">
        <search-site />
      </div>
    </div>
    <router-view />
  </div>
</template>

<script>
import SearchSite from "./components/SearchSite.vue";
export default {
  components: { SearchSite },
};
</script>

<style>
html {
  background: url("assets/Background1.png") no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
#app {
  font-style: Helvetica;
  /* max-width: 250px; */
  margin: auto;
  padding: 0px;
  /* height: 100vh; */
  /* background-image: url("assets/Background1.png");
  background-repeat: no-repeat;
  background-size:cover;
  background-attachment: fixed; */
}
#nav {
  display: flex;
  justify-content: space-between;
  padding-left: 10px;
  padding-right: 10px;
  text-align: left;
  background-color: black;
}

#left-group {
  display: flex;
}

.toplink {
  font-size: large;
  color: white;
}
#beer-icon {
  max-height: 30px;
  width: auto;
  padding-right: 10px;
}
</style>