 #!/bin/sh
 
 xterm \
     -title "ETR" -geo 120x40 -fg black -bg lightblue -cr red \
     -fn 7x13bold -fb 7x13bold \
     -xrm \
     'XTerm*VT100.translations: #override \n \
     <Key>Num_Lock:    string(0x1b)      string("OP") \n \
     <Key>KP_Divide:   string(0x1b)      string("OQ") \n \
     <Key>KP_Multiply: string(0x1b)      string("OR") \n \
     <Key>KP_Subtract: string(0x1b)      string("OS") \n \
     <Key>KP_Add:      string(0x1b)      string("Ol") \n \
     <Key>KP_Enter:    string(0x1b)      string("OM") \n \
     <Key>KP_Decimal:  string(0x1b)      string("On") \n \
     <Key>KP_0:        string(0x1b)      string("Op") \n \
     <Key>KP_1:        string(0x1b)      string("Oq") \n \
     <Key>KP_2:        string(0x1b)      string("Or") \n \
     <Key>KP_3:        string(0x1b)      string("Os") \n \
     <Key>KP_4:        string(0x1b)      string("Ot") \n \
     <Key>KP_5:        string(0x1b)      string("Ou") \n \
     <Key>KP_6:        string(0x1b)      string("Ov") \n \
     <Key>KP_7:        string(0x1b)      string("Ow") \n \
     <Key>KP_8:        string(0x1b)      string("Ox") \n \
     <Key>KP_9:        string(0x1b)      string("Oy")' \
     $* \
     -e ssh -t db1 /apps/bin/etr
#
# end of Bourne shell script
