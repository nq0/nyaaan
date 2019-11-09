<template>
  <div class="todo-list-new">
    <nuxt-link to="/">
      <h2 class="title">nyaaan</h2>
    </nuxt-link>
    <div>
      <div class="todo-list-new_title">
        <h3>あたらしくつくる</h3>
      </div>
      <div class="todo-list-new_content">
        <div class="todo-list-new_content-title">
          <label>たいとる</label>
          <input
            v-model="title"
            type="text"
            maxlength="20"
            placeholder="ねこにちゅ〜るをあげる"
            class="todo-list-new_content-title-form"
          />
        </div>
        <div class="todo-list-new_content-description">
          <label>しょうさい</label>
          <input
            v-model="description"
            type="text"
            maxlength="50"
            placeholder="1日1回まで！"
            class="todo-list-new_content-description-form"
          />
        </div>
        <div class="todo-list-new_content-date">
          <label>きげん</label>
          <input
            v-model="date"
            type="date"
            class="todo-list-new_content-date-form"
          />
        </div>
        <div v-if="!formCheck" class="todo-list-new_content-check">
          <p>※全部入力してね</p>
        </div>
        <div class="todo-list-new_content-button">
          <nuxt-link to="/">
            <button class="blue">
              やめる
            </button>
          </nuxt-link>
          <button @click="postTitle">おっけー</button>
        </div>
      </div>
    </div>
    <div v-if="openModal" class="modal">
      <div class="modal-overlay">
        <div class="modal-content">
          <div>送信しました！</div>
          <nuxt-link to="/">
            <button class="blue">とじる</button>
          </nuxt-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: () => ({
    title: '',
    description: '',
    date: '',
    isSend: false
  }),
  computed: {
    formCheck() {
      if (!this.title || !this.description) {
        return false
      }
      return true
    },
    openModal() {
      if (this.isSend) return true
      return false
    }
  },
  methods: {
    async postTitle() {
      if (!this.formCheck) {
        return
      }
      await axios
        .post(`/api/v1/posts`, {
          title: this.title,
          description: this.description
        })
        .then((res) => {
          if (res.data.status === 'SUCCESS') {
            return (this.isSend = true)
          }
          return console.log('error')
        })
    }
  }
}
</script>

<style lang="scss" scoped>
.title {
  font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont,
    'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  display: block;
  font-weight: 300;
  color: #35495e;
  letter-spacing: 1px;
  display: flex;
  align-items: center;
  padding-left: 15px;
  background: beige;
  position: fixed;
  top: 0;
  left: 0;
  height: 50px;
  width: 100%;
  z-index: 99;
}
.todo-list-new {
  padding-top: 50px;
  &_title {
    padding: 20px;
    color: #566586;
    font-size: 20px;
    max-width: 700px;
    margin: 0 auto;
  }
  &_content {
    max-width: 600px;
    margin: 0 auto;
    width: 90%;
    display: flex;
    justify-content: center;
    flex-direction: column;
    &-title {
      label {
        display: block;
        color: #5e3f42;
      }
      &-form {
        height: 34px;
        width: 200px;
        border: solid 2px #bbc5d6;
        border-radius: 4px;
        font-size: 16px;
      }
    }
    &-description {
      padding-top: 16px;
      label {
        display: block;
        color: #5e3f42;
      }
      &-form {
        height: 34px;
        width: 90%;
        border: solid 2px #bbc5d6;
        border-radius: 4px;
        font-size: 16px;
      }
    }
    &-date {
      padding-top: 16px;
      label {
        display: block;
        color: #5e3f42;
      }
      &-form {
        border: solid 2px #bbc5d6;
        border-radius: 4px;
        font-size: 16px;
        color: #35495e;
      }
    }
    &-check {
      padding-top: 16px;
      p {
        color: #e07892;
      }
    }
    &-button {
      display: flex;
      justify-content: space-around;
      align-items: center;
      grid-row: 3/4;
      grid-column: 1/4;
      padding: 32px 24px;
      button {
        background: #fff;
        border: solid 2px #e290a4;
        width: 86px;
        height: 46px;
        border-radius: 36px;
        font-size: 14px;
        color: #e07892;
        // font-weight: bold;
        &.blue {
          border-color: #bbc5d6;
          color: #8a9bb8;
        }
      }
    }
  }
}
.modal {
  &-overlay {
    display: flex;
    justify-content: center;
    overflow: auto;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 9999;
    width: 100%;
    height: 100%;
    background: #000000b3;
  }
  &-content {
    position: relative;
    align-self: center;
    width: 80%;
    height: 40%;
    max-width: 800px;
    padding: 30px 30px 15px;
    box-sizing: border-box;
    background: #fff;
    line-height: 1.4em;
    border-radius: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    div {
      padding-bottom: 24px;
    }
    button {
      background: #fff;
      border: solid 2px #bbc5d6;
      width: 86px;
      height: 46px;
      border-radius: 36px;
      font-size: 14px;
      color: #8a9bb8;
    }
  }
}
</style>
