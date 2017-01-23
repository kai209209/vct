<script lang="coffee">
  vm = {

    computed:
      chattingFriendsPool: ->
        this.$store.state.chattingFriendsPool

      currentChattingFriend: ->
        this.$store.state.currentChattingFriend

    methods:
      isActive: (friend) ->
        if this.currentChattingFriend == friend
          'active'

      selectCurrentChattingFriend: (friend) ->
        this.$store.commit('setCurrentChattingFriend', friend)

      removeFriendFromChattingFriendsPool: (friend) ->
        this.$store.commit('removeFriendFromChattingFriendsPool', friend)


  }
</script>


<template>
  <div class="conversation-list"> 
    <ul>
      <li v-for="(friend, index) in chattingFriendsPool" :class="isActive(friend)">
        <span><a href="#" @click.prevent="selectCurrentChattingFriend(friend)">{{friend.friends_relationship.nick_name || friend.friend.name}}</a></span><span><a href="#" @click.prevent="removeFriendFromChattingFriendsPool(friend)">x</a></span>
      </li>
    </ul>

  </div>
</template>


<style lang="scss">
  .conversation-list{
    width: 100%;
    height: 20px;

    ul{
      list-style: none;
      text-align: left;
      width: 100%;
      height: 50px;
      padding: 0;
      line-height: 20px;
      overflow-x:scroll; 

      li{
        display: inline-block;
        width: 100px;
        height: 30px;
        margin: 0 3px;
        padding: 3px;
        border: 1px solid #ccc;
        border-radius: 2px;
        position:relative;

        a{
          text-decoration: none;
          display: inline-block;
          color: black;
          vertical-align: middle;
        }

        span{
          display: inline-block;
          padding: 0 4px;
          font-size: 12px;
          text-align: center;
          &:first-child{
            width: 74px;
            margin: auto;
            a{
              width: 100%;
              text-overflow:ellipsis; 
              overflow:hidden; 
              white-space:nowrap; 
            }         

            &:after{
              content: "";
              position:absolute;
              width: 1px;
              height: 18px;
              right:18px;
              top:5px;
              background: #ccc;
            }
          }
          

          &:last-child{
            margin: 0;
            font-size: 8px;
            float: right;
            a{
              &:hover{
                color: red;
              }
            }
          }
        }
      }     

      .active{
        background-color: #cc9999;
      }
    }
  }

</style>