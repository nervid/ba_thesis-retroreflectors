#include "gpio.h"
#include "clk.h"
#include "spi.h"

#define LED1_PORT gpiod
#define LED1_PIN gpio_pin_3

#define LED2_PORT gpiod
#define LED2_PIN gpio_pin_2

#define LED3_PORT gpiod
#define LED3_PIN gpio_pin_5

#define LED4_PORT gpiod
#define LED4_PIN gpio_pin_4


#define BUTTON_PORT gpiob
#define BUTTON_PIN 4

#define MOSI_PORT gpioc
#define MOSI_PIN gpio_pin_6

typedef enum{
  pattern_mode_clk,
  pattern_mode_3byte,
  pattern_mode_2byte,
  pattern_mode_1byte

}pattern_mode_t;

void _delay_long(){
  unsigned long int x;

  for(x=0;x<50000;x++);
}

void _delay(){
  unsigned long int x;

  for(x=0;x<50;x++);
}

void display_mode(pattern_mode_t mode)
{
  uint8_t leds;

  leds = gpiod->odr & ~(0x1E); // blank leds
  
  switch(mode){
  case pattern_mode_clk:
    leds |= 1<<2;
    break;

  case pattern_mode_3byte:
    leds |= 1<<3;
    break;

  case pattern_mode_2byte:
    leds |= 1<<4;
    break;
    
  case pattern_mode_1byte:
    leds |= 1<<5;
    break;
    
  default:

    break;
  }

  LED1_PORT->odr = leds;
}

pattern_mode_t switch_mode(pattern_mode_t mode)
{
  //if(gpio_read(BUTTON_PORT, BUTTON_PIN) == 0){
  if((gpiob->idr & (1<<4)) == 0){
    switch(mode){
    case pattern_mode_clk:
      mode = pattern_mode_3byte;
      break;
    
    case pattern_mode_3byte:
      mode = pattern_mode_2byte;
      break;

    case pattern_mode_2byte:
      mode = pattern_mode_1byte;
      break;

    case pattern_mode_1byte:
      mode = pattern_mode_clk;
      break;

    default:
      mode = pattern_mode_clk;
      break;
    }
  }
  
  return mode;
}

void send_data(pattern_mode_t mode)
{
  //const uint8_t data[8] = {0xAA, 0xAA, 0xAA, 0x55, 0x55, 'T', 'E', 0x00};
  const uint8_t data[8] = {0xAA, 0xA7, 0x12, 'T', 'E', 'S', 'T', 0xAA};
  static data_cnt = 0;
  
  switch(mode){
  case pattern_mode_clk:
    //spi_txonly_start();
    spi_txonly_transmit(0xAA);
    break;

  case pattern_mode_3byte:
    spi_txonly_transmit(data[data_cnt]);
    data_cnt++;

    if(data_cnt > 7){
      data_cnt = 0;
      //_delay_long();
    }
    
  default:
    break;
  }

}


char calcCRC(char *data, int length)
{
  int crc = 0;
	int i, j;
	
	for(j=0; j < length; j++)
	{
		crc ^= (data[j] << 8);
		
		for(i=0;i<8;i++)
		{
			if((crc & 0x8000) != 0)
				crc ^= (0x1070 << 3);
		
			crc <<= 1;
		}
	}
	
	return (char)(crc >> 8);
} 


void send_frame(uint8_t *data, uint8_t id){
  uint8_t i, j;
  uint8_t frame[9] = {0xAA, 0xA7, 0x12}; // insert preamble
  frame[3] = id;
  
  for(i = 0; i<4; i++){
    frame[4+i] = data[i];
  }
  frame[8] = calcCRC(&frame[3],5); 

  for(j=0;j<10;j++){
    for(i = 0; i<9; i++){
      spi_txonly_transmit(frame[i]);
    }
  }
}


		  
int main(){
  unsigned long int cnt=0;
  pattern_mode_t mode = pattern_mode_3byte;

  uint8_t id = 0;
  const uint8_t data[4] = {'T', 'E', 'S', 'T'};
  // clk setup
  clk_set_source_auto(clk_source_hsi);
  clk_set_cpudiv(clk_cpudiv_1);
  clk_set_hsidiv(clk_hsidiv_8);


  // gpio setup
  gpio_mode(LED1_PORT,1<<2,gpio_mode_out_pp); // set up led pin as push-pull output
  gpio_mode(LED2_PORT,1<<3,gpio_mode_out_pp);
  gpio_mode(LED3_PORT,1<<4,gpio_mode_out_pp);
  gpio_mode(LED4_PORT,1<<5,gpio_mode_out_pp);

  gpio_mode(BUTTON_PORT,BUTTON_PIN,gpio_mode_in);
  
  gpio_mode(MOSI_PORT, MOSI_PIN, gpio_mode_out_pp);

  //spi_txonly_start();
  spi_txonly_start();
  while(1){


    
    //spi_txonly_transmit(0xAA);
    //gpio_toggle(LED_PORT,LED_PIN);

    //if((cnt % 10) == 0){
      //mode = switch_mode(mode);
      //display_mode(mode);
      id++;
      //}
    //send data here 
    //send_data(mode);
    
    //_delay();

    send_frame(data,id);
    
  }
}
