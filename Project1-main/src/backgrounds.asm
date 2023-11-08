.include "constants.inc"
.include "header.inc"

.segment "CODE"
.proc irq_handler
  RTI
.endproc

.proc nmi_handler
  LDA #$00
  STA OAMADDR
  LDA #$02
  STA OAMDMA
	LDA #$00
	STA $2005
	STA $2005
  RTI
.endproc

.import reset_handler

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

  ; write sprite data
  LDX #$00
load_sprites:
  LDA sprites,X
  STA $0200,X
  INX
  CPX #$10
  BNE load_sprites

	; Nametables

	; Clouds
	; top clouds
	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$20
	STA PPUADDR
	LDX #$3a
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$21
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$22
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$23
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$24
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$25
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$26
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$27
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$28
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$29
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$2a
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$2b
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$2c
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$2d
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$2e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$2f
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$30
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$31
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$32
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$33
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$34
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$35
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$36
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$37
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$38
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$39
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$3a
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$3b
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$3c
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$3d
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$3e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$3f
	STA PPUADDR
	STX PPUDATA

	; bottom clouds
	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$60
	STA PPUADDR
	LDX #$39
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$61
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$62
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$63
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$64
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$65
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$66
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$67
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$68
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$69
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$6a
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$6b
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$6c
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$6d
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$6e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$6f
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$70
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$71
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$72
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$73
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$74
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$75
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$76
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$77
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$78
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$79
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$7a
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$7b
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$7c
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$7d
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$7d
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$7e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$7f
	STA PPUADDR
	STX PPUDATA

	; middle clouds
	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$40
	STA PPUADDR
	LDX #$38
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$41
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$44
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$45
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$46
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$47
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$48
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$4b
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$4c
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$4d
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$4e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$4f
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$52
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$53
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$54
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$55
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$56
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$59
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$5a
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$5b
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$5e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$5f
	STA PPUADDR
	STX PPUDATA

	; left smile clouds
	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$42
	STA PPUADDR
	LDX #$34
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$49
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$50
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$57
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$5c
	STA PPUADDR
	STX PPUDATA

	; right smile clouds
	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$43
	STA PPUADDR
	LDX #$35
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$4a
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$51
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$58
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$5d
	STA PPUADDR
	STX PPUDATA

	; Snowflakes
	; top left snowflakes - row 1 (top)
	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$c0
	STA PPUADDR
	LDX #$42
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$88
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$d4
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$dc
	STA PPUADDR
	STX PPUDATA

	; top left snowflakes - row 2
	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$46
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$4e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$5a
	STA PPUADDR
	STX PPUDATA

	; top left snowflakes - row 3
	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$81
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$b6
	STA PPUADDR
	STX PPUDATA

	; top left snowflakes - row 4 (bottom)
	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$04
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$37
	STA PPUADDR
	STX PPUDATA

	; top right snowflakes - row 1 (top)
	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$c1
	STA PPUADDR
	LDX #$43
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$89
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$d5
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$dd
	STA PPUADDR
	STX PPUDATA

	; top right snowflakes - row 2
	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$47
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$4f
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$5b
	STA PPUADDR
	STX PPUDATA

; top right snowflakes - row 3
	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$82
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$b7
	STA PPUADDR
	STX PPUDATA

; top right snowflakes - row 4 (bottom)
	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$05
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$38
	STA PPUADDR
	STX PPUDATA

	; bottom left snowflakes - row 1 (top)
	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$e0
	STA PPUADDR
	LDX #$52
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$a8
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$f4
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$fc
	STA PPUADDR
	STX PPUDATA

	; bottom left snowflakes - row 2
	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$66
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$6e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$7a
	STA PPUADDR
	STX PPUDATA

	; bottom left snowflakes - row 3
	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$a1
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$d6
	STA PPUADDR
	STX PPUDATA

	; bottom left snowflakes - row 4 (bottom)
	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$24
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$57
	STA PPUADDR
	STX PPUDATA

	; bottom right snowflakes - row 1 (top)
	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$e1
	STA PPUADDR
	LDX #$53
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$a9
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$f5
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$20
	STA PPUADDR
	LDA #$fd
	STA PPUADDR
	STX PPUDATA

	; bottom right snowflakes - row 2
	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$67
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$6f
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$7b
	STA PPUADDR
	STX PPUDATA

	; bottom right snowflakes - row 3
	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$a2
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$21
	STA PPUADDR
	LDA #$d7
	STA PPUADDR
	STX PPUDATA

	; bottom right snowflakes - row 4 (bottom)
	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$25
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$58
	STA PPUADDR
	STX PPUDATA

	; left platform edge
	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$aa
	STA PPUADDR
	LDX #$30
	STX PPUDATA

	; right platform edge
	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$b4
	STA PPUADDR
	LDX #$32
	STX PPUDATA

	; middle platform
	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$ab
	STA PPUADDR
	LDX #$3c
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$ac
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$ad
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$ae
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$af
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$b0
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$b1
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$b2
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$b3
	STA PPUADDR
	STX PPUDATA

	; trees

	; top tree
	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$85
	STA PPUADDR
	LDX #$3e
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$9b
	STA PPUADDR
	STX PPUDATA

	; mid tree
	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$a5
	STA PPUADDR
	LDX #$38
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$c5
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$e5
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$c5
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$e5
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$c5
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$bb
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$db
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$fb
	STA PPUADDR
	STX PPUDATA

	; left tree 
	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$a4
	STA PPUADDR
	LDX #$3f
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$c4
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$e4
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$c4
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$ba
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$da
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$fa
	STA PPUADDR
	STX PPUDATA

	; right tree 
	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$a6
	STA PPUADDR
	LDX #$40
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$c6
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$e6
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$bc
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$dc
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$22
	STA PPUADDR
	LDA #$fc
	STA PPUADDR
	STX PPUDATA

	; tree trunk
	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$05
	STA PPUADDR
	LDX #$3d
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$25
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$1b
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$3b
	STA PPUADDR
	STX PPUDATA

	;snowy floor
	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$40
	STA PPUADDR
	LDX #$3c
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$41
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$42
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$43
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$44
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$45
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$46
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$47
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$48
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$49
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$4a
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$4b
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$4c
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$4d
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$4e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$4f
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$50
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$51
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$52
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$53
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$54
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$55
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$56
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$57
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$58
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$59
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$5a
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$5b
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$5c
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$5d
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$5e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$5f
	STA PPUADDR
	STX PPUDATA

	;underground
	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$60
	STA PPUADDR
	LDX #$31
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$61
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$62
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$63
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$64
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$65
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$67
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$68
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$69
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$6a
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$6b
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$6c
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$6d
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$6e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$6f
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$70
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$71
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$72
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$73
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$74
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$75
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$76
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$77
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$78
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$79
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$7a
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$7b
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$7c
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$7d
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$7e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$7f
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$80
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$81
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$82
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$83
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$84
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$85
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$86
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$87
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$88
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$89
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$8a
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$8b
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$8c
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$8d
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$8e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$8f
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$90
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$91
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$92
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$93
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$94
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$95
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$96
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$97
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$98
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$99
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$9a
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$9b
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$9c
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$9d
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$9e
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$9f
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$a0
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$a1
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$a2
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$a3
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$a4
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$a5
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$a6
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$a7
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$a8
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$a9
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$aa
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$ab
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$ac
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$ad
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$ae
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$af
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$b0
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$b1
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$b2
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$b3
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$b4
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$b5
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$b6
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$b7
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$b8
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$b9
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$ba
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$bb
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$bc
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$bd
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$be
	STA PPUADDR
	STX PPUDATA

	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$bf
	STA PPUADDR
	STX PPUDATA







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

.segment "VECTORS"
.addr nmi_handler, reset_handler, irq_handler

.segment "RODATA"
palettes:
.byte $21, $16, $17, $20
.byte $21, $00, $06, $30
.byte $21, $17, $28, $0f
.byte $21, $09, $19, $29

.byte $21, $2d, $10, $15
.byte $21, $09, $19, $29
.byte $21, $09, $19, $29
.byte $21, $09, $19, $29

sprites:

.segment "CHR"
.incbin "background.chr"
