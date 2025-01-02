<template>
  <div>
    <h1>店舗詳細</h1>
    <ul>
      <li v-for="cook in filteredCooks" :key="cook.id">
        <router-link :to="`/cooks/${cook.id}`">{{ umarepo.new }}</router-link>
      </li>
    </ul>

    <div v-if="cook">
      <p><strong>店舗名:</strong> {{ cook.store }}</p>
      <p><strong>キャッチコピー:</strong> {{ cook.store_catchcopy }}</p>
      <p><strong>住所:</strong> {{ cook.address }}</p>
      <p><strong>電話番号:</strong> {{ cook.phone_number }}</p>
      <p><strong>カテゴリー:</strong> {{ cook.category }}</p>
      <p><strong>緯度:</strong> {{ cook.lat }}</p>
      <p><strong>経度:</strong> {{ cook.lng }}</p>
    </div>
    <div v-if="cook.image">
      <img :src="cook.image" alt="店舗の画像" />
    </div>

    <div v-else>
      <p></p>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      cook: null // 店舗データ
    }
  },
  created() {
    const cookId = this.$route.params.id // URL から ID を取得
    if (!cookId) {
      console.error('ID が URL にありません')
      return
    }

    axios
      .get(`http://localhost:3000/cooks/${cookId}`) // Rails の show アクションにリクエスト
      .then((response) => {
        this.cook = response.data // レスポンスデータを格納
      })
      .catch((error) => {
        console.error('エラーが発生しました:', error)
      })
  }
}
</script>
