window.store = new (Vuex.Store)(
  state:
    currentUser: ''

  mutations:
    setCurrentUser: (state, user) ->
      state.currentUser = user
)