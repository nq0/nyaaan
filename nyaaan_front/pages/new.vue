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
            maxlength="50"
            placeholder="たいとる"
            class="todo-list-new_content-title-form"
          />
        </div>
      </div>
    </div>
    new
  </div>
</template>

<script>
export default {
  deta: () => ({
    title: '',
    description: ''
  })
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
      &-form {
        height: 34px;
        width: 200px;
        border: solid 2px #bbc5d6;
        border-radius: 4px;
        font-size: 16px;
      }
    }
  }
}
</style>
