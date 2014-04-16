"Octopress 新記事作成
"
"使用するグローバル変数
"  g:octopress_rootdir        octopressルートディレクトリ
"  g:octopress_article_ext    記事の拡張子
"  g:octopress_article_subdir 記事のサブフォルダ。strftime()のパラメータ(%Y等)
"                             使用可能
"
" 2012/01/06  新規作成
" 2012/01/12  category,keywordに初期値を入れた
"             publishedフィールド追加
"             g:octopress_article_subdir追加
"             末尾に<!-- more -->を追加
"             
func! octopress#new_article(title)
  let l:atitle = a:title
  if ( l:atitle == "" )
    let l:atitle = input("input title:")
  endif
  let l:time = localtime()
  let l:hantitle = l:atitle
  "Kaoriya 全角→半角関数があるなら使う
  if ( exists( "*ToHankaku" ) )
    let l:hantitle = ToHankaku(l:atitle)
  endif
  " match_characterはKaoriyaのhz_ja.vimより。意味はよく分からん。
  let l:match_character = '\%([ｳｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾊﾋﾌﾍﾎ]ﾞ\|[ﾊﾋﾌﾍﾎ]ﾟ\|.\)'
  let l:asctitle = ""
  let l:ii = 0
  let l:len = strlen(l:hantitle)
  " titleのファイル名に使える英数字＆記号だけ抜き出す。
  while ( l:ii < l:len )
      let l:char = matchstr(l:hantitle, l:match_character, l:ii)
    "2バイト文字は省く
    if ( l:char =~ '^\f$' && char2nr(l:char) < 256 )
      let l:asctitle .= l:char
    endif
    let l:ii += strlen(l:char)
  endwhile
  if ( l:asctitle == "" )
    let l:asctitle = "article"
  endif
  let article_dir = get(g:, 'octopress_rootdir', '~/octopress') . '/source/_posts/'  
  let sub_dir = strftime(get(g:, 'octopress_article_subdir', ''), l:time)
  if ( sub_dir != '' )
    if ( finddir( article_dir . sub_dir ) == '' )
      if ( exists( "*mkdir" ) )
        let article_dir .= l:sub_dir
        call mkdir( article_dir, "p" )
      else
        "作れない場合は_postsに置いとく
        echohl ErrorMsg | echomsg 'mkdirをサポートしてません _postに置いておきます' | echohl None
      endif
    else
      let article_dir .= l:sub_dir
    endif
    let last_char = article_dir[strlen(article_dir)-1]
    if ( last_char != '/' && last_char != '\' )
      let article_dir .= '/'
    endif
  endif

  let article_ext = get(g:, 'octopress_article_ext', 'markdown')

  let l:fbase = strftime("%Y-%m-%d-", l:time) . l:asctitle
  let l:fname = article_dir . l:fbase . '.'  . article_ext
  let l:is_create = 1
  if ( findfile(l:fname) != "" )
    let l:ec = tolower(input("'".l:fbase.'.'.article_ext."' is exist create/overwrite/edit [c/w/e]?:"))
    if ( l:ec == "w" )
      call delete(l:fname)
    elseif (l:ec == "c" )
      let l:ii = 0
      while ( 1 )
        let l:ii += 1
        let l:fname = article_dir . l:fbase.'_'.l:ii.'.' . article_ext
        if ( findfile(l:fname) == "" )
          break
        endif
      endwhile
    elseif (l:ec == "e" )
      let l:is_create = 0
    else
      return
    endif
  endif
  if ( l:is_create )
    let l:utf8title = ""
    if ( has('iconv') )
      let l:utf8title = iconv(l:atitle, &enc, "utf-8")
    else
      let l:utf8title = l:atitle
    endif

    let l:wlines = ['---', 'layout: post']
    let l:wlines += ['title: "' . l:utf8title . '"']
    let l:wlines += ['date: '. strftime("%Y-%m-%d %H:%M", l:time)]
    let l:wlines += ['comments: true', 'published: true', 'categories: [cat1, cat2]']
    let l:wlines += ['description: ', 'keywords: key1, key2', '---', '',"<!-- more -->"]

    call writefile( l:wlines, l:fname )
  endif
  if ( l:asctitle == l:atitle )
    "タイトルに日本語が含まれない場合、明示的にutf-8にしてみる
    "タイトルにファイル名に使えない文字が含まれてる場合ここを通らないけど
    augroup au_oct_new
      au BufEnter * setl fenc=utf-8
    augroup END
  endif
  execute "edit" . " ++enc=UTF-8 " . l:fname | "normal G"
  if ( l:asctitle == l:atitle )
    augroup au_oct_new
      autocmd!
    augroup END
  endif
endfunc
