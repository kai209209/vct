//= require components/chatpool/search-friend
//= require components/chatpool/friends-list
//= require components/chatpool/conversation-field

<script lang="coffee">
  vm = {

    computed:
      friends: ->
        this.$store.state.friends

      currentUser: ->
        this.$store.state.currentUser


    components:
      searchFriend: VCompents['components/chatpool/search-friend']
      friendsList: VCompents['components/chatpool/friends-list']
      conversationField: VCompents['components/chatpool/conversation-field']

  }
</script>


<template>
  <div >
    <div class="vct-body">
      <div class="vct-sidebar">
        <search-friend></search-friend>
        <friends-list></friends-list>   
      </div>
      <div class="vct-panel">
        <conversation-field></conversation-field>
      </div>
    </div>
  </div>
</template>

<style lang="scss">
  
  .vct-body{
    width: 1140px;
    margin: 20px auto;
    text-align: center;
  }

  .vct-sidebar{
    display:inline-block;
    background: #ffffff;
    width: 400px;
    height: 800px;
    margin: 0 15px 0 0;
    border-radius: 8px;
    box-shadow: 0 4px 20px;
    vertical-align: top;
  }

  .vct-panel{
    display:inline-block;
    background: #ffffff;
    width: 650px;
    height: 800px;
    margin: 0 0 0 15px;
    border-radius: 8px;
    box-shadow: 0 4px 20px;
    vertical-align: top;

  }

</style>