.include "constants.inc"
.include "header.inc"

.segment "ZEROPAGE"
player_x: .res 1
player_y: .res 1
player_dir: .res 1
pad1: .res 1
jumping: .res 1
jump_height: .res 1
frame_counter: .res 1
animation_delay_counter: .res 1
character_state: .res 1
attacking: .res 1
attack_animation: .res 1
.exportzp player_x, player_y, pad1, jumping, jump_height, frame_counter, animation_delay_counter, character_state, attacking, attack_animation

.segment "CODE"
.proc irq_handler
  RTI
.endproc

.import read_controller1

.proc nmi_handler
  LDA #$00
  STA OAMADDR
  LDA #$02
  STA OAMDMA
  LDA #$00

  ; read controller
  JSR read_controller1

  ; update tiles *after* DMA transfer
  JSR update_player
  JSR draw_player

  LDA #$00
  STA $2005
  STA $2005
  RTI
.endproc

.import reset_handler
.import draw_background

.export main
.proc main
  ; write a palette
  LDX PPUSTATUS
  LDX #$3f
  STX PPUADDR
  LDX #$00
  STX PPUADDR
load_palettes:
  LDA palettes,X
  STA PPUDATA
  INX
  CPX #$20
  BNE load_palettes

	; Nametables
    JSR draw_background

vblankwait:       ; wait for another vblank before continuing
  BIT PPUSTATUS
  BPL vblankwait

  LDA #%10000000  ; turn on NMIs, sprites use first pattern table
  STA PPUCTRL
  LDA #%00011110  ; turn on screen
  STA PPUMASK

forever:
  JMP forever
.endproc

.proc update_player
  PHP  ; Start by saving registers,
  PHA  ; as usual.
  TXA
  PHA
  TYA
  PHA

  LDA attacking      ; Check if the player is currently attacking 
  BEQ check_jumping  ; If not attacking, check if jumping

  LDA attack_animation     ; Check the attack animation counter
  BEQ end_attack_animation ; If the animation is finished, end attack state

  DEC attack_animation     ; Decrease the attack animation counter

end_attack_animation:
  LDA #$00                 ; Reset attack state and animation counter
  STA attacking
  STA attack_animation
  BRA check_jumping

  LDA jumping        ; Check if the player is currently jumping
  BEQ check_ground   ; If not jumping, check if on the ground

  LDA player_y
  SEC
  SBC jump_height ; Subtract the jump height from the current y position
  STA player_y

  LDA jump_height  ; Update jump height (simulate gravity)
  SEC
  SBC #1
  STA jump_height

  LDA player_y       ; Check if the player is back on the ground
  CMP #192           ; Adjust this value based on your ground level
  BCC not_on_ground

  STA player_y       ; Set player on the ground
  LDA #$00
  STA jumping

not_on_ground:
  ; Additional check to prevent going through the floor
  LDA player_y
  CMP #192           ; Adjust this value based on your ground level
  BCS set_on_ground  ; If player_y is below ground level, set it to ground level

check_ground:
  LDA pad1          ; Load button presses
  AND #BTN_UP       ; Filter out all but Up
  BEQ check_left    ; If result is zero, Up not pressed
  LDA jumping       ; Check if the player is already jumping
  BNE no_jump       ; If jumping, don't jump again

  LDA #$0a          ; Set the jump height (adjust as needed)
  STA jump_height
  LDA #$01          ; Set the jumping flag
  STA jumping

set_on_ground:
  LDA #$c0           ; Set player_y to the ground level (adjust as needed)
  STA player_y

no_jump:
check_attack:
  LDA pad1          ; Load button presses
  AND #BTN_A        ; Filter out all but the attack button
  BEQ check_left    ; If result is zero, attack not pressed
  LDA attacking     ; Check if the player is already attacking
  BNE no_attack     ; If already attacking, skip attack initiation

  LDA #$05          ; Set the attack animation duration (adjust as needed)
  STA attack_animation ; Set the attack animation counter
  LDA #$01          ; Set the attacking flag
  STA attacking

no_attack:
check_left:
  LDA pad1          ; Load button presses
  AND #BTN_LEFT     ; Filter out all but Left
  BEQ check_right   ; If result is zero, left not pressed
  LDA player_x      ; Load current player x position
  CMP #2            ; Compare with left edge of the screen
  BCC no_left_move  ; If less, branch to no_left_move
  SEC
  SBC #2
  STA player_x
no_left_move:
check_right:
  LDA pad1          ; Load button presses
  AND #BTN_RIGHT    ; Filter out all but Right
  BEQ set_idle_state      ; If result is zero, right not pressed

  ; Check if the character is already walking
  LDA character_state
  CMP #$01
  BEQ no_right_move ; If walking, don't change state

  ; Set character state to walking
  LDA #$01
  STA character_state

  ; Reset animation delay counter
  LDA #0
  STA animation_delay_counter
no_right_move:
  ; Check screen boundary before changing position
  LDA player_x      ; Load current player x position
  CMP #238          ; Compare with right edge of the screen - 2
  BCS check_up ; If greater or equal, don't move right

  ; Add your RIGHT movement logic here
  SEC
  ADC #1
  STA player_x
  JMP check_up

set_idle_state:
  ; Set character state to idle
  LDA #$00
  STA character_state
  JMP check_up
check_up:
  LDA pad1
  AND #BTN_UP
  BEQ check_down
  LDA player_y
  CMP #10          ; Compare with top edge of the screen
  BEQ no_up_move   ; If at the top edge, don't move up
  DEC player_y
no_up_move:
check_down:
  LDA pad1
  AND #BTN_DOWN
  BEQ done_checking
  LDA player_y
  CMP #192        ; Compare with bottom edge of the screen (adjust if needed)
  BEQ no_down_move ; If at the bottom edge, don't move down
  INC player_y
no_down_move:
done_checking:
  PLA ; Done with updates, restore registers
  TAY ; and return to where we called this
  PLA
  TAX
  PLA
  PLP
  RTS
.endproc

.proc draw_player
  ; save registers
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

  ; Increment the animation delay counter
  INC animation_delay_counter

  ; Compare with your desired delay value
  LDA animation_delay_counter
  CMP #5
  BNE skip_animation_update

  ; Determine the frame of the walking animation
  LDA frame_counter
  AND #$02     ; Use the last bit to cycle through 0 to 2
  ASL A        ; Multiply by 2 (since each frame is 2 bytes)
  TAX

  ; Check the character state
  LDA character_state
  CMP #$00  ; Check if the character is in the idle state
  BEQ idle_state

  ; Check if the character is attacking 
  LDA attacking
  BEQ not_attacking

  ; Write player tile numbers for the current attack animation frame
  LDA attack_animation_frames, X
  STA $
  LDA attack_animation_frames + 1, X
  STA $
  LDA attack_animation_frames + 2, X
  STA $
  LDA attack_animation_frames + 3, X
  STA $

  not_attacking:
  ; Write player tile numbers for the current animation frame (walking)
  LDA walking_animation_frames, X
  STA $0201
  LDA walking_animation_frames + 1, X
  STA $0205
  LDA walking_animation_frames + 2, X
  STA $0209
  LDA walking_animation_frames + 3, X
  STA $020D

  ; Write player tile attributes
  ; Use palette 1
  LDA #$01
  STA $0202
  STA $0206
  STA $020A
  STA $020E

  JMP done_drawing

idle_state:
  ; Write player tile numbers for the idle frame
  LDA idle_animation_frames, X
  STA $0201
  LDA idle_animation_frames + 1, X
  STA $0205
  LDA idle_animation_frames + 2, X
  STA $0209
  LDA idle_animation_frames + 3, X
  STA $020D

  ; Write player tile attributes
  ; Use palette 1
  LDA #$01
  STA $0202
  STA $0206
  STA $020A
  STA $020E

done_drawing:
  ; Reset the animation delay counter
  LDA #0
  STA animation_delay_counter

skip_animation_update:
  ; store tile locations
  ; top left tile:
  LDA player_y
  STA $0200
  LDA player_x
  STA $0203

  ; top right tile (x + 8):
  LDA player_y
  STA $0204
  LDA player_x
  CLC
  ADC #$08
  STA $0207

  ; bottom left tile (y + 8):
  LDA player_y
  CLC
  ADC #$08
  STA $0208
  LDA player_x
  STA $020b

  ; bottom right tile (x + 8, y + 8)
  LDA player_y
  CLC
  ADC #$08
  STA $020c
  LDA player_x
  CLC
  ADC #$08
  STA $020f

  INC frame_counter

  ; restore registers and return
  PLA
  TAY
  PLA
  TAX
  PLA
  PLP
  RTS
.endproc

.segment "VECTORS"
.addr nmi_handler, reset_handler, irq_handler

.segment "RODATA"
palettes:
.byte $21, $16, $17, $20 ; main background pallete
.byte $21, $00, $06, $30 
.byte $21, $17, $28, $2a ; second tree pallete
.byte $21, $09, $19, $29 ; first tree pallete

.byte $21, $16, $17, $20
.byte $21, $00, $06, $30
.byte $21, $09, $19, $29
.byte $21, $09, $19, $29

idle_animation_frames:
.byte $44, $4d, $46, $47  ; Frame 0

walking_animation_frames:
.byte $44, $4d, $46, $47  ; Frame 0
.byte $4c, $4d, $4e, $4f  ; Frame 1

attack_animation_frames:

.segment "CHR"
.incbin "graphics.chr"