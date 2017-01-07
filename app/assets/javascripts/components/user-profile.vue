
<script lang="coffee">
  vm = {

    props: ['currentUser']

    created: ->
      this.$store.commit('setCurrentUser', this.currentUser)
  }
</script>


<template>
  <div class="vct-profile">
  
  </div>
</template>

<style lang="scss">
  .vct-profile{
    width: 1090px;
    height: 300px;
    margin: 20px auto;
    background: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 20px;
    padding: 150px 300px 0 300px;
  }
</style>