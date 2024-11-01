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
        <button type="submit">検索</button>
      </form>
    </div>
    <div class="cooks">
      <h1>お店一覧</h1>
      <!-- お店情報を繰り返し表示 -->
      <div v-for="cook in cooks" :key="cook.id" class="item">
        <div class="cook-img-wrap">
          <img class="cook-img" :src="cook.image" alt="店舗画像" />
        </div>
        <div class="tag-wrap">
          <!-- 各タグを表示 -->
          <div v-for="tag in cook.tags" :key="tag">
            <label class="tag">{{ tag }}</label>
          </div>
          <h3 class="item-name">{{ cook.store_catchcopy }}</h3>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data() {
    console.log('check!!')
    return {
      searchQuery: '',
      cooks: [
        { store: 'awamori', lat: 26.2155658, lng: 127.6691134 },
        { store: 'awamori', lat: 26.176827006031758, lng: 127.6751037628797 },
        { store: 'awamori', lat: 26.18668612463146, lng: 127.66806564613702 }
      ]
    }
  },

  methods: {
    fetchCooks() {
      console.log('check2!!')
      return axios.get('http://localhost:3000/cooks').then((res) => {
        console.log(res.data)
        this.cooks = res.data
      })
    },
    searchStores() {
      console.log('check3!!')
      this.fetchCooks()
    }
  },

  mounted() {
    this.fetchCooks()
  }
}
</script>
