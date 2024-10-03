<template>
  <div>
    <div id="top-search">
      <div
        class="image-container top-search"
        :style="{ backgroundImage: 'url(' + require('@/assets/chatan.jpg') + ')' }"
      ></div>
      <div
        class="image-container top-search2"
        :style="{ backgroundImage: 'url(' + require('@/assets/maguro.jpg') + ')' }"
      ></div>
      <div
        class="image-container top-search3"
        :style="{ backgroundImage: 'url(' + require('@/assets/unazyu.jpg') + ')' }"
      ></div>
      <div class="text-container">
        <p><span class="emphasized">"絶対</span>にハズさない"</p>
        <p>沖縄の美味しいお店を検索できる</p>
      </div>
      <div class="search-container">
        <form @submit.prevent="handleSubmit">
          <input type="submit" value="next" />
        </form>
      </div>
    </div>

    <div v-if="currentUser && currentUser.admin" class="admin-actions">
      <button @click="registerDB">DBの登録</button>
    </div>

    <div v-if="currentUser" class="user-actions">
      <button @click="deleteAccount">アカウントを削除</button>
      <button @click="cancelSubscription">サブスクを退会</button>
    </div>

    <ul>
      <li v-for="(place, index) in places" :key="index">{{ place.name }}</li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      currentUser: null,
      places: []
    }
  },
  mounted() {
    this.fetchCurrentUser()
    this.fetchPlaces()
  },
  methods: {
    fetchCurrentUser() {
      axios.get(`${import.meta.env.VITE_API_URL}/api/users/current`).then((response) => {
        this.currentUser = response.data.user
      })
    },
    fetchPlaces() {
      axios.get(`${import.meta.env.VITE_API_URL}/api/places`).then((response) => {
        this.places = response.data
      })
    },
    handleSubmit() {
      window.location.href = '/cooks_search'
    },
    registerDB() {
      window.location.href = '/new_cook'
    },
    deleteAccount() {
      if (confirm('本当にアカウントを削除しますか？')) {
        axios
          .delete(`${import.meta.env.VITE_API_URL}/api/users/${this.currentUser.id}`)
          .then(() => {
            alert('アカウントが削除されました')
            this.currentUser = null
          })
      }
    },
    cancelSubscription() {
      if (confirm('本当に退会致しますか？')) {
        axios
          .delete(`${import.meta.env.VITE_API_URL}/api/users/${this.currentUser.id}/subscription`)
          .then(() => {
            alert('サブスクを退会しました')
          })
      }
    }
  }
}
</script>


<style>
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  text-align: center;
  background-color: #f9f9f9;
}
#top-search {
  width: 100%;
  height: 480px;
  display: flex;
  align-items: center;
  color: white;
  position: relative;
}
.image-container {
  width: 33.33%;
  height: 100%;
  background-size: cover;
  background-position: center;
}
.text-container {
  position: absolute;
  top: 10px;
  width: 100%;
  text-align: center;
  color: white;
  z-index: 1;
}
.text-container .emphasized {
  font-size: 70px;
  font-weight: bold;
  color: white;
}
.text-container p {
  font-size: 50px;
  margin: 5px 0;
  color: white;
}
.search-container {
  position: absolute;
  bottom: 10px;
  width: 100%;
  text-align: center;
  z-index: 1;
}
.search-form {
  display: inline-block;
  text-align: left;
}
.search-form input[type='submit'] {
  font-size: 40px;
  padding: 20px 40px;
  cursor: pointer;
}
.admin-actions,
.user-actions {
  margin-top: 20px;
}
.admin-actions button,
.user-actions button {
  margin: 5px;
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  font-size: 20px;
  margin: 10px 0;
}
</style>
