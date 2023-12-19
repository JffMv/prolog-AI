sirvePara(PRODUCTO,OBJETIVO) :- 
    productoEspecializado(PRODUCTO,OBJETIVO),
    usa(PRODUCTO,TECNOLOGIA), 
    ayuda(TECNOLOGIA,OBJETIVO).

recomendadoPara(PRODUCTO, LINEA,PARTE_CUERPO, ESTADO_PARTE_CUERPO,GENERO) :-
    puedeUsar(LINEA,GENERO),
    pertenece(PRODUCTO,LINEA),
	recomendadoEn(PRODUCTO, PARTE_CUERPO, ESTADO_PARTE_CUERPO).

recomendadoEn(PRODUCTO,PARTE_CUERPO,ESTADO_PARTE_CUERPO) :- 
    seAplicaEn(PRODUCTO,PARTE_CUERPO),
    noRecomendadoPara(PRODUCTO_MALO,PARTE_CUERPO,ESTADO_PARTE_CUERPO),
 	totalProductos(PRODUCTO,PRODUCTO_MALO,PRODUCTO).
        
totalProductos(RESULTADO, PRODUCTO_MALO, PRODUCTO) :- 
    ( PRODUCTO \= PRODUCTO_MALO -> RESULTADO = PRODUCTO ; false).

precioProducto(PRODUCTO,PRECIOMAXIMO) :- precio(PRODUCTO,X), X @=< PRECIOMAXIMO.
    
producto(PRODUCTO,LINEA,PARTE_CUERPO,OBJETIVO,ESTADO_PARTE_CUERPO,MOMENTO_APLICAR,GENERO,PRECIOMAXIMO) :- 
    sirvePara(PRODUCTO,OBJETIVO), 
    cuandoUsarlo(PRODUCTO,MOMENTO_APLICAR),
    recomendadoPara(PRODUCTO,LINEA,PARTE_CUERPO,ESTADO_PARTE_CUERPO,GENERO),
    precioProducto(PRODUCTO,PRECIOMAXIMO).

consulta(RESULTADO):-setof(P,producto(P,_,pelo,nutricion,liso_graso,_,_,1000000000),RESULTADO).

pertenece(shampooekosmurumuru,ekos_murumuru). 
pertenece(shampooekospatua,ekos_patua). 
pertenece(shampoonutritivocabelloseco,lumina). 
pertenece(acondicionadorpolinutricioncabello,lumina). 
pertenece(acondicionadorekosmurumuru,ekos_murmuru). 
pertenece(acondicionadorekospatua,ekos_patua). 
pertenece(shampoocremoso,lumina). 
pertenece(acondicionadorhidratante,lumina). 
pertenece(mascararecuperadora,lumina). 
pertenece(shampoo2en1,homem). 
pertenece(shampoocontrolgrasa,homem). 
pertenece(jabon_crema_limpieza_hidratante,chronos).
pertenece(exfoliante_antiseñales,chronos).
pertenece(acqua_bihidratante_renovador,chronos).
pertenece(serum_intensivo_para_bolsas_ojeras,chronos).
pertenece(jabon_limpieza_purificante_antioleosidad,chronos).
pertenece(protector_solar_facial_en_gel_fps_50,fotoequilibrio).
pertenece(protector_solar_facial_en_gel_crema_fps_50,fotoequilibrio).

seAplicaEn(shampooekosmurumuru,pelo).
seAplicaEn(shampooekospatua,pelo). 
seAplicaEn(shampoonutritivocabelloseco,pelo). 
seAplicaEn(acondicionadorpolinutricioncabello,pelo). 
seAplicaEn(acondicionadorekosmurumuru,pelo). 
seAplicaEn(acondicionadorekospatua,pelo). 
seAplicaEn(shampoocremoso,pelo). 
seAplicaEn(acondicionadorhidratante,pelo). 
seAplicaEn(mascararecuperadora,pelo). 
seAplicaEn(shampoo2en1,pelo). 
seAplicaEn(shampoocontrolgrasa,pelo). 
seAplicaEn(jabon_crema_limpieza_hidratante,cara).
seAplicaEn(exfoliante_antiseñales,cara).
seAplicaEn(acqua_bihidratante_renovador,cara).
seAplicaEn(serum_intensivo_para_bolsas_ojeras,cara).
seAplicaEn(jabon_limpieza_purificante_antioleosidad,cara).
seAplicaEn(protector_solar_facial_en_gel_fps_50,cara).
seAplicaEn(protector_solar_facial_en_gel_crema_fps_50,cara).

  

puedeUsar(ekos_patua,hombre).
puedeUsar(ekos_patua,mujer).
puedeUsar(ekos_murumuru,mujer). 
puedeUsar(lumina,mujer). 
puedeUsar(homem,hombre). 
puedeUsar(chronos,hombre).
puedeUsar(chronos,mujer).
puedeUsar(fotoequilibrio,hombre).
puedeUsar(fotoequilibrio,mujer).

precio(shampooekosmurumuru,43500).
precio(shampooekosmurumuru,43500).
precio(shampooekosmurumuru,36400).
precio(acondicionadorpolinutricioncabello,36400).
precio(acondicionadorekosmurumuru,43500).
precio(acondicionadorekospatua,43500).
precio(shampoocremoso,36400).
precio(acondicionadorhidratante,36400).
precio(mascararecuperadora,54600).
precio(shampoo2en1,35700).
precio(shampoocontrolgrasa,35700). 
precio(jabon_crema_limpieza_hidratante,43900).
precio(exfoliante_antiseñales,51100).
precio(acqua_bihidratante_renovador,115400).
precio(serum_intensivo_para_bolsas_ojeras,120900).
precio(jabon_limpieza_purificante_antioleosidad,43900).
precio(protector_solar_facial_en_gel_fps_50,69900).
precio(protector_solar_facial_en_gel_crema_fps_50,69900).






productoEspecializado(shampooekosmurumuru,nutricion).
productoEspecializado(shampooekosmurumuru,reconstruccioncapilar).
productoEspecializado(shampooekospatua,crecimientocapilar).
productoEspecializado(shampooekospatua,fortalecimientocapilar).
productoEspecializado(shampooekospatua,reconstruccioncapilar).
productoEspecializado(shampoonutritivocabelloseco,frizz).
productoEspecializado(shampoonutritivocabelloseco,nutricion).
productoEspecializado(shampoonutritivocabelloseco,reconstruccioncapilar).
productoEspecializado(acondicionadorpolinutricioncabello,reconstruccioncapilar).
productoEspecializado(acondicionadorpolinutricioncabello,nutricion).
productoEspecializado(acondicionadorpolinutricioncabello,frizz).
productoEspecializado(acondicionadorekosmurumuru,nutricion).
productoEspecializado(acondicionadorekosmurumuru,hidratacion).
productoEspecializado(acondicionadorekospatua,frizz).
productoEspecializado(acondicionadorekospatua,fortalecimientocapilar).
productoEspecializado(acondicionadorekospatua,crecimientocapilar).
productoEspecializado(acondicionadorekospatua,reconstruccioncapilar).
productoEspecializado(shampoocremoso,rizos).
productoEspecializado(shampoocremoso,hidratacion).
productoEspecializado(shampoocremoso,frizz).
productoEspecializado(shampoocremoso,reconstruccioncapilar).
productoEspecializado(acondicionadorhidratante,reconstruccioncapilar).
productoEspecializado(acondicionadorhidratante,hidratacion).
productoEspecializado(acondicionadorhidratante,frizz).
productoEspecializado(mascararecuperadora,frizz).
productoEspecializado(mascararecuperadora,hidratacion).
productoEspecializado(mascararecuperadora,rizos).
productoEspecializado(mascararecuperadora,reconstruccioncapilar).
productoEspecializado(shampoo2en1,reconstruccioncapilar).
productoEspecializado(shampoo2en1,fortalecimientocapilar).
productoEspecializado(shampoocontrolgrasa,antioleosidad).
productoEspecializado(jabon_crema_limpieza_hidratante,hidratacion).
productoEspecializado(jabon_crema_limpieza_hidratante,limpieza).
productoEspecializado(exfoliante_antiseñales,exfolacion).
productoEspecializado(exfoliante_antiseñales,antiseñales).
productoEspecializado(acqua_bihidratante_renovador,hidratacion).
productoEspecializado(serum_intensivo_para_bolsas_ojeras,hidratacion).
productoEspecializado(serum_intensivo_para_bolsas_ojeras,pielcansada).
productoEspecializado(jabon_limpieza_purificante_antioleosidad,limpieza).
productoEspecializado(jabon_limpieza_purificante_antioleosidad,antioleosidad).
productoEspecializado(protector_solar_facial_en_gel_fps_50,proteccion_solar).
productoEspecializado(protector_solar_facial_en_gel_crema_fps_50,69900).

cuandoUsarlo(shampooekosmurumuru,lavado). 
cuandoUsarlo(shampooekospatua,lavado). 
cuandoUsarlo(shampoonutritivocabelloseco,lavado). 
cuandoUsarlo(acondicionadorpolinutricioncabello,lavado). 
cuandoUsarlo(acondicionadorekosmurumuru,lavado). 
cuandoUsarlo(acondicionadorekospatua,lavado). 
cuandoUsarlo(shampoocremoso,lavado). 
cuandoUsarlo(acondicionadorhidratante,lavado). 
cuandoUsarlo(mascararecuperadora,tratamiento). 
cuandoUsarlo(shampoo2en1,lavado). 
cuandoUsarlo(shampoocontrolgrasa,lavado). 
cuandoUsarlo(jabon_crema_limpieza_hidratante,dia).
cuandoUsarlo(jabon_crema_limpieza_hidratante,noche).
cuandoUsarlo(exfoliante_antiseñales,dia).
cuandoUsarlo(exfoliante_antiseñales,noche).
cuandoUsarlo(acqua_bihidratante_renovador,dia).
cuandoUsarlo(acqua_bihidratante_renovador,noche).
cuandoUsarlo(serum_intensivo_para_bolsas_ojeras,noche).
cuandoUsarlo(jabon_limpieza_purificante_antioleosidad,dia).
cuandoUsarlo(jabon_limpieza_purificante_antioleosidad,noche).
cuandoUsarlo(protector_solar_facial_en_gel_fps_50,dia).
cuandoUsarlo(protector_solar_facial_en_gel_crema_fps_50,dia).



usa(shampooekosmurumuru,murumuru). 
usa(shampooekospatua,patua). 
usa(shampoonutritivocabelloseco,biotegnologiaproteia). 
usa(shampoonutritivocabelloseco,nutrirevitalizacion). 
usa(acondicionadorpolinutricioncabello,biotegnologiaproteia). 
usa(acondicionadorpolinutricioncabello,nutrirevitalizacion). 
usa(acondicionadorekospatua,patua). 
usa(acondicionadorekosmurumuru,murumuru). 
usa(shampoocremoso,biotegnologiaproteia). 
usa(shampoocremoso,chia). 
usa(shampoocremoso,linaza). 
usa(acondicionadorhidratante,linaza). 
usa(acondicionadorhidratante,chia). 
usa(acondicionadorhidratante,oleodericino). 
usa(mascararecuperadora,biotegnologiaproteia). 
usa(mascararecuperadora,chia). 
usa(mascararecuperadora,linaza). 
usa(mascararecuperadora,oleodericino). 
usa(shampoo2en1,murumuru). 
usa(shampoocontrolgrasa,biotegnologiaproteia). 
usa(shampoocontrolgrasa,nutrirevitalizacion). 
usa(jabon_crema_limpieza_hidratante,prebiotico). 
usa(exfoliante_antiseñales,microesferas_bambu).
usa(exfoliante_antiseñales,acido_gucouco).
usa(acqua_bihidratante_renovador,acqua).
usa(serum_intensivo_para_bolsas_ojeras,cafeina).
usa(jabon_limpieza_purificante_antioleosidad,candia).
usa(protector_solar_facial_en_gel_fps_50,fotoequilibrio).
usa(protector_solar_facial_en_gel_crema_fps_50,fotoequilibrio).

  

  

ayuda(murumuru,nutricion). 
ayuda(murumuru,fortalecimientocapilar). 
ayuda(murumuru,reconstruccioncapilar). 
ayuda(patua,fortalecimientocapilar). 
ayuda(patua,crecimientocapilar). 
ayuda(biotegnologiaproteia,nutricion). 
ayuda(nutrirevitalizacion,nutricion). 
ayuda(biotegnologiaproteia,frizz). 
ayuda(biotegnologiaproteia,rizos). 
ayuda(chia,hidratacion). 
ayuda(linaza,hidratacion). 
ayuda(chia,reconstruccioncapilar). 
ayuda(linaza,reconstruccioncapilar). 
ayuda(oleodericino,reconstruccioncapilar). 
ayuda(oleodericino,hidratacion). 
ayuda(biotegnologiaproteia,fortalecimientocapilar). 
ayuda(biotegnologiaproteia,antioleosidad).
ayuda(prebiotico,hidratacion).
ayuda(prebiotico,limpieza).
ayuda(microesferas_bambu,exfolacion).
ayuda(microesferas_bambu,antiseñales).
ayuda(acido_gucouco,exfolacion).
ayuda(acido_gucouco,antiseñales).
ayuda(acqua,hidratacion).
ayuda(serum_intensivo_para_bolsas_ojeras,cafeina).
ayuda(candia,limpieza).
ayuda(candia,antioleosidad).
ayuda(fotoequilibrio,proteccion_solar).
  
noRecomendadoPara(shampooekosmurumuru,pelo,liso_graso).
noRecomendadoPara(shampooekosmurumuru,pelo,ondulado_graso).
noRecomendadoPara(shampooekosmurumuru,pelo,rizado_graso).
noRecomendadoPara(shampoonutritivocabelloseco,pelo,rizado_graso).
noRecomendadoPara(shampoonutritivocabelloseco,pelo,liso_graso).
noRecomendadoPara(shampoonutritivocabelloseco,pelo,ondulado_graso).
noRecomendadoPara(shampoonutritivocabelloseco,pelo,rizado_mixto).
noRecomendadoPara(shampoonutritivocabelloseco,pelo,liso_mixto).
noRecomendadoPara(shampoonutritivocabelloseco,pelo,ondulado_mixto).
noRecomendadoPara(acondicionadorpolinutricioncabello,pelo,rizado_graso).
noRecomendadoPara(acondicionadorpolinutricioncabello,pelo,liso_graso).
noRecomendadoPara(acondicionadorpolinutricioncabello,pelo,ondulado_graso).
noRecomendadoPara(acondicionadorpolinutricioncabello,pelo,rizado_mixto).
noRecomendadoPara(acondicionadorpolinutricioncabello,pelo,liso_mixto).
noRecomendadoPara(acondicionadorpolinutricioncabello,pelo,ondulado_mixto).
noRecomendadoPara(acondicionadorekosmurumuru,pelo,liso_graso).
noRecomendadoPara(acondicionadorekosmurumuru,pelo,ondulado_graso).
noRecomendadoPara(acondicionadorekosmurumuru,pelo,rizado_graso).
noRecomendadoPara(shampoocremoso,pelo,liso_graso).
noRecomendadoPara(shampoocremoso,pelo,ondulado_graso).
noRecomendadoPara(shampoocremoso,pelo,rizado_graso).
noRecomendadoPara(acondicionadorhidratante,pelo,liso_graso).
noRecomendadoPara(acondicionadorhidratante,pelo,ondulado_graso).
noRecomendadoPara(acondicionadorhidratante,pelo,rizado_graso).
noRecomendadoPara(mascararecuperadora,pelo,liso_graso).
noRecomendadoPara(mascararecuperadora,pelo,ondulado_graso).
noRecomendadoPara(mascararecuperadora,pelo,rizado_graso).
noRecomendadoPara(shampoocontrolgrasa,pelo,liso_mixto).
noRecomendadoPara(shampoocontrolgrasa,pelo,liso_seco).
noRecomendadoPara(shampoocontrolgrasa,pelo,ondulado_mixto).
noRecomendadoPara(shampoocontrolgrasa,pelo,ondulado_seco).
noRecomendadoPara(shampoocontrolgrasa,pelo,rizado_mixto).
noRecomendadoPara(shampoocontrolgrasa,pelo,rizado_seco).
noRecomendadoPara(jabon_crema_limpieza_hidratante,cara,mixta).
noRecomendadoPara(jabon_crema_limpieza_hidratante,cara,grasa).
noRecomendadoPara(jabon_limpieza_purificante_antioleosidad,cara,seca).
noRecomendadoPara(jabon_limpieza_purificante_antioleosidad,cara,normal).
noRecomendadoPara(protector_solar_facial_en_gel_fps_50,cara,seca).
noRecomendadoPara(protector_solar_facial_en_gel_fps_50,cara,normal).
noRecomendadoPara(protector_solar_facial_en_gel_crema_fps_50,cara,mixta).
noRecomendadoPara(protector_solar_facial_en_gel_crema_fps_50,cara,grasa).
