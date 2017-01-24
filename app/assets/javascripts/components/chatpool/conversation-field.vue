//= require components/chatpool/conversation-list
//= require components/chatpool/conversation-content
//= require components/chatpool/conversation-form


<script lang="coffee">
  vm = {

    computed:
      chattingFriendsPool: ->
        this.$store.state.chattingFriendsPool

      currentChattingFriend: ->
        this.$store.state.currentChattingFriend

  components:
    conversationList: VCompents['components/chatpool/conversation-list']
    conversationContent: VCompents['components/chatpool/conversation-content']
    conversationForm: VCompents['components/chatpool/conversation-form']

  }
</script>


<template>
  <div v-if="currentChattingFriend"> 
    <div class="conversations-top">
      <conversation-list></conversation-list>
    </div>
    <div class="conversations-middle">
      <conversation-content></conversation-content>
    </div>
    <div class="conversations-bottom">
      <conversation-form></conversation-form>      
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
    height: 500px;
    margin: 10px auto;
  }
  .conversations-bottom{
    width: 80%;
    height: 170px;
    margin: 10px auto;
  }

</style>