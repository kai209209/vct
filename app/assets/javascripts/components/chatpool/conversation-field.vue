//= require components/chatpool/conversation-list

<script lang="coffee">
  vm = {

    computed:
      chattingFriendsPool: ->
        this.$store.state.chattingFriendsPool

      currentChattingFriend: ->
        this.$store.state.currentChattingFriend

  components:
    conversationList: VCompents['components/chatpool/conversation-list']

  }
</script>


<template>
  <div> 
    <div class="conversations-top">
      <conversation-list></conversation-list>
    </div>
    <div class="conversations-middle">
      
    </div>
    <div class="conversations-bottom">
      
    </div>
  </div>
</template>


<style lang="scss">

  .conversations-top{
    width: 90%;
    height: 30px;
    margin: 30px auto 20px auto;
  }
  .conversations-middle{
    width: 80%;
    height: 550px;
    margin: 10px auto;
    border: 1px solid;
  }
  .conversations-bottom{
    width: 80%;
    height: 150px;
    margin: 10px auto;
    border: 1px solid;
  }

</style>