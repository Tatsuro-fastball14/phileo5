<template>
  <div class="wrapper">
    <div class="side-bar">
      <form @submit.prevent="searchStores">
        <label for="store">Keyword</label>
        <input
          v-model="searchQuery"
          type="text"
          id="store"
          name="store"
          placeholder="Search stores..."
        />
        <br />
        <button type="submit">検索</button>
      </form>
    </div>

    <h1>お店一覧</h1>
    <!-- お店情報を繰り返し表示 -->
    <ul>
      <li v-for="cook in filteredCooks" :key="cook.id">
        <router-link :to="`/cooks/${cook.id}`">{{ cook.store }}</router-link>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      cooks: [], // お店一覧データを格納する配列
      searchQuery: '' // 検索キーワード
    }
  },
  computed: {
    // 検索キーワードに基づいてリアルタイムにフィルタリングされたお店のリストを返す
    filteredCooks() {
      return this.cooks.filter((cook) =>
        cook.store.toLowerCase().includes(this.searchQuery.toLowerCase())
      )
    }
  },

  mounted() {
    this.fetchCooks() // コンポーネントがマウントされた時にお店一覧を取得
  },

  methods: {
    fetchCooks() {
      // お店一覧を取得するメソッド
      axios
        .get('http://localhost:3000/cooks') // エンドポイントを一覧取得用に修正
        .then((response) => {
          console.log('Fetched data:', response.data) // データの確認用ログ
          this.cooks = response.data
        })
        .catch((error) => {
          console.error('エラーが発生しました:', error) // エラーログの出力
        })
    },
    searchStores() {
      // 検索フォームのサブミットで検索キーワードをコンソールに表示
      console.log(`Searching for: ${this.searchQuery}`)
      // filteredCooksはcomputedプロパティで自動更新されるため追加の処理は不要
    }
  }
}
</script>

created() {
    // コンポーネントが作成されたときに、チャットルーム一覧を取得する
    this.fetchChatRooms()
  },
  methods: {
    fetchChatRooms() {
      axios
        // 環境変数VITE_API_URLからAPIのURLを取得する
        .get(`${import.meta.env.VITE_API_URL}/rooms`)
        .then((response) => {
          this.chatRooms = response.data
        })
        .catch((error) => {
          console.error(error)
        })
    },

