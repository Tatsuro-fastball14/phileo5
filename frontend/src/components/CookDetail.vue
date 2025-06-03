<template>
  <div>
    <h1>店舗詳細</h1>
    <ul>
      <router-link :to="`/cooks/${cook.id}/umarepos/new`">ウマレポを作成</router-link>
    </ul>

    <div v-if="cook">
      <p><strong>店舗名:</strong> {{ cook.store }}</p>
      <p><strong>キャッチコピーz:</strong> {{ cook.curator }}</p>
      <p><strong>住所:</strong> {{ cook.address }}</p>
      <p><strong>電話番号:</strong> {{ cook.phone_number }}</p>
      <p><strong>カテゴリー:</strong> {{ cook.category }}</p>
      <p><strong>緯度:</strong> {{ cook.lat }}</p>
      <p><strong>経度:</strong> {{ cook.lng }}</p>
    </div>
    <div v-if="cook.images_urls">
      <div v-for="(url, index) in cook.images_urls" :key="index">
        <img :src="cook.images_urls" alt="店舗の画像" style="max-width: 100%; height: auto" />
      </div>
    </div>

    <div v-if="umarepo">
      <p><strong>タイトル:</strong> {{ umarepo.title }}</p>
      <p><strong>名前:</strong> {{ umarepo.curator }}</p>
      <p><strong>コメント:</strong> {{ umarepo.comment }}</p>
    </div>

    <!-- umarepoを表示 -->
    <ul>
      <li v-for="umarepo in cook.umarepos" :key="umarepo.id">
        {{ umarepo.title }} - {{ umarepo.curator }} - {{ umarepo.comment }}
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      cook: null,
      umarepo: null // 店舗データ
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
        console.log('Cook details:', response.data)
        this.cook = response.data // レスポンスデータを格納
      })
      .catch((error) => {
        console.error('エラーが発生しました:', error)
      })
  }
}
</script>
