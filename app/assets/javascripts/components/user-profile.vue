//= require components/profile/user-info
//= require components/profile/user-search

<script lang="coffee">
  vm = {
    data: ->
      state: 'profile'

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

    created: ->
      this.$store.commit('setCurrentUser', this.currentUser)

    components:
      userInfo: VCompents['components/user-info']
      userSearch: VCompents['components/user-search']
  }
</script>


<template>
  <div class="vct-profile">
    <div v-if="profile">
      <div class="profile"><a class="info-sel" href="#" @click.prevent="showInfo">个人信息</a></div>
      <div class="profile"><a class="search-sel" href="#" @click.prevent="showSearchFriend">查找好友</a></div>
    </div>
    <div v-else-if="info">
      <user-info></user-info>
    </div>
    <div v-else-if="searchFriend">
      <user-search></user-search>
    </div>
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
    padding: 50px 100px;

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

        &:hover{
          text-decoration:none;
          color: rgba(0,0,0,1)
        }
      }
    }
  }


</style>