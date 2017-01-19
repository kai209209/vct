window.store = new (Vuex.Store)(
  state:
    currentUser: ''
    friends: []
    currentChattingFriend: ''
    chattingFriendsPool: []

  mutations:
    setCurrentUser: (state, user) ->
      state.currentUser = user

    updateUserName: (state, currentUser) ->
      state.currentUser = currentUser

    setCurrentChattingFriend: (state, friend) ->
      state.currentChattingFriend = friend
      console.log state.currentChattingFriend

    setFriends: (state, friends) ->
      state.friends = friends      

    addFriendToChattingFriendsPool: (state, friend) ->
      state.chattingFriendsPool.push(friend)
      console.log state.chattingFriendsPool

    removeFriendFromChattingFriendsPool: (state, friend) ->
      state.chattingFriendsPool.splice(state.chattingFriendsPool.indexOf(friend), 1)
      if state.chattingFriendsPool.length > 0
        state.currentChattingFriend = state.chattingFriendsPool[0]
      else
        state.currentChattingFriend = ''
)