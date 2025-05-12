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

      <!-- 画像アップロード -->
      <div class="form-group">
        <label for="image">画像アップロード</label>
        <input
          type="file"
          multiple
          id="image"
          name="image"
          accept="image/png,image/jpeg"
          @change="setImages"
        />
      </div>

      <button type="submit" @click="upload" :disabled="title">登録</button>
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
      images: [],

      message: null,
      errorMessage: null
    }
  },
  methods: {
    setImages(e) {
      e.preventDefault()
      this.images = e.target.files[0]
      console.log('bbb:', e.target.files[0])
      console.log('bbb:', e.target.files[1])
      console.log('bbb:', e.target.files[2])
      console.log('===== デバッグ終了 =====')
    },

    async submitForm() {
      try {
        const formData = new FormData()
        // 各フィールドをフォームデータに追加
        formData.append('cook[store]', this.store)
        formData.append('cook[store_catchcopy]', this.storeCatchcopy)
        formData.append('cook[sentence]', this.sentence)
        formData.append('cook[address]', this.address)
        formData.append('cook[phone_number]', this.phoneNumber)
        formData.append('cook[category]', this.category)
        formData.append('cook[lat]', this.lat)
        formData.append('cook[lng]', this.lng)
        // フォームの中身を確認（開発時のデバッグ用）
        console.log(...formData.entries())

        // 画像が1枚以上あれば追加処理へ
        if (this.images && this.images.length > 0) {
          console.log('if文の中に入りました')
          console.log('画像数:', this.images.length)
          formData.append('cook[images][]', this.images[2])
          axios.post(`/api/image`, formData, config).then((rs) => {
            console.log(rs.data)
          })
        } else {
          console.log('if文を通っていません')
          console.log('this.images:', this.images)
          console.log('this.images.length:', this.images?.length)
        }

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
    }
  }
}
</script>