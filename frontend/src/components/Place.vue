<template>
  <div>
    <h1>VueChat - チャットルーム一覧</h1>
    <ul>
      <li v-for="place in place" :key="place.id">
        <router-link :to="`/places/${place.id}`">{{ place.name }}</router-link>
      </li>
    </ul>
    <h3>チャットルーム作成</h3>
    <input type="text" v-model="newRoomName" />
    <div>
      <button @click="createRoom">作成</button>
    </div>
  </div>
</template>
<script>
import axios from 'axios'

export default {
  data() {
    return {
      places: [],
      newRoomName: ''
    }
  },
  created() {
    // コンポーネントが作成されたときに、チャットルーム一覧を取得する
    this.fetchPlace()
  },
  methods: {
    fetchPlace() {
      axios
        // 環境変数VITE_API_URLからAPIのURLを取得する
        .get(`${import.meta.env.VITE_API_URL}/place`)
        .then((response) => {
          this.place = response.data
        })
        .catch((error) => {
          console.error(error)
        })
    },
    createRoom() {
      axios
        .post(`${import.meta.env.VITE_API_URL}/places`, {
          name: this.newRoomName
        })
        .then((response) => {
          this.chatRooms.push(response.data)
          this.newRoomName = ''
        })
        .catch((error) => {
          console.error(error)
        })
    }
  }
}
</script>