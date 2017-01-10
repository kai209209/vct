<script lang="coffee">
  vm = {

    props: ['currentUser']

    created: ->
      this.$store.commit('setCurrentUser', this.currentUser)

    computed:
      storedCurrentUser: ->
        this.$store.state.currentUser

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
      <template v-if="storedCurrentUser">
        <li><a href="/user">{{storedCurrentUser.name}}</a></li>
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


<style lang="scss">
  .nav{
    width: 1090px;
    height: 50px;
    margin: 0 auto;
    background: #ffffff;
    border-radius: 0 0 8px 8px;
    box-shadow: 0 4px 20px;

    ul.vct-nav {
      height: 100%;
      margin: 0 10px 0 0;
      list-style: none;
      display: inline-block;
      float: right;

      li {
        display: inline-block;
        line-height: 50px;
        text-align: right;
        padding: 0 2px;

        a {
          color: black;
        }
      }    
    }

    ul.vct-brand {
      list-style: none;
      height: 100%;
      display: inline-block;
      float: left;

      li {
        display: inline-block;
        line-height: 50px;
        font-size: 25px;
        a {
          color: black;
          &:hover{
            text-decoration:none;
          }
        }
      }
    }
  }

</style>