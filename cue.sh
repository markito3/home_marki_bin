#!/bin/sh
xterm -T "jlabl3 ssh tunnel" -e ssh -t -L9003:localhost:9003 jlab.jlab.org ssh -t -L9003:localhost:22 jlabl3 &
xterm -T "ifarml5 ssh tunnel" -e ssh -t -L9005:localhost:9005 jlab.jlab.org ssh -t -L9005:localhost:22 ifarml5 &
xterm -T "jlabl3 vnc tunnel" -e ssh -t -L5903:localhost:5903 login.jlab.org ssh -t -L5903:localhost:5903 jlabl3 &
xterm -T "ifarml5 vnc tunnel" -e ssh -t -L5905:localhost:5905 login.jlab.org ssh -t -L5905:localhost:5905 ifarml5 &
exit
