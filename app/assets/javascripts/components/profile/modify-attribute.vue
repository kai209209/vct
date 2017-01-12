
<script lang="coffee">
  vm = {

    data: ->
      information: false
      name: ''      
      currentPassword: ''
      password: ''
      passwordConfirmation: ''
      message: ''
      currentPasswordError: ''
      passwordError: ''
      passwordConfirmationError: ''

    props: ['theAttribute']

    computed:
      informationState: ->
        this.information == true

      modifyAttributeColumn: ->
        this.theAttribute == 'name'


    methods:
      cancelModify: ->
        this.$emit('cancelModify')

      updateCurrentUserAttributes: ->
        this.information = true
        this.message = "更新中，请稍后！"
        $this = this
        if this.theAttribute == "name"
          $.ajax({
            url: '/user/update_name'
            type: 'POST'
            data:
              name: $this.name
            success: (data) ->
              $this.message = "更新成功！"
              $this.$store.commit('setCurrentUser', data)

            error: (data) ->      
              $this.message =  data.responseJSON.error
            })
        else           
          this.currentPasswordError = ''
          this.passwordError = ''
          this.passwordConfirmationError = ''
          $.ajax({
            url: '/user/update_password'
            type: 'POST'
            data:
              user:
                current_password: $this.currentPassword
                password: $this.password
                password_confirmation: $this.passwordConfirmation
            success: (data) ->
              $this.message = "更新成功！ 请重新登录！"
              setTimeout("javascript:location.href='/users/sign_in'", 1000); 

            error: (data) ->
              $.each data.responseJSON.error, (key, value) ->
                if key == 'current_password'
                  $this.currentPasswordError = value[0]
                else if key == 'password'
                  $this.passwordError = value[0]
                else if key == 'password_confirmation'
                  $this.passwordConfirmationError = value[0]
              $this.message = '更新失败!'
            })

    watch:
      theAttribute: () ->
        this.message = ''
        this.currentPasswordError = ''
        this.passwordError = ''
        this.passwordConfirmationError = ''


  }
</script>


<template>
  <div class="modify-attributes">
    <div class="modify-attribute" v-if="informationState">
      {{message}}
    </div>
    <div v-if="modifyAttributeColumn">
      <input class="form-control modify-attribute" id="changeUserNameInput" v-model="name" placeholder="请输入名称">
    </div>
    <div v-else>
      <div :class="{'has-error': currentPasswordError}">
        <input type="password" class="form-control modify-attribute" id="currentPasswordInput" v-model="currentPassword" placeholder="请输原密码">
        <p>{{currentPasswordError}}</p>
      </div>
      <div :class="{'has-error': passwordError}">
        <input type="password" class="form-control modify-attribute" id="newPasswordInput" v-model="password" placeholder="请输入新密码">
        <p>{{passwordError}}</p>
      </div>
      <div :class="{'has-error': passwordConfirmationError}">
        <input type="password" class="form-control modify-attribute" id="newpasswordConfirmationInput" v-model="passwordConfirmation" placeholder="请再次输入新密码">
        <p>{{passwordConfirmationError}}</p>
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
      margin: 10px 20px 0px 20px;
    }

    .button-fields{
      margin: 10px 20px 20px 20px;
    }
    p {
      color: red;
      margin: 0 0 0 20px;
    }

 }
</style>











