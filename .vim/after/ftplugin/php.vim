if exists('b:did_ftplugin_php')
  finish
endif
let b:did_ftplugin_php=1

setlocal noexpandtab   " php ではインデントに tab を使う
setlocal tabstop=4     " tab はホワイトスペース 4 文字分
setlocal softtabstop=4 " tab はホワイトスペース 4 文字分
setlocal shiftwidth=4  " インデントはホワイトスペース 4 文字分

