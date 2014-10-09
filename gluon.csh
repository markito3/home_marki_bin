	if ( $?prompt ) then		
	    set history=5000		
	    set savehist=5000		
	    set system=`hostname`
	    set prompt = "%m:%C> "	
#	    set autologout = 120		
#	    set time = 300	
	    set notify
	    set noclobber
#	    
            alias	h	history	
	    alias	ssh	'ssh -X \!*' 
	    alias	dir	'ls -lh --color \!*|more' 
	    alias	cp 	'cp -i \!*'			
	endif
#
	setenv EDITOR emacs 
	setenv VISUAL emacs 
	setenv SVN_EDITOR emacs 
#
#
#  Here we set MySQL path (disabled MySQL in CLAS setup, it was not good 
#
	setenv MYSQL_INCLUDE_PATH /usr/include/mysql
	if( `arch` == x86_64 ) then 
	    setenv MYSQL_LIB_PATH 	  /usr/lib64/mysql
	else
	    setenv MYSQL_LIB_PATH 	  /usr/lib/mysql
	endif
#	setenv MYSQL /usr/local/mysql
	setenv MYSQLIB $MYSQL_LIB_PATH
	setenv MYSQINC $MYSQL_INCLUDE_PATH
#
# Set default printer
	setenv LPDEST cs07
	setenv PRINTER cs07

	source /gluex/etc/hdonline.cshrc
	setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${LINUXVME_LIB}

# Determine the RHEL version 
	setenv OS_NAME `uname`
        if ( `arch` == x86_64 ) then 
#	    set ARCH='64'
	    set ARCH=''
        else 
	    set ARCH=''
        endif
	if ( -e /etc/redhat-release ) then 
	    set DISTRIB=RH
            set VERSION=`uname -r | awk '{if(loc=match($0,/EL/)){printf "EL"};if(loc=match($0,/el/)){printf "EL"};}'`
            set VERSION = "${VERSION}"`awk '/release/{print substr($0,match($0,/[123456789]/),1)}' /etc/redhat-release`
#           set VERSION = "${VERSION}"4
            setenv OS_NAME ${OS_NAME}${ARCH}${DISTRIB}${VERSION}
        endif


#
# Set the ROOT variables
#
#	source /apps/root/5.34.01/setroot_CUE
#
# Setup EPICS environment
#	source /group/halld/Online/controls/epics/.epicsrc 3-14-12-2
#	if( ${OS_NAME} == 'LinuxRHEL5' ) then 
#	    source /gluex/controls/epics/.epicsrc 3-14-12-3-RHEL5
#  	else
#	    source /gluex/controls/epics/.epicsrc 3-14-12-3-1
#	endif
#	source /gluex/controls/epics/.epicsrc 3-14-12-3-1

#	source /group/halld/Online/controls/css/.cssrc 3.1.2
#	source /gluex/controls/css/.cssrc 3.1.7
	source /gluex/controls/css/.cssrc WITH_ALARM_3.1.7
