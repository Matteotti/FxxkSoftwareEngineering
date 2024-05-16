<script lang="ts" setup>
import { reactive, ref } from 'vue';

const props = defineProps({
    msg: {
        type: String,
        required: true
    },
    nameAttr: {
        type: String,
        required: true
    },
    type: {
        type: String,
        default: "text"
    },
    _autocomplete: {
        type: String,
        default: "none"
    },
    _require: {
        type: Boolean,
        default: true
    },
    labelColor: {
        type: String,
        default: 'black' // 设置默认颜色
    }
});

var _invalid_msg_store = "请输入" + props.msg;
var _invalid_msg = _invalid_msg_store;
var msg_show = reactive({ data: { value: false } });
const text = ref('');
const showLabel = (show: boolean, newText: string | null = null) => {
    if (newText != null) _invalid_msg = newText;
    else _invalid_msg = _invalid_msg_store;
    msg_show.data.value = show;
};
const clearText = () => { text.value = ''; };
function handleInputChange() {
    msg_show.data.value = false;
}
defineExpose({
    showLabel,
    clearText
});
</script>

<template>
    <div class="label_input">
        <div class="label" :for="props.nameAttr" id="msg" :style="{ color: props.labelColor }">{{ msg }}: </div>
        <input :type="type" :name="props.nameAttr" class="input-item" :autocomplete="_autocomplete" v-model="text" @input="handleInputChange"></input>
        <div class="label" v-show="msg_show.data.value" id="require_msg">{{ _invalid_msg }}</div>
    </div>
</template>

<style scoped>
.label_input {
    display: flex;
    width: 100%;
    outline: none;
}
input {
    margin-left: 50px;
    width: 200px;
}
#msg {
    align-self: flex-start;
    font-family: KaiTi;
    width: 100px;
}
#require_msg {
    color: red;
    margin: auto;
}
</style>
