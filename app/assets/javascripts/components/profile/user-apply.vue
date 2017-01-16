
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
    <a href="#">
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
    width: 120px;
    text-align: center;
    display: inline-block;
    margin: 5px;
    border: 1px solid black;
    border-radius: 3px;

    a{
      display: block;
      margin: 3px;

      img{
        display: block;
        margin: 0 5px;
      }

      span {
        word-wrap: break-word;
        word-break: break-all;        
      }
    }
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