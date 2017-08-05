#!/bin/bash

echo "looking for street crime CSV files..."
find $HOME -name "*street.csv"
echo "making a new folder on the Desktop..."
mkdir $HOME/Desktop/allcombined
echo "moving all *street.csv files to new folder..."
mv `find $HOME -name "*street.csv"` $HOME/Desktop/allcombined
