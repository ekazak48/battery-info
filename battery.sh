#!/bin/bash
folder=/sys/class/power_supply/BAT0/
 read manufacturer < $folder/manufacturer
 read model < $folder/model_name
 echo "$manufacturer $model battery"

 read charge_full < $folder/charge_full
 read dvoltage < $folder/voltage_min_design
 dvoltagen=$(($dvoltage / 1000))
 read charge_full_design < $folder/charge_full_design
 charge_full_design=$(($charge_full_design/1000))
echo "Design charge=$charge_full_design mAh voltage=$dvoltagen mV"
echo "Battery information in real time:"


cycle=1
while cycle=1; do
 read charge_now < $folder/charge_now
    charge_now=$(($charge_now/1000))
 read capacity  < $folder/capacity 
 read voltage < $folder/voltage_now
 voltage=$(($voltage/1000))
 echo "charge remaining $charge_now mAh, $capacity%, current voltage=$voltage mV"
 sleep 1
done
