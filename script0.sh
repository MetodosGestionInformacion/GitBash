months=('Enero',01 'Febrero',02 'Marzo',03 'Abril',04 'Mayo',05 'Junio',06 'Julio',07 'Agosto',08 'Septiembre',09 'Octubre',10 'Noviembre',11 'Diciembre',12)
for year in {2006..2014}
do
	mkdir ${year}
	cd ${year}
	for month in "${months[@]}"
	do
		IFS=","; set -- $month  # $1 == enero, $2 == 01
		mkdir ${2}
		cd ${2}
		curl www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/${year}/${1}{%20,_}${year}.zip > ${year}${1}.zip
		unzip -j ${year}${1}.zip '**127P*'
		rm ${year}${1}.zip
		cd ..
	done
	cd ..
done
