<template>
  <div class="user-reviews">
    <user-review-display
      v-for="review in reviews"
      v-bind:key="review.id"
      v-bind:review="review"
    />
  </div>
</template>

<script>
import UserService from "../services/UserService";
import UserReviewDisplay from "./UserReviewDisplay";

export default {
  name: "user-reviews",
  components: { UserReviewDisplay },

  data() {
    return { reviews: [] };
  },
  created() {
    UserService.getUserReviews(this.$store.state.user.userId).then((response) => {
      this.reviews = response.data;
    });
  },
};
</script>

<style>
</style>