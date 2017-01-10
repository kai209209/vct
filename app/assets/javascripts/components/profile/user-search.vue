<script lang="coffee">
  vm = {

    methods: 
      returnPro: ->
        this.$emit('returnProfile')
  }
</script>


<template>
  <div class="user-operate"> 
    <a class="return-pro btn btn-default btn-xs" href="#" @click.prevent="returnPro">返回上一层</a>
  </div>
</template>


<style lang="scss">

</style>