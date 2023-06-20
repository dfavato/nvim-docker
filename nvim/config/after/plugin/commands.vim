command Conf :vs ~/.config/nvim/
command Json :%!python -m json.tool

" Python run pytest
function GetTestCommand()
	let l:file = expand('%:p')
	try
		let l:func = matchlist(getline('.'), 'def \(\w\+\)')[1]
	catch /E684/
		return "No function found"
	endtry
	return 'pipenv run pytest ' . l:file . '::' . l:func . ' --disable-warnings -vv'
endfunction
function RunPytest()
	let l:cmd = GetTestCommand()
	execute "!" . l:cmd
endfunction
function RunPytestInteractive()
	let l:cmd = GetTestCommand()
	TerminalSplit bash
	call feedkeys(l:cmd . "\<CR>")
endfunction

command TestInteractive call RunPytestInteractive()
command Test call RunPytest()
