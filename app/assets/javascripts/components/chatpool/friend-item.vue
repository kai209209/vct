<script lang="coffee">
  vm = {

    props: ["friend"]

    computed: 
      messageReceive: ->
        false

      messageCount: ->
        0

    methods: 
      chatWithFriend: (friend) ->
        's'

      friendAvatar: (friend) ->
        friend.avatar.replace('public', '')

  }
</script>


<template>
  <div class="friend-item"> 
    <a href="#" @click.prevent="chatWithFriend(friend)"><img :src="friendAvatar(friend)" width="45" height="45"><div class="friend-info"><span>{{friend.name}}<em>({{friend.email}})</em></span><span>...</span></div><div class="message-count" v-if="messageReceive">{{messageCount}}</div></a>
  </div>
</template>


<style lang="scss">
  .friend-item{
    width: 100%;
  }

  a{
    text-decoration: none;
    display: inline-block;
    height: 45px;
    width: 100%;

    img{
      display: inline-block;
      height: 45px;
    }

    &:hover{
      background: #eee;
    }

  }

  .friend-info{
    display: inline-block;
    vertical-align: middle;
    height: 40px;
    width: 80%;

    span{
      display: block;
      height: 20px;
      margin: 0 10px;
      em{
        margin: 0 3px;
        color:gray;
      }
    }
  }

  .message-count{
    display: inline-block;
  }

</style>