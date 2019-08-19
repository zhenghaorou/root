#!/bin/bash
#这是一个对文本的增删改查的脚本
#1是检测文件是否为文件．2是增加文件内容．3是删除文件内容.4是查看文件内容.5是使用vim进去编辑文本模式H是查看帮助Q是退出
lvs=$(echo -e "\033[40;37m输入文件路径>>>\033[0m")
clear
search (){
  while :
    do
    read -p "$lvs :" gvs
    if [ -z $gvs ];then
      echo "you didn't enter a name"
      echo "you must have some scores before you can search!" && continue
    elif  [ -z "`cat $gvs`"  ];then
      echo "you didn't enter a name"
      echo "you must have some scores before you can search!" && continue
    else
           echo "$gvs 是个文件"
      echo 'sueccfullly' &&  break  
    fi
  done

}
ddd=`echo -e "\033[40;32menter name and score of a record\033[0m"` 
add () {

[ -z  $gvs ] && search
while [ ! -z  $gvs   ]
do
 read -p "$ddd:" ccc 
if [ $ccc  == ""  ];then 
echo  "you didn't enter any value"
else
echo $ccc >> $gvs && break 
fi
done
sleep 3
}

delete () {
   [  -z $gvs  ]  && search
while :
do
  read -p "$ddd:" bdc
  if [ -z $bdc ];then
    echo "你没有输出值"
  else
    sed -i "/$bdc/d" $gvs && sed -n 'p'  $gvs && break 
  fi
done
}

edit () {
 [  -z  $gvs    ] && search
vim $gvs
}

display () { 
[   -z   $gvs     ] && search
sed -n 'p' $gvs 
}

 main () {
case "$name" in
1)
search
SOUR
;;
2)
 add
SOUR
 ;;
3)
delete
SOUR
;;
4)
display
SOUR
;;
5)
edit
SOUR
;;
H|h)
echo -e "\033[40;36;1m This is a student's record\033[0m"
 SOUR
;;
q)
echo -e "\033[0m   "
 exit
  ;;
*)
echo "you must have some scores before you can search!" 
sleep 3
clear
esac
}

#ooo=`echo -e "\033[40;35menter name and score of a record\033[0m"`
screen () {
echo -e "\033[40;35mThis is a student's record\033[0m"
sleep 3
}

paragma () {
echo "please enter valid mode"
exit
}

abc=$(echo -e "\033[40;33m please enter your choice [1 2 3 4 5 H Q ]")
SOUR () {
echo -e "\033[41;32;1m###############################################
         1:search a record                    #
         2:add    a record                    #
         3:delete a record                    #
         4:display  all record                #
         5:edit  record with vi               #
         H:help screen                        #
         Q:exit pragma                        #
###############################################\033[0m"
    read -p "$abc:" name 
    echo -e "\033[0m"
}
SOUR
while [ $name !=  "Q"   ]
do
if [ -z $name ];then
echo "you didn't enter a name"
else
main
fi
done
