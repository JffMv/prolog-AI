sirvePara(PRODUCTO,OBJETIVO,GENERO) :- 
    lineaEspecializado(LINEA,OBJETIVO),
    pertenece(PRODUCTO,LINEA),
    puedeUsar(LINEA,GENERO).

quererEstaTecnologia(PRODUCTO, QUIERO_TECNOLOGIA, OBJETIVO) :-
    usa(PRODUCTO, QUIERO_TECNOLOGIA),
    ayuda(QUIERO_TECNOLOGIA, OBJETIVO).

recomendadoPara(PRODUCTO,LINEA,PARTE_CUERPO,COMO_ES_PARTE_CUERPO,ESTADO_PARTE_CUERPO) :-
    recomendadoEn(PRODUCTO,PARTE_CUERPO,COMO_ES_PARTE_CUERPO,ESTADO_PARTE_CUERPO),
    pertenece(PRODUCTO,LINEA).

recomendadoEn(PRODUCTO,PARTE_CUERPO,COMO_ES_PARTE_CUERPO,ESTADO_PARTE_CUERPO) :- 
    seAplicaEn(PRODUCTO,PARTE_CUERPO, COMO_ES_PARTE_CUERPO),
    productosPara(PRODUCTO,PARTE_CUERPO,ESTADO_PARTE_CUERPO).

precioProducto(PRODUCTO,PRECIO) :- precio(PRODUCTO,X), PRECIO @=< X.
    
producto(PRODUCTO,LINEA,PARTE_CUERPO,COMO_ES_PARTE_CUERPO,
         OBJETIVO,ESTADO_PARTE_CUERPO,MOMENTO_APLICAR,GENERO,PRECIO
         ,QUIERO_TECNOLOGIA) :- 
    sirvePara(PRODUCTO,OBJETIVO,GENERO), 
    quererEstaTecnologia(PRODUCTO,QUIERO_TECNOLOGIA,OBJETIVO),
    precioProducto(PRODUCTO,PRECIO),
    recomendadoPara(PRODUCTO,LINEA,PARTE_CUERPO,COMO_ES_PARTE_CUERPO,ESTADO_PARTE_CUERPO),
	cuandoUsarlo(PRODUCTO,MOMENTO_APLICAR).

consulta(P) :-producto(P,_,cabello,liso,nutricion,seco,_,_,1,_).

precio(shampooekosmurumuru,5).

pertenece(shampooekosmurumuru,ekos).
pertenece(shampooekospatua,ekos).
pertenece(shampoonutritivocabelloseco,lumina).
pertenece(acondicionadorpolinutricioncabello,lumina).
pertenece(acondicionadorekosmurumuru,ekos).
pertenece(acondicionadorekospatua,ekos).

puedeUsar(ekos,mujer).
puedeUsar(lumina,mujer).

lineaEspecializado(ekos,nutricion).
lineaEspecializado(ekos,crecimientocapilar).
lineaEspecializado(ekos,fortalecimientocapilar).
lineaEspecializado(ekos,nutricion).
lineaEspecializado(murumuru,reconstruccioncapilar).
lineaEspecializado(lumina,nutricion).

cuandoUsarlo(shampooekosmurumuru,lavado).
cuandoUsarlo(shampooekospatua,lavado).
cuandoUsarlo(shampoonutritivocabelloseco,lavado).
cuandoUsarlo(acondicionadorpolinutricioncabello,lavado).
cuandoUsarlo(acondicionadorekosmurumuru,lavado).
cuandoUsarlo(acondicionadorekospatua,lavado).

usa(shampooekosmurumuru,murumuru).
usa(shampooekospatua,patua).
usa(shampoonutritivocabelloseco,biotegnologiaproteia).
usa(shampoonutritivocabelloseco,nutrirevitalizacion).
usa(acondicionadorpolinutricioncabello,biotegnologiaproteia).
usa(acondicionadorpolinutricioncabello,nutrirevitalizacion).
usa(acondicionadorekospatua,patua).
usa(acondicionadorekosmurumuru,murumuru).


ayuda(murumuru,nutricion).
ayuda(murumuru,fortalecimientocapilar).
ayuda(murumuru,reconstruccioncapilar).
ayuda(patua,fortalecimientocapilar).
ayuda(patua,crecimientocapilar).
ayuda(biotegnologiaproteia,nutricion).
ayuda(nutrirevitalizacion,nutricion).

seAplicaEn(shampooekosmurumuru,cabello,liso).
seAplicaEn(shampooekosmurumuru,cabello,ondulado).
seAplicaEn(shampooekosmurumuru,cabello,rizado).
seAplicaEn(shampooekospatua,cabello,liso).
seAplicaEn(shampooekospatua,cabello,ondulado).
seAplicaEn(shampooekospatua,cabello,rizado).
seAplicaEn(shampoonutritivocabelloseco,cabello,liso).
seAplicaEn(shampoonutritivocabelloseco,cabello,ondulado).
seAplicaEn(shampoonutritivocabelloseco,cabello,rizado).
seAplicaEn(acondicionadorpolinutricioncabello,cabello,liso).
seAplicaEn(acondicionadorpolinutricioncabello,cabello,ondulado).
seAplicaEn(acondicionadorpolinutricioncabello,cabello,rizado).
seAplicaEn(acondicionadorekosmurumuru,cabello,liso).
seAplicaEn(acondicionadorekosmurumuru,cabello,ondulado).
seAplicaEn(acondicionadorekosmurumuru,cabello,rizado).
seAplicaEn(acondicionadorekospatua,cabello,liso).
seAplicaEn(acondicionadorekospatua,cabello,ondulado).
seAplicaEn(acondicionadorekospatua,cabello,rizado).

productosPara(shampooekosmurumuru,cabello,seco).
productosPara(shampooekosmurumuru,cabello,mixto).
productosPara(shampooekospatua,cabello,seco).
productosPara(shampooekospatua,cabello,mixto).
productosPara(shampooekospatua,cabello,graso).
productosPara(shampoonutritivocabelloseco,cabello,seco).
productosPara(acondicionadorpolinutricioncabello,cabello,seco).
productosPara(acondicionadorekosmurumuru,cabello,seco).
productosPara(acondicionadorekosmurumuru,cabello,mixto).
productosPara(acondicionadorekospatua,cabello,seco).
productosPara(acondicionadorekospatua,cabello,mixto).
productosPara(acondicionadorekospatua,cabello,graso).

/*
sirvePara(PRODUCTO,OBJETIVO,GENERO) :- 
    productoEspecializado(PRODUCTO,OBJETIVO),
    usa(PRODUCTO,TECNOLOGIA), 
    ayuda(TECNOLOGIA,OBJETIVO), 
    puedeUsar(GENERO,PRODUCTO).

recomendadoPara(PRODUCTO,LINEA,PARTE_CUERPO,ESTADO_PARTE_CUERPO) :-
    productosPara(PRODUCTO,ESTADO_PARTE_CUERPO),
    recomendadoEn(PRODUCTO,PARTE_CUERPO,ESTADO_PARTE_CUERPO),
    pertenece(PRODUCTO,LINEA).

recomendadoEn(PRODUCTO,PARTE_CUERPO,ESTADO_PARTE_CUERPO) :- 
    seAplicaEn(PRODUCTO,PARTE_CUERPO),
    :-noRecomendadoPara(PRODUCTO,PARTE_CUERPO,ESTADO_PARTE_CUERPO).

precioProducto(PRODUCTO,PRECIO) :- precio(PRODUCTO,X), X @=< PRECIO.
    
producto(PRODUCTO,LINEA,PARTE_CUERPO,OBJETIVO,ESTADO_PARTE_CUERPO,MOMENTO_APLICAR,GENERO,PRECIO) :- 
    sirvePara(PRODUCTO,OBJETIVO,GENERO), 
    cuandoUsarlo(PRODUCTO,MOMENTO_APLICAR),
    recomendadoPara(PRODUCTO,LINEA,PARTE_CUERPO,ESTADO_PARTE_CUERPO),
    precioProducto(PRODUCTO,PRECIO).

pertenece(shampooekosmurumuru,ekos).
pertenece(shampooekospatua,ekos).
pertenece(shampoonutritivocabelloseco,lumina).
pertenece(acondicionadorpolinutricioncabello,lumina).
pertenece(acondicionadorekosmurumuru,ekos).
pertenece(acondicionadorekospatua,ekos).

puedeUsar(ekos,mujer).
puedeUsar(lumina,mujer).

productoEspecializado(ekos,nutricion).
productoEspecializado(ekos,crecimientocapilar).
productoEspecializado(ekos,fortalecimientocapilar).
productoEspecializado(ekos,nutricion).
productoEspecializado(murumuru,reconstruccioncapilar).
productoEspecializado(lumina,nutricion).

cuandoUsarlo(shampooekosmurumuru,lavado).
cuandoUsarlo(shampooekospatua,lavado).
cuandoUsarlo(shampoonutritivocabelloseco,lavado).
cuandoUsarlo(acondicionadorpolinutricioncabello,lavado).
cuandoUsarlo(acondicionadorekosmurumuru,lavado).
cuandoUsarlo(acondicionadorekospatua,lavado).

usa(shampooekosmurumuru,murumuru).
usa(shampooekospatua,patua).
usa(shampoonutritivocabelloseco,biotegnologiaproteia).
usa(shampoonutritivocabelloseco,nutrirevitalizacion).
usa(acondicionadorpolinutricioncabello,biotegnologiaproteia).
usa(acondicionadorpolinutricioncabello,nutrirevitalizacion).
usa(acondicionadorekospatua,patua).
usa(acondicionadorekosmurumuru,murumuru).


ayuda(murumuru,nutricion).
ayuda(murumuru,fortalecimientocapilar).
ayuda(murumuru,reconstruccioncapilar).
ayuda(patua,fortalecimientocapilar).
ayuda(patua,crecimientocapilar).
ayuda(biotegnologiaproteia,nutricion).
ayuda(nutrirevitalizacion,nutricion).

seAplicaEn(shampooekosmurumuru,liso).
seAplicaEn(shampooekosmurumuru,ondulado).
seAplicaEn(shampooekosmurumuru,rizado).
seAplicaEn(shampooekospatua,liso).
seAplicaEn(shampooekospatua,ondulado).
seAplicaEn(shampooekospatua,rizado).
seAplicaEn(shampoonutritivocabelloseco,liso).
seAplicaEn(shampoonutritivocabelloseco,ondulado).
seAplicaEn(shampoonutritivocabelloseco,rizado).
seAplicaEn(acondicionadorpolinutricioncabello,liso).
seAplicaEn(acondicionadorpolinutricioncabello,ondulado).
seAplicaEn(acondicionadorpolinutricioncabello,rizado).
seAplicaEn(acondicionadorekosmurumuru,liso).
seAplicaEn(acondicionadorekosmurumuru,ondulado).
seAplicaEn(acondicionadorekosmurumuru,rizado).
seAplicaEn(acondicionadorekospatua,liso).
seAplicaEn(acondicionadorekospatua,ondulado).
seAplicaEn(acondicionadorekospatua,rizado).

productosPara(shampooekosmurumuru,seco).
productosPara(shampooekosmurumuru,mixto).
productosPara(shampooekospatua,seco).
productosPara(shampooekospatua,mixto).
productosPara(shampooekospatua,graso).
productosPara(shampoonutritivocabelloseco,seco).
productosPara(acondicionadorpolinutricioncabello,seco).
productosPara(acondicionadorekosmurumuru,seco).
productosPara(acondicionadorekosmurumuru,mixto).
productosPara(acondicionadorekospatua,seco).
productosPara(acondicionadorekospatua,mixto).
productosPara(acondicionadorekospatua,graso).
*/