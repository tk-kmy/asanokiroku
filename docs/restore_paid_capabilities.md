# Apple Developer Program 加入後に Capability を復旧する手順

Personal Team の制約で一時的に無効化した以下を、加入後に再有効化するためのメモ。

- iCloud / CloudKit
- Push Notifications (Remote Notifications)
- WeatherKit

## 前提

- Apple Developer Program (年 $99) への登録完了
- Xcode の「Signing & Capabilities」で Team が個人 ID ではなく Developer Program の Team に切り替わっている

## 1. Entitlements を戻す

`asanokiroku/asanokiroku.entitlements` に以下のキーを追加:

```xml
<key>aps-environment</key>
<string>development</string>
<key>com.apple.developer.icloud-container-identifiers</key>
<array>
    <string>iCloud.jp.asanokiroku.app</string>
</array>
<key>com.apple.developer.icloud-services</key>
<array>
    <string>CloudKit</string>
</array>
<key>com.apple.developer.weatherkit</key>
<true/>
```

Xcode 上では Signing & Capabilities タブの「+ Capability」から:

- **iCloud**(Services で CloudKit を ON、Containers で `iCloud.jp.asanokiroku.app` を作成)
- **Push Notifications**
- **WeatherKit**

を追加すると上記キーが自動で書かれる。

## 2. Background Modes

`asanokiroku/Info.plist` の `UIBackgroundModes` 配列に `remote-notification` を追加:

```xml
<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>remote-notification</string>
</array>
```

## 3. Persistence を CloudKit 版に戻す

`asanokiroku/Persistence.swift` の以下を変更:

- `let container: NSPersistentContainer` → `let container: NSPersistentCloudKitContainer`
- `container = NSPersistentContainer(name: ...)` → `container = NSPersistentCloudKitContainer(name: ...)`

`Persistence.swift` 内のコメント (Personal Team の注釈) も削除する。

## 4. Core Data モデル

`asanokiroku/asanokiroku.xcdatamodeld/asanokiroku.xcdatamodel/contents` の `<model>` タグに
`usedWithCloudKit="YES"` を戻す:

```xml
<model ... usedWithCloudKit="YES" ...>
```

CloudKit と同期するエンティティは以下を満たす必要がある:

- すべての属性が optional または default 値を持つ
- relationship に inverse がある
- unique constraints は使わない

## 5. CloudKit Container の作成

Apple Developer Portal → Certificates, Identifiers & Profiles → Identifiers → iCloud Containers で
`iCloud.jp.asanokiroku.app` を作成する(Xcode の Capability 追加時に「+」から作る方法でも可)。

## 6. 動作確認

- 実機で iCloud にサインインしているアカウントが Developer Program と同じ Apple ID
- シミュレータでも実機でも一度 build & run して、CloudKit Dashboard にスキーマがデプロイされることを確認
- WeatherKit は実機での確認推奨(シミュレータでは取得制限あり)
