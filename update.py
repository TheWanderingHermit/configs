#!/usr/bin/python
__author__     = 'Sidharth Sharma'
__copyright__  = 'Copyright 2017, Sidharth Sharma'
__license__    = 'Beer-Ware License Rev. 42'
__maintainer__ = 'Sidharth Sharma'
__email__      = 'ims.sharma@gmail.com'
__credits__    = ['Sidharth Sharma']
__version__    = '0.1'
__status__     = 'Development'

'''
An script designed to update all my vim plugins
'''

import os
import sys
import subprocess

cmd 	  = {
        'YouCompleteMe' : './install.py --clang-completer',
      }
vimbundle = os.path.abspath( './' )

for rpath in os.listdir( vimbundle ) :
    if os.path.isdir( rpath ) :
        apath = os.path.abspath( rpath )
        module  = os.path.basename( apath )
	print 'updating module: %s' % ( module )
        os.chdir( apath )
	pullps  = subprocess.Popen( 'git pull', shell = True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
	pullout = pullps.communicate()[0]
        print pullout
        if os.path.basename( module ) in cmd :
	    if not 'Already up-to-date.' in pullout :
		print 'executing command: %s' % ( cmd[ module ] )
		cmdps  = subprocess.Popen( cmd[ module ], shell = True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
		cmdout = cmdps.communicate()[0]
                print cmdout
        os.chdir( vimbundle )


