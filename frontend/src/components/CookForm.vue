<template>
  <div class="form-container">
    <h1>店舗情報を登録</h1>
    <form @submit.prevent="submitForm">
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
      message: null,
      errorMessage: null
    }
  },
  methods: {
    async submitForm() {
      try {
        const response = await axios.post('http://localhost:3000/cooks', {
          cook: {
            store: this.store,
            store_catchcopy: this.storeCatchcopy,
            sentence: this.sentence,
            address: this.address,
            phone_number: this.phoneNumber,
            category: this.category,
            lat: this.lat,
            lng: this.lng
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
