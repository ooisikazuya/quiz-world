## アプリ名
### QUIZ-WORLD

## 概要
QUIZ-WORLDはクイズを気軽に楽しめるアプリです。

あなたの好きなことに関する問題を作成し、他のユーザーにクイズを解いてもらうことができます。

また、あなたが作成したクイズを宣伝したり、他のユーザーが作成したクイズを解いた感想などを書き込める掲示板もあります。

クイズを作りたい人、色んなクイズに挑戦したい人は是非使ってみてください。

## アプリを作るきっかけ
テレビのクイズ番組が好きでよく見ているのですが、クイズに答えるだけではなく作ることもしてみたいと思ったので、その両方ができるアプリを作ってみました。

さらに、クイズにいいね機能を付けてどのクイズがどのくらいお気に入りされているかを可視化できたらおもしろいなと思い実装しました。

ユーザーが多ければ多いほどより楽しいアプリになるなと思っています。

## ターゲット
- クイズを作って色んな人に解いてもらいたい人
- 様々なジャンルのクイズに挑戦したい人

## 使い方
- **クイズを作成・編集する**

![スクリーンショット 2021-05-07 14 32 53](https://user-images.githubusercontent.com/74053238/117404150-614ceb80-af44-11eb-8a26-79cd42d1e6cf.png)

![スクリーンショット 2021-05-07 14 34 11](https://user-images.githubusercontent.com/74053238/117404272-9a855b80-af44-11eb-9746-87e07a0fb001.png)

選択クイズを作成・編集することができます。

選択肢の数を問題毎に２〜５択に設定できるので、○×クイズを作ってみてもいいかもしれません。

- **クイズに挑戦する**

![スクリーンショット 2021-05-07 14 27 05](https://user-images.githubusercontent.com/74053238/117404334-bc7ede00-af44-11eb-90de-ab7ffd0cb7f3.png)

![スクリーンショット 2021-05-07 14 28 21](https://user-images.githubusercontent.com/74053238/117404406-db7d7000-af44-11eb-8b18-ef11605f2daf.png)

![スクリーンショット 2021-05-07 14 30 51](https://user-images.githubusercontent.com/74053238/117404496-fd76f280-af44-11eb-916b-25f8db638ca5.png)

ユーザーが作ったクイズに挑戦することができます。

ジャンル検索でやりたいクイズを探してチャレンジしましょう。

あなたがいいねしたクイズをまとめたページもあるので、お気に入りのクイズを何度もやって楽しみましょう。

- **クイズ掲示板**

![スクリーンショット 2021-05-07 14 54 45](https://user-images.githubusercontent.com/74053238/117404573-1e3f4800-af45-11eb-9ceb-57a7d2952586.png)

あなたが作ったクイズを宣伝したり、色んなクイズをした感想を書くことができます。

キーワード検索で特定のワードが書かれてある掲示板を探して楽しみましょう。

- **会員情報**

![スクリーンショット 2021-05-07 14 38 50](https://user-images.githubusercontent.com/74053238/117404633-3b741680-af45-11eb-836b-374625bc7450.png)

会員情報の変更、アイコン画像の選択をすることができます。

アイコン画像はクイズ掲示板に表示されます。

## 使用技術
### フロントエンド
- HTML/CSS
- JavaScript/jQuery
- devise
- carrierwave
- mini_magick
- kaminari

### サーバーサイド
- Ruby 2.6.2
- Ruby on Rails 5.2.4.4

### デプロイ
- heroku 7.53.0

  #### URL
  
  https://polar-citadel-76171.herokuapp.com

  #### テストユーザー情報
  - ニックネーム・・・kazu　
  - メールアドレス・・・ttttt@ttttt
  - パスワード・・・xyzxyz    
