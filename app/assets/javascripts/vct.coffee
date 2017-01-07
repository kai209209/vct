#= require components/vct-nav-head
#= require components/user-profile

$ ->
  app = new Vue({
    el: '#vct-el'
    store,

    components:
      vctNav: VCompents['components/vct-nav-head']
      userProfile: VCompents['components/user-profile']
    })