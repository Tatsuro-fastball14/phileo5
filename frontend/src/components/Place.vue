<template>
  <div id="app">
    <div id="top-search">
      <div class="image-container top-search"></div>
      <div class="image-container top-search2"></div>
      <div class="image-container top-search3"></div>
    </div>
    <div class="text-container">
      <p><span class="emphasized">"絶対</span>にハズさない"</p>
      <p>沖縄の美味しいお店を検索できる</p>
    </div>

    <div class="search-container">
      <form @submit.prevent="submitSearch" class="search-form">
        <input type="submit" value="next" />
      </form>
    </div>
  

  <div v-if="current_user.present">
    <div class="admin-actions">
      <button @click="registerInDB">DBの登録</button>
    </div>
  </div>

  <div v-if="current_user">
    <div class="user-actions">
      <button @click="deleteAccount">アカウントを削除</button>
      <button @click="unsubscribe">サブスクを退会</button>
    </div>

    <ul>
      <li v-for="place in places" :key="place.id">{{ place.name }}</li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      places: [],
      current_user: {
        present: false
      }
    }
  },
  methods: {
    submitSearch() {
      console.log('Search submitted')
    },
    registerInDB() {
      console.log('DBの登録 clicked')
    },
    deleteAccount() {
      console.log('アカウントを削除 clicked')
    },
    unsubscribe() {
      console.log('サブスクを退会 clicked')
    }
  }
}
</script>

<style scoped>
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
  position: relative;
}

.image-container {
  width: 33.33%;
  height: 100%;
  background-size: cover;
  background-position: center;
}

.top-search {
  background-image: url("<= require asset_path('chatan.jpg')>");
}

.top-search2 {
  background-image: url("<= require asset_path('maguro.jpg')>");
}

.top-search3 {
  background-image: url("<= require asset_path('unazyu.jpg')>");
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
}

.text-container p {
  font-size: 50px;
  margin: 5px 0;
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
