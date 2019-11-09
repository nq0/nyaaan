<template>
  <div class="container">
    <div>
      <h2 class="title">nyaaan</h2>
      <div>
        <div class="todo-list_title">
          <h3>とぅーどぅーりすと</h3>
        </div>
        <div class="todo-list_content">
          <div class="todo-list_content-top">
            <div class="todo-list_content-top_select">
              <select name="sort">
                <option value="">ならびかえ</option>
                <option value="desc">あたらしい順</option>
                <option value="asc">ふるい順</option>
              </select>
            </div>
            <nuxt-link to="/new">
              <button class="todo-list_content-top_new">
                <span>＋</span>
              </button>
            </nuxt-link>
          </div>
          <div>
            <div
              v-for="data in dataList"
              :key="data.id"
              class="todo-list_content-item"
            >
              <div class="todo-list_content-item_date">
                <span>11/1</span>
              </div>
              <div class="todo-list_content-item_title">{{ data.title }}</div>
              <div
                class="todo-list_content-item_close"
                @click="openDeleteModal(data.id)"
              >
                <span>×</span>
              </div>
              <div class="todo-list_content-item_description">
                {{ data.description }}
              </div>
              <div class="todo-list_content-item_button">
                <nuxt-link :to="'/' + data.id + '/edit'">
                  <button class="blue">
                    へんしゅー
                  </button>
                </nuxt-link>
                <button>やった</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal">
      <div class="modal-overlay">
        <div class="modal-content"></div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  components: {},
  data: () => ({
    dataList: []
  }),
  created() {
    this.getTitle()
  },
  methods: {
    goEdit(id) {
      console.log(id)
    },
    openDeleteModal(id) {
      console.log(id)
    },
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

<style lang="scss" scoped>
.container {
  padding-top: 50px;
}

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

// select {
//   -webkit-appearance: none;
//   -moz-appearance: none;
//   appearance: none;
//   border: none;
//   outline: none;
//   background: transparent;
// }

.todo-list {
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
    &-top {
      display: flex;
      justify-content: space-between;
      padding-bottom: 14px;
      align-items: flex-end;
      &_select {
        width: 80px;
        position: relative;
        &::before {
          content: '';
          width: 6px;
          height: 6px;
          border: 0px;
          border-top: solid 2px #8a9bb8;
          border-right: solid 2px #8a9bb8;
          -ms-transform: rotate(135deg);
          -webkit-transform: rotate(135deg);
          transform: rotate(135deg);
          position: absolute;
          top: 50%;
          right: -2px;
          margin-top: -4px;
        }
        select {
          border: solid 2px #bbc5d6;
          height: 28px;
          color: #566586;
        }
      }
      &_new {
        width: 40px;
        height: 40px;
        border: solid 2px #e290a4;
        border-radius: 50%;
        color: #e290a4;
        span {
          position: relative;
          top: -3px;
          font-size: 30px;
          display: flex;
          justify-content: center;
        }
      }
    }
    &-item {
      display: grid;
      grid-template-columns: 60px 1fr 30px;
      grid-auto-rows: 36px 1fr 60px;
      height: 160px;
      background: #fffef7;
      margin-bottom: 12px;
      border: solid 2px #bbc5d6;
      border-radius: 5px;
      &_date {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 36px;
        background: #bbc5d6;
        span {
          font-weight: bold;
          font-size: 18px;
          color: #566586;
        }
      }
      &_title {
        display: flex;
        align-items: center;
        font-size: 18px;
        font-weight: bold;
        background: #bbc5d6;
        color: #fff;
      }
      &_close {
        position: relative;
        background: #bbc5d6;
        span {
          font-size: 30px;
          color: #566586;
          position: absolute;
          top: -3px;
        }
      }
      &_description {
        grid-row: 2/3;
        grid-column: 2/3;
        padding: 10px 0;
        display: flex;
        align-items: center;
        color: #5e3f42;
      }
      &_button {
        display: flex;
        justify-content: space-around;
        align-items: center;
        grid-row: 3/4;
        grid-column: 1/4;
        padding: 0 30px;
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
}
.modal {
  display: none;
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
    width: 92%;
    height: 92%;
    max-width: 800px;
    padding: 30px 30px 15px;
    box-sizing: border-box;
    background: #fff;
    line-height: 1.4em;
    border-radius: 20px;
  }
}
</style>
