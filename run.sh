#!/bin/bash

# User Configuration sections Observation Options and Model Options

## Observation Options

SITEMETA=obsinput/AQS_full_site_list.csv
OBSINPATH=obsinput/AQS_daily_data_2016.csv
OBSDEFN=defn/obssimple.txt
OBSOUTPATH=output/obs.nc

## Model Options

MODFORMAT="format='ioapi',mode='r+s'"
MODINPATHS=$(ls modinput/*.subset.nc4 | sort)
MODDEFN=defn/modsimple.txt
MODOUTPATH=output/modatobs.nc
HOUR2DAY=mean # mean, mda8, max, epamda8

# AQ-MOCO Call
# ** USER SHOULD NOT MODIFY **
python -i scripts/aqmoco.py \
  --hour-func=${HOUR2DAY} \
  --obsexpr=${OBSDEFN} ${SITEMETA} ${OBSINPATH} \
  --modexpr=${MODDEFN} --mod-format=${MODFORMAT} ${MODINPATHS} \
  ${OBSOUTPATH} ${MODOUTPATH}
