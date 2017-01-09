//= require components/profile/modify-attribute

<script lang="coffee">
  vm = {

    data: ->
      information: false
      name: ''
      oldPassword: ''
      newPassword: ''
      repeatnewPassword: ''
      message: '正在更新中，请稍等！'

    props: ['theAttribute']

    computed:
      informationState: ->
        this.information == true

      modifyAttributeColumn: ->
        this.theAttribute == "name"

    methods:
      cancelModify: ->
        this.$emit('cancelModify')

      updateCurrentUserAttributes: ->
        if this.theAttribute == "name"
          this.information = true


  }
</script>


<template>
  <div class="modify-attributes">
    <div class="modify-attribute" v-if="informationState">
      {{message}}
    </div>
    <div v-if="modifyAttributeColumn">
      <input class="form-control modify-attribute" v-model="name" placeholder="请输入名称">
    </div>
    <div v-else>
      <div>
        <input class="form-control modify-attribute" v-model="oldPassword" placeholder="请输原密码">
      </div>
      <div>
        <input class="form-control modify-attribute" v-model="newPassword" placeholder="请输入新密码">
      </div>
      <div>
        <input class="form-control modify-attribute" v-model="repeatnewPassword" placeholder="请再次输入新密码">
      </div>      
    </div>
    <div class="button-fields">
      <button type="submit" class="btn btn-default" @click.prevent="updateCurrentUserAttributes">确定</button>
      <button type="submit" class="btn btn-default" @click.prevent="cancelModify">取消</button>      
    </div>
  </div>
</template>


<style lang="scss">
  .modify-attributes{
    margin: 30px;
    padding: 2px 5px;

    .modify-attribute{
      width: 90%;
      margin: 10px 20px 20px 20px;
    }

    .button-fields{
      margin: 0 20px 20px 20px;
    }

 }
</style>











