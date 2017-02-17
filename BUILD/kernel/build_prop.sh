#!/sbin/sh
# ========================================
# script Apollo kernels
# ========================================
# Created by lyapota

FILE=/system/build.prop

set_prop()
{
  prop=$1
  arg=$2
  if grep -Fq $prop $FILE ; then
      lineNum=`busybox sed -n "/${prop}=/=" $FILE`
      sed -i "${lineNum} c${prop}=${arg}" $FILE
      echo "to $prop set value $arg in build.prop"   
  else
      echo "$prop does not exist in build.prop"
      echo "appending to end of build.prop"
      echo $prop=$arg >> $FILE
  fi;
}

set_prop ro.securestorage.support false
set_prop ro.config.tima 0

