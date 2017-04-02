
% Sistemas de Representação de Conhecimento e Raciocínio - Exercício 2
% Grupo 1

% Adriana Guedes
% Marco Aurélio Barbosa
% Guilherme Guerreiro
% Ricardo Certo

%-----------------------------------------------------------------------
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------------------------------------------------------------------
% Definição de invariante

:- op(900,xfy,'::').

% -------------------------------------------------------------------------------------------
% BASE DE CONHECIMENTO
%--------------------------------------------------------------------------------------------
% Base de conhecimento com informação sobre cuidado prestado, ato médico , utente


:- dynamic(utente/6).
:- dynamic(cuidado_prestado/4).
:- dynamic(atos/6).

% --------------------------------------------------------------
% Extensao do predicado utente : IdUt, Nome, Idade, Rua, Cidade, Contacto-> { V, F , D }

utente( 1,'Carlos',35,'Rua D.Pedro V','Braga','253456789').
utente( 2,'Joao',12,'Rua da Ramada','Guimaraes','929876543').
utente( 3,'Julio',89,'Rua das Victorias','Guimaraes','935436789').
utente( 4,'Ana',25,'Rua Conde Almoster','Lisboa','913456789').
utente( 5,'Carolina',50,'Rua do Caires','Braga','253987654').
utente( 6,'Joana',26,'Av.da Boavista','Porto','961234567').
utente( 7,'Fernando',65,'Rua do Loureiro','Viana do Castelo','966668569').
utente( 8,'Rute',18,'Av. da Liberdade','Braga','916386423').
utente( 9,'Maciel',45,rua_desconhecida,cidade_desconhecida,'935731290').
utente( 10,'Filipa',35,rua_desconhecida,cidade_desconhecida,contacto_desconhecido).
utente( 11,'Mauro',76,'Rua Gil Vicente','Montalegre',contacto_desconhecido).
utente( 12,'Laura',90,'Rua Fernando Mendes',cidade_desconhecida,'244000045').
utente( 13,'Jaime',50,rua_desconhecida,'Barcelos','914768180').
utente( 14,'Lourenço',idade_desconhecida,'Rua da Boavista','Guimaraes','926306127').
utente( 15,nome_desconhecido,16,'Rua Monsenhor de Melo','Vilamoura','936150873').


% --------------------------------------------------------------
% Extensao do predicado cuidado_prestado: IdServ, Descrição, Instituição, Cidade -> { V, F, D }

cuidado_prestado( 1,'Pediatria','Hospital Privado de Braga','Braga').
cuidado_prestado( 2,'Cardiologia','Hospital de Braga','Braga').
cuidado_prestado( 3,'Ortopedia','Hospital de Braga','Braga').
cuidado_prestado( 4,'Oftalmologia','Hospital de Braga','Braga').
cuidado_prestado( 5,'Oncologia','IPO','Porto').
cuidado_prestado( 6,'Urgência','Hospital de Santa Maria','Porto').
cuidado_prestado( 7,'Urgência','Hospital da Luz','Guimaraes').
cuidado_prestado( 8,'Neurologia','Centro Hospitalar Sao Joao','Porto').
cuidado_prestado( 9,'Urgência','Hospital de Braga','Braga').
cuidado_prestado( 10,'Urgência','Hospital Lusiadas','Faro').
cuidado_prestado( 11,'Otorrinolaringologia','Hospital de Vila Real','Vila Real').
cuidado_prestado( 12,'Podologia',instituicao_desconhecida,'Vila Real').


% --------------------------------------------------------------
% Extensao do predicado ato_medico:  Data, IdUt, IdServ, CorPulseira, Médico, Custo -> { V, F, D }

atos( '02-01-17', 15, 10, 'Verde', 'Dra.Sara', 17.5).
atos( '24-02-17', 8, 4, 'Sem_pulseira', 'Dr.Mourao', 4).
atos( '25-02-17', 1, 2, 'Sem_pulseira', 'Dr.Barroso', 12).
atos( '28-01-17', 13, 9, 'Laranja', 'Dr.Tomas', 5).
atos( '10-02-17', 4, 3, 'Sem_pulseira', 'Dr.Falcão', 20).
atos( '19-03-17', 3, 8, 'Amarela', 'Dr.Bones', 50).
atos( '11-01-17', 1, 1, 'Sem_pulseira', 'Dr.Pardal', 2).
atos( '12-02-17', 5, 8, 'Sem_pulseira', 'Dra.Teresa', 13.75).
atos( '20-03-17', 11, 11, 'Sem_pulseira', 'Dra.Marta', 13).
atos( '27-01-17', 2, 7, 'Amarela', 'Dr.Pedro Martins', 11).
atos( '01-01-17', 6, 6, 'Laranja', 'Dr.Reveillon', 50).
atos( '03-03-17', 3, 1, 'Sem_pulseira', 'Dra.Candida', 45).
atos( '08-03-17', 9, 9, 'Vermelha', 'Dr.Lima', 50).
atos( '14-02-17', 14, 7, 'Amarela', 'Dra.Mafalda', 23).
atos( '30-01-17', 7, 5, cor_desconhecida, 'Dr.Quimio', custo_desconhecido).
atos( '01-02-17', 1, 6, 'Verde', 'Dra.Luisa', custo_desconhecido).
atos( '01-03-17', 10, 6, 'Verde', medico_desconhecido, 25.5).
atos( '10-03-17', 12, 11, cor_desconhecida, 'Dr.Luis', 12.50).


% --------------------------------------------------------------


-utente(Id,Nome,Idade,Morada) :-
		nao(utente(Id,Nome,Idade,Morada)) ,
		nao(excecao(utente(Id,Nome,Idade,Morada))).


-atos(D,IdUt,IdServ,C,M,Ct) :- 
	  nao(atos(D,IdUt,IdServ,C,M,Ct)) , 
	  nao(excecao(atos(D,IdUt,IdServ,C,M,Ct))).


-cuidado_prestado(Id,D,I,C) :- 
				nao(cuidado_prestado(Id,D,I,C)) ,
				nao(cuidado_prestado(excecao(Id,D,I,C))).

% --------------------------------------------------------------
% 
% --------------------------------------------------------------

% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}

demo( Questao,verdadeiro ) :- Questao.
demo( Questao, falso ) :- -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( R ) :- R, !, fail.
nao( R ).

evolucao( Termo ) :-
    solucoes( Invariante,+Termo::Invariante,Lista ),
    insercao( Termo ),
    teste( Lista ).

insercao( Termo ) :-
    assert( Termo ).
insercao( Termo ) :-
    retract( Termo ),!,fail.

teste( [] ).
teste( [R|LR] ) :-
    R,
    teste( LR ).

solucoes( X,Y,Z ) :-
    findall( X,Y,Z ).

comprimento( S,N ) :-
    length( S,N ).

% ///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%					    INVARIANTES
% ///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% Invariante Estrutural para utente:
% (não permite a inserção de conhecimento repetido)

+utente(I,Nome,IDD,RU,CDD,CNT) :: (solucoes(I,(utente(I,_,_,_,_,_)),L),
                        comprimento(L,N),
                        N == 1).


% --------------------------------------------------------------
% Invariante Estrutural para cuidado_prestado:
% (não permite a inserção de conhecimento repetido)

+cuidado_prestado(ID,D,I,X) ::(solucoes(ID,(cuidado_prestado(ID,_,_,_)),L),
                                comprimento(L,N),
                                 N == 1).

% --------------------------------------------------------------
% Invariante Estrutural para cuidado_prestado:
% não permite a inserção de conhecimento repetido

+atos(D,IDUT,IDS,CP,MDC,C) :: (solucoes((D,IDUT,IDS),(atos(D,IDUT,IDS,_,_,_)),L),
                              comprimento(L,N),
                              N == 1).

% ---------------------------------------------------------
% Invariante que certifica a existência de um ID de utente e de um ID servico

+atos(D,IDUT,IDS,CP,MDC,C) :: (utente(IDUT,_,_,_,_,_),
                              cuidado_prestado(IDS,_,_,_)).


% ///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%					CONHECIMENTO INTERDITO
% ///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% utente 16 tem contacto que ninguém pode conhecer

utente( 16,'Djalo',30,'Rua Tangente II','Arouca',nxpto).
excecao(utente(I,N,Id,R,C,Ct)) :- utente(I,N,Id,R,C,nxpto).
nulo(nxpto).
+utente(I,N,Id,R,C,Ct) :: (solucoes((I,N,Id,R,C,Ct), (utente(16,'Djalo',30,'Rua Tangente II','Arouca',Ct),nao(nulo(Ct))),S), 
							comprimento( S,N ) ,
							N == 0).

% ///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%					CONHECIMENTO IMPRECISO
% ///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% um ato pode ter custado 50 ou 150 euros
excecao(atos( '1-03-17', 12, 11, 'Sem_pulseira', 'Dr.Luisa', 50)).
excecao(atos( '1-03-17', 12, 11, 'Sem_pulseira', 'Dr.Luisa', 150)).


% ///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%					CONHECIMENTO INCERTO
% ///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% UTENTES -----------------------------------------------------
% nome desconhecido
excecao(utente(I,N,Idd,R,C,Con)) :- 
		utente(I,nome_desconhecido,Idd,R,C,Con).

% idade desconhecida
excecao(utente(I,N,Idd,R,C,Con)) :- 
		utente(I,N,idade_desconhecida,R,C,Con).

% rua desconhecida
excecao(utente(I,N,Idd,R,C,Con)) :- 
		utente(I,N,Idd,rua_desconhecida,C,Con).

% cidade desconhecida
excecao(utente(I,N,Idd,R,C,Con)) :- 
		utente(I,N,Idd,R,cidade_desconhecida,Con).

% contacto desconhecido
excecao(utente(I,N,Idd,R,C,Con)) :- 
		utente(I,N,Idd,R,C,contacto_desconhecido).

% rua , cidade e contacto desconhecidos
excecao(utente(I,N,Idd,R,C,Con)) :- 
		utente(I,N,Idd,rua_desconhecida,cidade_desconhecida,contacto_desconhecido).

% rua e cidade desconhecidos
excecao(utente(I,N,Idd,R,C,Con)) :- 
		utente(I,N,Idd,rua_desconhecida,cidade_desconhecida,Con).


% ATOS ---------------------------------------------------------------


% Cor Pulseira desconhecida
excecao(atos(D,IdUt,IdServ,C,M,Ct)) :-
		 atos(D,IdUt,IdServ,cor_desconhecida,M,Ct).

% Médico desconhecido
excecao(atos(D,IdUt,IdServ,C,M,Ct)) :-
		 atos(D,IdUt,IdServ,C,medico_desconhecido,Ct).

% Custo Desconhecido  
excecao(atos(D,IdUt,IdServ,C,M,Ct)) :-
		 atos(D,IdUt,IdServ,C,M,custo_desconhecido).

% Pulseira e custo desconhecidos
excecao(atos(D,IdUt,IdServ,C,M,Ct)) :-
		 atos(D,IdUt,IdServ,cor_desconhecida,M,custo_desconhecido).


% CUIDADOS PRESTADOS --------------------------------------------------


% Instituição desconhecida
excecao(cuidado_prestado(Id,D,I,C)) :- 
			cuidado_prestado(Id,D,instituicao_desconhecida,C).
