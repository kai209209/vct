<script lang="coffee">
  vm = {
    props: ['user']

    computed:
      userImage: ->
        this.user.avatar.replace('public', '')


  }
</script>


<template>
  <div class="search-user-info"> 
    <a href="#" class="thumbnail">
      <img :src="userImage">
      <span>{{user.name}}<em id="user-image-info">({{user.email}})</em></span>      
    </a>
    <div class="search-operate">
      <span><button class="btn btn-xs btn-default">信息</button></span>
      <span><button class="btn btn-xs btn-primary">申请好友</button></span>
    </div>
  </div>
</template>


<style lang="scss">
  .search-user-info{
    width: 200px;
    height: 100px;
    text-align: center;
    display: inline-block;
    margin: 5px;
  }

  .search-operate{
    width: 100%;
    height: 30px;
    text-align: center;
    padding: 2px 0 0 0;
  }
  #user-image-info{
    margin: 0 0 0 5px;
  }
</style>