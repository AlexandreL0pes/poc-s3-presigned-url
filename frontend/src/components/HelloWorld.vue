<script setup>
import { ref, computed } from 'vue'

import axios from "axios";

const file = ref(null);
const success = ref(null)
const fileSelected = ref(false)

const fileName = computed(() => file.value?.name);
const fileExtension = computed(() => fileName.value?.substr(fileName.value?.lastIndexOf(".") + 1));
const fileMimeType = computed(() => file.value?.type);

const uploadFile = (event) => {
  file.value = event.target.files[0];
  fileSelected.value = true
};

const submitFile = async () => {
  const reader = new FileReader();
  reader.readAsDataURL(file.value);
  reader.onload = async () => {
    const encodedFile = reader.result.split(",")[1];
    const data = {
      file: encodedFile,
      filename: "fileName.value",
      fileExtension: fileExtension.value,
      fileMimeType: fileMimeType.value,
    };
    try {
      const endpoint = await getPresignedUrl();
      console.log(endpoint);
      const response = await axios.put(endpoint, data);
      console.log(response.data);
      success.value = true
    } catch (error) {
      success.value = false
      console.error(error);
    }
  };
};

const getPresignedUrl = async () => {
  try {
    const endpoint = "http://localhost:3000/api/s3/presigned_url"
    const response = await axios.get(endpoint)

    console.log(response.data.url);
    return response.data.url
  } catch (error) {
    return null
  }
}
</script>

<template>
  <h1>{{ msg }}</h1>

  <div class="card">
    <input @change="uploadFile" type="file" />
    <button @click="submitFile">Submit</button>
  </div>

  <div v-if="fileSelected && success !== null">
    <div v-if="success">File was uploaded with success!</div>
    <div v-else>An error happened during the upload</div>
  </div>
</template>
