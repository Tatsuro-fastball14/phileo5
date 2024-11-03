<template>
  <div>
    <h1>店舗一覧</h1>
    <div v-for="cook in cooks" :key="cook.id" class="item">
      <div class="cook-img-wrap">
        <img v-if="cook.image" :src="cook.image" alt="店舗画像" class="cook-img" />
      </div>
      <h3>{{ cook.store_catchcopy }}</h3>
      <p>{{ cook.sentence }}</p>
      <p><strong>住所:</strong> {{ cook.address }}</p>
      <p><strong>電話番号:</strong> {{ cook.phone_number }}</p>
      <p><strong>店舗名:</strong> {{ cook.store }}</p>
      <p><strong>カテゴリー:</strong> {{ cook.category }}</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      cooks: [] // 店舗一覧を格納する配列
    }
  },
  created() {
    // コンポーネントが作成されたときにデータを取得
    axios
      .get('http://localhost:3000/cooks')
      .then((response) => {
        this.cooks = response.data
      })
      .catch((error) => {
        console.error('店舗情報の取得エラー:', error)
      })
  }
}
</script>

<style scoped>
.item {
  margin-bottom: 20px;
}
.cook-img-wrap {
  width: 100%;
  max-width: 300px;
}
.cook-img {
  width: 100%;
}
</style>
