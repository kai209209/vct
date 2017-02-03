
<script lang="coffee">
  vm = {
    data: ->
      messageState: false
      content: ''
      currentConversationMessages: []
      currentConversation: ''

    computed:
      currentChattingFriend: ->
        this.$store.state.currentChattingFriend

      webSocketData: ->
        this.$store.state.webSocketData

    mounted: ->   
      this.loadMessages(this.currentChattingFriend)

    updated: ->
      this.rollthHeight(1)

    watch:
      currentChattingFriend: (val) ->
        this.messageState = false
        this.loadMessages(val)

      webSocketData: (val) ->
        if val.operate == 'send_message' && val.conversation_id == this.currentConversation.id
          this.currentConversationMessages.push(val.user_message)
          

    methods:
      loadMessages: (val) ->
        $this = this
        $.getJSON({
          url: "/conversations/#{val.conversation.id}"
          success: (data) ->
            $this.currentConversationMessages = data.user_messages
            $this.currentConversation = data.conversation
            $this.messageState = true
            $this.rollthHeight(1)
          })

      userClass: (messageItem) ->
        if messageItem.user.id == this.$store.state.currentUser.id
          'self'

      userAvatar: (user) ->
        user.avatar.replace('public', '')


      sendMessage: ->
        value = this.content && this.content.trim()
        if !value
          return

        conversation_id = this.currentChattingFriend.conversation.id

        messageProperty = {
          message:          
            id: 'null'
            content: this.content
            user_id: this.$store.state.currentUser.id
            conversation_id: conversation_id
          user:
            this.$store.state.currentUser
        }

        this.currentConversationMessages.push(messageProperty)
        messageIndex = this.currentConversationMessages.indexOf(messageProperty)
        
        $this = this        
        $.ajax({
          url: "/conversations/#{conversation_id}/user_messages"
          type: 'POST'
          data:
            user_message:
              content: $this.content
              conversation_id: conversation_id
          success: (data) ->
            $this.currentConversationMessages.splice(messageIndex, 1, data.user_message)   
          })
        this.content = ''

      rollthHeight: (st)->
        allmessages = $('#vct-conversation')
        allmessages.scrollTop(allmessages.prop("scrollHeight"))

      sendingState: (message) ->
        if message.message.id == 'null'
          true
        else 
          false

    filters:
      formatDate: (v) ->
        moment(v).format('YYYY-MM-DD HH:mm')

  }
</script>

<template>
  <div id="conversation-info"> 
    <div id="vct-conversation">
      <ul v-if="messageState">
        <li v-for="messageItem in currentConversationMessages">
          <p class="time"><span>{{messageItem.message.created_at | formatDate}}</span></p>
          <div class="main" :class="userClass(messageItem)">
            <img class="avatar" width="30" height="30" :src="userAvatar(messageItem.user)"/>
            <div class="text">{{messageItem.message.content}}</div>
            <p v-if="sendingState(messageItem)">发送中</p>
          </div>

        </li>
      </ul>
      <div class="spinner" v-else>
        <div class="spinner-container container1">
          <div class="circle1"></div>
          <div class="circle2"></div>
          <div class="circle3"></div>
          <div class="circle4"></div>
        </div>
        <div class="spinner-container container2">
          <div class="circle1"></div>
          <div class="circle2"></div>
          <div class="circle3"></div>
          <div class="circle4"></div>
        </div>
        <div class="spinner-container container3">
          <div class="circle1"></div>
          <div class="circle2"></div>
          <div class="circle3"></div>
          <div class="circle4"></div>
        </div>
      </div>
    </div>
    <div id="content-form"> 
      <div class="form-group">
        <textarea class="form-control" rows='5' v-model='content' >
      </div>
      <div class="form-group">
        <button class="btn btn-default btn-sm" @click='sendMessage'>发送</button>
      </div>
    </div>
  </div>
</template>


<style lang="scss">
  #conversation-info {
    height: 98%;
  }

  #vct-conversation{
    padding: 10px 15px;
    overflow-y: scroll;
    height: 500px;
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

    .main{
      p {
        font-size: 8px;
        padding: 0 0 0 45px;
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

      p {
        padding: 0 45px 0 0;
      }
    }
  }

  #content-form{
    width: 100%;
    padding: 0 15px;
    height: 150px;
    margin: 3px auto;
    padding: 20px 0 0 0;
    text-align: left;
  }

</style>