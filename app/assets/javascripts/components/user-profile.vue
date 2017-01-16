//= require components/profile/user-info
//= require components/profile/user-search


<script lang="coffee">
  vm = {
    data: ->
      state: 'searchFriend'

    computed:
      profile: ->
        this.state == 'profile'

      info: ->
        this.state == 'info'

      searchFriend: ->
        this.state == 'searchFriend'

    methods: 
      showInfo: ->
        this.state = "info"

      showSearchFriend: ->
        this.state = "searchFriend"

      returnProfile: ->
        this.state = "profile"


    props: ['currentUser']

    components:
      userInfo: VCompents['components/profile/user-info']
      userSearch: VCompents['components/profile/user-search']
  }
</script>


<template>
  <div class="vct-profile">
    <transition name="fade" mode="out-in">
      <div v-if="profile" key='profile'>
        <div class="profile"><a class="info-sel" href="#" @click.prevent="showInfo"><span>个人信息</span></a></div>
        <div class="profile"><a class="search-sel" href="#" @click.prevent="showSearchFriend"><span>查找好友</span></a></div>
      </div>
      <div v-else-if="info" key='info'>
        <userInfo @returnProfile="returnProfile"></userInfo>
      </div>
      <div v-else-if="searchFriend" key='searchFriend'>
        <user-search @returnProfile="returnProfile"></user-search>
      </div>
    </transition>
  </div>
</template>

<style lang="scss">
  .vct-profile{
    width: 1090px;
    margin: 20px auto;
    text-align: center;
    background: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 20px;
    padding: 50px 50px;

    .profile {
      display: inline-block;
      width: 300px;
      height: 300px;
      border-radius: 300px;
      line-height:300px;

      &:first-child{
        margin: 20px 20px;
      }

      &:last-child{
        margin: 20px 20px;
      }

      a{
        height: 100%;
        width: 100%;
        line-height:260px;
        display: block;
        border:15px solid rgba(200,200,200,0.4);
        border-radius: 300px;
        font-size: 40px;
        color: rgba(200,200,200,1);
        background-origin: border-box;

        &.info-sel {
          background-image: url(/assets/info-profile.jpg);
        }

        &.search-sel {
          background-image: url(/assets/search-profile.jpg);
        }

        span{
          display: block;
          width: 100%;
          height: 100%;
          border-radius: 300px;
          background: rgba(255,255,255,0);
          transition: all .5s ease;

          &:hover{
            background: rgba(255,255,255,0.5);
          }

        }

        &:hover{
          text-decoration:none;
          color: rgba(0,0,0,1)
        }
      }
    }
  }

</style>