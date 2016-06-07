# mt-plugin-datediff

`name`で指定した変数に格納されている日付（YYYYMMDD）と再構築時の日付を比較し、指定の範囲内である場合は真になるコンディショナルタグプラグインです。

## サンプルコード

```
<mt:Entries>
<mt:EntriesHeader><ul></mt:EntriesHeader>
<$mt:EntryDate format="%Y%m%d" setvar="tmp__today"$>
<li><mt:DateDiff name="tmp__today" le="7">[New!]</mt:DateDiff> <$mt:EntryTitle escape="html"$></li>
<mt:EntriesFooter></ul></mt:EntriesFooter>
</mt:Entries>
```