# MyLibrary

Swift 動的ライブラリ ( `.dylib` ) を GitHub Actions でビルドし、タグ push 時に自動リリースするサンプル

## 使い方

1. このリポジトリを `main` ブランチで push すると CI が走り `.dylib` をアーティファクトとして保存
2. `git tag v1.0.0 && git push --tags` などタグを push すると Release が生成され `.dylib` が zip でアセットに追加

## ビルド手動確認

```bash
swift build -c release
./.build/release/libMyLibrary.dylib
```
