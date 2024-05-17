import { createRouter, createWebHistory } from 'vue-router'
import WelcomeView from '../views/WelcomeView.vue'
import LoginView from '../views/LoginView.vue'
import RegisterView from '../views/RegisterView.vue'
import HomeView from '../views/HomeView.vue'
import HospitalInfo from '../views/HospitalInfo.vue'
import QueryComplaint from "../views/QueryComplaintView.vue"
import MedicalInsurance from '../views/MedicalInsurance.vue'
import MakeComplaint from "../views/MakeComplaintView.vue"
import ReserveView from '@/views/ReserveView.vue'
import ReserveRecords from '@/views/ReserveRecords.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'welcome',
      component: WelcomeView
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView
    },
    {
      path: '/register',
      name: 'register',
      component: RegisterView
    },
    {
      path: '/home/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/home/hospitalInfo',
      name: 'HospitalInfo',
      component: HospitalInfo
    },
    {
      path: '/home/queryComplaint',
      name: 'queryComplaint',
      component: QueryComplaint
    },
    {
      path: '/home/makeComplaint',
      name: 'makeComplaint',
      component: MakeComplaint
    },
    {
      path: '/home/medicalInsurance',
      name: 'MedicalInsurance',
      component: MedicalInsurance
    },
    {
      path: '/home/reserve',
      name: 'Reserve',
      component: ReserveView
    },
    {
      path: '/home/reserveRecords',
      name: 'ReserveRecords',
      component: ReserveRecords
    }
  ]
})

export default router
