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
        <button type="submit">検 索</button>
      </form>
    </div>
    <div class="cooks">
      <h1>お店一覧</h1>
      <div v-for="cook in cooks" :key="cook.id" class="item">
        <div class="cook-img-wrap">
          <img class="cook-img" :src="cook.image" />
        </div>
        <div class="tag-wrap">
          <div v-for="tag in cook.tags" :key="tag">
            <label class="tag">{{ tag }}</label>
          </div>
          <!-- <div class="avatar">
            <a :href="'/cooks/' + cook.id">
              <img src="avatar.JPG" alt="Avatar" />
            </a>
          </div> -->
          <h3 class="item-name">{{ cook.store_catchcopy }}</h3>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      searchQuery: '',
      cooks: [
        {
          id: 1,
          name: 'レストラン A',
          image: 'IMG_1082jpg',
          tags: ['イタリアン', 'デザート'],
          store_catchcopy: '美味しいイタリア料理をどうぞ！'
        },
        {
          id: 2,
          name: 'カフェ B',
          image: 'IMG_2784jpg',
          tags: ['カフェ', '軽食'],
          store_catchcopy: 'リラックスできるカフェタイム'
        }
      ]
    }
  }
}
</script>



