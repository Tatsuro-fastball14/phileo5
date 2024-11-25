<template>
  <div class="wrapper">
    <h1>お店一覧</h1>
    <ul>
      <li v-for="cook in filteredCooks" :key="cook.id" class="cook-card">
        <!-- カード全体をクリック可能にする -->
        <router-link :to="generateDetailURI(cook.id)" class="cook-link">
          <div class="card-content">
            <h2>{{ cook.store }}</h2>
            <p>{{ cook.description }}</p>
          </div>
        </router-link>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      cooks: [], // お店一覧データを格納する配列
      searchQuery: '' // 検索キーワード
    }
  },
  computed: {
    filteredCooks() {
      return this.cooks.filter((cook) =>
        cook.store.toLowerCase().includes(this.searchQuery.toLowerCase())
      )
    }
  },
  mounted() {
    this.fetchCooks()
  },
  methods: {
    fetchCooks() {
      axios
        .get(`http://localhost:3000/cooks`)
        .then((response) => {
          this.cooks = response.data
        })
        .catch((error) => {
          console.error('エラーが発生しました:', error)
        })
    },
    generateDetailURI(cookId) {
      return `/cooks/${cookId}` // 詳細ページのURIを生成
    }
  }
}
</script>
