# flutter_todo_sample

flutter を用いて、以下の実装を試したサンプルアプリケーションです

## Features

- [x] sns ログイン
    - facebook
    - google
- [x] タスクの一覧表示
    - [ ] ステータス別のフィルタリング表示（すべて/未完了のみ/完了のみ）
- [x] タスクの新規追加
- [x] タスクの更新
- [x] タスクの削除
- [x] タスクのステータス変更（完了/未完了）
- [ ] タスクの並び替え


## 開発環境の設定

### Firebase の Authentication

- Firebase の設定ファイルは自身で作成したものを配置してください
    - android: `google-services.json` を `android/app/` 配下に配置
    ![android_setting](./README/firebase_setting_android.jpg)
    - ios: `google-services.json` を `android/app/` 配下に配置
    ![ios_setting](./README/firebase_setting_ios.jpg)

- ログインプロバイダの、 Facebook と Google の有効化
  - 設定
    ![auth_provider](./README/firebase_setting_auth_providers.jpg)
  - マルチログインの有効化
    ![auth_multi_login](./README/firebase_setting_auth_multi_account.jpg)