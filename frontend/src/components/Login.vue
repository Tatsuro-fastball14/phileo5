<template>
  <div>
    <h1>ログイン</h1>
    <form @submit.prevent="login">
      <div>
        <label for="email">メールアドレス</label>
        <input v-model="email" type="email" id="email" required />
      </div>
      <div>
        <label for="password">パスワード</label>
        <input v-model="password" type="password" id="password" required />
      </div>
      <button type="submit">ログイン</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      email: '',
      password: ''
    }
  },
  methods: {
    async login() {
      try {
        const response = await axios.post('http://localhost:3000/users/sign_in', {
          user: {
            email: this.email,
            password: this.password
          }
        })
        console.log('ログイン成功:', response.data)
      } catch (error) {
        console.error('ログインエラー:', error.response.data)
      }
    }
  }
}
</script>
