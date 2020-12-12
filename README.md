# flutter_todo_sample

flutter を用いて、以下の実装を試したサンプルアプリケーションです

TODO スクショ


## ローカル環境の設定

### Firebase の Authentication

- Firebase の設定ファイルは自身で作成したものを配置してください
    - android: `google-services.json` を `android/app/` 配下に配置
    ![android_setting](./README/firebase_setting_android.jpg)
    - ios: `google-services.json` を `android/app/` 配下に配置
    ![android_setting](./README/firebase_setting_ios.jpg)


### Firestore 

- ローカル開発時にエミュレータを利用する場合は以下を実施します。

1. firebase CLI のインストール
2. firebase プロジェクトとしての初期化

```shell
$ cd /path/to/thisproject
$ fireabase init
```

3. ローカルでのエミュレータ起動

```shell
$ firebase emulators:start
```