
<script lang="coffee">
  vm = {
    data: ->
      messageItems: []

    computed:
      currentChattingFriend: ->
        this.$store.state.currentChattingFriend

    created: ->
      $this = this
      $.getJSON({
        url: "/conversations/#{$this.currentChattingFriend.conversation.id}"
        success: (data) ->
          $this.messageItems = data.user_messages
        })

    watch:
      currentChattingFriend: (val) ->
        $this = this
        $.getJSON({
          url: "/conversations/#{val.conversation.id}"
          success: (data) ->
            $this.messageItems = data.user_messages
          })

    methods:
      userClass: (messageItem) ->
        if messageItem.user.id == this.$store.state.currentUser.id
          'self'

      userAvatar: (user) ->
        user.avatar.replace('public', '')

    filters:
      formatDate: (v) ->
        moment(v).format('YYYY-MM-DD HH:mm')
  }
</script>

<template>
  <div id="vct-conversation"> 
    <ul>
      <li v-for="messageItem in messageItems">
        <p class="time"><span>{{messageItem.message.created_at | formatDate}}</span></p>
        <div class="main" :class="userClass(messageItem)">
          <img class="avatar" width="30" height="30" :src="userAvatar(messageItem.user)"/>
          <div class="text">{{messageItem.message.content}}</div>
        </div>
      </li>
    </ul>
  </div>
</template>


<style lang="scss">
  #vct-conversation{
    padding: 10px 15px;
    overflow-y: scroll;
    height: 98%;
    margin: 3px auto;
    border: 1px solid #dcdcdc;
    border-radius: 3px;
    background-color: #fafafa;

    ul{
      list-style: none;
      padding: 0;

      >li{
        margin-bottom: 15px;
        text-align: left;
      }
    }

    .time {
      margin: 7px 0;
      text-align: center;
      
      > span {
        display: inline-block;
        padding: 0 18px;
        font-size: 12px;
        color: black;
        border-radius: 2px;
        background-color: #dcdcdc;
      }
    }

    .avatar {
      float: left;
      margin: 0 10px 0 0;
      border-radius: 3px;
    }

    .text {
      display: inline-block;
      position: relative;
      padding: 0 10px;
      max-width: 80%;
      min-height: 30px;
      line-height: 2.5;
      font-size: 12px;
      text-align: left;
      word-break: break-all;
      background-color: #ccffff;
      border-radius: 4px;
      
      &:before {
          content: " ";
          position: absolute;
          top: 9px;
          right: 100%;
          border: 6px solid transparent;
          border-right-color: #ccffff;
      }
    }
    
    .self {
      text-align: right;
      
      .avatar {
          float: right;
          margin: 0 0 0 10px;
      }
      .text {
          background-color: #b2e281;
          
          &:before {
              right: inherit;
              left: 100%;
              border-right-color: transparent;
              border-left-color: #b2e281;
          }
      }
    }
  }

</style>