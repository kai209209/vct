
<script lang="coffee">
  vm = {

    props: ['currentUser']

    created: ->
      this.$store.commit('setCurrentUser', this.currentUser)
  }
</script>


<template>
  <div class="nav"> 
    <ul class="vct-brand">
      <li>
        <a href="/">Vct</a>
      </li>
    </ul>
    <ul class="vct-nav">
      <template v-if="currentUser">
        <li><a href="#">{{currentUser.name}}</a></li>
        <li><a href="/vct/chat">聊天</a></li>
        <li><a href="/users/sign_out" data-method="delete">退出</a></li>
      </template>
      <template v-else>
        <li><a href="/users/sign_in">登录</a></li>
        <li><a href="/users/sign_up">注册</a></li>
      </template>
    </ul>
  </div>
</template>


        