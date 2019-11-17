/*
 * 	startup.c
 *
 */
 
#define SIMULATOR
 
//PortE for graphic display
#define GPIO_E													0x40021000
#define	portModer	 ((volatile unsigned int *)					(GPIO_E))
#define	portOtyper	 ((volatile unsigned short *)				(GPIO_E+0x4))
#define	portOspeedr	 ((volatile unsigned int *)					(GPIO_E+0x8))
#define	portOpupdr	 ((volatile unsigned int *)					(GPIO_E+0xC))
#define GPIO_IDR 	((volatile unsigned short *)				(GPIO_E+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *)				(GPIO_E+0x11))
#define GPIO_ODR_LOW  ((volatile unsigned char *)				(GPIO_E+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *)				(GPIO_E+0x15))
 
 
//Delay 
#define SYSTICK									0xE000E010
#define STK_CTRL ((volatile unsigned int *)		(SYSTICK))
#define STK_LOAD ((volatile unsigned int *)		(SYSTICK+0x4))
#define STK_VAL ((volatile unsigned int *)		(SYSTICK+0x8))
//#define STK_CALIB ((volatile unsigned int *)	(SYSTICK+0xC))

#define B_RS 			1			//0 command, 1 Data
#define B_RW 			2			//0 write, 1 read
#define B_SELECT 		4			//Graphics 0, 1 ASCII
#define B_CS1 			8			//Controller select 1
#define B_CS2			0x10		//Controller Select 2
#define B_RESET			0x20		//Reset
#define B_E				0x40		//Enable

#define LCD_ON			0x3F		//Display on
#define	LCD_OFF			0x3E		//Display off
#define LCD_SET_ADD		0x40		//Set horizontal coordinate
#define LCD_SET_PAGE	0xB8		//Set vertical coordinate
#define	LCD_DISP_START	0xC0		//Start adress
#define	LCD_BUSY		0x80		//Read busy status

#define MAX_POINTS 20

typedef unsigned char uint8_t;

typedef struct tPoint
{
	unsigned char x;
	unsigned char y;
}POINT;

typedef struct tGeometry
{
	int numpoints;
	int sizex;
	int sizey;
	POINT px[MAX_POINTS];
}GEOMETRY, *PGEOMETRY;

GEOMETRY ball_geometry=
{
	12,			//Numpoints
	4,4,		//sizeX sizeY
	{	{0,1}, {0,2}, 
	{1,0},{1,1},{1,2},{1,3},
	{2,0},{2,1},{2,2},{2,3},
		{3,1},{3,2} } //form
};
	
typedef struct tObj 
{
	PGEOMETRY geo;
	int dirx,diry;
	int posx,posy;
	void (* draw ) (struct tObj *);
	void (* clear ) (struct tObj *);
	void (* move ) (struct tObj *);
	void (* set_speed ) (struct tObj *, int, int);
}OBJECT, *POBJECT;


void set_object_speed(POBJECT o, int speedx, int speedy)
{
	o->dirx = speedx;
	o->diry = speedy;
}

void draw_object(POBJECT o)
{
	for (int i = 0; i < o->geo->numpoints; i++)
	{
		pixel((o->geo->px[i].x+o->posx),(o->geo->px[i].y + o->posy), 1);
	} 
}

void clear_object(POBJECT o)
{
	for(int i = 0; i < o->geo->numpoints; i++)
	{
		pixel((o->geo->px[i].x + o->posx),(o->geo->px[i].y + o->posy), 0);
	}
}

void move_object(POBJECT o)
{
	clear_object(o);
	o->posx = (o->posx + o->dirx);
	o->posy = (o->posy + o->diry);
	
	if (o->posx < 1)						//Left border limit -> reverse direction
	{
		o->dirx = -(o->dirx);
	}
	if ( (o->posx  + o->geo->sizex) > 128)	//Right border limit -> reverse direction
	{
		o->dirx = -(o->dirx);
	}
	
	if (o->posy < 1) 
	{
		o->diry = -(o->diry);
	}
	
	if ((o->posy + o->geo->sizey) > 64)
	{
		o->diry = -(o->diry);
	}
	draw_object(o);
}

//int current_disp[64][4];

static OBJECT ball= 
{
	&ball_geometry,
	0,0,
	1,1,
	draw_object,
	clear_object,
	move_object,
	set_object_speed,
};

void delay_250ns( void )
{
	/* SystemCoreClock = 168000000 */
	*STK_CTRL = 0;					//Initiate counter by resetting bit to 0
	*STK_LOAD = ( (168/4) -1 );		//Counter value 168 000 000 = 1 sec, 168 = 1 microsec = 1000 nanosec / 4 = 250ns 
	*STK_VAL = 0;					//Reset counter register
	*STK_CTRL = 5;					
	while( (*STK_CTRL & 0x10000 )== 0 );
	*STK_CTRL = 0;
}

void delay_500ns( void)	
{
	/* SystemCoreClock = 168000000 */
	*STK_CTRL = 0;					
	*STK_LOAD = ( (168/2) -1 );		
	*STK_VAL = 0;					
	*STK_CTRL = 5;					
	while( (*STK_CTRL & 0x10000 )== 0 );
	*STK_CTRL = 0;
}

void delay_micro( unsigned int us )
{
	#ifdef SIMULATOR
	us = us / 1000;
	us++;
	#endif
	
	while (us>0)
	{
	delay_250ns();
	delay_250ns();
	delay_250ns();
	delay_250ns();
	us--;
	}
}

void delay_milli(unsigned int ms) 
{
	delay_micro(1000*ms);
}

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		// Set stack 
	" MOV SP,R0\n"
	" BL main\n"				// Call main 
	"_exit: B .\n"				// Never return 
	) ;
}

void graphic_ctrl_bit_set (uint8_t x) 
{
	uint8_t c;
	c = *GPIO_ODR_LOW;
	c |= (~B_SELECT & x);
	*GPIO_ODR_LOW = c;
}

void graphic_ctrl_bit_clear( uint8_t x )
{
	uint8_t c;
	c = *GPIO_ODR_LOW;
	c = ~B_SELECT & ( c & ~x);
	*GPIO_ODR_LOW = c;
}

void select_controller (uint8_t controller)		
{
	switch (controller){
		case 0: 
		graphic_ctrl_bit_clear (B_CS1 | B_CS2); 
		break;
		
		case B_CS1: 
		graphic_ctrl_bit_set(B_CS1); 
		graphic_ctrl_bit_clear(B_CS2);
		break;
		
		case B_CS2:
		graphic_ctrl_bit_clear(B_CS1);
		graphic_ctrl_bit_set(B_CS2);
		break;
		
		case B_CS1 | B_CS2:
		graphic_ctrl_bit_set(B_CS1 | B_CS2);
		break;
	}
	 
}

static void graphic_wait_ready (void)			
{
	uint8_t c;
	graphic_ctrl_bit_clear(B_E);
	*portModer = 0x00005555;			//15-8 Input 7-0 Output
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_set(B_RW);
	delay_500ns();
	while(1)
	{
		if (c == 0) break;
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		c = *GPIO_IDR_HIGH & LCD_BUSY;
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();
	}
	
	*portModer = 0x55555555;			//15-0 Outputs
}

static uint8_t graphic_read(uint8_t controller)	
{
	uint8_t rv;
	graphic_ctrl_bit_clear(B_E);
	*portModer = 0x00005555;					//15-8 Input, 7-0 Output
	graphic_ctrl_bit_set(B_RS | B_RW);
	select_controller(controller);
	delay_500ns;
	graphic_ctrl_bit_set(B_E);
	delay_500ns;
	rv = *GPIO_IDR_HIGH;
	graphic_ctrl_bit_clear(B_E);
	*portModer = 0x55555555;
	if ( controller & B_CS1)
	{
		select_controller(B_CS1);
		graphic_wait_ready;
	}
	if ( controller & B_CS2)
	{
		select_controller(B_CS2);
		graphic_wait_ready;
	}
	return rv;
}

static uint8_t graphic_read_data(uint8_t controller)
{
	graphic_read(controller);
	return graphic_read(controller);
}

static void graphic_write (uint8_t value, uint8_t controller)
{
	*GPIO_ODR_HIGH = value;
	select_controller(controller);
	delay_500ns;
	graphic_ctrl_bit_set(B_E);
	delay_500ns;
	graphic_ctrl_bit_clear(B_E);
	
	if (controller & B_CS1)
	{
		select_controller(B_CS1);
		graphic_wait_ready;
	}
	if (controller & B_CS2)
	{
		select_controller(B_CS2);
		graphic_wait_ready;
	}
	
	*GPIO_ODR_HIGH = 0;
	graphic_ctrl_bit_set(B_E);
	select_controller(0);
}

static void graphic_write_command(uint8_t command, uint8_t controller)
{
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_clear(B_RS | B_RW);
	graphic_write(command, controller);
}

static void graphic_write_data(uint8_t data, uint8_t controller)
{
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	graphic_write(data, controller);
}

void graphic_clear_screen(void) 
{
	for (char page = 0; page < 8; page++)
	{
		graphic_write_command(LCD_SET_PAGE | page	, B_CS1|B_CS2);
		graphic_write_command(LCD_SET_ADD  | 0	, B_CS1|B_CS2);
		
		for (char add = 0; add < 64; add++)
		{
			graphic_write_data(0, B_CS1 | B_CS2);
		}
	}
}

void graphic_initialize (void)					//PDF
{
		
	graphic_ctrl_bit_set(B_E);
	delay_micro(10);
	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RESET | B_E);
	delay_milli(30);
	graphic_ctrl_bit_set(B_RESET);
	delay_milli(100);
	graphic_write_command (LCD_OFF,						B_CS1 | B_CS2);
	graphic_write_command (LCD_ON,						B_CS1 | B_CS2);			//toggla display
	graphic_write_command (LCD_DISP_START,				B_CS1 | B_CS2);			//start = 0
	graphic_write_command (LCD_SET_ADD,					B_CS1 | B_CS2);			//add = 0
	graphic_write_command (LCD_SET_PAGE,				B_CS1 | B_CS2);			//page = 0
	select_controller(0);
	
	/*
	for (int i = 0; i <64; i++)
	{
		for (int j = 0; j < 4; j++)
		{
			current_disp[i][j] = 0;
		}
	}
	 * 
	 */
}

void pixel (int x, int y, int set)
{
	uint8_t mask, c, controller;
	int index;
	
	if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
	
	index = (y-1)/8;
	
	switch( (y-1)%8) {
		case 0: mask = 1; break;
		case 1: mask = 2; break;
		case 2: mask = 4; break;
		case 3: mask = 8; break;
		case 4: mask = 0x10; break;
		case 5: mask = 0x20; break;
		case 6: mask = 0x40; break;
		case 7: mask = 0x80; break;
	}
	
	if(set == 0){
		mask = ~mask;
	}
	if(x > 64){
		controller = B_CS2;
		x = x-65;
	} else {
		controller = B_CS1;
		x = x-1;
	}
	
	graphic_write_command(LCD_SET_ADD | x, controller);
	graphic_write_command(LCD_SET_PAGE | index, controller);
	c = graphic_read_data(controller);
	graphic_write_command(LCD_SET_ADD | x, controller);
	
	if(set)
	{
		mask = mask | c;
	} else {
		mask = mask & c;
	}
	
	graphic_write_data(mask, controller);
	
}

void init_app(void)
{
	*portModer = 0x55555555; // PortE Output (bit 15-0)
	*portOtyper = 0x00000000;
	*portOpupdr = 0x00000000;
}
void main(void)
{
 	POBJECT p = &ball;
	init_app();
	graphic_initialize();
	#ifndef SIMULATOR
	graphic_clear_screen();
	#endif
	
	p->set_speed(p, 4 ,1);
	while(1)
	{
		p->move(p);
		delay_milli(40);
	}
	
	
}

