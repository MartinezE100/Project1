.include "constants.inc"

.segment "ZEROPAGE"
.importzp player_x, player_y, player_dir, jumping, jump_height, frame_counter, animation_delay_counter, character_state

.segment "CODE"
.import main
.export reset_handler
.proc reset_handler
  SEI
  CLD
  LDX #$00
  STX PPUCTRL
  STX PPUMASK

vblankwait:
  BIT PPUSTATUS
  BPL vblankwait

	LDX #$00
	LDA #$ff
clear_oam:
	STA $0200,X ; set sprite y-positions off the screen
	INX
	INX
	INX
	INX
	BNE clear_oam

vblankwait2:
	BIT PPUSTATUS
	BPL vblankwait2

	; initialize zero-page values
	LDA #$75
	STA player_x
	LDA #$c0
	STA player_y
	LDA #$00
	STA jumping
	STA jump_height
	STA frame_counter
	STA character_state
	STA player_dir
	LDA #0
	STA animation_delay_counter

  JMP main
.endproc
