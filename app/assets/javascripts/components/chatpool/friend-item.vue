<script lang="coffee">
  vm = {

    props: ["friend"]

    computed: 
      messageReceive: ->
        false

      messageCount: ->
        0

      friendAvatar: ->
        this.friend.friend.avatar.replace('public', '')

      chattingFriendsPool: ->
        this.$store.state.chattingFriendsPool


    methods: 
      chatWithFriend: ->
        #设置当前聊天好友对象
        this.$store.commit('setCurrentChattingFriend', this.friend)
        unless this.friend in this.chattingFriendsPool
          #如果当前好友对象没有在聊天池中，则将该好友加入聊天池
          this.$store.commit('addFriendToChattingFriendsPool', this.friend)
  }
</script>


<template>
  <div class="friend-item"> 
    <a href="#" @click.prevent="chatWithFriend"><img :src="friendAvatar" width="45" height="45"><div class="friend-info"><span>{{friend.friends_relationship.nick_name || friend.friend.name}}<em>({{friend.friend.email}})</em></span><span>...</span></div><div class="message-count" v-if="messageReceive">{{messageCount}}</div></a>
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