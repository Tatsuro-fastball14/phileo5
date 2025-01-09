<template>
  <div class="new-umarepo">
    <div class="weight-bold-text-umarepo">
      タイトル
      <span class="indispenable">必須</span>
    </div>
    <form @submit.prevent="submitForm" enctype="multipart/form-data">
      <!-- <--テキスト情報入力-->
      <div class="form-group">
        <label for="title">タイトル</label>
        <input v-model="title" type="text" id="title" required />
      </div>

      <div class="form-group">
        <label for="curator">名前</label>
        <input v-model="curator" type="text" id="curator" required />
      </div>

      <div class="form-group">
        <label for="comment">コメント</label>
        <input v-model="comment" type="text" id="comment" required />
      </div>

      <p v-show="message" class="success-message">{{ message }}</p>
      <p v-show="errormessage" class="success-errormessage">{{ errormessage }}</p>
      <button type="submit">投稿する</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  props: {
    cookId: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      title: '',
      curator: '',
      comment: '',
      message: null,
      errormessage: ''
    }
  },

  // 略
  methods: {
    createSubscription() {
      this.subscription = this.cable.subscriptions.create(
        { channel: 'Umarepo', cook_id: this.cookId },
        {
          received: (message) => {
            console.log(message)
            this.messages.push(message)
          }
        }
      )
    },
    async submitForm() {
      console.log('current cookid:', this.cookid)
      try {
        const formData = new FormData()
        formData.append('umarepo[title]', this.title)
        formData.append('umarepo[curator]', this.curator)
        formData.append('umarepo[comment]', this.comment)

        const response = await axios.post(
          `http://localhost:3000/cooks/${this.cookId}/umarepos`,
          formData
        )

        this.message = '登録が完了しました。' // APIからの成功メッセージがあればそれを使用
        this.resetForm()
      } catch (error) {
        console.error('エラー詳細:', error)
        this.errormessage = error.response?.data?.error?.join(',') || '登録に失敗しました。'
      }
    },

    resetForm() {
      this.title = ''
      this.curator = ''
      this.comment = ''
    }
  }
}
</script>
