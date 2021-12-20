<template>
  <div id="profile-box">
    <h1 id="username-header" class="profileHeader">{{ $store.state.user.username }}'s BEER BIO</h1>
    <img id="user-logo" v-bind:src="returnUser.profilePicture" />
    <div class="user-info">
      <div id="user-age">Age: {{ returnUser.age }}</div>
      <div id="user-town">Hometown: {{ returnUser.hometown }}</div>
      <div id="fav-brew">
        Favorite Brewery: {{ returnUser.favoriteBrewery }}
      </div>
      <div id="fav-beer">
        Favorite Style of Beer: {{ returnUser.favoriteStyle }}
      </div>
      <!-- <div>Member Since: {{user.dateJoined}} </div> -->

      <div class="aboutInfo">
        Reviews from {{ $store.state.user.username }}:
      </div>
    </div>
  </div>
</template>

<script>
import UserService from "@/services/UserService";
export default {
  data() {
    return {
      returnUser: {},
    };
  },
  created() {
    UserService.getUserFromUsername(this.$store.state.user.username).then(
      (response) => {
        this.returnUser = response.data;
      }
    );
  },
};
</script>

<style>
#username-header {
  text-shadow: 4px 4px black;
}
.profileHeader {
  font-size: 50px;
  font-weight: bold;
  color: white;
}
.aboutInfo {
  color: white;
  font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
  font-size: 35px;
  font-weight: bold;
}
.aboutInfo2 {
  color: white;
  background-color: rgba(0, 0, 0, 0.866);
  font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
  height: 30%;
  width: 100%;
  overflow-y: scroll;
}
.favoriteBreweries {
  display: inline-flexbox;
  color: white;
  /* background-color:  rgba(0, 0, 0, 0.266); */
  font-weight: bold;
  font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
  font-size: 25px;
}
.favoriteBeers {
  display: inline-block;
  color: white;
  /* background-color:  rgba(0, 0, 0, 0.266); */
  font-weight: bold;
  font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
  font-size: 25px;
}

.user-info {
  color: white;
  font-size: 20px;
}

@media only screen and (max-width: 768px) {

  #user-logo {
    max-width: 130px;
  }

  .user-info {
    display: flex;
  }
}
</style>