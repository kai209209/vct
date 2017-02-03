<script lang="coffee">
  vm = {
    data: ->
      messageReceive: false

    props: ["friend"]

    computed: 
      messageCount: ->
        0

      friendAvatar: ->
        this.friend.friend.avatar.replace('public', '')

      chattingFriendsPool: ->
        this.$store.state.chattingFriendsPool

      webSocketData: ->
        this.$store.state.webSocketData

      currentChattingFriend: ->
        this.$store.state.currentChattingFriend


    methods: 
      chatWithFriend: ->
        this.messageReceive = false
        #设置当前聊天好友对象
        this.$store.commit('setCurrentChattingFriend', this.friend)
        unless this.friend in this.chattingFriendsPool
          #如果当前好友对象没有在聊天池中，则将该好友加入聊天池
          this.$store.commit('addFriendToChattingFriendsPool', this.friend)

    watch:
      currentChattingFriend: (val) ->
        if this.friend == val && this.messageReceive == true
          this.messageReceive = false


      webSocketData: (val) ->
        result =  val.operate == 'send_message' && val.user_message.user.id == this.friend.friend.id && this.currentChattingFriend != this.friend

        console.log result
        if result
          this.messageReceive = true


  }
</script>


<template>
  <div class="friend-item"> 
    <a href="#" @click.prevent="chatWithFriend"><img :src="friendAvatar" width="45" height="45"><div class="friend-info"><span>{{friend.friends_relationship.nick_name || friend.friend.name}}<em>({{friend.friend.email}})</em></span><span>...</span></div><div class="message-new" v-if="messageReceive">新</div></a>
  </div>
</template>


<style lang="scss">
  .friend-item{
    width: 100%;

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

  .message-new{
    display: inline-block;
    color: red;
    font-size: 10px;
  }

</style>