<template>
  <div class="wrapper">
    <div class="side-bar">
      <form @submit.prevent="searchStores">
        <label for="store">Keyword</label>
        <input
          v-model="searchQuery"
          type="text"
          id="store"
          name="store"
          placeholder="Search stores..."
        />
        <br />
        <button type="submit">検 索</button>
      </form>
    </div>
    <div class="cooks">
      <h1>お店一覧</h1>
      <div v-for="cook in cooks" :key="cook.id" class="item">
        <div class="item-img">
          <img :src="cook.image" alt="Shop Image" class="star-icon" />
        </div>
        <div class="item-price">
          <div class="avatar">
            <a :href="'/cooks/' + cook.id">
              <img src="avatar.JPG" alt="Avatar" />
            </a>
          </div>
          <h3 class="item-name">{{ cook.store_catchcopy }}</h3>
        </div>
      </div>
      <button @click="nextPage">Next</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      searchQuery: '',
      cooks: [],
      currentPage: 1
    }
  },
  methods: {
    searchStores() {
      // Make a GET request to your search endpoint
      fetch(`/cooks/search?store_cont=${this.searchQuery}&page=${this.currentPage}`)
        .then((response) => response.json())
        .then((data) => {
          this.cooks = data.cooks
        })
    },
    nextPage() {
      this.currentPage += 1
      this.searchStores() // Fetch the next page of results
    }
  },
  mounted() {
    // Load initial data when the component is mounted
    this.searchStores()
  }
}
</script>

<style scoped>
/* Add your component-specific styles here */
</style>
