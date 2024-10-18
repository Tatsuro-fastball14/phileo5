import { createRouter, createWebHistory } from 'vue-router';
import Cook from '../components/Cook.vue';
import Place from '../components/Place.vue'; // 追加

const routes = [
  { path: '/', component: Place },
  { path: '/place/:id', component: Place, props: route => ({ roomId: route.params.id }) }, // 追加
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;