NEOVIM COMMANDS

----------

# move (all in normal mode) 

## horizontal
- h, l = go left or right (@number)
- b, w = move by word (@number)
- F or f+char =  go to previous or next char, then scroll with , and ; (@number)
- 0, go = move to beginning of line
- $, gp = move to end of line

## vertical
- j, k = go down or up (@number)
- H, M, L = move to top, middle or bottom of a screen
- Ctrl+d, Ctrl+u = move half a page
- zz = center the screen on line
- gg = go to the beginning
- G = go to the end
- [n]gg = go to line n
- {, } = move by a paragraph
- % = move to matching parenthesis
- gx = go to url

## find
- /pattern = find pattern, then scroll with N and n
- :%s/pattern/replacement/g = find pattern, replace it in the whole file
- :%s/pattern/replacement/g = idem with a confirmation at each occurrence
- :s/pattern/replacement/g = idem but with respect to the line or the selection

----------

# insert

- i = insert before cursor
- I = insert at the beginning of the line
- a = insert after cursor
- A = insert at the end of the line
- O = insert in a new line above
- o = insert in a new line below
- (in insert mode) Esc or CapsLock = return to normal mode

----------

# visual (a.k.a. selection)

- v = select (character by character)
- V = select (line by line)
- viw = select word
- vip = select paragraph
- vi) = select inside parentheses
- va) = select inside parentheses, including parentheses
- o = jump to the other side of the selection

----------

# edit

## normal mode
- u = undo (@number)
- x = delete character (@number)
- J = join two lines
- ~ = capitalize
- r+char = replace with character
- R = enter replace mode
- yy = copy line
- dd = delete line (@number)
- db, dw = delete to the beginning or end of word 
- cc = delete line and enter insert mode
- yiw = copy word
- yi) = copy inside parentheses
- diw = delete word
- di) = delete inside parentheses
- p = paste below line
- P = paste above line
- sd) = delete parentheses
- sr)] = replace parentheses by brackets
- :%sort = sort alphabetically lines in the selection

## visual mode
- <, > = unindent, indent
- x = cut
- y = copy
- p = paste in place of
- sa) = add parentheses

## code  
- gc = comment line
- Leader+gf = format
- Leader+gr = rename
- Leader+gi = git
- Leader+k =  hover
- Leader+l =  definition
- Leader+d =  show diagnostics
- Leader+xx = trouble (diagnostics)
- Leader+xs = trouble (symbol list)
- Leader+td = todo list
- Leader+cd = make a Python docstring

----------

# files

## general
- :e filename = open file
- :w =  save
- :w filename = save as
- :q = quit
- :qa = quit all (useful for saving the session)
- :wa = save all

## latex
- Leader+ll = start compiling (recompile with each save)
- Leader+lt = toggle toc
- Leader+lv = view pdf (at the right place)
- Leader+cl = close log

## snacks
- leader+se = snacks explorer
- leader+sf = snacks find
- leader+sb = snacks buffer
- leader+sg = snacks grep
- leader+st = snacks terminal
- leader+ss = snacks smart find
- leader+si = snacks git
- leader+sk = snacks keymaps
- leader+sz = snacks zen

## telescope
- leader+ff = telescope find
- leader+fy = telescope browser
- leader+fb = telescope buffer
- leader+fg = telescope grep
- leader+fh = telescope heading
- leader+fs = telescope sesssions
- leader+y = yazi

## open new split or tabs while snacking / telescoping
- Ctrl+T = create tab
- Ctrl+Q = send grep to quickfix list, then scroll with Ctrl+J and Ctrl+
- Ctrl+V = edit file in new vertical split 
- Ctrl+S / X = edit file in new horizontal split 

----------

# views

## buffers
- gB or gb =  next buffer
- :ls = list buffers
- :bd[n] = delete buffer n
- :b[n] = go to buffer n

## tabs and splits
- Ctrl+T = create tab
- Ctrl+Shift+T = close tab
- gt or gT = next tab
- :vs = vertical split
- :sp =  horizontal split
- Ctrl+W, motion(hjkl) = move to split
- Ctrl+W, < or > = resize horizontally
- Ctrl+W, - or + = resize vertically
- :q =  close (tab or split)

----------

# macros

- q[n]{command}q : register command in macro n 
- @[n] : execute macro n (@number)

----------

