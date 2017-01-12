//= require components/user-apply
<script lang="coffee">
  vm = {

    data: ->
      searchUser: ''
      # users: ''
      usersState: ''

    computed: 
      users: ->
        user = this.$store.state.currentUser
        [user]
        
      userslist: ->
        this.users

      loading: ->
        this.usersState == 'loading'



    methods: 
      returnPro: ->
        this.$emit('returnProfile')

      searchUserFromBacken: ->
        this.usersState = 'loading'

    components:
      userApply: VCompents['components/user-apply']



  }
</script>


<template>
  <div class="user-operate"> 
    <h3>搜索用户</h3>
    <a class="return-pro btn btn-default btn-xs" href="#" @click.prevent="returnPro">返回上一层</a>
    <hr>
    <div class="search-panel">
      <div class="form-group">
        <input v-model="searchUser" class="form-control" placeholder="请输入用户名称或者邮箱">        
      </div>      
      <button class="btn btn-default btn-sm" @click="searchUserFromBacken">搜索</button>
    </div>
    <div class="show-users">
      <div v-if="userslist">
        <div class="search-list">
          <user-apply v-for="user in users" :user="user"></user-apply>
        </div>
      </div>
      <div v-else-if="loading">
        <div class="loading-text">正在加载，请稍后！</div>
        <div class="spinner">
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
      <div v-else>无</div>
    </div>
  </div>
</template>


<style lang="scss">
  .search-panel{
    display: inline-block;
    vertical-align: top;
    width: 250px;
    padding: 5px 10px;
    border-right: 1px solid #eee;

  }

  .show-users{
    display: inline-block;
    vertical-align: top;
    width: 700px;
    padding: 5px 20px;
  }

  .earch-list{

  }

  .loading-text{
    display: inline-block;
    vertical-align: middle;
    height: 50px;
    // line-height: 10px;
  }

  .spinner {
    display: inline-block;
    margin: 10px auto;
    width: 20px;
    height: 20px;
    position: relative;
  }
     
  .container1 > div, .container2 > div, .container3 > div {
    width: 6px;
    height: 6px;
    background-color: #333;
   
    border-radius: 100%;
    position: absolute;
    -webkit-animation: bouncedelay 1.2s infinite ease-in-out;
    animation: bouncedelay 1.2s infinite ease-in-out;
    -webkit-animation-fill-mode: both;
    animation-fill-mode: both;
  }
   
  .spinner .spinner-container {
    position: absolute;
    width: 100%;
    height: 100%;
  }
   
  .container2 {
    -webkit-transform: rotateZ(45deg);
    transform: rotateZ(45deg);
  }
   
  .container3 {
    -webkit-transform: rotateZ(90deg);
    transform: rotateZ(90deg);
  }
   
  .circle1 { top: 0; left: 0; }
  .circle2 { top: 0; right: 0; }
  .circle3 { right: 0; bottom: 0; }
  .circle4 { left: 0; bottom: 0; }
   
  .container2 .circle1 {
    -webkit-animation-delay: -1.1s;
    animation-delay: -1.1s;
  }
   
  .container3 .circle1 {
    -webkit-animation-delay: -1.0s;
    animation-delay: -1.0s;
  }
   
  .container1 .circle2 {
    -webkit-animation-delay: -0.9s;
    animation-delay: -0.9s;
  }
   
  .container2 .circle2 {
    -webkit-animation-delay: -0.8s;
    animation-delay: -0.8s;
  }
   
  .container3 .circle2 {
    -webkit-animation-delay: -0.7s;
    animation-delay: -0.7s;
  }
   
  .container1 .circle3 {
    -webkit-animation-delay: -0.6s;
    animation-delay: -0.6s;
  }
   
  .container2 .circle3 {
    -webkit-animation-delay: -0.5s;
    animation-delay: -0.5s;
  }
   
  .container3 .circle3 {
    -webkit-animation-delay: -0.4s;
    animation-delay: -0.4s;
  }
   
  .container1 .circle4 {
    -webkit-animation-delay: -0.3s;
    animation-delay: -0.3s;
  }
   
  .container2 .circle4 {
    -webkit-animation-delay: -0.2s;
    animation-delay: -0.2s;
  }
   
  .container3 .circle4 {
    -webkit-animation-delay: -0.1s;
    animation-delay: -0.1s;
  }
   
  @-webkit-keyframes bouncedelay {
    0%, 80%, 100% { -webkit-transform: scale(0.0) }
    40% { -webkit-transform: scale(1.0) }
  }
   
  @keyframes bouncedelay {
    0%, 80%, 100% {
      transform: scale(0.0);
      -webkit-transform: scale(0.0);
    } 40% {
      transform: scale(1.0);
      -webkit-transform: scale(1.0);
    }
  }
</style>