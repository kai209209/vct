//= require components/chatpool/search-friend
//= require components/chatpool/friends-list
//= require components/chatpool/conversation-field

<script lang="coffee">
  vm = {

    data: ->
      friends: []
      filteredFriends: []

    computed:
      currentUser: ->
        this.$store.state.currentUser

      caculateFriends: ->
        if this.filteredFriends.length != 0
          this.filteredFriends
        else
          this.friends

      chattingFriendsPool: ->
        # this.$store.state.chattingFriendsPool.length > 0
        true


    methods: 
      filterFriends: (queryString) ->
        #根据传入的数据进行查询且过滤
        this.filteredFriends = this.friends.filter (friend) ->
          nameState = String(friend.friend.name).toLowerCase().indexOf(queryString) > -1
          emailState = String(friend.friend.email).toLowerCase().indexOf(queryString) > -1
          nickNameState = String(friend.friends_relationship.nick_name).toLowerCase().indexOf(queryString) > -1
          nameState || emailState || nickNameState
        

    created: ->
      $this = this
      $.getJSON({
        url: '/friends_relationships'
        success: (data) ->
          #加载好友关系数据
          $this.$store.commit('setFriends', data.friends_relationships)
          $this.friends = data.friends_relationships
        })


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
        <h5>我的好友</h5>
        <search-friend :friends="friends" @filterFriends="filterFriends"></search-friend>
        <friends-list :friends="caculateFriends"></friends-list>
      </div>
      <div class="vct-panel">
        <conversation-field v-if="chattingFriendsPool"></conversation-field>
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