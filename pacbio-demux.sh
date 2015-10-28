#!/bin/bash

fastx_barcode_splitter.pl --bol --partial 1 --prefix r1. --bcfile r1.fastx < $1
fastx_barcode_splitter.pl --bol --partial 1 --prefix r2. --bcfile r2.fastx < r1.unmatched 
fastx_barcode_splitter.pl --bol --partial 1 --prefix f1. --bcfile f1.fastx < r2.unmatched  
fastx_barcode_splitter.pl --bol --partial 1 --prefix f2. --bcfile f2.fastx < f1.unmatched 
fastx_barcode_splitter.pl --bol --partial 1 --prefix f3. --bcfile f3.fastx < f2.unmatched 

fastx_barcode_splitter.pl --eol --partial 1 --prefix rc.r1. --bcfile rc.r1.fastx < f3.unmatched 
fastx_barcode_splitter.pl --eol --partial 1 --prefix rc.r2. --bcfile rc.r2.fastx < rc.r1.unmatched 
fastx_barcode_splitter.pl --eol --partial 1 --prefix rc.f1. --bcfile rc.f1.fastx < rc.r2.unmatched 
fastx_barcode_splitter.pl --eol --partial 1 --prefix rc.f2. --bcfile rc.f2.fastx < rc.f1.unmatched 
fastx_barcode_splitter.pl --eol --partial 1 --prefix rc.f3. --bcfile rc.f3.fastx < rc.f2.unmatched

fastx_barcode_splitter.pl --bol --partial 1 --prefix r1.trim. --bcfile r1.trim.fastx < rc.f3.unmatched
fastx_barcode_splitter.pl --bol --partial 1 --prefix r2.trim. --bcfile r2.trim.fastx < r1.trim.unmatched 
fastx_barcode_splitter.pl --bol --partial 1 --prefix f1.trim. --bcfile f1.trim.fastx < r2.trim.unmatched  
fastx_barcode_splitter.pl --bol --partial 1 --prefix f2.trim. --bcfile f2.trim.fastx < f1.trim.unmatched 
fastx_barcode_splitter.pl --bol --partial 1 --prefix f3.trim. --bcfile f3.trim.fastx < f2.trim.unmatched 

fastx_barcode_splitter.pl --eol --partial 1 --prefix rc.r1.trim. --bcfile rc.r1.trim.fastx < f3.trim.unmatched 
fastx_barcode_splitter.pl --eol --partial 1 --prefix rc.r2.trim. --bcfile rc.r2.trim.fastx < rc.r1.trim.unmatched 
fastx_barcode_splitter.pl --eol --partial 1 --prefix rc.f1.trim. --bcfile rc.f1.trim.fastx < rc.r2.trim.unmatched 
fastx_barcode_splitter.pl --eol --partial 1 --prefix rc.f2.trim. --bcfile rc.f2.trim.fastx < rc.f1.trim.unmatched 
fastx_barcode_splitter.pl --eol --partial 1 --prefix rc.f3.trim. --bcfile rc.f3.trim.fastx < rc.f2.trim.unmatched

cat *.Plate1* > $1.plate1.fasta
cat *.Plate2* > $1.plate2.fasta
cat *.Plate3* > $1.plate3.fasta
cat *.Plate4* > $1.plate4.fasta

rename 's/.reads_of_insert.fasta//g' $1.plate1.fasta
rename 's/.reads_of_insert.fasta//g' $1.plate2.fasta
rename 's/.reads_of_insert.fasta//g' $1.plate3.fasta
rename 's/.reads_of_insert.fasta//g' $1.plate4.fasta

rm *Plate* *unmatched
:<<'END'
fastx_barcode_splitter.pl --eol --partial 1 --prefix r.r1. --bcfile r.r1.fastx < rc.f3.unmatched
fastx_barcode_splitter.pl --eol --partial 1 --prefix r.r2. --bcfile r.r2.fastx < r.r1.unmatched 
fastx_barcode_splitter.pl --eol --partial 1 --prefix r.f1. --bcfile r.f1.fastx < r.r2.unmatched  
fastx_barcode_splitter.pl --eol --partial 1 --prefix r.f2. --bcfile r.f2.fastx < r.f1.unmatched 
fastx_barcode_splitter.pl --eol --partial 1 --prefix r.f3. --bcfile r.f3.fastx < r.f2.unmatched

fastx_barcode_splitter.pl --bol --partial 1 --prefix c.r1. --bcfile c.r1.fastx < r.f3.unmatched
fastx_barcode_splitter.pl --bol --partial 1 --prefix c.r2. --bcfile c.r2.fastx < c.r1.unmatched 
fastx_barcode_splitter.pl --bol --partial 1 --prefix c.f1. --bcfile c.f1.fastx < c.r2.unmatched  
fastx_barcode_splitter.pl --bol --partial 1 --prefix c.f2. --bcfile c.f2.fastx < c.f1.unmatched 
fastx_barcode_splitter.pl --bol --partial 1 --prefix c.f3. --bcfile c.f3.fastx < c.f2.unmatched
END
