<script lang="coffee">
  vm = {

    computed:
      chattingFriendsPool: ->
        this.$store.state.chattingFriendsPool

      currentChattingFriend: ->
        this.$store.state.currentChattingFriend

  }
</script>


<template>
  <div class="conversation-list"> 
    <ul>
      <li v-for="(friend, index) in chattingFriendsPool">
        <span><a href="#">{{friend.friends_relationship.nick_name || friend.friend.name}}<a></span><span><a href="#">x<a></span>
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
      padding: 0;
      line-height: 20px;

      li{
        display: inline-block;
        margin: 0 3px;
        padding: 3px;
        border: 1px solid #ccc;
        border-radius: 2px;
        position:relative;

        a{
          text-decoration: none;
          color: black;
          font-size: 18px;

        }

        span{
          display: inline-block;
          padding: 0 4px;
          &:first-child{
            margin: 0 3px 0 0;
            &:after{
              content: "";
              position:absolute;
              width: 2px;
              height: 18px;
              right:20px;
              top:5px;
              background: #ccc;
            }

          }
          

          &:last-child{
            margin: 0;
          }
        }
      }
    }
  }

</style>