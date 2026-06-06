# koba

Container image for development with coding agent

## ベースイメージ

Ubuntu 24.04

## 同梱するコーディングエージェント

- [Claude Code](https://www.anthropic.com/claude-code)
- [Codex](https://openai.com/codex/)
- [OpenCode](https://opencode.ai/)
- [Pi](https://pi.dev/)

## ツールのインストール方針

イメージに含めるツールは、以下の優先順位でインストール方法を選択する。

1. 公式に推奨されるインストール方法が `apt` / `mise` 以外の場合は、推奨の方法に従う
2. `mise` でインストール可能なツールは `mise` を優先的に使う
3. 上記に該当しない場合は `apt` を使う

`mise` を優先する理由は、開発が活発なツールのバージョン追従や、特定バージョンへの固定が容易なため。`apt` は開発が安定しているシステム寄りのツールに使う。
