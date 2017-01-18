<script lang="coffee">
  vm = {
    data: ->
      userName: ''

  }
</script>


<template>
  <div class="search-friend"> 
    <input class="form-control" type="text" placeholder="搜索好友" v-model='userName'>  
    <hr>
  </div>
</template>


<style lang="scss">
  .search-friend{
    text-align: left;
    width: 350px;
    margin: 30px auto 5px;
  }

</style>