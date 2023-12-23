#!/bin/bash
#
#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno12/lab4-Git/
#SBATCH -J lab1_alumno12
#SBATCH --mail-type=NONE
#SBATCH --mail-user=MAIL@um.es
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH -o salida-avanzado-lab4.sh

for fasta in *.fastq; do
   longitud=$(wc -l "$fasta" | cut -f1 -d" ")
   objetivo=$(( longitud/12 ))
   head -n "$objetivo" "$fasta" > "nuevo_$fasta" &
done 

wait
