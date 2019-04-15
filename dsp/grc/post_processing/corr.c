#include <stdio.h>
#include <sys/stat.h>
#include <string.h>

#define BUF_SIZE 1000000

char calcCRC(char *data, int length){
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


int main(){
  unsigned char buf[BUF_SIZE];
  unsigned char buf_parsed[BUF_SIZE/8-100];
  int i,j,bit_offset,bit_ctr;

  char *pch;
  
  FILE *fp;

  int id,old_id = 0;
  
  int output_idx = 0;
  unsigned char *bit_ptr=buf;

  fp = fopen("../test_corr.raw","rb");

  fseek(fp, 0L, SEEK_END);
  int fsize = ftell(fp);
  rewind(fp);


  fread(buf,sizeof(buf),1,fp);

  //printf("fread read %d bytes",ret);
  
  while(1){
    memset(buf_parsed,0,sizeof(buf_parsed));

    /* find occurance of flag inserted by correlator */
    while((*bit_ptr & (1<<1)) == 0){
      bit_ptr++;
      if(bit_ptr > buf+fsize){
	printf("End of buffer\n");
	return 0;
      }
    }

    //printf("Found packet: %2x %2x %2x %2x\n", bit_ptr[0], bit_ptr[1], bit_ptr[2], bit_ptr[3] );

    
    bit_ptr--;

    // this is fucking *MSB FIRST*!
    for(i=0;i<8*6;i++){
      bit_ptr++;
      if(*(bit_ptr) & 1){
	buf_parsed[i/8] |= 1 << (7-(i%8));
      }
    
    }
    buf_parsed[6] = 0;

    if(calcCRC(buf_parsed,6) == 0){
      id = buf_parsed[0];
      if((id > old_id) || (id==0 && old_id>127)){
	old_id = id;
	printf("ID=%d; ASCII: ",id);
	for(int j = 1; j < 5; j++){
	  printf("%c",buf_parsed[j]);
	}
	printf("\n");
      }
    }

    //if(buf_parsed[0] == 'T')
    //printf("Found packet: %s\t%2x %2x %2x %2x %2x %2x\n",buf_parsed+1, buf_parsed[0], buf_parsed[1], buf_parsed[2], buf_parsed[3], buf_parsed[4], buf_parsed[5] );
    
     
    
  }
    
}
