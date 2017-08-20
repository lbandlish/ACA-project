#!/bin/bash

cd ./temp
for i in  $(ls | sort -nr); do
mv $i $((2*i))
done
