---MENU----
---board_front 1 (front)---
local board_front = {
    Row_1 = {
        Row_11 = '[ ]',
        Row_12 = '[ ]',
        Row_13 = '[ ]',
        Row_14 = '[ ]',
        Row_15 = '[ ]'
    },
    Row_2 = {
        Row_21 = '[ ]',
        Row_22 = '[ ]',
        Row_23 = '[ ]',
        Row_24 = '[ ]',
        Row_25 = '[ ]'
    },
    Row_3 = {
        Row_31 = '[ ]',
        Row_32 = '[ ]',
        Row_33 = '[ ]',
        Row_34 = '[ ]',
        Row_35 = '[ ]'
    },
    Row_4 = {
        Row_41 = '[ ]',
        Row_42 = '[ ]',
        Row_43 = '[ ]',
        Row_44 = '[ ]'
    }
}
-----Table 2 (background)
local board_background = {
    Row_1 = {
        Row_11 = '[ ]',
        Row_12 = '[ ]',
        Row_13 = '[ ]',
        Row_14 = '[ ]'
    },
    Row_2 = {
        Row_21 = '[ ]',
        Row_22 = '[ ]',
        Row_23 = '[ ]',
        Row_24 = '[ ]'
    },
    Row_3 = {
        Row_31 = '[ ]',
        Row_32 = '[ ]',
        Row_33 = '[ ]',
        Row_34 = '[ ]'
    },
    Row_4 = {
        Row_41 = '[ ]',
        Row_42 = '[ ]',
        Row_43 = '[ ]',
        Row_44 = '[ ]'
    }
}
---Config + show board_front functions---
local safe_col, safe_row
local valid = false
local valid = false
local block_row, block_col
local mine_col = math.random(1, 4)
local mine_row = math.random(1, 4)
local random_row, random_col = math.random(1, 4), math.random(1, 4)
local safe_col_2, safe_row_2
local gene = false
local full = false
local game_over = false
local function show_board()
    print(board_front.Row_1.Row_11 .. ' ' .. board_front.Row_1.Row_12 .. ' ' .. board_front.Row_1.Row_13 .. ' ' ..
              board_front.Row_1.Row_14)
    print(board_front.Row_2.Row_21 .. ' ' .. board_front.Row_2.Row_22 .. ' ' .. board_front.Row_2.Row_23 .. ' ' ..
              board_front.Row_2.Row_24)
    print(board_front.Row_3.Row_31 .. ' ' .. board_front.Row_3.Row_32 .. ' ' .. board_front.Row_3.Row_33 .. ' ' ..
              board_front.Row_3.Row_34)
    print(board_front.Row_4.Row_41 .. ' ' .. board_front.Row_4.Row_42 .. ' ' .. board_front.Row_4.Row_43 .. ' ' ..
              board_front.Row_4.Row_44)
end

local function show_board_background()
    print(
        board_background.Row_1.Row_11 .. ' ' .. board_background.Row_1.Row_12 .. ' ' .. board_background.Row_1.Row_13 ..
            ' ' .. board_background.Row_1.Row_14)
    print(
        board_background.Row_2.Row_21 .. ' ' .. board_background.Row_2.Row_22 .. ' ' .. board_background.Row_2.Row_23 ..
            ' ' .. board_background.Row_2.Row_24)
    print(
        board_background.Row_3.Row_31 .. ' ' .. board_background.Row_3.Row_32 .. ' ' .. board_background.Row_3.Row_33 ..
            ' ' .. board_background.Row_3.Row_34)
    print(
        board_background.Row_4.Row_41 .. ' ' .. board_background.Row_4.Row_42 .. ' ' .. board_background.Row_4.Row_43 ..
            ' ' .. board_background.Row_4.Row_44)
end

local function player_choose()
    print('Please enter which block do you want to choose to pop...')
    io.write('Enter Row: ')
    block_row = io.read('*n')
    io.write('Enter column: ')
    block_col = io.read('*n')
end
---Check if full function---
local function check_if_full()
    if board_background.Row_1.Row_11 ~= '[ ]' and board_background.Row_1.Row_12 ~= '[ ]' and
        board_background.Row_1.Row_13 ~= '[ ]' and board_background.Row_1.Row_14 ~= '[ ]' and
        board_background.Row_2.Row_21 ~= '[ ]' and board_background.Row_2.Row_22 ~= '[ ]' and
        board_background.Row_2.Row_23 ~= '[ ]' and board_background.Row_2.Row_24 ~= '[ ]' and
        board_background.Row_3.Row_31 ~= '[ ]' and board_background.Row_3.Row_32 ~= '[ ]' and
        board_background.Row_3.Row_33 ~= '[ ]' and board_background.Row_3.Row_34 ~= '[ ]' and
        board_background.Row_4.Row_41 ~= '[ ]' and board_background.Row_4.Row_42 ~= '[ ]' and
        board_background.Row_4.Row_43 ~= '[ ]' and board_background.Row_4.Row_44 ~= '[ ]' then
        full = true
    else
        full = false
    end
end
check_if_full()
---Generate safe---
local function generate_safe()
    repeat
        safe_col = math.random(1, 4)
        safe_row = math.random(1, 4)
        board_background['Row_' .. safe_row]['Row_' .. safe_row .. safe_col] = '[X]'
        check_if_full()
    until full == true
end

---Generate mine---
local function generate_mine()
    board_background['Row_' .. mine_row]['Row_' .. mine_row .. mine_col] = '[O]'
end

----Show user result functions---
local function show_result()
    if board_background['Row_' .. block_row]['Row_' .. block_row .. block_col] == '[X]' then
        game_over = false
        board_front['Row_' .. block_row]['Row_' .. block_row .. block_col] = '[X]'
    elseif board_background['Row_' .. block_row]['Row_' .. block_row .. block_col] == '[O]' then
        game_over = true
        board_front['Row_' .. block_row]['Row_' .. block_row .. block_col] = '[O]'
        print('GAME OVER!!')
    end
end
---RUN THE GAME---
generate_safe()
generate_mine()
while game_over == false do
    show_board()
    player_choose()
    show_result()
    print('-----------------')
    if game_over == true then
        show_board_background()
    end
end
