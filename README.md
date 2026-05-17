# あさのきろく

OD(起立性調節障害)を抱える中高生と保護者のための体調記録 iOS アプリ。

## 概要

朝の体調・症状・気圧・睡眠などを短時間で記録し、時系列で振り返ることで、本人と保護者・医師の対話を支援することを目的とします。

## 技術スタック

- **プラットフォーム**: iOS 17.0+
- **UI**: SwiftUI
- **データ**: Core Data + CloudKit (NSPersistentCloudKitContainer)
- **連携**: HealthKit / WeatherKit
- **言語**: Swift 5.9+
- **IDE**: Xcode 15.0+

## プロジェクト構成

```
asanokiroku/
├── asanokiroku.xcodeproj/        Xcode プロジェクト
├── asanokiroku/                  アプリ本体ソース
│   ├── asanokirokuApp.swift      App エントリポイント
│   ├── ContentView.swift         ルートビュー
│   ├── Persistence.swift         Core Data + CloudKit スタック
│   ├── asanokiroku.xcdatamodeld/ データモデル
│   ├── Assets.xcassets/          画像・カラー
│   ├── Info.plist                権限文言など
│   └── asanokiroku.entitlements  Capabilities
├── asanokirokuTests/             ユニットテスト
├── asanokirokuUITests/           UI テスト
└── docs/                         設計ドキュメント
    ├── phase1_report.md
    └── basic_design.md
```

## セットアップ

1. このリポジトリを clone
2. Xcode 15 以降で `asanokiroku.xcodeproj` を開く
3. Signing & Capabilities で自分の Apple Developer Team を選択
4. iCloud Container を `iCloud.jp.asanokiroku.app` で作成
5. Cmd + R でシミュレータ実行

詳細は `docs/` を参照。

## Bundle Identifier

`jp.asanokiroku.app`

## ライセンス

未定(リリース前に決定予定)。
