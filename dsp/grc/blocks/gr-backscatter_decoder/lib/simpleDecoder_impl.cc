/* -*- c++ -*- */
/* 
 * Copyright 2018 <+YOU OR YOUR COMPANY+>.
 * 
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <gnuradio/io_signature.h>
#include "simpleDecoder_impl.h"

#include <iostream>

namespace gr {
  namespace backscatter_decoder {

    simpleDecoder::sptr
    simpleDecoder::make()
    {
      return gnuradio::get_initial_sptr
        (new simpleDecoder_impl());
    }

    /*
     * The private constructor
     */
    simpleDecoder_impl::simpleDecoder_impl()
      : gr::block("simpleDecoder",
		  gr::io_signature::make(1, 1, sizeof(char)),
		  gr::io_signature::make(0, 0, 0))
    {}

    /*
     * Our virtual destructor.
     */
    simpleDecoder_impl::~simpleDecoder_impl()
    {
    }

    // no forecast needed as we only consume data
    void
    simpleDecoder_impl::forecast (int noutput_items, gr_vector_int &ninput_items_required)
    {
      /* <+forecast+> e.g. ninput_items_required[0] = noutput_items */
      ninput_items_required[0] = noutput_items;
    }

    int
    simpleDecoder_impl::general_work (int noutput_items,
                       gr_vector_int &ninput_items,
                       gr_vector_const_void_star &input_items,
                       gr_vector_void_star &output_items)
    {
      const char *in = (const char *) input_items[0];
      //char *out = (<+OTYPE+> *) output_items[0];
		static unsigned char data[7];
		static int bit_idx = 0;
		static unsigned char id=0;

      // Do <+signal processing+>

		for(int i = 0; i < noutput_items; i++) {
			if(in[i] & (1<<1)){
				bit_idx = 0;
				//std::cout << "Sync found" << std::endl;
				//reset data array
				for(int j = 0; j < 6; j++){
					data[j] = 0;
				}
			}

			if(bit_idx < 6*8){
				if(in[i] & (1<<0)){
					data[bit_idx/8] |= 1 << (7-(bit_idx%8));

				}else{
					// nothing, current bit is at 0
				}
				bit_idx++;
				if(bit_idx == 6*8){
					// calc CRC
					unsigned char crc = simpleDecoder_impl::calcCRC((char*)data,6);
					

					if(crc == 0){
						if(id != data[0]){
							id = data[0];
							// print data
							std::cout << "ASCII: ";
							for(int j = 0; j < 5; j++){
								if(data[j] >= ' ' && data[j]<127){
									std::cout << data[j];
								}else{
									std::cout << '.';
								}
							}
							std::cout << " - ";

							std::cout << "HEX: ";
							for(int j = 0; j < 6; j++){
								printf("%02x ",data[j]);
							}
							printf("- CRC (calculated): %02x ",crc);
							std::cout << std::endl;
						}
					}
				}
			}
		}
      
      // Tell runtime system how many input items we consumed on
      // each input stream.
      consume_each (noutput_items);

      // Tell runtime system how many output items we produced.
      return noutput_items;
    }

		char simpleDecoder_impl::calcCRC(char *data, int length){
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

  } /* namespace backscatter_decoder */
} /* namespace gr */

