# mruby-make_block
<br>ブロックチェーンのブロックを生成するために必要な要素をmgem化</br>
・主な要素
データと記録時間の記録(小ブロック)
小ブロックをまとめて大きなブロックに(大ブロック)
↓　大ブロック
|---------------------|
|   12:00 気温21度     |
|   12:05 気温20度     |
|   12:10 気温19度     |
|---------------------|
mruby-generate-addressをビルドしているためランダムなアドレス生成も可能
