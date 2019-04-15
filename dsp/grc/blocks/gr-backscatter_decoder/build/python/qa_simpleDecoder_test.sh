#!/bin/sh
export VOLK_GENERIC=1
export GR_DONT_LOAD_PREFS=1
export srcdir=/home/free_hat/git/retroreflectors/dsp/grc/blocks/gr-backscatter_decoder/python
export PATH=/home/free_hat/git/retroreflectors/dsp/grc/blocks/gr-backscatter_decoder/build/python:$PATH
export LD_LIBRARY_PATH=/home/free_hat/git/retroreflectors/dsp/grc/blocks/gr-backscatter_decoder/build/lib:$LD_LIBRARY_PATH
export PYTHONPATH=/home/free_hat/git/retroreflectors/dsp/grc/blocks/gr-backscatter_decoder/build/swig:$PYTHONPATH
/usr/bin/python2 /home/free_hat/git/retroreflectors/dsp/grc/blocks/gr-backscatter_decoder/python/qa_simpleDecoder.py 
