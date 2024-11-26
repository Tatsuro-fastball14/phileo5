import { createRouter, createWebHistory } from 'vue-router';
import Cook from '../components/Cook.vue';
import Place from '../components/Place.vue'; // 追加
import CookDetail from '../components/CookDetail.vue'; // 詳細ページ




const routes = [
  { path: '/', component: Place },
  { path: '/cooks', component: Cook },
  { path: '/cooks/:id', component: CookDetail, name: 'CookDetail' }
  // { path: '/place/:id', component: Place, props: route => ({ roomId: route.params.id }) }, // 追加
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;