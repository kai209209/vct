

<script lang="coffee">
  vm = {
    props: ['stranger']

    computed:
      userImage: ->
        ava = this.stranger.avatar.replace('public', '')
        ava = ava.replace('100', '240')
        ava

    methods:
      shut: ->
        this.$emit('shut')



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
      <div class="operate-panel">
        <button class="btn btn-primary">申请好友</button>
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


  }
  
</style>