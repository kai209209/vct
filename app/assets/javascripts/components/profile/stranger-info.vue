

<script lang="coffee">
  vm = {
    data: ->
      applyOperate: false
      detail: ''
      apply: ''
      applyState: false

    props: ['stranger']

    computed:
      userImage: ->
        ava = this.stranger.avatar.replace('public', '')
        ava = ava.replace('100', '240')
        ava

      applyFriendState: ->
        this.applyOperate

      applyStateNil: ->
        this.applyState == ''

      applyStateApply: ->
        this.applyState == 'apply'

      applyStateReject: ->
        this.applyState == 'reject'

      applyStatePass: ->
        this.applyState == 'pass'



    methods:
      shut: ->
        this.$emit('shut')

      applyFriend: ->
        this.applyOperate = true

      sendApply: ->
        if this.applyState == 'reject'
          this.reApply()
        else
          this.createApply()

      createApply: ->
        $this = this
        $.ajax({
          url: 'applies'
          type: 'POST'
          data:
            apply:
              receiver_id: $this.stranger.id
              detail: $this.detail
          success: (data) ->
            $this.apply = data
            $this.applyState = data.apply_status
            $this.applyOperate = false

          error: (data) ->
            alert('申请失败，请重新申请')
          })


      reApply: ->
        $this = this
        $.ajax({
          url: '/applies/reapply'
          type: 'PATCH'
          data: 
            id: $this.apply.id
          success: (data) ->
            $this.apply = data            
          })        
        $this.applyState = 'apply'
        $this.applyOperate = false


    created: ->
      $this = this
      $.ajax({
        url: '/applies/apply'
        data: 
          receiver_id: $this.stranger.id
        success: (data) ->
          if data
            $this.apply = data
            $this.applyState = data.apply_status
          else
            $this.applyState = ''
        })



  }
</script>


<template>
  <div id="show-stranger">
    <dir id="stranger-attributes">
      <a href="x" class="shut" @click.prevent="shut">关闭</a>
      <div class="stranger-panel">
        <div class="stranger-image"><img :src="userImage"></div>
        <div class="stranger-info">
          <div><p>名称: {{stranger.name}}</p></div>
          <div><p>邮箱: {{stranger.email}}</p></div>
        </div>        
      </div>
      <div class="apply-panel" v-if="applyFriendState">
        <div class="form-group">
          <textarea class="form-control" rows='5' v-model='detail' placeholder="信息内容">
        </div>

        <div class="form-group">
          <button class="btn btn-default btn-sm" @click='sendApply'>发送申请</button>
        </div>        
      </div>
      <div class="operate-panel" v-else>
        <button class="btn btn-primary" @click="applyFriend" v-if="applyStateNil">申请好友</button>  
        <button class="btn btn-primary disabled" v-else-if="applyStateApply">请等待对方确认</button>
        <button class="btn btn-primary disabled" v-else-if="applyStatePass">你们已经是好友了</button>
        <button class="btn btn-primary" @click="applyFriend" v-else-if="applyStateReject">已拒绝，可再次申请</button>
        <button class="btn btn-primary disabled" v-else>查询中，请稍等</button>
        <button class="btn btn-danger" @click="shut">关闭</button>
      </div>
    </dir>
  </div>
</template>


<style lang="scss">
  #show-stranger{
    width: 100%;
    height: 100%;
    position:fixed;
    left:0; 
    right:0; 
    top:0; 
    bottom:0; 
    border-radius: 3px;
    background: rgba(211, 211, 211, 0.9);
    margin:0 auto; 
  }

  #stranger-attributes{
    position: relative;
    width: 800px;
    height: 600px;
    background: white;
    margin: 50px auto;
    border: 1px solid black;
    border-radius: 5px;

    .shut{
      text-decoration: none;
      display: block;
      position: absolute;
      top: 3px;
      right: 8px;
    }

    .stranger-panel{
      width: 90%;
      margin: 50px auto;

      .stranger-image{
        display: inline-block;
        // vertical-align: top;
      }

      .stranger-info{
        display: inline-block;
        margin: 0 10px;
        font: 2em;
        line-height: 2em;
      }

    }

    .operate-panel{
      position: absolute;
      right: 20px;
      bottom: 20px;
    }

    .apply-panel{
      width: 700px;
      padding: 50px 10px 20px 30px;
    }


  }
  
</style>