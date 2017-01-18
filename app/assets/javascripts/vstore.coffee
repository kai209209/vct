window.store = new (Vuex.Store)(
  state:
    currentUser: ''
    friends: [{id: 1, name: "test", avatar: "public/system/letter_avatars/2/A/226_95_81/100.png"}, {id:2, name: "ad", avatar: "public/system/letter_avatars/2/A/226_95_81/100.png"}]

  mutations:
    setCurrentUser: (state, user) ->
      state.currentUser = user

    updateUserName: (state, currentUser) ->
      state.currentUser = currentUser

)