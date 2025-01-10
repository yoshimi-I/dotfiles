noremap j gj
noremap k gk

" jjでインサートモードを抜ける設定
inoremap jk <Esc>

" ヤンクでクリップボードに保存
set clipboard=unnamedplus

let mapleader = "\<space>"

" ビジュアルモードで選択範囲をペースト
xnoremap p pgvy

" leader + a で行の先頭（最初の非空白文字）に移動
nnoremap <S-a> ^

" leader + e で行の末尾に移動
nnoremap <S-e> $

" leader + s で横分割
nnoremap <leader>s :split<CR>
" leader + v で縦分割
nnoremap <leader>v :vsplit<CR>

" 分割したウィンドウ間の移動を簡略化
nnoremap <S-h> <C-w>h
nnoremap <S-l> <C-w>l

" leader + c でバッファを削除し、ウィンドウを閉じる
nnoremap <leader>c :bdelete<CR>

" 履歴の保持数を増やす
set undolevels=1000
set history=1000

" ビジュアルモードで選択範囲をコピー
vnoremap <leader>y "+y
" 選択範囲をカット
vnoremap <leader>d "+d
" 選択範囲をペースト（他のペースト操作を上書きしない）
xnoremap <leader>p "_dP

" Control + j で前のバッファ（左のファイル）に移動
nnoremap <silent> <S-j> :bprevious<CR>
" Control + k で次のバッファ（右のファイル）に移動
nnoremap <silent> <S-k> :bnext<CR>

" leader + t でNERDTreeをトグル
nnoremap <leader>t :NERDTreeToggle<CR>
" leader + f で現在のファイルをNERDTreeで表示
nnoremap <leader>f :NERDTreeFind<CR>

" カーソルを上下にスクロールし、中央に表示
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" 検索結果にジャンプするときに中央に表示
nnoremap n nzzzv
nnoremap N Nzzzv

" leader + o でファイルを開く
nnoremap <leader>o :e .<CR>
" leader + m で最近使用したファイルを開く
nnoremap <leader>m :browse oldfiles<CR>

" Visual モード中に 'v' を押すと Visual Block モードに切り替える
vnoremap v <C-v>

" U を押したら redo を実行（1つ先に進む）
nnoremap U <C-r>
