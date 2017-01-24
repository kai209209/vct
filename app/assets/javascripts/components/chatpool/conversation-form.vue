<script lang="coffee">
  vm = {
    data: ->
      message: ''

    methods:
      sendMessage: ->
        true


  }
</script>


<template>
  <div id="conversation-form"> 
    <div class="form-group">
      <textarea class="form-control" rows='5' v-model='message' >
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