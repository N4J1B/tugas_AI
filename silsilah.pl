%Fakta-fakta
perempuan(tina).
perempuan(sekar).
perempuan(dita).
perempuan(sari).
perempuan(dwi).
perempuan(siti).
perempuan(lisa).
perempuan(cantika).
perempuan(cika).
perempuan(puspa).
perempuan(ayu).
perempuan(mega).
perempuan(nina).
perempuan(bella).

laki(andi).
laki(fajar).
laki(budi).
laki(yanto).
laki(ruslan).
laki(riki).
laki(cahyo).
laki(putra).
laki(dendi).
laki(eko).
laki(ferdi).
laki(kevin).

% Generasi 2 (Anak Andi dan Tina)
anak(budi, andi).  % Budi adalah anak dari Andi
anak(budi, tina).  % Budi adalah anak dari Tina
anak(sari, andi).  % Sari adalah anak dari Andi
anak(sari, tina).  % Sari adalah anak dari Tina
anak(sekar, andi).  % Sekar adalah anak dari Andi
anak(sekar, tina).  % Sekar adalah anak dari Tina

% Generasi 3 (Cucu Andi dan Tina)
anak(ruslan, fajar).  % Ruslan adalah anak dari Fajar
anak(ruslan, sekar).  % Ruslan adalah anak dari Sekar
anak(riki, fajar).    % Riki adalah anak dari Fajar
anak(riki, sekar).    % Riki adalah anak dari Sekar

anak(cahyo, dita).    % Cahyo adalah anak dari Dita
anak(cahyo, budi).    % Cahyo adalah anak dari Budi

anak(lisa, Sari).      % lisa adalah anak dari Sari
anak(lisa, Yanto).     % lisa adalah anak dari Yanto
anak(dendi, Sari).      % Dendi adalah anak dari Sari
anak(dendi, Yanto).     % Dendi adalah anak dari Yanto

% Generasi 4 (Cicit Andi dan Tina)
anak(puspa, ruslan). % Puspa adalah anak dari Ruslan
anak(puspa, cika).   % Puspa adalah anak dari Cika
anak(ayu, ruslan).   % Ayu adalah anak dari Ruslan
anak(ayu, cika).     % Ayu adalah anak dari Cika

anak(mega, cahyo).   % Mega adalah anak dari Cahyo
anak(mega, siti).    % Mega adalah anak dari Siti
anak(eko, cahyo).    % Eko adalah anak dari Cahyo
anak(eko, siti).     % Eko adalah anak dari Siti
anak(nina, cahyo).   % Nina adalah anak dari Cahyo
anak(nina, siti).    % Nina adalah anak dari Siti

anak(ferdi, putra).  % Ferdi adalah anak dari Putra
anak(ferdi, lisa).   % Ferdi adalah anak dari Lisa

anak(kevin, dendi).  % Kevin adalah anak dari Dendi
anak(kevin, cantika).% Kevin adalah anak dari Cantika
anak(bella, dendi).  % Bella adalah anak dari Dendi
anak(bella, cantika).% Bella adalah anak dari Cantika

%Rules
perempuan(X) :- \+ laki(X).

%relasi orangtua
orangTua(X, Y) :- anak(Y, X).
ayah(X, Y) :- orangTua(X, Y), laki(X).
ibu(X, Y) :- orangTua(X, Y), perempuan(X).
istri(X, Y) :- ibu(X, Z), ayah(Y, Z).
suami(X, Y) :- ayah(X, Z), ibu(Y, Z). 

%relasi saudara kandung
saudara(X, Y) :- orangTua(Z, X), orangTua(Z, Y), X \= Y.
saudaraLaki(X, Y) :- saudara(X, Y), laki(X).
saudaraPerempuan(X, Y) :- saudara(X, Y), perempuan(X).

%relasi paman dan bibi, keponakan
paman(X, Y) :- orangTua(X, Z), saudaraLaki(Z, Y).
bibi(X, Y) :- orangTua(X, Z), saudaraPerempuan(Z, Y).
ponakan(X, Y) :- orangTua(Z, X), (saudaraLaki(Y, Z); saudaraPerempuan(Y, Z)).
ponakanLaki :- ponakan(X, Y), laki(X).
ponakanPerempuan :- ponakan(X, Y), perempuan(X).


%relasi sepupu 

%relasi menantu mertua ipar

%relasi suami istri

%relasi kakek buyut nenek buyut


%relasi kakek dan nenek
kakek(X, Y) :- pria(X), anak(Z, X), anak(Y, Z).
nenek(X, Y) :- wanita(X), anak(Z, X), anak(Y, Z).