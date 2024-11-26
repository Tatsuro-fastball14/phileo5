<template>
  <div>
    <h1>店舗詳細</h1>
    <div v-if="cook">
      <p><strong>店舗名:</strong> {{ cook.store }}</p>
      <p><strong>キャッチコピー:</strong> {{ cook.store_catchcopy }}</p>
      <p><strong>住所:</strong> {{ cook.address }}</p>
      <p><strong>電話番号:</strong> {{ cook.phone_number }}</p>
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
