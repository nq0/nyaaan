<template>
  <div class="container">
    <div>
      <logo />
      <h1 class="title">
        nyaaan
      </h1>
      <h2 class="subtitle">
        nyaaan!
      </h2>
      <div>
        <ul v-for="data in dataList" :key="data.id">
          <li>{{ data.title }} : {{ data.description }}</li>
        </ul>
        <button @click="postTitle">にゃっ</button>
      </div>
      <div class="links">
        <a href="https://nuxtjs.org/" target="_blank" class="button--green">
          Documentation
        </a>
        <a
          href="https://github.com/nuxt/nuxt.js"
          target="_blank"
          class="button--grey"
        >
          GitHub
        </a>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import Logo from '~/components/Logo.vue'

export default {
  components: {
    Logo
  },
  data: () => ({
    dataList: []
  }),
  created() {
    this.getTitle()
  },
  methods: {
    async getTitle() {
      this.dataList = await axios.get(`/api/v1/posts`).then((res) => {
        return res.data.data
      })
    },
    async postTitle() {
      await axios
        .post(`/api/v1/posts`, {
          title: 'まろ！',
          description: 'まよびーむ'
        })
        .then((res) => {
          return res.data
        })
    }
  }
}
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.title {
  font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont,
    'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}

li {
  list-style-type: none;
}
</style>
