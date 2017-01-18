<script lang="coffee">
  vm = {

    computed:
      friends: ->
        this.$store.state.friends

    methods: 
      chatWithFriend: (friend) ->
        's'

      friendAvatar: (friend) ->
        friend.avatar.replace('public', '')


  }
</script>


<template>
  <div class="friends-list"> 
    <ul>
      <li class="friend-list" v-for="friend in friends">
        <a href="#" @click.prevent="chatWithFriend(friend)"><img :src="friendAvatar(friend)" width="40" height="40">{{friend.name}}</a>
      </li>
    </ul>  
  </div>
</template>


<style lang="scss">
  .friends-list{
    text-align: left;
    width: 350px;
    margin: 1px auto;

    ul{
      list-style: none;
      padding: 0 0 0 10px;

      li{
        height: 40px;
        margin: 5px 0 0 0;
      }

      a{
        text-decoration: none;
        display: block;
      }
    }
  }




</style>