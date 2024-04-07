## 病人投诉模块
### 类
class patient {
-account
-password
-name
-id
-gender
-age
-phone
-email
-balance
}

class complaint {
-id
-time
-content
-result
-relatedDoctor
-relatedPatient
-relatedAdmin
}

## 病人问诊模块
### 类
class patient {
-account
-password
-name
-id
-gender
-age
-phone
-email
-balance
}

class MedicalConsultation {
-consultation_id
-patient_id
-doctor_id
-payment // 缴费账单
-ill_history // 病历单
}

class ill_history {
-id
-time
-description
-illness // 具体病因（病的类别）
}

class payment {
-id
-relatedPatient
-money
-time
}