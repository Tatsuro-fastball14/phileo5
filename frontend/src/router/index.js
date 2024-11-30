import { createRouter, createWebHistory } from 'vue-router';
import Cook from '../components/Cook.vue';
import Place from '../components/Place.vue'; // 追加
import CookDetail from '../components/CookDetail.vue'; // 詳細ページ
import Login from "../components/Login.vue";
import CookForm from "../components/CookForm.vue";





const routes = [
  { path: '/', component: Place },
  { path: '/cooks', component: Cook },
  { path: '/cooks/:id', component: CookDetail, name: 'CookDetail' },
  { path: "/login", component: Login, name: "Login" },
  { path: "/cooks/new", component: CookForm, name: "CookForm" }

];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;