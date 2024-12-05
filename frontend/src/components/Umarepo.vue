<template>
  <div class="new-umarepo">
    <div class="weight-bold-text-umarepo">
      タイトル
      <span class="indispenable">必須</span>
    </div>
    <form @submit.prevent="submitForm" enctype="multipart/form-data">

    <!-- <--テキスト情報入力--> -->
     <div class="form-group">
       <label for="title">タイトル</label>
       <input v-model="title" type="text" id="title" required/>
    </div>

     <div class="form group">
       <label for="curator">名前</label>
       <input v-model="curator" type="text" id="curator" required/>
    </div>

    <div class="form group">
       <label for="comment">コメント</label>
       <input v-model="comment" type="text" id="comment" required/>
    </div>

    <p v-if="message" class="success-message">{{ message }}</p>
    <p v-if="errormessage" class="success-errormessage">{{ errormessage }}</p>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      title: '',
      curator: '',
      comment: '',
      message: null,
      errormessage: ''
    }
  },
  methods: {
    async submitForm() {
      try {
        const FormData = new FormData()
        FormDate.append('umarepo[title]', this.title)
        FormDate.append('umarepo[curator]', this.curator)
        FormDate.append('umarepo[comment]', this.comment)

        const response = await axios.post('http://localhost:3000/cooks/', formdata, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        })

        this.message = response.data.message
        this.resetFrom()
      } catch (error) {
        this.errormessage = error.response?.data?.error?.join(',') || '登録に失敗しました。'
      }
    },

    resetFrom() {
      this.title = ''
      this.curator = ''
      this.comment = ''
    }
  }
}
</script>