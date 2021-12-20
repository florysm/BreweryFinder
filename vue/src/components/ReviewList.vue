<template>
  <div id="reviews-list">
    <review-display
      v-for="review in reviews"
      v-bind:key="review.id"
      v-bind:review="review"
    />
  </div>
</template>

<script>
import BeerReviewService from "../services/BeerReviewService";
import ReviewDisplay from "./ReviewDisplay";

export default {
  name: "review-list",
  components: { ReviewDisplay },

  data() {
    return { reviews: [] };
  },
  created() {
    BeerReviewService.getAllReviews(this.$route.params.id).then((response) => {
      this.reviews = response.data;
      this.$store.commit("SET_REVIEWS", response.data)
    });
  },
};
</script>

<style>
#reviews-list {
 display: flex;
 flex-direction: row;
 justify-content: space-evenly;
 flex-wrap: wrap;
}
</style>