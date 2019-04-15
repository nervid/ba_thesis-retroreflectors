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


#ifndef INCLUDED_BACKSCATTER_DECODER_SIMPLEDECODER_H
#define INCLUDED_BACKSCATTER_DECODER_SIMPLEDECODER_H

#include <backscatter_decoder/api.h>
#include <gnuradio/block.h>

namespace gr {
  namespace backscatter_decoder {

    /*!
     * \brief <+description of block+>
     * \ingroup backscatter_decoder
     *
     */
    class BACKSCATTER_DECODER_API simpleDecoder : virtual public gr::block
    {
     public:
      typedef boost::shared_ptr<simpleDecoder> sptr;

      /*!
       * \brief Return a shared_ptr to a new instance of backscatter_decoder::simpleDecoder.
       *
       * To avoid accidental use of raw pointers, backscatter_decoder::simpleDecoder's
       * constructor is in a private implementation
       * class. backscatter_decoder::simpleDecoder::make is the public interface for
       * creating new instances.
       */
      static sptr make();
    };

  } // namespace backscatter_decoder
} // namespace gr

#endif /* INCLUDED_BACKSCATTER_DECODER_SIMPLEDECODER_H */

