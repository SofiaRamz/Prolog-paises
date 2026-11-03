% Programa completo
% Ruta:consult('c:/escuela/septimo/programacion logica y funcional/unidad tres/Prolog paises.pl'). 

% HECHOS 

% Conocimiento inicial sobre los países 
es_pais(rusia).
es_pais(canada).
es_pais(china).
es_pais(estados_unidos).
es_pais(brasil).
es_pais(australia).
es_pais(mexico).
es_pais(francia).

% Relación de tamaño entre dos países
grande(rusia, canada).
grande(canada, china).
grande(china, estados_unidos).
grande(estados_unidos, brasil).
grande(brasil, australia).
grande(australia, mexico).
grande(mexico, francia).

% Datos sobre idiomas 
habla(mexico, espanol).
habla(estados_unidos, ingles).
habla(australia, ingles).
habla(brasil, portugues).
habla(francia, frances).

% REGLAS 

% RECURSIVAS

% A es mucho más grande que B si es más grande.
mucho_mas_grande(A, B) :- grande(A, B).

% A es mucho más grande que B si A es más grande que X y X es mucho más grande que B.
mucho_mas_grande(A, B) :- grande(A, X), mucho_mas_grande(X, B).


% AND 

% X es un país hispanohablante si es un país y habla español.
pais_hispanohablante(X) :- es_pais(X), habla(X, espanol).

% X es competidor territorial de Y si X es más grande que Y y Y es un país.
competidor_territorial(X, Y) :- grande(X, Y), es_pais(Y).

% X es un país grande que habla inglés si habla inglés y además es más grande que Australia.
pais_ingles_grande(X) :- habla(X, ingles), grande(X, australia).

% X es un país que habla francés si es un país y habla francés.
pais_habla_frances(X) :- es_pais(X), habla(X, frances).


% OR

% X tiene un idioma occidental si habla español o habla inglés.
idioma_occidental(X) :- habla(X, espanol) ; habla(X, ingles).

% X es un país muy grande si es más grande que China o es más grande que Estados Unidos.
pais_muy_grande(X) :- grande(X, china) ; grande(X, estados_unidos).

% X tiene un idioma de origen latino si habla español o habla portugués.
idioma_latino(X) :- habla(X, espanol) ; habla(X, portugues).

% X habla inglés o francés si cumple cualquiera de los dos idiomas.
habla_ingles_o_frances(X) :- habla(X, ingles) ; habla(X, frances).


% ==========================================
% COMPROBACIÓN
% ==========================================

% HECHOS
% ?- es_pais(brasil).
% ?- habla(mexico, espanol).

% REGLAS RECURSIVAS
% ?- mucho_mas_grande(rusia, china).     
% ?- mucho_mas_grande(canada, mexico).   

% REGLAS AND
% ?- pais_hispanohablante(mexico).       
% ?- competidor_territorial(rusia, canada). 
% ?- pais_ingles_grande(estados_unidos). 
% ?- pais_habla_frances(francia).        

% REGLAS OR
% ?- idioma_occidental(australia).       
% ?- pais_muy_grande(canada).            
% ?- idioma_latino(brasil).              
% ?- habla_ingles_o_frances(francia).    

% BÚSQUEDA DE DATOS CON VARIABLES
% ?- habla(X, ingles).
% ?- mucho_mas_grande(X, australia).