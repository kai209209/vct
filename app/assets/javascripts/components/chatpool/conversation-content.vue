
<script lang="coffee">
  vm = {
    data: ->
      messages: []

    computed:
      currentChattingFriend: ->
        this.$store.state.currentChattingFriend


    watch:
      currentChattingFriend: (val) ->
        console.log val

  }
</script>

<template>
  <div id="vct-conversation"> 
    <ul>
      <li v-for="message in messages">
        
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
    border: 1px solid;
  }

</style>