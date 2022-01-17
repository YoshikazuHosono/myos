; hosonos
; TAB=4

		org		0x7c00			; このプログラムがどこに読み込まれるのか

; fat12 floppy

		jmp		entry
		db		0x90
		db		"HOSONOSX"		; ブートセクタの名前を自由に書いてよい（8バイト）
		dw		512				; 1セクタの大きさ（512にしなければいけない）
		db		1				; クラスタの大きさ（1セクタにしなければいけない）
		dw		1				; FATがどこから始まるか（普通は1セクタ目からにする）
		db		2				; FATの個数（2にしなければいけない）
		dw		224				; ルートディレクトリ領域の大きさ（普通は224エントリにする）
		dw		2880			; このドライブの大きさ（2880セクタにしなければいけない）
		db		0xf0			; メディアのタイプ（0xf0にしなければいけない）
		dw		9				; FAT領域の長さ（9セクタにしなければいけない）
		dw		18				; 1トラックにいくつのセクタがあるか（18にしなければいけない）
		dw		2				; ヘッドの数（2にしなければいけない）
		dd		0				; パーティションを使ってないのでここは必ず0
		dd		2880			; このドライブ大きさをもう一度書く
		db		0,0,0x29		; よくわからないけどこの値にしておくといいらしい
		dd		0xffffffff		; たぶんボリュームシリアル番号
		db		"HOSONOS    "	; ディスクの名前（11バイト）
		db		"FAT12   "		; フォーマットの名前（8バイト）
		resb	18				; とりあえず18バイトあけておく

entry:
		mov		AX,0
		mov		SS,AX
		mov		SP,0x7c00
		mov		DS,AX
		mov		ES,AX
		mov		SI,msg

putloop:
		mov		AL,[SI]
		add		SI,1
		cmp		AL,0
		JE		fin
		mov		AH,0x0e
		mov		BX,15
		int		0x10
		jmp		putloop

fin:
		hlt
		jmp		fin

msg:
		db		0x0a
		db		"booting hosonos..."
		db		0x0a
		db		0
		RESB	0x1fe-($-$$)	; 0x001feまでを0x00で埋める命令
		DB		0x55, 0xaa		; ブートセクタの最後はこれにしないといけんらしい
		; ブートセクタ以外の部分
		db		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		resb	4600
		db		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		resb	1469432
