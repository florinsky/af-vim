# My VIM build (for PHP especially)

## Keys explanation

### Panels:
* C-o - toggle TAGs panel
* C-e - toggle file explorer

### Popup:
* C-p - search files (by name)
* C-f - find in current file
* C-g - find in all opened files
* C-b - buffer list
* C-t - search by tags (ctags)

### Navigation
* e - open file for edition
* C-] - jump to a declaration (under coursor)
* g C-] - if multiple declaration then select from the list and jump
* C-a - jump back
* Shift-* - search the word next (word under cursor)
* Shirt-# - search the word back
* gg - go the first line
* G - go the last line
* 0 - go the beginning of the current line
* w - go to the next word
* W - go to the next WORD
* b - go back to the previous word
* B - go back to the previous WORD
* % - jump between braces
* [[ - go to the next function
* . - repeat last command
* g; - go to the last editing place

### Edit text
* :%s/search/replace/g - replace text
* :%s/search/replace/gw - replace text with confirmation
* :g/string/d - delete all lines containing the string
* :v/string/d - delete all lines wich didn't containing string
* >> - indent the current line
* << - dedent the current line
* > - in visual mode
* <
* E - select word in visual mode
* U - uppercase the selected word
* u - lowercase the selected word

### Tabs
* tabe - open new tab
* tabe <file> - open the file in the new tab
* tabc - close the tab
* gt - move to the next tab
* gT - move to the previous tab

### Bookmarks
* ma - set the position as mark 'a'
* `a - jump to the mark 'a'
* lowercase/uppercase - local/global mark

### Auto-complete (php):
* C-space

### Search under cursor:
* CR - toggle highlight the word under cusor
* n - search next selected word

### Usefull Commands:
* :noh - remove highlighted search word

### Fugitive (commands):
* :Gstatus

### Snippets (tab key):
* ec - echo "string";

## How to install

Just run the command:
> curl -L http://goo.gl/0Pmeap | make -f - install

or
> curl https://raw.githubusercontent.com/florinsky/af-vim/master/Makefile | make -f - install 

## TODO:
* Commenter
* Project manager
* Check C-g - it does not search in all opened biffers
* How to search in all files?


