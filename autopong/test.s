   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.global	ball_geometry
  16              		.data
  17              		.align	2
  20              	ball_geometry:
  21 0000 0C000000 		.word	12
  22 0004 04000000 		.word	4
  23 0008 04000000 		.word	4
  24 000c 00       		.byte	0
  25 000d 01       		.byte	1
  26 000e 00       		.byte	0
  27 000f 02       		.byte	2
  28 0010 01       		.byte	1
  29 0011 00       		.byte	0
  30 0012 01       		.byte	1
  31 0013 01       		.byte	1
  32 0014 01       		.byte	1
  33 0015 02       		.byte	2
  34 0016 01       		.byte	1
  35 0017 03       		.byte	3
  36 0018 02       		.byte	2
  37 0019 00       		.byte	0
  38 001a 02       		.byte	2
  39 001b 01       		.byte	1
  40 001c 02       		.byte	2
  41 001d 02       		.byte	2
  42 001e 02       		.byte	2
  43 001f 03       		.byte	3
  44 0020 03       		.byte	3
  45 0021 01       		.byte	1
  46 0022 03       		.byte	3
  47 0023 02       		.byte	2
  48 0024 00000000 		.space	16
  48      00000000 
  48      00000000 
  48      00000000 
  49              		.text
  50              		.align	1
  51              		.global	set_object_speed
  52              		.syntax unified
  53              		.code	16
  54              		.thumb_func
  55              		.fpu softvfp
  57              	set_object_speed:
  58              	.LFB0:
  59              		.file 1 "C:/Users/becer/Documents/cintro2/autopong/startup.c"
   1:C:/Users/becer/Documents/cintro2/autopong\startup.c **** /*
   2:C:/Users/becer/Documents/cintro2/autopong\startup.c ****  * 	startup.c
   3:C:/Users/becer/Documents/cintro2/autopong\startup.c ****  *
   4:C:/Users/becer/Documents/cintro2/autopong\startup.c ****  */
   5:C:/Users/becer/Documents/cintro2/autopong\startup.c ****  
   6:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define SIMULATOR
   7:C:/Users/becer/Documents/cintro2/autopong\startup.c ****  
   8:C:/Users/becer/Documents/cintro2/autopong\startup.c **** //PortE for graphic display
   9:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define GPIO_E													0x40021000
  10:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define	portModer	 ((volatile unsigned int *)					(GPIO_E))
  11:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define	portOtyper	 ((volatile unsigned short *)				(GPIO_E+0x4))
  12:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define	portOspeedr	 ((volatile unsigned int *)					(GPIO_E+0x8))
  13:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define	portOpupdr	 ((volatile unsigned int *)					(GPIO_E+0xC))
  14:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define GPIO_IDR 	((volatile unsigned short *)				(GPIO_E+0x10))
  15:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *)				(GPIO_E+0x11))
  16:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define GPIO_ODR_LOW  ((volatile unsigned char *)				(GPIO_E+0x14))
  17:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *)				(GPIO_E+0x15))
  18:C:/Users/becer/Documents/cintro2/autopong\startup.c ****  
  19:C:/Users/becer/Documents/cintro2/autopong\startup.c ****  
  20:C:/Users/becer/Documents/cintro2/autopong\startup.c **** //Delay 
  21:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define SYSTICK									0xE000E010
  22:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define STK_CTRL ((volatile unsigned int *)		(SYSTICK))
  23:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define STK_LOAD ((volatile unsigned int *)		(SYSTICK+0x4))
  24:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define STK_VAL ((volatile unsigned int *)		(SYSTICK+0x8))
  25:C:/Users/becer/Documents/cintro2/autopong\startup.c **** //#define STK_CALIB ((volatile unsigned int *)	(SYSTICK+0xC))
  26:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
  27:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define B_RS 			1			//0 command, 1 Data
  28:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define B_RW 			2			//0 write, 1 read
  29:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define B_SELECT 		4			//Graphics 0, 1 ASCII
  30:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define B_CS1 			8			//Controller select 1
  31:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define B_CS2			0x10		//Controller Select 2
  32:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define B_RESET			0x20		//Reset
  33:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define B_E				0x40		//Enable
  34:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
  35:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define LCD_ON			0x3F		//Display on
  36:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define	LCD_OFF			0x3E		//Display off
  37:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define LCD_SET_ADD		0x40		//Set horizontal coordinate
  38:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define LCD_SET_PAGE	0xB8		//Set vertical coordinate
  39:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define	LCD_DISP_START	0xC0		//Start adress
  40:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define	LCD_BUSY		0x80		//Read busy status
  41:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
  42:C:/Users/becer/Documents/cintro2/autopong\startup.c **** #define MAX_POINTS 20
  43:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
  44:C:/Users/becer/Documents/cintro2/autopong\startup.c **** typedef unsigned char uint8_t;
  45:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
  46:C:/Users/becer/Documents/cintro2/autopong\startup.c **** typedef struct tPoint
  47:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
  48:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	unsigned char x;
  49:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	unsigned char y;
  50:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }POINT;
  51:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
  52:C:/Users/becer/Documents/cintro2/autopong\startup.c **** typedef struct tGeometry
  53:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
  54:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	int numpoints;
  55:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	int sizex;
  56:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	int sizey;
  57:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	POINT px[MAX_POINTS];
  58:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }GEOMETRY, *PGEOMETRY;
  59:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
  60:C:/Users/becer/Documents/cintro2/autopong\startup.c **** GEOMETRY ball_geometry=
  61:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
  62:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	12,			//Numpoints
  63:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	4,4,		//sizeX sizeY
  64:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{	{0,1}, {0,2}, 
  65:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{1,0},{1,1},{1,2},{1,3},
  66:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{2,0},{2,1},{2,2},{2,3},
  67:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		{3,1},{3,2} } //form
  68:C:/Users/becer/Documents/cintro2/autopong\startup.c **** };
  69:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
  70:C:/Users/becer/Documents/cintro2/autopong\startup.c **** typedef struct tObj 
  71:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
  72:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	PGEOMETRY geo;
  73:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	int dirx,diry;
  74:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	int posx,posy;
  75:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	void (* draw ) (struct tObj *);
  76:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	void (* clear ) (struct tObj *);
  77:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	void (* move ) (struct tObj *);
  78:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	void (* set_speed ) (struct tObj *, int, int);
  79:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }OBJECT, *POBJECT;
  80:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
  81:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
  82:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void set_object_speed(POBJECT o, int speedx, int speedy)
  83:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
  60              		.loc 1 83 0
  61              		.cfi_startproc
  62              		@ args = 0, pretend = 0, frame = 16
  63              		@ frame_needed = 1, uses_anonymous_args = 0
  64 0000 80B5     		push	{r7, lr}
  65              		.cfi_def_cfa_offset 8
  66              		.cfi_offset 7, -8
  67              		.cfi_offset 14, -4
  68 0002 84B0     		sub	sp, sp, #16
  69              		.cfi_def_cfa_offset 24
  70 0004 00AF     		add	r7, sp, #0
  71              		.cfi_def_cfa_register 7
  72 0006 F860     		str	r0, [r7, #12]
  73 0008 B960     		str	r1, [r7, #8]
  74 000a 7A60     		str	r2, [r7, #4]
  84:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	o->dirx = speedx;
  75              		.loc 1 84 0
  76 000c FB68     		ldr	r3, [r7, #12]
  77 000e BA68     		ldr	r2, [r7, #8]
  78 0010 5A60     		str	r2, [r3, #4]
  85:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	o->diry = speedy;
  79              		.loc 1 85 0
  80 0012 FB68     		ldr	r3, [r7, #12]
  81 0014 7A68     		ldr	r2, [r7, #4]
  82 0016 9A60     		str	r2, [r3, #8]
  86:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
  83              		.loc 1 86 0
  84 0018 C046     		nop
  85 001a BD46     		mov	sp, r7
  86 001c 04B0     		add	sp, sp, #16
  87              		@ sp needed
  88 001e 80BD     		pop	{r7, pc}
  89              		.cfi_endproc
  90              	.LFE0:
  92              		.align	1
  93              		.global	draw_object
  94              		.syntax unified
  95              		.code	16
  96              		.thumb_func
  97              		.fpu softvfp
  99              	draw_object:
 100              	.LFB1:
  87:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
  88:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void draw_object(POBJECT o)
  89:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 101              		.loc 1 89 0
 102              		.cfi_startproc
 103              		@ args = 0, pretend = 0, frame = 16
 104              		@ frame_needed = 1, uses_anonymous_args = 0
 105 0020 80B5     		push	{r7, lr}
 106              		.cfi_def_cfa_offset 8
 107              		.cfi_offset 7, -8
 108              		.cfi_offset 14, -4
 109 0022 84B0     		sub	sp, sp, #16
 110              		.cfi_def_cfa_offset 24
 111 0024 00AF     		add	r7, sp, #0
 112              		.cfi_def_cfa_register 7
 113 0026 7860     		str	r0, [r7, #4]
 114              	.LBB2:
  90:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	for (int i = 0; i < o->geo->numpoints; i++)
 115              		.loc 1 90 0
 116 0028 0023     		movs	r3, #0
 117 002a FB60     		str	r3, [r7, #12]
 118 002c 1EE0     		b	.L3
 119              	.L4:
 120              	.LBB3:
  91:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
  92:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		pixel((o->geo->px[i].x+o->posx),(o->geo->px[i].y + o->posy), 1);
 121              		.loc 1 92 0 discriminator 3
 122 002e 7B68     		ldr	r3, [r7, #4]
 123 0030 1A68     		ldr	r2, [r3]
 124 0032 FB68     		ldr	r3, [r7, #12]
 125 0034 0433     		adds	r3, r3, #4
 126 0036 5B00     		lsls	r3, r3, #1
 127 0038 D318     		adds	r3, r2, r3
 128 003a 0433     		adds	r3, r3, #4
 129 003c 1B78     		ldrb	r3, [r3]
 130 003e 1A00     		movs	r2, r3
 131 0040 7B68     		ldr	r3, [r7, #4]
 132 0042 DB68     		ldr	r3, [r3, #12]
 133 0044 D018     		adds	r0, r2, r3
 134 0046 7B68     		ldr	r3, [r7, #4]
 135 0048 1A68     		ldr	r2, [r3]
 136 004a FB68     		ldr	r3, [r7, #12]
 137 004c 0433     		adds	r3, r3, #4
 138 004e 5B00     		lsls	r3, r3, #1
 139 0050 D318     		adds	r3, r2, r3
 140 0052 0533     		adds	r3, r3, #5
 141 0054 1B78     		ldrb	r3, [r3]
 142 0056 1A00     		movs	r2, r3
 143 0058 7B68     		ldr	r3, [r7, #4]
 144 005a 1B69     		ldr	r3, [r3, #16]
 145 005c D318     		adds	r3, r2, r3
 146 005e 0122     		movs	r2, #1
 147 0060 1900     		movs	r1, r3
 148 0062 FFF7FEFF 		bl	pixel
 149              	.LBE3:
  90:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	for (int i = 0; i < o->geo->numpoints; i++)
 150              		.loc 1 90 0 discriminator 3
 151 0066 FB68     		ldr	r3, [r7, #12]
 152 0068 0133     		adds	r3, r3, #1
 153 006a FB60     		str	r3, [r7, #12]
 154              	.L3:
  90:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	for (int i = 0; i < o->geo->numpoints; i++)
 155              		.loc 1 90 0 is_stmt 0 discriminator 1
 156 006c 7B68     		ldr	r3, [r7, #4]
 157 006e 1B68     		ldr	r3, [r3]
 158 0070 1B68     		ldr	r3, [r3]
 159 0072 FA68     		ldr	r2, [r7, #12]
 160 0074 9A42     		cmp	r2, r3
 161 0076 DADB     		blt	.L4
 162              	.LBE2:
  93:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	} 
  94:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 163              		.loc 1 94 0 is_stmt 1
 164 0078 C046     		nop
 165 007a BD46     		mov	sp, r7
 166 007c 04B0     		add	sp, sp, #16
 167              		@ sp needed
 168 007e 80BD     		pop	{r7, pc}
 169              		.cfi_endproc
 170              	.LFE1:
 172              		.align	1
 173              		.global	clear_object
 174              		.syntax unified
 175              		.code	16
 176              		.thumb_func
 177              		.fpu softvfp
 179              	clear_object:
 180              	.LFB2:
  95:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
  96:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void clear_object(POBJECT o)
  97:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 181              		.loc 1 97 0
 182              		.cfi_startproc
 183              		@ args = 0, pretend = 0, frame = 16
 184              		@ frame_needed = 1, uses_anonymous_args = 0
 185 0080 80B5     		push	{r7, lr}
 186              		.cfi_def_cfa_offset 8
 187              		.cfi_offset 7, -8
 188              		.cfi_offset 14, -4
 189 0082 84B0     		sub	sp, sp, #16
 190              		.cfi_def_cfa_offset 24
 191 0084 00AF     		add	r7, sp, #0
 192              		.cfi_def_cfa_register 7
 193 0086 7860     		str	r0, [r7, #4]
 194              	.LBB4:
  98:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++)
 195              		.loc 1 98 0
 196 0088 0023     		movs	r3, #0
 197 008a FB60     		str	r3, [r7, #12]
 198 008c 1EE0     		b	.L6
 199              	.L7:
 200              	.LBB5:
  99:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 100:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		pixel((o->geo->px[i].x + o->posx),(o->geo->px[i].y + o->posy), 0);
 201              		.loc 1 100 0 discriminator 3
 202 008e 7B68     		ldr	r3, [r7, #4]
 203 0090 1A68     		ldr	r2, [r3]
 204 0092 FB68     		ldr	r3, [r7, #12]
 205 0094 0433     		adds	r3, r3, #4
 206 0096 5B00     		lsls	r3, r3, #1
 207 0098 D318     		adds	r3, r2, r3
 208 009a 0433     		adds	r3, r3, #4
 209 009c 1B78     		ldrb	r3, [r3]
 210 009e 1A00     		movs	r2, r3
 211 00a0 7B68     		ldr	r3, [r7, #4]
 212 00a2 DB68     		ldr	r3, [r3, #12]
 213 00a4 D018     		adds	r0, r2, r3
 214 00a6 7B68     		ldr	r3, [r7, #4]
 215 00a8 1A68     		ldr	r2, [r3]
 216 00aa FB68     		ldr	r3, [r7, #12]
 217 00ac 0433     		adds	r3, r3, #4
 218 00ae 5B00     		lsls	r3, r3, #1
 219 00b0 D318     		adds	r3, r2, r3
 220 00b2 0533     		adds	r3, r3, #5
 221 00b4 1B78     		ldrb	r3, [r3]
 222 00b6 1A00     		movs	r2, r3
 223 00b8 7B68     		ldr	r3, [r7, #4]
 224 00ba 1B69     		ldr	r3, [r3, #16]
 225 00bc D318     		adds	r3, r2, r3
 226 00be 0022     		movs	r2, #0
 227 00c0 1900     		movs	r1, r3
 228 00c2 FFF7FEFF 		bl	pixel
 229              	.LBE5:
  98:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++)
 230              		.loc 1 98 0 discriminator 3
 231 00c6 FB68     		ldr	r3, [r7, #12]
 232 00c8 0133     		adds	r3, r3, #1
 233 00ca FB60     		str	r3, [r7, #12]
 234              	.L6:
  98:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	for(int i = 0; i < o->geo->numpoints; i++)
 235              		.loc 1 98 0 is_stmt 0 discriminator 1
 236 00cc 7B68     		ldr	r3, [r7, #4]
 237 00ce 1B68     		ldr	r3, [r3]
 238 00d0 1B68     		ldr	r3, [r3]
 239 00d2 FA68     		ldr	r2, [r7, #12]
 240 00d4 9A42     		cmp	r2, r3
 241 00d6 DADB     		blt	.L7
 242              	.LBE4:
 101:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 102:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 243              		.loc 1 102 0 is_stmt 1
 244 00d8 C046     		nop
 245 00da BD46     		mov	sp, r7
 246 00dc 04B0     		add	sp, sp, #16
 247              		@ sp needed
 248 00de 80BD     		pop	{r7, pc}
 249              		.cfi_endproc
 250              	.LFE2:
 252              		.align	1
 253              		.global	move_object
 254              		.syntax unified
 255              		.code	16
 256              		.thumb_func
 257              		.fpu softvfp
 259              	move_object:
 260              	.LFB3:
 103:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 104:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void move_object(POBJECT o)
 105:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 261              		.loc 1 105 0
 262              		.cfi_startproc
 263              		@ args = 0, pretend = 0, frame = 8
 264              		@ frame_needed = 1, uses_anonymous_args = 0
 265 00e0 80B5     		push	{r7, lr}
 266              		.cfi_def_cfa_offset 8
 267              		.cfi_offset 7, -8
 268              		.cfi_offset 14, -4
 269 00e2 82B0     		sub	sp, sp, #8
 270              		.cfi_def_cfa_offset 16
 271 00e4 00AF     		add	r7, sp, #0
 272              		.cfi_def_cfa_register 7
 273 00e6 7860     		str	r0, [r7, #4]
 106:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	clear_object(o);
 274              		.loc 1 106 0
 275 00e8 7B68     		ldr	r3, [r7, #4]
 276 00ea 1800     		movs	r0, r3
 277 00ec FFF7FEFF 		bl	clear_object
 107:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	o->posx = (o->posx + o->dirx);
 278              		.loc 1 107 0
 279 00f0 7B68     		ldr	r3, [r7, #4]
 280 00f2 DA68     		ldr	r2, [r3, #12]
 281 00f4 7B68     		ldr	r3, [r7, #4]
 282 00f6 5B68     		ldr	r3, [r3, #4]
 283 00f8 D218     		adds	r2, r2, r3
 284 00fa 7B68     		ldr	r3, [r7, #4]
 285 00fc DA60     		str	r2, [r3, #12]
 108:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	o->posy = (o->posy + o->diry);
 286              		.loc 1 108 0
 287 00fe 7B68     		ldr	r3, [r7, #4]
 288 0100 1A69     		ldr	r2, [r3, #16]
 289 0102 7B68     		ldr	r3, [r7, #4]
 290 0104 9B68     		ldr	r3, [r3, #8]
 291 0106 D218     		adds	r2, r2, r3
 292 0108 7B68     		ldr	r3, [r7, #4]
 293 010a 1A61     		str	r2, [r3, #16]
 109:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 110:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	if (o->posx < 1)						//Left border limit -> reverse direction
 294              		.loc 1 110 0
 295 010c 7B68     		ldr	r3, [r7, #4]
 296 010e DB68     		ldr	r3, [r3, #12]
 297 0110 002B     		cmp	r3, #0
 298 0112 04DC     		bgt	.L9
 111:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 112:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		o->dirx = -(o->dirx);
 299              		.loc 1 112 0
 300 0114 7B68     		ldr	r3, [r7, #4]
 301 0116 5B68     		ldr	r3, [r3, #4]
 302 0118 5A42     		rsbs	r2, r3, #0
 303 011a 7B68     		ldr	r3, [r7, #4]
 304 011c 5A60     		str	r2, [r3, #4]
 305              	.L9:
 113:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 114:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	if ( (o->posx  + o->geo->sizex) > 128)	//Right border limit -> reverse direction
 306              		.loc 1 114 0
 307 011e 7B68     		ldr	r3, [r7, #4]
 308 0120 DA68     		ldr	r2, [r3, #12]
 309 0122 7B68     		ldr	r3, [r7, #4]
 310 0124 1B68     		ldr	r3, [r3]
 311 0126 5B68     		ldr	r3, [r3, #4]
 312 0128 D318     		adds	r3, r2, r3
 313 012a 802B     		cmp	r3, #128
 314 012c 04DD     		ble	.L10
 115:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 116:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		o->dirx = -(o->dirx);
 315              		.loc 1 116 0
 316 012e 7B68     		ldr	r3, [r7, #4]
 317 0130 5B68     		ldr	r3, [r3, #4]
 318 0132 5A42     		rsbs	r2, r3, #0
 319 0134 7B68     		ldr	r3, [r7, #4]
 320 0136 5A60     		str	r2, [r3, #4]
 321              	.L10:
 117:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 118:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 119:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	if (o->posy < 1) 
 322              		.loc 1 119 0
 323 0138 7B68     		ldr	r3, [r7, #4]
 324 013a 1B69     		ldr	r3, [r3, #16]
 325 013c 002B     		cmp	r3, #0
 326 013e 04DC     		bgt	.L11
 120:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 121:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		o->diry = -(o->diry);
 327              		.loc 1 121 0
 328 0140 7B68     		ldr	r3, [r7, #4]
 329 0142 9B68     		ldr	r3, [r3, #8]
 330 0144 5A42     		rsbs	r2, r3, #0
 331 0146 7B68     		ldr	r3, [r7, #4]
 332 0148 9A60     		str	r2, [r3, #8]
 333              	.L11:
 122:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 123:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 124:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	if ((o->posy + o->geo->sizey) > 64)
 334              		.loc 1 124 0
 335 014a 7B68     		ldr	r3, [r7, #4]
 336 014c 1A69     		ldr	r2, [r3, #16]
 337 014e 7B68     		ldr	r3, [r7, #4]
 338 0150 1B68     		ldr	r3, [r3]
 339 0152 9B68     		ldr	r3, [r3, #8]
 340 0154 D318     		adds	r3, r2, r3
 341 0156 402B     		cmp	r3, #64
 342 0158 04DD     		ble	.L12
 125:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 126:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		o->diry = -(o->diry);
 343              		.loc 1 126 0
 344 015a 7B68     		ldr	r3, [r7, #4]
 345 015c 9B68     		ldr	r3, [r3, #8]
 346 015e 5A42     		rsbs	r2, r3, #0
 347 0160 7B68     		ldr	r3, [r7, #4]
 348 0162 9A60     		str	r2, [r3, #8]
 349              	.L12:
 127:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 128:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	draw_object(o);
 350              		.loc 1 128 0
 351 0164 7B68     		ldr	r3, [r7, #4]
 352 0166 1800     		movs	r0, r3
 353 0168 FFF7FEFF 		bl	draw_object
 129:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 354              		.loc 1 129 0
 355 016c C046     		nop
 356 016e BD46     		mov	sp, r7
 357 0170 02B0     		add	sp, sp, #8
 358              		@ sp needed
 359 0172 80BD     		pop	{r7, pc}
 360              		.cfi_endproc
 361              	.LFE3:
 363              		.data
 364              		.align	2
 367              	ball:
 368 0034 00000000 		.word	ball_geometry
 369 0038 00000000 		.word	0
 370 003c 00000000 		.word	0
 371 0040 01000000 		.word	1
 372 0044 01000000 		.word	1
 373 0048 00000000 		.word	draw_object
 374 004c 00000000 		.word	clear_object
 375 0050 00000000 		.word	move_object
 376 0054 00000000 		.word	set_object_speed
 377              		.text
 378              		.align	1
 379              		.global	delay_250ns
 380              		.syntax unified
 381              		.code	16
 382              		.thumb_func
 383              		.fpu softvfp
 385              	delay_250ns:
 386              	.LFB4:
 130:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 131:C:/Users/becer/Documents/cintro2/autopong\startup.c **** //int current_disp[64][4];
 132:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 133:C:/Users/becer/Documents/cintro2/autopong\startup.c **** static OBJECT ball= 
 134:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 135:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	&ball_geometry,
 136:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	0,0,
 137:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	1,1,
 138:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	draw_object,
 139:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	clear_object,
 140:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	move_object,
 141:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	set_object_speed,
 142:C:/Users/becer/Documents/cintro2/autopong\startup.c **** };
 143:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 144:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void delay_250ns( void )
 145:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 387              		.loc 1 145 0
 388              		.cfi_startproc
 389              		@ args = 0, pretend = 0, frame = 0
 390              		@ frame_needed = 1, uses_anonymous_args = 0
 391 0174 80B5     		push	{r7, lr}
 392              		.cfi_def_cfa_offset 8
 393              		.cfi_offset 7, -8
 394              		.cfi_offset 14, -4
 395 0176 00AF     		add	r7, sp, #0
 396              		.cfi_def_cfa_register 7
 146:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	/* SystemCoreClock = 168000000 */
 147:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*STK_CTRL = 0;					//Initiate counter by resetting bit to 0
 397              		.loc 1 147 0
 398 0178 0C4B     		ldr	r3, .L15
 399 017a 0022     		movs	r2, #0
 400 017c 1A60     		str	r2, [r3]
 148:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*STK_LOAD = ( (168/4) -1 );		//Counter value 168 000 000 = 1 sec, 168 = 1 microsec = 1000 nanosec 
 401              		.loc 1 148 0
 402 017e 0C4B     		ldr	r3, .L15+4
 403 0180 2922     		movs	r2, #41
 404 0182 1A60     		str	r2, [r3]
 149:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*STK_VAL = 0;					//Reset counter register
 405              		.loc 1 149 0
 406 0184 0B4B     		ldr	r3, .L15+8
 407 0186 0022     		movs	r2, #0
 408 0188 1A60     		str	r2, [r3]
 150:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*STK_CTRL = 5;					
 409              		.loc 1 150 0
 410 018a 084B     		ldr	r3, .L15
 411 018c 0522     		movs	r2, #5
 412 018e 1A60     		str	r2, [r3]
 151:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	while( (*STK_CTRL & 0x10000 )== 0 );
 413              		.loc 1 151 0
 414 0190 C046     		nop
 415              	.L14:
 416              		.loc 1 151 0 is_stmt 0 discriminator 1
 417 0192 064B     		ldr	r3, .L15
 418 0194 1A68     		ldr	r2, [r3]
 419 0196 8023     		movs	r3, #128
 420 0198 5B02     		lsls	r3, r3, #9
 421 019a 1340     		ands	r3, r2
 422 019c F9D0     		beq	.L14
 152:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*STK_CTRL = 0;
 423              		.loc 1 152 0 is_stmt 1
 424 019e 034B     		ldr	r3, .L15
 425 01a0 0022     		movs	r2, #0
 426 01a2 1A60     		str	r2, [r3]
 153:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 427              		.loc 1 153 0
 428 01a4 C046     		nop
 429 01a6 BD46     		mov	sp, r7
 430              		@ sp needed
 431 01a8 80BD     		pop	{r7, pc}
 432              	.L16:
 433 01aa C046     		.align	2
 434              	.L15:
 435 01ac 10E000E0 		.word	-536813552
 436 01b0 14E000E0 		.word	-536813548
 437 01b4 18E000E0 		.word	-536813544
 438              		.cfi_endproc
 439              	.LFE4:
 441              		.align	1
 442              		.global	delay_500ns
 443              		.syntax unified
 444              		.code	16
 445              		.thumb_func
 446              		.fpu softvfp
 448              	delay_500ns:
 449              	.LFB5:
 154:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 155:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void delay_500ns( void)	
 156:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 450              		.loc 1 156 0
 451              		.cfi_startproc
 452              		@ args = 0, pretend = 0, frame = 0
 453              		@ frame_needed = 1, uses_anonymous_args = 0
 454 01b8 80B5     		push	{r7, lr}
 455              		.cfi_def_cfa_offset 8
 456              		.cfi_offset 7, -8
 457              		.cfi_offset 14, -4
 458 01ba 00AF     		add	r7, sp, #0
 459              		.cfi_def_cfa_register 7
 157:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	/* SystemCoreClock = 168000000 */
 158:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*STK_CTRL = 0;					
 460              		.loc 1 158 0
 461 01bc 0C4B     		ldr	r3, .L19
 462 01be 0022     		movs	r2, #0
 463 01c0 1A60     		str	r2, [r3]
 159:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*STK_LOAD = ( (168/2) -1 );		
 464              		.loc 1 159 0
 465 01c2 0C4B     		ldr	r3, .L19+4
 466 01c4 5322     		movs	r2, #83
 467 01c6 1A60     		str	r2, [r3]
 160:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*STK_VAL = 0;					
 468              		.loc 1 160 0
 469 01c8 0B4B     		ldr	r3, .L19+8
 470 01ca 0022     		movs	r2, #0
 471 01cc 1A60     		str	r2, [r3]
 161:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*STK_CTRL = 5;					
 472              		.loc 1 161 0
 473 01ce 084B     		ldr	r3, .L19
 474 01d0 0522     		movs	r2, #5
 475 01d2 1A60     		str	r2, [r3]
 162:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	while( (*STK_CTRL & 0x10000 )== 0 );
 476              		.loc 1 162 0
 477 01d4 C046     		nop
 478              	.L18:
 479              		.loc 1 162 0 is_stmt 0 discriminator 1
 480 01d6 064B     		ldr	r3, .L19
 481 01d8 1A68     		ldr	r2, [r3]
 482 01da 8023     		movs	r3, #128
 483 01dc 5B02     		lsls	r3, r3, #9
 484 01de 1340     		ands	r3, r2
 485 01e0 F9D0     		beq	.L18
 163:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*STK_CTRL = 0;
 486              		.loc 1 163 0 is_stmt 1
 487 01e2 034B     		ldr	r3, .L19
 488 01e4 0022     		movs	r2, #0
 489 01e6 1A60     		str	r2, [r3]
 164:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 490              		.loc 1 164 0
 491 01e8 C046     		nop
 492 01ea BD46     		mov	sp, r7
 493              		@ sp needed
 494 01ec 80BD     		pop	{r7, pc}
 495              	.L20:
 496 01ee C046     		.align	2
 497              	.L19:
 498 01f0 10E000E0 		.word	-536813552
 499 01f4 14E000E0 		.word	-536813548
 500 01f8 18E000E0 		.word	-536813544
 501              		.cfi_endproc
 502              	.LFE5:
 504              		.global	__aeabi_uidiv
 505              		.align	1
 506              		.global	delay_micro
 507              		.syntax unified
 508              		.code	16
 509              		.thumb_func
 510              		.fpu softvfp
 512              	delay_micro:
 513              	.LFB6:
 165:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 166:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void delay_micro( unsigned int us )
 167:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 514              		.loc 1 167 0
 515              		.cfi_startproc
 516              		@ args = 0, pretend = 0, frame = 8
 517              		@ frame_needed = 1, uses_anonymous_args = 0
 518 01fc 80B5     		push	{r7, lr}
 519              		.cfi_def_cfa_offset 8
 520              		.cfi_offset 7, -8
 521              		.cfi_offset 14, -4
 522 01fe 82B0     		sub	sp, sp, #8
 523              		.cfi_def_cfa_offset 16
 524 0200 00AF     		add	r7, sp, #0
 525              		.cfi_def_cfa_register 7
 526 0202 7860     		str	r0, [r7, #4]
 168:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	#ifdef SIMULATOR
 169:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	us = us / 1000;
 527              		.loc 1 169 0
 528 0204 7A68     		ldr	r2, [r7, #4]
 529 0206 FA23     		movs	r3, #250
 530 0208 9900     		lsls	r1, r3, #2
 531 020a 1000     		movs	r0, r2
 532 020c FFF7FEFF 		bl	__aeabi_uidiv
 533              	.LVL0:
 534 0210 0300     		movs	r3, r0
 535 0212 7B60     		str	r3, [r7, #4]
 170:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	us++;
 536              		.loc 1 170 0
 537 0214 7B68     		ldr	r3, [r7, #4]
 538 0216 0133     		adds	r3, r3, #1
 539 0218 7B60     		str	r3, [r7, #4]
 171:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	#endif
 172:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 173:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	while (us>0)
 540              		.loc 1 173 0
 541 021a 0AE0     		b	.L22
 542              	.L23:
 174:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 175:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	delay_250ns();
 543              		.loc 1 175 0
 544 021c FFF7FEFF 		bl	delay_250ns
 176:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	delay_250ns();
 545              		.loc 1 176 0
 546 0220 FFF7FEFF 		bl	delay_250ns
 177:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	delay_250ns();
 547              		.loc 1 177 0
 548 0224 FFF7FEFF 		bl	delay_250ns
 178:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	delay_250ns();
 549              		.loc 1 178 0
 550 0228 FFF7FEFF 		bl	delay_250ns
 179:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	us--;
 551              		.loc 1 179 0
 552 022c 7B68     		ldr	r3, [r7, #4]
 553 022e 013B     		subs	r3, r3, #1
 554 0230 7B60     		str	r3, [r7, #4]
 555              	.L22:
 173:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 556              		.loc 1 173 0
 557 0232 7B68     		ldr	r3, [r7, #4]
 558 0234 002B     		cmp	r3, #0
 559 0236 F1D1     		bne	.L23
 180:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 181:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 560              		.loc 1 181 0
 561 0238 C046     		nop
 562 023a BD46     		mov	sp, r7
 563 023c 02B0     		add	sp, sp, #8
 564              		@ sp needed
 565 023e 80BD     		pop	{r7, pc}
 566              		.cfi_endproc
 567              	.LFE6:
 569              		.align	1
 570              		.global	delay_milli
 571              		.syntax unified
 572              		.code	16
 573              		.thumb_func
 574              		.fpu softvfp
 576              	delay_milli:
 577              	.LFB7:
 182:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 183:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void delay_milli(unsigned int ms) 
 184:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 578              		.loc 1 184 0
 579              		.cfi_startproc
 580              		@ args = 0, pretend = 0, frame = 8
 581              		@ frame_needed = 1, uses_anonymous_args = 0
 582 0240 80B5     		push	{r7, lr}
 583              		.cfi_def_cfa_offset 8
 584              		.cfi_offset 7, -8
 585              		.cfi_offset 14, -4
 586 0242 82B0     		sub	sp, sp, #8
 587              		.cfi_def_cfa_offset 16
 588 0244 00AF     		add	r7, sp, #0
 589              		.cfi_def_cfa_register 7
 590 0246 7860     		str	r0, [r7, #4]
 185:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	delay_micro(1000*ms);
 591              		.loc 1 185 0
 592 0248 7A68     		ldr	r2, [r7, #4]
 593 024a 1300     		movs	r3, r2
 594 024c 5B01     		lsls	r3, r3, #5
 595 024e 9B1A     		subs	r3, r3, r2
 596 0250 9B00     		lsls	r3, r3, #2
 597 0252 9B18     		adds	r3, r3, r2
 598 0254 DB00     		lsls	r3, r3, #3
 599 0256 1800     		movs	r0, r3
 600 0258 FFF7FEFF 		bl	delay_micro
 186:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 601              		.loc 1 186 0
 602 025c C046     		nop
 603 025e BD46     		mov	sp, r7
 604 0260 02B0     		add	sp, sp, #8
 605              		@ sp needed
 606 0262 80BD     		pop	{r7, pc}
 607              		.cfi_endproc
 608              	.LFE7:
 610              		.section	.start_section,"ax",%progbits
 611              		.align	1
 612              		.global	startup
 613              		.syntax unified
 614              		.code	16
 615              		.thumb_func
 616              		.fpu softvfp
 618              	startup:
 619              	.LFB8:
 187:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 188:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
 189:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 190:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void startup ( void )
 191:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 620              		.loc 1 191 0
 621              		.cfi_startproc
 622              		@ Naked Function: prologue and epilogue provided by programmer.
 623              		@ args = 0, pretend = 0, frame = 0
 624              		@ frame_needed = 1, uses_anonymous_args = 0
 192:C:/Users/becer/Documents/cintro2/autopong\startup.c **** __asm volatile(
 625              		.loc 1 192 0
 626              		.syntax divided
 627              	@ 192 "C:/Users/becer/Documents/cintro2/autopong/startup.c" 1
 628 0000 0248     		 LDR R0,=0x2001C000
 629 0002 8546     	 MOV SP,R0
 630 0004 FFF7FEFF 	 BL main
 631 0008 FEE7     	_exit: B .
 632              	
 633              	@ 0 "" 2
 193:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	" LDR R0,=0x2001C000\n"		// Set stack 
 194:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	" MOV SP,R0\n"
 195:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	" BL main\n"				// Call main 
 196:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	"_exit: B .\n"				// Never return 
 197:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	) ;
 198:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 634              		.loc 1 198 0
 635              		.thumb
 636              		.syntax unified
 637 000a C046     		nop
 638              		.cfi_endproc
 639              	.LFE8:
 641              		.text
 642              		.align	1
 643              		.global	graphic_ctrl_bit_set
 644              		.syntax unified
 645              		.code	16
 646              		.thumb_func
 647              		.fpu softvfp
 649              	graphic_ctrl_bit_set:
 650              	.LFB9:
 199:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 200:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void graphic_ctrl_bit_set (uint8_t x) 
 201:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 651              		.loc 1 201 0
 652              		.cfi_startproc
 653              		@ args = 0, pretend = 0, frame = 16
 654              		@ frame_needed = 1, uses_anonymous_args = 0
 655 0264 80B5     		push	{r7, lr}
 656              		.cfi_def_cfa_offset 8
 657              		.cfi_offset 7, -8
 658              		.cfi_offset 14, -4
 659 0266 84B0     		sub	sp, sp, #16
 660              		.cfi_def_cfa_offset 24
 661 0268 00AF     		add	r7, sp, #0
 662              		.cfi_def_cfa_register 7
 663 026a 0200     		movs	r2, r0
 664 026c FB1D     		adds	r3, r7, #7
 665 026e 1A70     		strb	r2, [r3]
 202:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	uint8_t c;
 203:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	c = *GPIO_ODR_LOW;
 666              		.loc 1 203 0
 667 0270 0C4A     		ldr	r2, .L27
 668 0272 0F21     		movs	r1, #15
 669 0274 7B18     		adds	r3, r7, r1
 670 0276 1278     		ldrb	r2, [r2]
 671 0278 1A70     		strb	r2, [r3]
 204:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	c |= (~B_SELECT & x);
 672              		.loc 1 204 0
 673 027a FB1D     		adds	r3, r7, #7
 674 027c 1B78     		ldrb	r3, [r3]
 675 027e 5BB2     		sxtb	r3, r3
 676 0280 0422     		movs	r2, #4
 677 0282 9343     		bics	r3, r2
 678 0284 5AB2     		sxtb	r2, r3
 679 0286 7B18     		adds	r3, r7, r1
 680 0288 1B78     		ldrb	r3, [r3]
 681 028a 5BB2     		sxtb	r3, r3
 682 028c 1343     		orrs	r3, r2
 683 028e 5AB2     		sxtb	r2, r3
 684 0290 7B18     		adds	r3, r7, r1
 685 0292 1A70     		strb	r2, [r3]
 205:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*GPIO_ODR_LOW = c;
 686              		.loc 1 205 0
 687 0294 034A     		ldr	r2, .L27
 688 0296 7B18     		adds	r3, r7, r1
 689 0298 1B78     		ldrb	r3, [r3]
 690 029a 1370     		strb	r3, [r2]
 206:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 691              		.loc 1 206 0
 692 029c C046     		nop
 693 029e BD46     		mov	sp, r7
 694 02a0 04B0     		add	sp, sp, #16
 695              		@ sp needed
 696 02a2 80BD     		pop	{r7, pc}
 697              	.L28:
 698              		.align	2
 699              	.L27:
 700 02a4 14100240 		.word	1073877012
 701              		.cfi_endproc
 702              	.LFE9:
 704              		.align	1
 705              		.global	graphic_ctrl_bit_clear
 706              		.syntax unified
 707              		.code	16
 708              		.thumb_func
 709              		.fpu softvfp
 711              	graphic_ctrl_bit_clear:
 712              	.LFB10:
 207:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 208:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void graphic_ctrl_bit_clear( uint8_t x )
 209:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 713              		.loc 1 209 0
 714              		.cfi_startproc
 715              		@ args = 0, pretend = 0, frame = 16
 716              		@ frame_needed = 1, uses_anonymous_args = 0
 717 02a8 80B5     		push	{r7, lr}
 718              		.cfi_def_cfa_offset 8
 719              		.cfi_offset 7, -8
 720              		.cfi_offset 14, -4
 721 02aa 84B0     		sub	sp, sp, #16
 722              		.cfi_def_cfa_offset 24
 723 02ac 00AF     		add	r7, sp, #0
 724              		.cfi_def_cfa_register 7
 725 02ae 0200     		movs	r2, r0
 726 02b0 FB1D     		adds	r3, r7, #7
 727 02b2 1A70     		strb	r2, [r3]
 210:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	uint8_t c;
 211:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	c = *GPIO_ODR_LOW;
 728              		.loc 1 211 0
 729 02b4 0E4A     		ldr	r2, .L30
 730 02b6 0F21     		movs	r1, #15
 731 02b8 7B18     		adds	r3, r7, r1
 732 02ba 1278     		ldrb	r2, [r2]
 733 02bc 1A70     		strb	r2, [r3]
 212:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	c = ~B_SELECT & ( c & ~x);
 734              		.loc 1 212 0
 735 02be FB1D     		adds	r3, r7, #7
 736 02c0 1B78     		ldrb	r3, [r3]
 737 02c2 5BB2     		sxtb	r3, r3
 738 02c4 DB43     		mvns	r3, r3
 739 02c6 5BB2     		sxtb	r3, r3
 740 02c8 7A18     		adds	r2, r7, r1
 741 02ca 1278     		ldrb	r2, [r2]
 742 02cc 52B2     		sxtb	r2, r2
 743 02ce 1340     		ands	r3, r2
 744 02d0 5BB2     		sxtb	r3, r3
 745 02d2 DAB2     		uxtb	r2, r3
 746 02d4 0800     		movs	r0, r1
 747 02d6 7B18     		adds	r3, r7, r1
 748 02d8 0421     		movs	r1, #4
 749 02da 8A43     		bics	r2, r1
 750 02dc 1A70     		strb	r2, [r3]
 213:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*GPIO_ODR_LOW = c;
 751              		.loc 1 213 0
 752 02de 044A     		ldr	r2, .L30
 753 02e0 0100     		movs	r1, r0
 754 02e2 7B18     		adds	r3, r7, r1
 755 02e4 1B78     		ldrb	r3, [r3]
 756 02e6 1370     		strb	r3, [r2]
 214:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 757              		.loc 1 214 0
 758 02e8 C046     		nop
 759 02ea BD46     		mov	sp, r7
 760 02ec 04B0     		add	sp, sp, #16
 761              		@ sp needed
 762 02ee 80BD     		pop	{r7, pc}
 763              	.L31:
 764              		.align	2
 765              	.L30:
 766 02f0 14100240 		.word	1073877012
 767              		.cfi_endproc
 768              	.LFE10:
 770              		.align	1
 771              		.global	select_controller
 772              		.syntax unified
 773              		.code	16
 774              		.thumb_func
 775              		.fpu softvfp
 777              	select_controller:
 778              	.LFB11:
 215:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 216:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void select_controller (uint8_t controller)		
 217:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 779              		.loc 1 217 0
 780              		.cfi_startproc
 781              		@ args = 0, pretend = 0, frame = 8
 782              		@ frame_needed = 1, uses_anonymous_args = 0
 783 02f4 80B5     		push	{r7, lr}
 784              		.cfi_def_cfa_offset 8
 785              		.cfi_offset 7, -8
 786              		.cfi_offset 14, -4
 787 02f6 82B0     		sub	sp, sp, #8
 788              		.cfi_def_cfa_offset 16
 789 02f8 00AF     		add	r7, sp, #0
 790              		.cfi_def_cfa_register 7
 791 02fa 0200     		movs	r2, r0
 792 02fc FB1D     		adds	r3, r7, #7
 793 02fe 1A70     		strb	r2, [r3]
 218:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	switch (controller){
 794              		.loc 1 218 0
 795 0300 FB1D     		adds	r3, r7, #7
 796 0302 1B78     		ldrb	r3, [r3]
 797 0304 082B     		cmp	r3, #8
 798 0306 0CD0     		beq	.L34
 799 0308 02DC     		bgt	.L35
 800 030a 002B     		cmp	r3, #0
 801 030c 05D0     		beq	.L36
 219:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		case 0: 
 220:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_ctrl_bit_clear (B_CS1 | B_CS2); 
 221:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		break;
 222:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		
 223:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		case B_CS1: 
 224:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_ctrl_bit_set(B_CS1); 
 225:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 226:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		break;
 227:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		
 228:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		case B_CS2:
 229:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
 230:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 231:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		break;
 232:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		
 233:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		case B_CS1 | B_CS2:
 234:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_ctrl_bit_set(B_CS1 | B_CS2);
 235:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		break;
 236:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 237:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	 
 238:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 802              		.loc 1 238 0
 803 030e 1AE0     		b	.L39
 804              	.L35:
 218:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	switch (controller){
 805              		.loc 1 218 0
 806 0310 102B     		cmp	r3, #16
 807 0312 0DD0     		beq	.L37
 808 0314 182B     		cmp	r3, #24
 809 0316 12D0     		beq	.L38
 810              		.loc 1 238 0
 811 0318 15E0     		b	.L39
 812              	.L36:
 220:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		break;
 813              		.loc 1 220 0
 814 031a 1820     		movs	r0, #24
 815 031c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 221:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		
 816              		.loc 1 221 0
 817 0320 11E0     		b	.L33
 818              	.L34:
 224:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 819              		.loc 1 224 0
 820 0322 0820     		movs	r0, #8
 821 0324 FFF7FEFF 		bl	graphic_ctrl_bit_set
 225:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		break;
 822              		.loc 1 225 0
 823 0328 1020     		movs	r0, #16
 824 032a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 226:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		
 825              		.loc 1 226 0
 826 032e 0AE0     		b	.L33
 827              	.L37:
 229:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 828              		.loc 1 229 0
 829 0330 0820     		movs	r0, #8
 830 0332 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 230:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		break;
 831              		.loc 1 230 0
 832 0336 1020     		movs	r0, #16
 833 0338 FFF7FEFF 		bl	graphic_ctrl_bit_set
 231:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		
 834              		.loc 1 231 0
 835 033c 03E0     		b	.L33
 836              	.L38:
 234:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		break;
 837              		.loc 1 234 0
 838 033e 1820     		movs	r0, #24
 839 0340 FFF7FEFF 		bl	graphic_ctrl_bit_set
 235:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 840              		.loc 1 235 0
 841 0344 C046     		nop
 842              	.L33:
 843              	.L39:
 844              		.loc 1 238 0
 845 0346 C046     		nop
 846 0348 BD46     		mov	sp, r7
 847 034a 02B0     		add	sp, sp, #8
 848              		@ sp needed
 849 034c 80BD     		pop	{r7, pc}
 850              		.cfi_endproc
 851              	.LFE11:
 853              		.align	1
 854              		.syntax unified
 855              		.code	16
 856              		.thumb_func
 857              		.fpu softvfp
 859              	graphic_wait_ready:
 860              	.LFB12:
 239:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 240:C:/Users/becer/Documents/cintro2/autopong\startup.c **** static void graphic_wait_ready (void)			
 241:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 861              		.loc 1 241 0
 862              		.cfi_startproc
 863              		@ args = 0, pretend = 0, frame = 8
 864              		@ frame_needed = 1, uses_anonymous_args = 0
 865 034e 80B5     		push	{r7, lr}
 866              		.cfi_def_cfa_offset 8
 867              		.cfi_offset 7, -8
 868              		.cfi_offset 14, -4
 869 0350 82B0     		sub	sp, sp, #8
 870              		.cfi_def_cfa_offset 16
 871 0352 00AF     		add	r7, sp, #0
 872              		.cfi_def_cfa_register 7
 242:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	uint8_t c;
 243:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 873              		.loc 1 243 0
 874 0354 4020     		movs	r0, #64
 875 0356 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 244:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*portModer = 0x00005555;			//15-8 Input 7-0 Output
 876              		.loc 1 244 0
 877 035a 144B     		ldr	r3, .L46
 878 035c 144A     		ldr	r2, .L46+4
 879 035e 1A60     		str	r2, [r3]
 245:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 880              		.loc 1 245 0
 881 0360 0120     		movs	r0, #1
 882 0362 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 246:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RW);
 883              		.loc 1 246 0
 884 0366 0220     		movs	r0, #2
 885 0368 FFF7FEFF 		bl	graphic_ctrl_bit_set
 247:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	delay_500ns();
 886              		.loc 1 247 0
 887 036c FFF7FEFF 		bl	delay_500ns
 888              	.L43:
 248:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	while(1)
 249:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 250:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		if (c == 0) break;
 889              		.loc 1 250 0
 890 0370 FB1D     		adds	r3, r7, #7
 891 0372 1B78     		ldrb	r3, [r3]
 892 0374 002B     		cmp	r3, #0
 893 0376 11D0     		beq	.L45
 251:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_ctrl_bit_set(B_E);
 894              		.loc 1 251 0
 895 0378 4020     		movs	r0, #64
 896 037a FFF7FEFF 		bl	graphic_ctrl_bit_set
 252:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		delay_500ns();
 897              		.loc 1 252 0
 898 037e FFF7FEFF 		bl	delay_500ns
 253:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		c = *GPIO_IDR_HIGH & LCD_BUSY;
 899              		.loc 1 253 0
 900 0382 0C4B     		ldr	r3, .L46+8
 901 0384 1B78     		ldrb	r3, [r3]
 902 0386 DAB2     		uxtb	r2, r3
 903 0388 FB1D     		adds	r3, r7, #7
 904 038a 7F21     		movs	r1, #127
 905 038c 8A43     		bics	r2, r1
 906 038e 1A70     		strb	r2, [r3]
 254:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_ctrl_bit_clear(B_E);
 907              		.loc 1 254 0
 908 0390 4020     		movs	r0, #64
 909 0392 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 255:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		delay_500ns();
 910              		.loc 1 255 0
 911 0396 FFF7FEFF 		bl	delay_500ns
 250:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_ctrl_bit_set(B_E);
 912              		.loc 1 250 0
 913 039a E9E7     		b	.L43
 914              	.L45:
 915 039c C046     		nop
 256:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 257:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 258:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*portModer = 0x55555555;			//15-0 Outputs
 916              		.loc 1 258 0
 917 039e 034B     		ldr	r3, .L46
 918 03a0 054A     		ldr	r2, .L46+12
 919 03a2 1A60     		str	r2, [r3]
 259:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 920              		.loc 1 259 0
 921 03a4 C046     		nop
 922 03a6 BD46     		mov	sp, r7
 923 03a8 02B0     		add	sp, sp, #8
 924              		@ sp needed
 925 03aa 80BD     		pop	{r7, pc}
 926              	.L47:
 927              		.align	2
 928              	.L46:
 929 03ac 00100240 		.word	1073876992
 930 03b0 55550000 		.word	21845
 931 03b4 11100240 		.word	1073877009
 932 03b8 55555555 		.word	1431655765
 933              		.cfi_endproc
 934              	.LFE12:
 936              		.align	1
 937              		.syntax unified
 938              		.code	16
 939              		.thumb_func
 940              		.fpu softvfp
 942              	graphic_read:
 943              	.LFB13:
 260:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 261:C:/Users/becer/Documents/cintro2/autopong\startup.c **** static uint8_t graphic_read(uint8_t controller)	
 262:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 944              		.loc 1 262 0
 945              		.cfi_startproc
 946              		@ args = 0, pretend = 0, frame = 16
 947              		@ frame_needed = 1, uses_anonymous_args = 0
 948 03bc 80B5     		push	{r7, lr}
 949              		.cfi_def_cfa_offset 8
 950              		.cfi_offset 7, -8
 951              		.cfi_offset 14, -4
 952 03be 84B0     		sub	sp, sp, #16
 953              		.cfi_def_cfa_offset 24
 954 03c0 00AF     		add	r7, sp, #0
 955              		.cfi_def_cfa_register 7
 956 03c2 0200     		movs	r2, r0
 957 03c4 FB1D     		adds	r3, r7, #7
 958 03c6 1A70     		strb	r2, [r3]
 263:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	uint8_t rv;
 264:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 959              		.loc 1 264 0
 960 03c8 4020     		movs	r0, #64
 961 03ca FFF7FEFF 		bl	graphic_ctrl_bit_clear
 265:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*portModer = 0x00005555;					//15-8 Input, 7-0 Output
 962              		.loc 1 265 0
 963 03ce 184B     		ldr	r3, .L52
 964 03d0 184A     		ldr	r2, .L52+4
 965 03d2 1A60     		str	r2, [r3]
 266:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RS | B_RW);
 966              		.loc 1 266 0
 967 03d4 0320     		movs	r0, #3
 968 03d6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 267:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	select_controller(controller);
 969              		.loc 1 267 0
 970 03da FB1D     		adds	r3, r7, #7
 971 03dc 1B78     		ldrb	r3, [r3]
 972 03de 1800     		movs	r0, r3
 973 03e0 FFF7FEFF 		bl	select_controller
 268:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	delay_500ns;
 269:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 974              		.loc 1 269 0
 975 03e4 4020     		movs	r0, #64
 976 03e6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 270:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	delay_500ns;
 271:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	rv = *GPIO_IDR_HIGH;
 977              		.loc 1 271 0
 978 03ea 134A     		ldr	r2, .L52+8
 979 03ec 0F23     		movs	r3, #15
 980 03ee FB18     		adds	r3, r7, r3
 981 03f0 1278     		ldrb	r2, [r2]
 982 03f2 1A70     		strb	r2, [r3]
 272:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 983              		.loc 1 272 0
 984 03f4 4020     		movs	r0, #64
 985 03f6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 273:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*portModer = 0x55555555;
 986              		.loc 1 273 0
 987 03fa 0D4B     		ldr	r3, .L52
 988 03fc 0F4A     		ldr	r2, .L52+12
 989 03fe 1A60     		str	r2, [r3]
 274:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	if ( controller & B_CS1)
 990              		.loc 1 274 0
 991 0400 FB1D     		adds	r3, r7, #7
 992 0402 1B78     		ldrb	r3, [r3]
 993 0404 0822     		movs	r2, #8
 994 0406 1340     		ands	r3, r2
 995 0408 02D0     		beq	.L49
 275:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 276:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		select_controller(B_CS1);
 996              		.loc 1 276 0
 997 040a 0820     		movs	r0, #8
 998 040c FFF7FEFF 		bl	select_controller
 999              	.L49:
 277:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_wait_ready;
 278:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 279:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	if ( controller & B_CS2)
 1000              		.loc 1 279 0
 1001 0410 FB1D     		adds	r3, r7, #7
 1002 0412 1B78     		ldrb	r3, [r3]
 1003 0414 1022     		movs	r2, #16
 1004 0416 1340     		ands	r3, r2
 1005 0418 02D0     		beq	.L50
 280:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 281:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		select_controller(B_CS2);
 1006              		.loc 1 281 0
 1007 041a 1020     		movs	r0, #16
 1008 041c FFF7FEFF 		bl	select_controller
 1009              	.L50:
 282:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_wait_ready;
 283:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 284:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	return rv;
 1010              		.loc 1 284 0
 1011 0420 0F23     		movs	r3, #15
 1012 0422 FB18     		adds	r3, r7, r3
 1013 0424 1B78     		ldrb	r3, [r3]
 285:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 1014              		.loc 1 285 0
 1015 0426 1800     		movs	r0, r3
 1016 0428 BD46     		mov	sp, r7
 1017 042a 04B0     		add	sp, sp, #16
 1018              		@ sp needed
 1019 042c 80BD     		pop	{r7, pc}
 1020              	.L53:
 1021 042e C046     		.align	2
 1022              	.L52:
 1023 0430 00100240 		.word	1073876992
 1024 0434 55550000 		.word	21845
 1025 0438 11100240 		.word	1073877009
 1026 043c 55555555 		.word	1431655765
 1027              		.cfi_endproc
 1028              	.LFE13:
 1030              		.align	1
 1031              		.syntax unified
 1032              		.code	16
 1033              		.thumb_func
 1034              		.fpu softvfp
 1036              	graphic_read_data:
 1037              	.LFB14:
 286:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 287:C:/Users/becer/Documents/cintro2/autopong\startup.c **** static uint8_t graphic_read_data(uint8_t controller)
 288:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 1038              		.loc 1 288 0
 1039              		.cfi_startproc
 1040              		@ args = 0, pretend = 0, frame = 8
 1041              		@ frame_needed = 1, uses_anonymous_args = 0
 1042 0440 80B5     		push	{r7, lr}
 1043              		.cfi_def_cfa_offset 8
 1044              		.cfi_offset 7, -8
 1045              		.cfi_offset 14, -4
 1046 0442 82B0     		sub	sp, sp, #8
 1047              		.cfi_def_cfa_offset 16
 1048 0444 00AF     		add	r7, sp, #0
 1049              		.cfi_def_cfa_register 7
 1050 0446 0200     		movs	r2, r0
 1051 0448 FB1D     		adds	r3, r7, #7
 1052 044a 1A70     		strb	r2, [r3]
 289:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_read(controller);
 1053              		.loc 1 289 0
 1054 044c FB1D     		adds	r3, r7, #7
 1055 044e 1B78     		ldrb	r3, [r3]
 1056 0450 1800     		movs	r0, r3
 1057 0452 FFF7B3FF 		bl	graphic_read
 290:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	return graphic_read(controller);
 1058              		.loc 1 290 0
 1059 0456 FB1D     		adds	r3, r7, #7
 1060 0458 1B78     		ldrb	r3, [r3]
 1061 045a 1800     		movs	r0, r3
 1062 045c FFF7AEFF 		bl	graphic_read
 1063 0460 0300     		movs	r3, r0
 291:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 1064              		.loc 1 291 0
 1065 0462 1800     		movs	r0, r3
 1066 0464 BD46     		mov	sp, r7
 1067 0466 02B0     		add	sp, sp, #8
 1068              		@ sp needed
 1069 0468 80BD     		pop	{r7, pc}
 1070              		.cfi_endproc
 1071              	.LFE14:
 1073              		.align	1
 1074              		.syntax unified
 1075              		.code	16
 1076              		.thumb_func
 1077              		.fpu softvfp
 1079              	graphic_write:
 1080              	.LFB15:
 292:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 293:C:/Users/becer/Documents/cintro2/autopong\startup.c **** static void graphic_write (uint8_t value, uint8_t controller)
 294:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 1081              		.loc 1 294 0
 1082              		.cfi_startproc
 1083              		@ args = 0, pretend = 0, frame = 8
 1084              		@ frame_needed = 1, uses_anonymous_args = 0
 1085 046a 80B5     		push	{r7, lr}
 1086              		.cfi_def_cfa_offset 8
 1087              		.cfi_offset 7, -8
 1088              		.cfi_offset 14, -4
 1089 046c 82B0     		sub	sp, sp, #8
 1090              		.cfi_def_cfa_offset 16
 1091 046e 00AF     		add	r7, sp, #0
 1092              		.cfi_def_cfa_register 7
 1093 0470 0200     		movs	r2, r0
 1094 0472 FB1D     		adds	r3, r7, #7
 1095 0474 1A70     		strb	r2, [r3]
 1096 0476 BB1D     		adds	r3, r7, #6
 1097 0478 0A1C     		adds	r2, r1, #0
 1098 047a 1A70     		strb	r2, [r3]
 295:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*GPIO_ODR_HIGH = value;
 1099              		.loc 1 295 0
 1100 047c 154A     		ldr	r2, .L59
 1101 047e FB1D     		adds	r3, r7, #7
 1102 0480 1B78     		ldrb	r3, [r3]
 1103 0482 1370     		strb	r3, [r2]
 296:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	select_controller(controller);
 1104              		.loc 1 296 0
 1105 0484 BB1D     		adds	r3, r7, #6
 1106 0486 1B78     		ldrb	r3, [r3]
 1107 0488 1800     		movs	r0, r3
 1108 048a FFF7FEFF 		bl	select_controller
 297:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	delay_500ns;
 298:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 1109              		.loc 1 298 0
 1110 048e 4020     		movs	r0, #64
 1111 0490 FFF7FEFF 		bl	graphic_ctrl_bit_set
 299:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	delay_500ns;
 300:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 1112              		.loc 1 300 0
 1113 0494 4020     		movs	r0, #64
 1114 0496 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 301:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 302:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	if (controller & B_CS1)
 1115              		.loc 1 302 0
 1116 049a BB1D     		adds	r3, r7, #6
 1117 049c 1B78     		ldrb	r3, [r3]
 1118 049e 0822     		movs	r2, #8
 1119 04a0 1340     		ands	r3, r2
 1120 04a2 02D0     		beq	.L57
 303:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 304:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		select_controller(B_CS1);
 1121              		.loc 1 304 0
 1122 04a4 0820     		movs	r0, #8
 1123 04a6 FFF7FEFF 		bl	select_controller
 1124              	.L57:
 305:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_wait_ready;
 306:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 307:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	if (controller & B_CS2)
 1125              		.loc 1 307 0
 1126 04aa BB1D     		adds	r3, r7, #6
 1127 04ac 1B78     		ldrb	r3, [r3]
 1128 04ae 1022     		movs	r2, #16
 1129 04b0 1340     		ands	r3, r2
 1130 04b2 02D0     		beq	.L58
 308:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 309:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		select_controller(B_CS2);
 1131              		.loc 1 309 0
 1132 04b4 1020     		movs	r0, #16
 1133 04b6 FFF7FEFF 		bl	select_controller
 1134              	.L58:
 310:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_wait_ready;
 311:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 312:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 313:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*GPIO_ODR_HIGH = 0;
 1135              		.loc 1 313 0
 1136 04ba 064B     		ldr	r3, .L59
 1137 04bc 0022     		movs	r2, #0
 1138 04be 1A70     		strb	r2, [r3]
 314:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 1139              		.loc 1 314 0
 1140 04c0 4020     		movs	r0, #64
 1141 04c2 FFF7FEFF 		bl	graphic_ctrl_bit_set
 315:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	select_controller(0);
 1142              		.loc 1 315 0
 1143 04c6 0020     		movs	r0, #0
 1144 04c8 FFF7FEFF 		bl	select_controller
 316:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 1145              		.loc 1 316 0
 1146 04cc C046     		nop
 1147 04ce BD46     		mov	sp, r7
 1148 04d0 02B0     		add	sp, sp, #8
 1149              		@ sp needed
 1150 04d2 80BD     		pop	{r7, pc}
 1151              	.L60:
 1152              		.align	2
 1153              	.L59:
 1154 04d4 15100240 		.word	1073877013
 1155              		.cfi_endproc
 1156              	.LFE15:
 1158              		.align	1
 1159              		.syntax unified
 1160              		.code	16
 1161              		.thumb_func
 1162              		.fpu softvfp
 1164              	graphic_write_command:
 1165              	.LFB16:
 317:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 318:C:/Users/becer/Documents/cintro2/autopong\startup.c **** static void graphic_write_command(uint8_t command, uint8_t controller)
 319:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 1166              		.loc 1 319 0
 1167              		.cfi_startproc
 1168              		@ args = 0, pretend = 0, frame = 8
 1169              		@ frame_needed = 1, uses_anonymous_args = 0
 1170 04d8 80B5     		push	{r7, lr}
 1171              		.cfi_def_cfa_offset 8
 1172              		.cfi_offset 7, -8
 1173              		.cfi_offset 14, -4
 1174 04da 82B0     		sub	sp, sp, #8
 1175              		.cfi_def_cfa_offset 16
 1176 04dc 00AF     		add	r7, sp, #0
 1177              		.cfi_def_cfa_register 7
 1178 04de 0200     		movs	r2, r0
 1179 04e0 FB1D     		adds	r3, r7, #7
 1180 04e2 1A70     		strb	r2, [r3]
 1181 04e4 BB1D     		adds	r3, r7, #6
 1182 04e6 0A1C     		adds	r2, r1, #0
 1183 04e8 1A70     		strb	r2, [r3]
 320:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 1184              		.loc 1 320 0
 1185 04ea 4020     		movs	r0, #64
 1186 04ec FFF7FEFF 		bl	graphic_ctrl_bit_clear
 321:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	select_controller(controller);
 1187              		.loc 1 321 0
 1188 04f0 BB1D     		adds	r3, r7, #6
 1189 04f2 1B78     		ldrb	r3, [r3]
 1190 04f4 1800     		movs	r0, r3
 1191 04f6 FFF7FEFF 		bl	select_controller
 322:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_RS | B_RW);
 1192              		.loc 1 322 0
 1193 04fa 0320     		movs	r0, #3
 1194 04fc FFF7FEFF 		bl	graphic_ctrl_bit_clear
 323:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_write(command, controller);
 1195              		.loc 1 323 0
 1196 0500 BB1D     		adds	r3, r7, #6
 1197 0502 1A78     		ldrb	r2, [r3]
 1198 0504 FB1D     		adds	r3, r7, #7
 1199 0506 1B78     		ldrb	r3, [r3]
 1200 0508 1100     		movs	r1, r2
 1201 050a 1800     		movs	r0, r3
 1202 050c FFF7ADFF 		bl	graphic_write
 324:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 1203              		.loc 1 324 0
 1204 0510 C046     		nop
 1205 0512 BD46     		mov	sp, r7
 1206 0514 02B0     		add	sp, sp, #8
 1207              		@ sp needed
 1208 0516 80BD     		pop	{r7, pc}
 1209              		.cfi_endproc
 1210              	.LFE16:
 1212              		.align	1
 1213              		.syntax unified
 1214              		.code	16
 1215              		.thumb_func
 1216              		.fpu softvfp
 1218              	graphic_write_data:
 1219              	.LFB17:
 325:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 326:C:/Users/becer/Documents/cintro2/autopong\startup.c **** static void graphic_write_data(uint8_t data, uint8_t controller)
 327:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 1220              		.loc 1 327 0
 1221              		.cfi_startproc
 1222              		@ args = 0, pretend = 0, frame = 8
 1223              		@ frame_needed = 1, uses_anonymous_args = 0
 1224 0518 80B5     		push	{r7, lr}
 1225              		.cfi_def_cfa_offset 8
 1226              		.cfi_offset 7, -8
 1227              		.cfi_offset 14, -4
 1228 051a 82B0     		sub	sp, sp, #8
 1229              		.cfi_def_cfa_offset 16
 1230 051c 00AF     		add	r7, sp, #0
 1231              		.cfi_def_cfa_register 7
 1232 051e 0200     		movs	r2, r0
 1233 0520 FB1D     		adds	r3, r7, #7
 1234 0522 1A70     		strb	r2, [r3]
 1235 0524 BB1D     		adds	r3, r7, #6
 1236 0526 0A1C     		adds	r2, r1, #0
 1237 0528 1A70     		strb	r2, [r3]
 328:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 1238              		.loc 1 328 0
 1239 052a 4020     		movs	r0, #64
 1240 052c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 329:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	select_controller(controller);
 1241              		.loc 1 329 0
 1242 0530 BB1D     		adds	r3, r7, #6
 1243 0532 1B78     		ldrb	r3, [r3]
 1244 0534 1800     		movs	r0, r3
 1245 0536 FFF7FEFF 		bl	select_controller
 330:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 1246              		.loc 1 330 0
 1247 053a 0120     		movs	r0, #1
 1248 053c FFF7FEFF 		bl	graphic_ctrl_bit_set
 331:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 1249              		.loc 1 331 0
 1250 0540 0220     		movs	r0, #2
 1251 0542 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 332:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_write(data, controller);
 1252              		.loc 1 332 0
 1253 0546 BB1D     		adds	r3, r7, #6
 1254 0548 1A78     		ldrb	r2, [r3]
 1255 054a FB1D     		adds	r3, r7, #7
 1256 054c 1B78     		ldrb	r3, [r3]
 1257 054e 1100     		movs	r1, r2
 1258 0550 1800     		movs	r0, r3
 1259 0552 FFF78AFF 		bl	graphic_write
 333:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 1260              		.loc 1 333 0
 1261 0556 C046     		nop
 1262 0558 BD46     		mov	sp, r7
 1263 055a 02B0     		add	sp, sp, #8
 1264              		@ sp needed
 1265 055c 80BD     		pop	{r7, pc}
 1266              		.cfi_endproc
 1267              	.LFE17:
 1269              		.align	1
 1270              		.global	graphic_clear_screen
 1271              		.syntax unified
 1272              		.code	16
 1273              		.thumb_func
 1274              		.fpu softvfp
 1276              	graphic_clear_screen:
 1277              	.LFB18:
 334:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 335:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void graphic_clear_screen(void) 
 336:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 1278              		.loc 1 336 0
 1279              		.cfi_startproc
 1280              		@ args = 0, pretend = 0, frame = 8
 1281              		@ frame_needed = 1, uses_anonymous_args = 0
 1282 055e 80B5     		push	{r7, lr}
 1283              		.cfi_def_cfa_offset 8
 1284              		.cfi_offset 7, -8
 1285              		.cfi_offset 14, -4
 1286 0560 82B0     		sub	sp, sp, #8
 1287              		.cfi_def_cfa_offset 16
 1288 0562 00AF     		add	r7, sp, #0
 1289              		.cfi_def_cfa_register 7
 1290              	.LBB6:
 337:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	for (char page = 0; page < 8; page++)
 1291              		.loc 1 337 0
 1292 0564 FB1D     		adds	r3, r7, #7
 1293 0566 0022     		movs	r2, #0
 1294 0568 1A70     		strb	r2, [r3]
 1295 056a 23E0     		b	.L64
 1296              	.L67:
 338:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 339:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_write_command(LCD_SET_PAGE | page	, B_CS1|B_CS2);
 1297              		.loc 1 339 0
 1298 056c FB1D     		adds	r3, r7, #7
 1299 056e 1B78     		ldrb	r3, [r3]
 1300 0570 4822     		movs	r2, #72
 1301 0572 5242     		rsbs	r2, r2, #0
 1302 0574 1343     		orrs	r3, r2
 1303 0576 DBB2     		uxtb	r3, r3
 1304 0578 1821     		movs	r1, #24
 1305 057a 1800     		movs	r0, r3
 1306 057c FFF7ACFF 		bl	graphic_write_command
 340:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		graphic_write_command(LCD_SET_ADD  | 0	, B_CS1|B_CS2);
 1307              		.loc 1 340 0
 1308 0580 1821     		movs	r1, #24
 1309 0582 4020     		movs	r0, #64
 1310 0584 FFF7A8FF 		bl	graphic_write_command
 1311              	.LBB7:
 341:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		
 342:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		for (char add = 0; add < 64; add++)
 1312              		.loc 1 342 0
 1313 0588 BB1D     		adds	r3, r7, #6
 1314 058a 0022     		movs	r2, #0
 1315 058c 1A70     		strb	r2, [r3]
 1316 058e 08E0     		b	.L65
 1317              	.L66:
 343:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		{
 344:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 			graphic_write_data(0, B_CS1 | B_CS2);
 1318              		.loc 1 344 0 discriminator 3
 1319 0590 1821     		movs	r1, #24
 1320 0592 0020     		movs	r0, #0
 1321 0594 FFF7C0FF 		bl	graphic_write_data
 342:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		{
 1322              		.loc 1 342 0 discriminator 3
 1323 0598 BB1D     		adds	r3, r7, #6
 1324 059a 1A78     		ldrb	r2, [r3]
 1325 059c BB1D     		adds	r3, r7, #6
 1326 059e 0132     		adds	r2, r2, #1
 1327 05a0 1A70     		strb	r2, [r3]
 1328              	.L65:
 342:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		{
 1329              		.loc 1 342 0 is_stmt 0 discriminator 1
 1330 05a2 BB1D     		adds	r3, r7, #6
 1331 05a4 1B78     		ldrb	r3, [r3]
 1332 05a6 3F2B     		cmp	r3, #63
 1333 05a8 F2D9     		bls	.L66
 1334              	.LBE7:
 337:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 1335              		.loc 1 337 0 is_stmt 1 discriminator 2
 1336 05aa FB1D     		adds	r3, r7, #7
 1337 05ac 1A78     		ldrb	r2, [r3]
 1338 05ae FB1D     		adds	r3, r7, #7
 1339 05b0 0132     		adds	r2, r2, #1
 1340 05b2 1A70     		strb	r2, [r3]
 1341              	.L64:
 337:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 1342              		.loc 1 337 0 is_stmt 0 discriminator 1
 1343 05b4 FB1D     		adds	r3, r7, #7
 1344 05b6 1B78     		ldrb	r3, [r3]
 1345 05b8 072B     		cmp	r3, #7
 1346 05ba D7D9     		bls	.L67
 1347              	.LBE6:
 345:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		}
 346:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 347:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 1348              		.loc 1 347 0 is_stmt 1
 1349 05bc C046     		nop
 1350 05be BD46     		mov	sp, r7
 1351 05c0 02B0     		add	sp, sp, #8
 1352              		@ sp needed
 1353 05c2 80BD     		pop	{r7, pc}
 1354              		.cfi_endproc
 1355              	.LFE18:
 1357              		.align	1
 1358              		.global	graphic_initialize
 1359              		.syntax unified
 1360              		.code	16
 1361              		.thumb_func
 1362              		.fpu softvfp
 1364              	graphic_initialize:
 1365              	.LFB19:
 348:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 349:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void graphic_initialize (void)					//PDF
 350:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 1366              		.loc 1 350 0
 1367              		.cfi_startproc
 1368              		@ args = 0, pretend = 0, frame = 0
 1369              		@ frame_needed = 1, uses_anonymous_args = 0
 1370 05c4 80B5     		push	{r7, lr}
 1371              		.cfi_def_cfa_offset 8
 1372              		.cfi_offset 7, -8
 1373              		.cfi_offset 14, -4
 1374 05c6 00AF     		add	r7, sp, #0
 1375              		.cfi_def_cfa_register 7
 351:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		
 352:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 1376              		.loc 1 352 0
 1377 05c8 4020     		movs	r0, #64
 1378 05ca FFF7FEFF 		bl	graphic_ctrl_bit_set
 353:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	delay_micro(10);
 1379              		.loc 1 353 0
 1380 05ce 0A20     		movs	r0, #10
 1381 05d0 FFF7FEFF 		bl	delay_micro
 354:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RESET | B_E);
 1382              		.loc 1 354 0
 1383 05d4 7820     		movs	r0, #120
 1384 05d6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 355:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	delay_milli(30);
 1385              		.loc 1 355 0
 1386 05da 1E20     		movs	r0, #30
 1387 05dc FFF7FEFF 		bl	delay_milli
 356:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RESET);
 1388              		.loc 1 356 0
 1389 05e0 2020     		movs	r0, #32
 1390 05e2 FFF7FEFF 		bl	graphic_ctrl_bit_set
 357:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	delay_milli(100);
 1391              		.loc 1 357 0
 1392 05e6 6420     		movs	r0, #100
 1393 05e8 FFF7FEFF 		bl	delay_milli
 358:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_write_command (LCD_OFF,						B_CS1 | B_CS2);
 1394              		.loc 1 358 0
 1395 05ec 1821     		movs	r1, #24
 1396 05ee 3E20     		movs	r0, #62
 1397 05f0 FFF772FF 		bl	graphic_write_command
 359:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_write_command (LCD_ON,						B_CS1 | B_CS2);			//toggla display
 1398              		.loc 1 359 0
 1399 05f4 1821     		movs	r1, #24
 1400 05f6 3F20     		movs	r0, #63
 1401 05f8 FFF76EFF 		bl	graphic_write_command
 360:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_write_command (LCD_DISP_START,				B_CS1 | B_CS2);			//start = 0
 1402              		.loc 1 360 0
 1403 05fc 1821     		movs	r1, #24
 1404 05fe C020     		movs	r0, #192
 1405 0600 FFF76AFF 		bl	graphic_write_command
 361:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_write_command (LCD_SET_ADD,					B_CS1 | B_CS2);			//add = 0
 1406              		.loc 1 361 0
 1407 0604 1821     		movs	r1, #24
 1408 0606 4020     		movs	r0, #64
 1409 0608 FFF766FF 		bl	graphic_write_command
 362:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_write_command (LCD_SET_PAGE,				B_CS1 | B_CS2);			//page = 0
 1410              		.loc 1 362 0
 1411 060c 1821     		movs	r1, #24
 1412 060e B820     		movs	r0, #184
 1413 0610 FFF762FF 		bl	graphic_write_command
 363:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	select_controller(0);
 1414              		.loc 1 363 0
 1415 0614 0020     		movs	r0, #0
 1416 0616 FFF7FEFF 		bl	select_controller
 364:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 365:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	/*
 366:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	for (int i = 0; i <64; i++)
 367:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 368:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		for (int j = 0; j < 4; j++)
 369:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		{
 370:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 			current_disp[i][j] = 0;
 371:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		}
 372:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 373:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	 * 
 374:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	 */
 375:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 1417              		.loc 1 375 0
 1418 061a C046     		nop
 1419 061c BD46     		mov	sp, r7
 1420              		@ sp needed
 1421 061e 80BD     		pop	{r7, pc}
 1422              		.cfi_endproc
 1423              	.LFE19:
 1425              		.align	1
 1426              		.global	pixel
 1427              		.syntax unified
 1428              		.code	16
 1429              		.thumb_func
 1430              		.fpu softvfp
 1432              	pixel:
 1433              	.LFB20:
 376:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 377:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void pixel (int x, int y, int set)
 378:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 1434              		.loc 1 378 0
 1435              		.cfi_startproc
 1436              		@ args = 0, pretend = 0, frame = 32
 1437              		@ frame_needed = 1, uses_anonymous_args = 0
 1438 0620 B0B5     		push	{r4, r5, r7, lr}
 1439              		.cfi_def_cfa_offset 16
 1440              		.cfi_offset 4, -16
 1441              		.cfi_offset 5, -12
 1442              		.cfi_offset 7, -8
 1443              		.cfi_offset 14, -4
 1444 0622 88B0     		sub	sp, sp, #32
 1445              		.cfi_def_cfa_offset 48
 1446 0624 00AF     		add	r7, sp, #0
 1447              		.cfi_def_cfa_register 7
 1448 0626 F860     		str	r0, [r7, #12]
 1449 0628 B960     		str	r1, [r7, #8]
 1450 062a 7A60     		str	r2, [r7, #4]
 379:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	uint8_t mask, c, controller;
 380:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	int index;
 381:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 382:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
 1451              		.loc 1 382 0
 1452 062c FB68     		ldr	r3, [r7, #12]
 1453 062e 002B     		cmp	r3, #0
 1454 0630 00DC     		bgt	.LCB1144
 1455 0632 B6E0     		b	.L90	@long jump
 1456              	.LCB1144:
 1457              		.loc 1 382 0 is_stmt 0 discriminator 1
 1458 0634 BB68     		ldr	r3, [r7, #8]
 1459 0636 002B     		cmp	r3, #0
 1460 0638 00DC     		bgt	.LCB1147
 1461 063a B2E0     		b	.L90	@long jump
 1462              	.LCB1147:
 1463              		.loc 1 382 0 discriminator 2
 1464 063c FB68     		ldr	r3, [r7, #12]
 1465 063e 802B     		cmp	r3, #128
 1466 0640 00DD     		ble	.LCB1150
 1467 0642 AEE0     		b	.L90	@long jump
 1468              	.LCB1150:
 1469              		.loc 1 382 0 discriminator 3
 1470 0644 BB68     		ldr	r3, [r7, #8]
 1471 0646 402B     		cmp	r3, #64
 1472 0648 00DD     		ble	.LCB1153
 1473 064a AAE0     		b	.L90	@long jump
 1474              	.LCB1153:
 383:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 384:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	index = (y-1)/8;
 1475              		.loc 1 384 0 is_stmt 1
 1476 064c BB68     		ldr	r3, [r7, #8]
 1477 064e 013B     		subs	r3, r3, #1
 1478 0650 002B     		cmp	r3, #0
 1479 0652 00DA     		bge	.L73
 1480 0654 0733     		adds	r3, r3, #7
 1481              	.L73:
 1482 0656 DB10     		asrs	r3, r3, #3
 1483 0658 BB61     		str	r3, [r7, #24]
 385:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 386:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	switch( (y-1)%8) {
 1484              		.loc 1 386 0
 1485 065a BB68     		ldr	r3, [r7, #8]
 1486 065c 013B     		subs	r3, r3, #1
 1487 065e 534A     		ldr	r2, .L91
 1488 0660 1340     		ands	r3, r2
 1489 0662 04D5     		bpl	.L74
 1490 0664 013B     		subs	r3, r3, #1
 1491 0666 0822     		movs	r2, #8
 1492 0668 5242     		rsbs	r2, r2, #0
 1493 066a 1343     		orrs	r3, r2
 1494 066c 0133     		adds	r3, r3, #1
 1495              	.L74:
 1496 066e 072B     		cmp	r3, #7
 1497 0670 2CD8     		bhi	.L75
 1498 0672 9A00     		lsls	r2, r3, #2
 1499 0674 4E4B     		ldr	r3, .L91+4
 1500 0676 D318     		adds	r3, r2, r3
 1501 0678 1B68     		ldr	r3, [r3]
 1502 067a 9F46     		mov	pc, r3
 1503              		.section	.rodata
 1504              		.align	2
 1505              	.L77:
 1506 0000 7C060000 		.word	.L76
 1507 0004 86060000 		.word	.L78
 1508 0008 90060000 		.word	.L79
 1509 000c 9A060000 		.word	.L80
 1510 0010 A4060000 		.word	.L81
 1511 0014 AE060000 		.word	.L82
 1512 0018 B8060000 		.word	.L83
 1513 001c C2060000 		.word	.L84
 1514              		.text
 1515              	.L76:
 387:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		case 0: mask = 1; break;
 1516              		.loc 1 387 0
 1517 067c 1F23     		movs	r3, #31
 1518 067e FB18     		adds	r3, r7, r3
 1519 0680 0122     		movs	r2, #1
 1520 0682 1A70     		strb	r2, [r3]
 1521 0684 22E0     		b	.L75
 1522              	.L78:
 388:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		case 1: mask = 2; break;
 1523              		.loc 1 388 0
 1524 0686 1F23     		movs	r3, #31
 1525 0688 FB18     		adds	r3, r7, r3
 1526 068a 0222     		movs	r2, #2
 1527 068c 1A70     		strb	r2, [r3]
 1528 068e 1DE0     		b	.L75
 1529              	.L79:
 389:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		case 2: mask = 4; break;
 1530              		.loc 1 389 0
 1531 0690 1F23     		movs	r3, #31
 1532 0692 FB18     		adds	r3, r7, r3
 1533 0694 0422     		movs	r2, #4
 1534 0696 1A70     		strb	r2, [r3]
 1535 0698 18E0     		b	.L75
 1536              	.L80:
 390:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		case 3: mask = 8; break;
 1537              		.loc 1 390 0
 1538 069a 1F23     		movs	r3, #31
 1539 069c FB18     		adds	r3, r7, r3
 1540 069e 0822     		movs	r2, #8
 1541 06a0 1A70     		strb	r2, [r3]
 1542 06a2 13E0     		b	.L75
 1543              	.L81:
 391:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		case 4: mask = 0x10; break;
 1544              		.loc 1 391 0
 1545 06a4 1F23     		movs	r3, #31
 1546 06a6 FB18     		adds	r3, r7, r3
 1547 06a8 1022     		movs	r2, #16
 1548 06aa 1A70     		strb	r2, [r3]
 1549 06ac 0EE0     		b	.L75
 1550              	.L82:
 392:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		case 5: mask = 0x20; break;
 1551              		.loc 1 392 0
 1552 06ae 1F23     		movs	r3, #31
 1553 06b0 FB18     		adds	r3, r7, r3
 1554 06b2 2022     		movs	r2, #32
 1555 06b4 1A70     		strb	r2, [r3]
 1556 06b6 09E0     		b	.L75
 1557              	.L83:
 393:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		case 6: mask = 0x40; break;
 1558              		.loc 1 393 0
 1559 06b8 1F23     		movs	r3, #31
 1560 06ba FB18     		adds	r3, r7, r3
 1561 06bc 4022     		movs	r2, #64
 1562 06be 1A70     		strb	r2, [r3]
 1563 06c0 04E0     		b	.L75
 1564              	.L84:
 394:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		case 7: mask = 0x80; break;
 1565              		.loc 1 394 0
 1566 06c2 1F23     		movs	r3, #31
 1567 06c4 FB18     		adds	r3, r7, r3
 1568 06c6 8022     		movs	r2, #128
 1569 06c8 1A70     		strb	r2, [r3]
 1570 06ca C046     		nop
 1571              	.L75:
 395:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 396:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 397:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	if(set == 0){
 1572              		.loc 1 397 0
 1573 06cc 7B68     		ldr	r3, [r7, #4]
 1574 06ce 002B     		cmp	r3, #0
 1575 06d0 05D1     		bne	.L85
 398:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		mask = ~mask;
 1576              		.loc 1 398 0
 1577 06d2 1F22     		movs	r2, #31
 1578 06d4 BB18     		adds	r3, r7, r2
 1579 06d6 BA18     		adds	r2, r7, r2
 1580 06d8 1278     		ldrb	r2, [r2]
 1581 06da D243     		mvns	r2, r2
 1582 06dc 1A70     		strb	r2, [r3]
 1583              	.L85:
 399:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 400:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	if(x > 64){
 1584              		.loc 1 400 0
 1585 06de FB68     		ldr	r3, [r7, #12]
 1586 06e0 402B     		cmp	r3, #64
 1587 06e2 07DD     		ble	.L86
 401:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		controller = B_CS2;
 1588              		.loc 1 401 0
 1589 06e4 1E23     		movs	r3, #30
 1590 06e6 FB18     		adds	r3, r7, r3
 1591 06e8 1022     		movs	r2, #16
 1592 06ea 1A70     		strb	r2, [r3]
 402:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		x = x-65;
 1593              		.loc 1 402 0
 1594 06ec FB68     		ldr	r3, [r7, #12]
 1595 06ee 413B     		subs	r3, r3, #65
 1596 06f0 FB60     		str	r3, [r7, #12]
 1597 06f2 06E0     		b	.L87
 1598              	.L86:
 403:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	} else {
 404:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		controller = B_CS1;
 1599              		.loc 1 404 0
 1600 06f4 1E23     		movs	r3, #30
 1601 06f6 FB18     		adds	r3, r7, r3
 1602 06f8 0822     		movs	r2, #8
 1603 06fa 1A70     		strb	r2, [r3]
 405:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		x = x-1;
 1604              		.loc 1 405 0
 1605 06fc FB68     		ldr	r3, [r7, #12]
 1606 06fe 013B     		subs	r3, r3, #1
 1607 0700 FB60     		str	r3, [r7, #12]
 1608              	.L87:
 406:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 407:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 408:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD | x, controller);
 1609              		.loc 1 408 0
 1610 0702 FB68     		ldr	r3, [r7, #12]
 1611 0704 5BB2     		sxtb	r3, r3
 1612 0706 4022     		movs	r2, #64
 1613 0708 1343     		orrs	r3, r2
 1614 070a 5BB2     		sxtb	r3, r3
 1615 070c DAB2     		uxtb	r2, r3
 1616 070e 1E25     		movs	r5, #30
 1617 0710 7B19     		adds	r3, r7, r5
 1618 0712 1B78     		ldrb	r3, [r3]
 1619 0714 1900     		movs	r1, r3
 1620 0716 1000     		movs	r0, r2
 1621 0718 FFF7DEFE 		bl	graphic_write_command
 409:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_write_command(LCD_SET_PAGE | index, controller);
 1622              		.loc 1 409 0
 1623 071c BB69     		ldr	r3, [r7, #24]
 1624 071e 5BB2     		sxtb	r3, r3
 1625 0720 4822     		movs	r2, #72
 1626 0722 5242     		rsbs	r2, r2, #0
 1627 0724 1343     		orrs	r3, r2
 1628 0726 5BB2     		sxtb	r3, r3
 1629 0728 DAB2     		uxtb	r2, r3
 1630 072a 7B19     		adds	r3, r7, r5
 1631 072c 1B78     		ldrb	r3, [r3]
 1632 072e 1900     		movs	r1, r3
 1633 0730 1000     		movs	r0, r2
 1634 0732 FFF7D1FE 		bl	graphic_write_command
 410:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	c = graphic_read_data(controller);
 1635              		.loc 1 410 0
 1636 0736 1723     		movs	r3, #23
 1637 0738 FC18     		adds	r4, r7, r3
 1638 073a 7B19     		adds	r3, r7, r5
 1639 073c 1B78     		ldrb	r3, [r3]
 1640 073e 1800     		movs	r0, r3
 1641 0740 FFF77EFE 		bl	graphic_read_data
 1642 0744 0300     		movs	r3, r0
 1643 0746 2370     		strb	r3, [r4]
 411:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD | x, controller);
 1644              		.loc 1 411 0
 1645 0748 FB68     		ldr	r3, [r7, #12]
 1646 074a 5BB2     		sxtb	r3, r3
 1647 074c 4022     		movs	r2, #64
 1648 074e 1343     		orrs	r3, r2
 1649 0750 5BB2     		sxtb	r3, r3
 1650 0752 DAB2     		uxtb	r2, r3
 1651 0754 7B19     		adds	r3, r7, r5
 1652 0756 1B78     		ldrb	r3, [r3]
 1653 0758 1900     		movs	r1, r3
 1654 075a 1000     		movs	r0, r2
 1655 075c FFF7BCFE 		bl	graphic_write_command
 412:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 413:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	if(set)
 1656              		.loc 1 413 0
 1657 0760 7B68     		ldr	r3, [r7, #4]
 1658 0762 002B     		cmp	r3, #0
 1659 0764 09D0     		beq	.L88
 414:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 415:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		mask = mask | c;
 1660              		.loc 1 415 0
 1661 0766 1F22     		movs	r2, #31
 1662 0768 BB18     		adds	r3, r7, r2
 1663 076a B918     		adds	r1, r7, r2
 1664 076c 1722     		movs	r2, #23
 1665 076e BA18     		adds	r2, r7, r2
 1666 0770 0978     		ldrb	r1, [r1]
 1667 0772 1278     		ldrb	r2, [r2]
 1668 0774 0A43     		orrs	r2, r1
 1669 0776 1A70     		strb	r2, [r3]
 1670 0778 08E0     		b	.L89
 1671              	.L88:
 416:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	} else {
 417:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		mask = mask & c;
 1672              		.loc 1 417 0
 1673 077a 1F22     		movs	r2, #31
 1674 077c BB18     		adds	r3, r7, r2
 1675 077e BA18     		adds	r2, r7, r2
 1676 0780 1721     		movs	r1, #23
 1677 0782 7918     		adds	r1, r7, r1
 1678 0784 1278     		ldrb	r2, [r2]
 1679 0786 0978     		ldrb	r1, [r1]
 1680 0788 0A40     		ands	r2, r1
 1681 078a 1A70     		strb	r2, [r3]
 1682              	.L89:
 418:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	}
 419:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 420:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_write_data(mask, controller);
 1683              		.loc 1 420 0
 1684 078c 1E23     		movs	r3, #30
 1685 078e FB18     		adds	r3, r7, r3
 1686 0790 1A78     		ldrb	r2, [r3]
 1687 0792 1F23     		movs	r3, #31
 1688 0794 FB18     		adds	r3, r7, r3
 1689 0796 1B78     		ldrb	r3, [r3]
 1690 0798 1100     		movs	r1, r2
 1691 079a 1800     		movs	r0, r3
 1692 079c FFF7BCFE 		bl	graphic_write_data
 1693 07a0 00E0     		b	.L69
 1694              	.L90:
 382:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 1695              		.loc 1 382 0
 1696 07a2 C046     		nop
 1697              	.L69:
 421:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 422:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 1698              		.loc 1 422 0
 1699 07a4 BD46     		mov	sp, r7
 1700 07a6 08B0     		add	sp, sp, #32
 1701              		@ sp needed
 1702 07a8 B0BD     		pop	{r4, r5, r7, pc}
 1703              	.L92:
 1704 07aa C046     		.align	2
 1705              	.L91:
 1706 07ac 07000080 		.word	-2147483641
 1707 07b0 00000000 		.word	.L77
 1708              		.cfi_endproc
 1709              	.LFE20:
 1711              		.align	1
 1712              		.global	init_app
 1713              		.syntax unified
 1714              		.code	16
 1715              		.thumb_func
 1716              		.fpu softvfp
 1718              	init_app:
 1719              	.LFB21:
 423:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 
 424:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void init_app(void)
 425:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 1720              		.loc 1 425 0
 1721              		.cfi_startproc
 1722              		@ args = 0, pretend = 0, frame = 0
 1723              		@ frame_needed = 1, uses_anonymous_args = 0
 1724 07b4 80B5     		push	{r7, lr}
 1725              		.cfi_def_cfa_offset 8
 1726              		.cfi_offset 7, -8
 1727              		.cfi_offset 14, -4
 1728 07b6 00AF     		add	r7, sp, #0
 1729              		.cfi_def_cfa_register 7
 426:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*portModer = 0x55555555; // PortE Output (bit 15-0)
 1730              		.loc 1 426 0
 1731 07b8 054B     		ldr	r3, .L94
 1732 07ba 064A     		ldr	r2, .L94+4
 1733 07bc 1A60     		str	r2, [r3]
 427:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*portOtyper = 0x00000000;
 1734              		.loc 1 427 0
 1735 07be 064B     		ldr	r3, .L94+8
 1736 07c0 0022     		movs	r2, #0
 1737 07c2 1A80     		strh	r2, [r3]
 428:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	*portOpupdr = 0x00000000;
 1738              		.loc 1 428 0
 1739 07c4 054B     		ldr	r3, .L94+12
 1740 07c6 0022     		movs	r2, #0
 1741 07c8 1A60     		str	r2, [r3]
 429:C:/Users/becer/Documents/cintro2/autopong\startup.c **** }
 1742              		.loc 1 429 0
 1743 07ca C046     		nop
 1744 07cc BD46     		mov	sp, r7
 1745              		@ sp needed
 1746 07ce 80BD     		pop	{r7, pc}
 1747              	.L95:
 1748              		.align	2
 1749              	.L94:
 1750 07d0 00100240 		.word	1073876992
 1751 07d4 55555555 		.word	1431655765
 1752 07d8 04100240 		.word	1073876996
 1753 07dc 0C100240 		.word	1073877004
 1754              		.cfi_endproc
 1755              	.LFE21:
 1757              		.align	1
 1758              		.global	main
 1759              		.syntax unified
 1760              		.code	16
 1761              		.thumb_func
 1762              		.fpu softvfp
 1764              	main:
 1765              	.LFB22:
 430:C:/Users/becer/Documents/cintro2/autopong\startup.c **** void main(void)
 431:C:/Users/becer/Documents/cintro2/autopong\startup.c **** {
 1766              		.loc 1 431 0
 1767              		.cfi_startproc
 1768              		@ args = 0, pretend = 0, frame = 8
 1769              		@ frame_needed = 1, uses_anonymous_args = 0
 1770 07e0 80B5     		push	{r7, lr}
 1771              		.cfi_def_cfa_offset 8
 1772              		.cfi_offset 7, -8
 1773              		.cfi_offset 14, -4
 1774 07e2 82B0     		sub	sp, sp, #8
 1775              		.cfi_def_cfa_offset 16
 1776 07e4 00AF     		add	r7, sp, #0
 1777              		.cfi_def_cfa_register 7
 432:C:/Users/becer/Documents/cintro2/autopong\startup.c ****  	POBJECT p = &ball;
 1778              		.loc 1 432 0
 1779 07e6 0A4B     		ldr	r3, .L98
 1780 07e8 7B60     		str	r3, [r7, #4]
 433:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	init_app();
 1781              		.loc 1 433 0
 1782 07ea FFF7FEFF 		bl	init_app
 434:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_initialize();
 1783              		.loc 1 434 0
 1784 07ee FFF7FEFF 		bl	graphic_initialize
 435:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	#ifndef SIMULATOR
 436:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	graphic_clear_screen();
 437:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	#endif
 438:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	
 439:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	p->set_speed(p, 4 ,1);
 1785              		.loc 1 439 0
 1786 07f2 7B68     		ldr	r3, [r7, #4]
 1787 07f4 1B6A     		ldr	r3, [r3, #32]
 1788 07f6 7868     		ldr	r0, [r7, #4]
 1789 07f8 0122     		movs	r2, #1
 1790 07fa 0421     		movs	r1, #4
 1791 07fc 9847     		blx	r3
 1792              	.LVL1:
 1793              	.L97:
 440:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	while(1)
 441:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 	{
 442:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		p->move(p);
 1794              		.loc 1 442 0 discriminator 1
 1795 07fe 7B68     		ldr	r3, [r7, #4]
 1796 0800 DB69     		ldr	r3, [r3, #28]
 1797 0802 7A68     		ldr	r2, [r7, #4]
 1798 0804 1000     		movs	r0, r2
 1799 0806 9847     		blx	r3
 1800              	.LVL2:
 443:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		delay_milli(40);
 1801              		.loc 1 443 0 discriminator 1
 1802 0808 2820     		movs	r0, #40
 1803 080a FFF7FEFF 		bl	delay_milli
 442:C:/Users/becer/Documents/cintro2/autopong\startup.c **** 		delay_milli(40);
 1804              		.loc 1 442 0 discriminator 1
 1805 080e F6E7     		b	.L97
 1806              	.L99:
 1807              		.align	2
 1808              	.L98:
 1809 0810 34000000 		.word	ball
 1810              		.cfi_endproc
 1811              	.LFE22:
 1813              	.Letext0:
