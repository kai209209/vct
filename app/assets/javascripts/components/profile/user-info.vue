//= require components/profile/modify-attribute

<script lang="coffee">
  vm = {
    data: ->
      theAttribute: 'name'

    computed:
      currentUser: ->
        this.$store.state.currentUser

      theAttributeState: ->
        this.theAttribute != ""

      avatar: ->
        ava = this.currentUser.avatar.replace('public', '')
        ava = ava.replace('100', '240')
        ava

    methods: 
      returnProfile: ->
        this.$emit('returnProfile')

      modifyTheName: ->
        this.theAttribute = 'name'


      modifyThePassword: ->
        this.theAttribute = 'password'

      setTheAttributesNull: ->
        this.theAttribute = ''


    components:
      modifyAttribute: VCompents['components/profile/modify-attribute']


  }
</script>


<template>
  <div class="user-operate"> 
    <a class="return-pro btn btn-default btn-xs" href="#" @click.prevent="returnProfile">返回上一层</a>
    <div class="user-infos">
      <div class="img-block"><img :src="avatar"></div>
      <div class="user-poverty">
        <div>名称: {{currentUser.name}}<span><a href="#" @click.prevent="modifyTheName">点击修改名称</a></span></div>
        <div>邮箱: {{currentUser.email}}<span>邮箱不可修改</div>
        <div>密码<span><a href="#" @click.prevent="modifyThePassword">点击修改密码</a></div>
      </div>
    </div>
    <transition name="fade" mode="out-in">
      <div class="modify-poverty" v-if="theAttributeState">
        <modify-attribute :theAttribute="theAttribute" @cancelModify="setTheAttributesNull"></modify-attribute>
      </div>
    </transition>
  </div>
</template>


<style lang="scss">
  .user-infos{
    display: inline-block;
    position: absolute;
    padding: 10px;
    top: 50px;
    left: 20px;

    .img-block {
      display: inline-block;
      img {
        width: 150px;
        height: 150px;
      }
    }

    .user-poverty{
      display: inline-block;
      padding: 0 0 0 20px;
      vertical-align: middle;

      div{
        font-size: 15px;
        height: 30px;
        position: relative;

        span, a{
          display: inline-block;
          position: absolute;
          padding-left: 5px;
          border-radius: 5px;
          width: 100%;
          left: 0;
          top: 0;
          background: rgba(255,255,255, 0);
          color: rgba(0, 0, 0, 0);
          transition: all .3s ease;

          &:hover{
            text-decoration: none;
            background: rgba(192,192,192, 1);
            color: rgba(0, 0, 0, 1);
          }
        }
      }
    }

  }

  .modify-poverty{
    display: inline-block;
    margin: 0 10px 0 100px;
    width: 50%;
    position: absolute;
    top: 10px;
    right: 50px;
    }
</style>











