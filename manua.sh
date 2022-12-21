#!/bin/bash
echo "
00000000000000000000000000000000000000000000000000000000000000000000000000
000xddddddddxkO00000Oxddddddddxk0000Oxdddx0000000000Oddddx000Odllloxkd0000
000Ox. 'lool:'..lO000Ol  ,dddl;..lO00Od.  l000000000:  'kO00o.,dkxo, '0000
00000, :000000x, .o000x  c00000d  :0000....o0000000l.. ;000O..x00000c'0000
00000, :0000000O. .k00x  c00000l  c0000.ll  l00000d.x. ;0000;  ,oO00Od0000
00000, :00000000;  o00x  'lll;. .l00000.l0:  d000d.dO. ;0000Oo,.  'cx00000
00000, :00000000,  o00x  c000Ox:  ,O000.l00: .d0d.o0O. ;00000000d:.  'x000
00000, :0000000d  ,O00x  c000000,  o000.c000: .c.o00O. ;0000l000000d. ,000
00000, :00000x; .cO000x  c00000d. .O000.c0000;  o000O. ;0000.:O00000' :000
000xo,';clllc:cdO000Oxc'';lllc:;:oO0Oxo,;dk00O:l000xl'';dx00;::cllc;;d0000
00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000
"


mkdir -p databases  #create databases folder if not exists

choice=("Create DataBase" "List" "Connect To DB" "Drop DB" "Exit")

select result in "${choice[@]}"
do
    case $result in
        "Create DataBase")
           clear ; . createDatabase.sh; . Back.sh
            ;;
        "List")
           clear ; . list.sh ; . Back.sh
            ;;
        "Connect To DB")
            clear ; . conactdb.sh; . Back.sh
            ;;
        "Drop DB")
            clear ; .  DropDatabase.sh ; . Back.sh
            ;;  
        "Exit")
            echo "thanks :: " ; exit
            ;;
        *) clear ; echo "Erorr plese agian enter choice " ; . manua.sh ;;
    esac
done