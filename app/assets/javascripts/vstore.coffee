window.store = new (Vuex.Store)(
  state:
    currentUser: ''
    friends: []
    currentChattingFriend: ''
    chattingFriendsPool: []
    webSocketData: ''

  mutations:
    setCurrentUser: (state, user) ->
      state.currentUser = user

    updateUserName: (state, currentUser) ->
      state.currentUser = currentUser

    setCurrentChattingFriend: (state, friend) ->
      state.currentChattingFriend = friend

    setFriends: (state, friends) ->
      state.friends = friends


    addFriendToChattingFriendsPool: (state, friend) ->
      state.chattingFriendsPool.push(friend)

    removeFriendFromChattingFriendsPool: (state, friend) ->
      state.chattingFriendsPool.splice(state.chattingFriendsPool.indexOf(friend), 1)
      if state.chattingFriendsPool.length > 0
        state.currentChattingFriend = state.chattingFriendsPool[0]
      else
        state.currentChattingFriend = ''

    setWebSocketData: (state, data) ->
      state.webSocketData = data


)