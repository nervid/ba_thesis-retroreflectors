#include <stdio.h>
#include <sys/stat.h>
#include <string.h>

#define BUF_SIZE 1000000

int main(){
  unsigned char buf[BUF_SIZE];
  unsigned char buf_parsed[BUF_SIZE/8-100];
  int i,j,bit_offset,bit_ctr;

  char *pch;
  
  FILE *ptr;

  int output_idx = 0;
  unsigned char *bit_ptr=buf;

  ptr = fopen("../test.raw","rb");


  fread(buf,sizeof(buf),1,ptr);

  
  /* parse the buffer with bit offset 0-7 */
  for(bit_offset=0;bit_offset<8;bit_offset++){
    bit_ptr = buf + bit_offset;
    memset(buf_parsed,0,sizeof(buf_parsed));
    
    for(output_idx=0;output_idx<sizeof(buf_parsed);output_idx++){
      for(i=0;i<8;i++){
	if(*bit_ptr){
	  buf_parsed[output_idx] |= 1<<(7-i);
	}
	bit_ptr++;
      
      }
    }

    
    for(output_idx=0;output_idx<sizeof(buf_parsed);output_idx++){
      if((buf_parsed[output_idx] == 0xA7) && (buf_parsed[output_idx+1] == 0x12) ){
	printf("Found sync: %x %x %x %c %c %c %c\n",buf_parsed[output_idx],buf_parsed[output_idx+1],buf_parsed[output_idx+2],buf_parsed[output_idx+3],buf_parsed[output_idx+4],buf_parsed[output_idx+5],buf_parsed[output_idx+6]);
      }
    }
    
    
  }

  
  
  
  
}
