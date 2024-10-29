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
    <div class="cooks">
      <h1>お店一覧</h1>
      <!-- お店情報を繰り返し表示 -->
      <div v-for="cook in cooks" :key="cook.id" class="item">
        <div class="cook-img-wrap">
          <img class="cook-img" :src="cook.image" alt="店舗画像" />
        </div>
        <div class="tag-wrap">
          <!-- 各タグを表示 -->
          <div v-for="tag in cook.tags" :key="tag">
            <label class="tag">{{ tag }}</label>
          </div>
          <h3 class="item-name">{{ cook.store_catchcopy }}</h3>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      cooks: [
        { store: 'awamori', lat: 26.2155658, lng: 127.6691134 },
        { store: 'awamori', lat: 26.176827006031758, lng: 127.6751037628797 },
        { store: 'awamori', lat: 26.18668612463146, lng: 127.66806564613702 }
      ]
    }
  },

  methods: {
    fetchCooks() {
      return axios.get('http://localhost:3000/cooks').then((res) => {
        console.log(res.data)
        this.cooks = res.data
      })
    }
  },

  mounted() {
    this.fetchCooks()

    if (!window.mapLoadStarted) {
      window.mapLoadStarted = true
      let script = document.createElement('script')
      script.src =
        'https://maps.googleapis.com/maps/api/js?key=AIzaSyAc8ucfbF9aY5Jn9VehhJZ852fopENuQTc&callback=initMap'
      script.async = true
      document.head.appendChild(script)
    }

    window.initMap = () => {
      window.mapLoaded = true
    }

    let timer = setInterval(() => {
      if (window.mapLoaded) {
        clearInterval(timer)
        console.log(parseFloat(this.cooks[0].lat))
        const map = new window.google.maps.Map(this.$refs.map, {
          center: {
            lat: parseFloat(this.cooks[0].lat),
            lng: parseFloat(this.cooks[0].lng)
          },
          zoom: 15
        })
        this.cooks.forEach((cook) => {
          let lat = parseFloat(cook.lat)
          let lng = parseFloat(cook.lng)
          new window.google.maps.Marker({
            position: { lat: lat, lng: lng },
            map
          })
          const marker = new google.maps.Marker({})
          var infowindow = new google.maps.InfoWindow({
            content: cook.title,

            position: { lat: lat, lng: lng }
          })
          infowindow.open(map)
        })
      }
    }, 500)
  }
}
</script>
