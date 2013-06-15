Vim Plugin for Balsa
===================

This plugin contains indent and syntax description file.


What is Balsa?
--------------

Balsa is an asynchronous circuit synthesis system.  To synthesis a circuit, write hardware description in the Balsa language.

For details, visit the following URL

http://apt.cs.manchester.ac.uk/projects/tools/balsa/


Installation
------------

Copy `syntax` and `indent` directories into `~/.vim/`.  Then, type the following command on Vim to apply indentation and syntax

    :set filetype=balsa
	
Or to set filetype automatically, add the following description into `~/.vim/filetype.vim`.

    au BufNewFile,BufRead *.balsa                   setf balsa


Copyright & Lisence
-------------------

Copyright (c) 2013 Shin'ya Ueoka.
This is licensed under MIT lisence.
