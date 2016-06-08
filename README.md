# mt-plugin-datediff

`name`で指定した変数に格納されている日付（YYYYMMDD）と再構築時の日付を比較し、`interval`で指定した範囲内である場合は真になるコンディショナルタグプラグインです。

## `interval`の考え方

<dl>
<dt>今日から7日先まで</dt>
<dd><code>interval="7"</code></dd>
<dt>今日から7日前まで</dt>
<dd><code>interval="-7"</code></dd>
</dl>

## サンプルコード

### 7日以内の記事にNewを付ける

```
<mt:Entries>
<mt:EntriesHeader><ul></mt:EntriesHeader>
<$mt:EntryDate format="%Y%m%d" setvar="tmp__today"$>
<li><mt:DateDiff name="tmp__today" interval="-7">[New!]</mt:DateDiff> <$mt:EntryTitle escape="html"$></li>
<mt:EntriesFooter></ul></mt:EntriesFooter>
</mt:Entries>
```

## 仕様

- 時刻までは考慮していません。（00:00:00で判定します。）