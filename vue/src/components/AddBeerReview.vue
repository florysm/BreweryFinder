<template>
  <form v-on:submit.prevent="addNewReview" class="beer-review">
    <div class="form-element">
      <label for="reviewer">Beer ID:</label>
      <input
        id="reviewBeerId"
        type="text"
        v-model.number="this.$route.params.id"
        disabled
        class="beer-review-form-control"
      />
    </div>
    <div class="form-element">
      <label for="subject">Subject:</label>
      <input
        type="text"
        id="subjectOfReview"
        v-model="newReview.subject"
        class="beer-review-form-control"
        />
    </div>
    <div class="form-element">
      <label for="description">Review:</label>
      <textarea
        id="descriptionOfReview"
        v-model="newReview.description"
        class="beer-review-form-control"
      ></textarea>
    </div>

    <div class="form-element">
      <label for="rating">Rating:</label>
      <select
        id="rating"
        v-model.number="newReview.rating"
        class="beer-review-form-control"
      >
        <option value="1">1 Star</option>
        <option value="2">2 Stars</option>
        <option value="3">3 Stars</option>
        <option value="4">4 Stars</option>
        <option value="5">5 Stars</option>
      </select>
    </div>
    <div class="form-element">
      <label for="date">Date:</label>
      <input
        type="date"
        id="date"
        v-model="newReview.date"
        class="beer-review-form-control"
      />/>
    </div>
    <button class="btn btn-submit">Submit</button>
    <button
      class="btn btn-cancel"
      v-on:click.prevent="cancelForm"
      type="cancel"
    >
      Cancel
    </button>
  </form>
</template>

<script>
import BeerReviewService from "../services/BeerReviewService";
export default {
  name: "add-beer-review",
  data() {
    return {
      newReview: {
        reviewId: 0,
        beerId: 0,
        subject: "",
        description: "",
        rating: 0,
        date: "",
      },
    };
  },
  methods: {
    addNewReview() {
      const newReview = {
        beerId: parseInt(this.$route.params.id),
        subject: this.newReview.subject,
        description: this.newReview.description,
        rating: this.newReview.rating,
        date: this.newReview.date,
        userId: this.$store.state.user.userId,
      };
      // this.$store.commit("ADD_REVIEW", this.newReview);
      BeerReviewService.addReview(newReview).then((response) => {
        this.newReview = response.data;
        if (response.status === 200) {
          this.$router.push({ path: `/beers/${this.$route.params.id}` });
        }
      });
    },
    cancelForm() {
      this.$router.push(`/beers/${this.$route.params.id}`);
    },
  },
};
</script>

<style>
.beer-review {
  margin-bottom: 10px;
  background-color: rgba(0, 0, 0, 0.466);
  width: 400px;
}
.form-group {
  margin-bottom: 10px;
  margin-top: 10px;
}
.form-element {
  margin: 10px;
}
label {
  display: inline-block;
  margin-bottom: 0.5rem;
  justify-content: center;
  color: goldenrod;
  font-size: large;
}
.beer-review-form-control {
  display: block;
  width: 40%;
  height: 35px;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: black;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
}
select.beer-review-form-control {
  width: 20%;
  display: inline-block;
  margin: 10px 20px 10px 10px;
}
#rating {
  display: block;
  margin-left: 0px;
  width: 100px;
}
#reviewBeerId {
  width: 100px;
}
#descriptionOfReview {
  width: 350px;
  height: 100px;
}
#subjectOfReview {
  width: 350px;
}
#date {
  width: 175px;
}
</style>