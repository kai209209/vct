//= require components/chatpool/friend-item
<script lang="coffee">
  vm = {

    props: ['friends']
    
    components:
      friend: VCompents['components/chatpool/friend-item']
  }
</script>

<template>
  <div class="friends-list"> 
    <ul>
      <li v-for="friend in friends">
        <friend :friend="friend"></friend>
      </li>
    </ul>  
  </div>
</template>


<style lang="scss">
  .friends-list{
    text-align: left;
    width: 350px;
    margin: 1px auto;

    ul{
      list-style: none;
      padding: 0 10px;

      li{
        height: 45px;  
        margin: 2px 0 0 0;      
      }
    }
  }

</style>