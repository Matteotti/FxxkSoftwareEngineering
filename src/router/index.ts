import { createRouter, createWebHistory } from 'vue-router'
import WelcomeView from '../views/WelcomeView.vue'
import LoginView from '../views/LoginView.vue'
import RegisterView from '../views/RegisterView.vue'
import HomeView from '../views/HomeView.vue'
import HospitalInfo from '../views/HospitalInfo.vue'
import QueryComplaintView from "../views/QueryComplaintView.vue"
import QueryAllBillView from "../views/QueryAllBillView.vue"
import QueryUnpaidBillView from "../views/QueryUnpaidBillView.vue"
import PayBill from "../views/PayBill.vue";
import MedicalInsurance from '../views/MedicalInsurance.vue'
import MakeComplaint from "../views/MakeComplaintView.vue"
import ReserveView from '@/views/ReserveView.vue'
import ReserveRecords from '@/views/ReserveRecords.vue'
import ReserveDoctors from '@/views/ReserveDoctorView.vue'

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
      component: QueryComplaintView
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
    },
    {
      path: '/home/queryAllBill',
      name: 'queryAllBill',
      component: QueryAllBillView
    },
    {
      path: '/home/queryUnpaidBill',
      name: 'queryUnpaidBill',
      component: QueryUnpaidBillView
    },
    {
        path: '/home/payBill',
        name: 'payBill',
        component: PayBill
    },
    {
      path: '/home/reserve/reserveDoctors',
      name: 'reserveDoctors',
      component: ReserveDoctors
    }
  ]
})

export default router
