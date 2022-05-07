function! AirlineInit()
    let g:airline_mode_map = {
                \ '__' : '-',
                \ 'n' : 'N',
                \ 'i' : 'I',
                \ 'R' : 'R',
                \ 'c' : 'C',
                \ 'v' : 'V',
                \ 'V' : 'V',
                \ 's' : 'S',
                \ 'S' : 'S',
                \ }
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep= ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_section_a = airline#section#create(['mode'])
    let g:airline_section_b = airline#section#create(['%f'])
    let g:airline_section_c = airline#section#create([''])
    let g:airline_section_x = airline#section#create_right([''])
    let g:airline_section_y = airline#section#create_right([''])
    let g:airline_section_z = airline#section#create_right(['%l %c'])
    let g:airline#extensions#tabline#enabled = 1
    AirlineToggleWhitespace
    AirlineTheme luna
endfunction
autocmd VimEnter * call AirlineInit()
