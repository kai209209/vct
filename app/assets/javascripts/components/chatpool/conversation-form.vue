<script lang="coffee">
  vm = {
    data: ->
      message: ''
      content: ''

    computed:
      currentChattingFriend: ->
        this.$store.state.currentChattingFriend

    methods:
      sendMessage: ->
        $this = this
        conversation_id = $this.currentChattingFriend.conversation.id
        $.ajax({
          url: "/conversations/#{conversation_id}/user_messages"
          type: 'POST'
          data:
            user_message:
              content: $this.content
              conversation_id: conversation_id
          success: (data) ->

          })


  }
</script>


<template>
  <div id="conversation-form"> 
    <div class="form-group">
      <textarea class="form-control" rows='5' v-model='content' >
    </div>
    <div class="form-group">
      <button class="btn btn-default btn-sm" @click='sendMessage'>发送</button>
    </div>
  </div>

</template>


<style lang="scss">
  #conversation-form{
    width: 100%;
    padding: 0 15px;
    height: 100%;
    margin: 3px auto;
    text-align: left;
  }

</style>