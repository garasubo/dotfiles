fun! GoshRunAll()
  " とりあえず保存をする。あと現在のファイル名を保存しておく
  w%
  let fname = expand("%")

  " 5行のバッファを「gosh_out」という名前でウィンドウの下に作る
  below 5new gosh_out

  " 前の出力があるかも知れんので削除する
  execute ":0,%delete"

  " goshを起動する。pathは設定してない。
  execute "r !gosh -i ".fname

  " 出力結果を保存しておく
  w /path/to/gosh_out

endfun

nmap <c-s> :call GoshRunAll()<cr>
