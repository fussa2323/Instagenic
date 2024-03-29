# Instagenic
 Instagram Integration app in Swift

# Features
+ List view 
+ Mute users/photos
+ Multiple accounts
+ Save photos to your Album
+ Download photos to your iPhone

# How to build

1) Download the repository

```
$ git clone https://github.com/fussa2323/Instagenic.git
$ cd instagramer
```

2) Initialize cocoapods dependancies

```
$ pod install
```

3) Install [Synx](https://github.com/venmo/synx"Synx") to your computer.

```
$ gem install synx
```

4) Open the project in Xcode

```
$ open "instagramer.xcworkspace"
```

5) Compile and run the app in your simulator

# Requirements

- Xcode 7.0
- iOS 8

## API Endpoint V1
- (* ) InstagenicUser.uuidをヘッダーのAuthorizationで渡す

# InstagramAPI Router
### User
|Method|enum case|内容|
|---|---|---|
|GET|GetPopularPhoto|ポピュラーメディアを取得|
|GET|GetUserInfo|Userの基本情報を取得|
|GET|GetUserFeed|UserのFeedを取得|
|GET|GetUserBySearch|Userを名前で検索する|
|GET|requestOauthCode|OAuthによるUser認証|


