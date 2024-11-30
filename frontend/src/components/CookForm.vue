<template>
  <div class="form-container">
    <h1>店舗情報を登録</h1>
    <form @submit.prevent="submitForm" enctype="multipart/form-data">
      <!-- テキスト情報入力 -->
      <div class="form-group">
        <label for="store">店舗名</label>
        <input v-model="store" type="text" id="store" required />
      </div>

      <div class="form-group">
        <label for="store_catchcopy">キャッチコピー</label>
        <input v-model="storeCatchcopy" type="text" id="store_catchcopy" required />
      </div>

      <div class="form-group">
        <label for="sentence">説明</label>
        <textarea v-model="sentence" id="sentence" required></textarea>
      </div>

      <div class="form-group">
        <label for="address">住所</label>
        <input v-model="address" type="text" id="address" required />
      </div>

      <div class="form-group">
        <label for="phone_number">電話番号</label>
        <input v-model="phoneNumber" type="text" id="phone_number" required />
      </div>

      <div class="form-group">
        <label for="category">カテゴリー</label>
        <input v-model="category" type="text" id="category" required />
      </div>

      <div class="form-group">
        <label for="lat">緯度</label>
        <input v-model="lat" type="number" id="lat" required />
      </div>

      <div class="form-group">
        <label for="lng">経度</label>
        <input v-model="lng" type="number" id="lng" required />
      </div>

      <!-- ファイルアップロード -->
      <div class="form-group">
        <label for="images">画像を選択</label>
        <input type="file" id="images" @change="handleFileChange('images', $event)" multiple />
      </div>

      <div class="form-group">
        <label for="videos">動画を選択</label>
        <input type="file" id="videos" @change="handleFileChange('videos', $event)" multiple />
      </div>

      <button type="submit">登録</button>
    </form>

    <p v-if="message" class="success-message">{{ message }}</p>
    <p v-if="errorMessage" class="error-message">{{ errorMessage }}</p>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      store: '',
      storeCatchcopy: '',
      sentence: '',
      address: '',
      phoneNumber: '',
      category: '',
      lat: '',
      lng: '',
      images: [], // アップロードする画像
      videos: [], // アップロードする動画
      message: null,
      errorMessage: null
    }
  },
  methods: {
    handleFileChange(field, event) {
      // 画像または動画を配列に格納
      this[field] = Array.from(event.target.files)
    },
    async submitForm() {
      try {
        const formData = new FormData()

        // テキストデータを追加
        formData.append('cook[store]', this.store)
        formData.append('cook[store_catchcopy]', this.storeCatchcopy)
        formData.append('cook[sentence]', this.sentence)
        formData.append('cook[address]', this.address)
        formData.append('cook[phone_number]', this.phoneNumber)
        formData.append('cook[category]', this.category)
        formData.append('cook[lat]', this.lat)
        formData.append('cook[lng]', this.lng)

        // 画像を追加
        this.images.forEach((image, index) => {
          formData.append(`cook[images][]`, image)
        })

        // 動画を追加
        this.videos.forEach((video, index) => {
          formData.append(`cook[videos][]`, video)
        })

        const response = await axios.post('http://localhost:3000/cooks', formData, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        })

        this.message = response.data.message
        this.resetForm()
      } catch (error) {
        this.errorMessage = error.response?.data?.errors?.join(', ') || '登録に失敗しました。'
      }
    },
    resetForm() {
      this.store = ''
      this.storeCatchcopy = ''
      this.sentence = ''
      this.address = ''
      this.phoneNumber = ''
      this.category = ''
      this.lat = ''
      this.lng = ''
      this.images = []
      this.videos = []
    }
  }
}
</script>

<style scoped>
.form-container {
  max-width: 500px;
  margin: 0 auto;
}
.success-message {
  color: green;
}
.error-message {
  color: red;
}
</style>
