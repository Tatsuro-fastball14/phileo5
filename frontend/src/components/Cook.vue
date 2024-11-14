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

    <h1>お店一覧</h1>
    <!-- お店情報を繰り返し表示 -->
    <ul>
      <li v-for="cook in cooks" :key="cook.id">
        <router-link :to="`/cooks/${cook.id}`">{{ cook.name }}</router-link>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      cooks: [],
      searchQuery: '' // searchQuery を追加
    }
  },
  mounted() {
    this.fetchCooks()
  },
  methods: {
    fetchCooks() {
      // メソッド名の修正
      axios
        .get('http://localhost:3000/cooks')
        .then((response) => {
          console.log
          this.cooks = response.data
        })
        .catch((error) => {
          console.error(error)
        })
    },
    searchStores() {
      // searchStores メソッドの実装例
      // キーワードに基づいてフィルタリングやAPIリクエストを実行する処理
      console.log(`Searching for: ${this.searchQuery}`)
    }
  }
}
</script>
