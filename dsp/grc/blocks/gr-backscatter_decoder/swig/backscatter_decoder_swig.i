/* -*- c++ -*- */

#define BACKSCATTER_DECODER_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "backscatter_decoder_swig_doc.i"

%{
#include "backscatter_decoder/simpleDecoder.h"
%}


%include "backscatter_decoder/simpleDecoder.h"
GR_SWIG_BLOCK_MAGIC2(backscatter_decoder, simpleDecoder);
