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

### Auto-complete (php):
* C-space

### Search under cursor:
* CR - toggle highlight the word under cusor

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
* View marks
* Check C-g - it does not search in all opened biffers
* How to search in all files?


