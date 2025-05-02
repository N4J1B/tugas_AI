% =====================
% GENERASI 1 (Paling Tua)
% =====================
pria(andi).
wanita(tina).

pasangan(andi, tina).

% =====================
% GENERASI 2 (Anak Andi & Tina)
% =====================
pria(fajar).
wanita(sekar).
wanita(dita).
pria(budi).
wanita(sari).
pria(yanto).

pasangan(fajar, sekar).
pasangan(dita, budi).
pasangan(sari, yanto).

anak(fajar, andi).
anak(fajar, tina).
anak(dita, andi).
anak(dita, tina).
anak(sari, andi).
anak(sari, tina).

% =====================
% GENERASI 3 (Cucu Andi & Tina)
% =====================
pria(ruslan).
wanita(cika).
pria(riki).
wanita(dwi).

wanita(siti).
pria(cahyo).

pria(putra).
wanita(lisa).
pria(dendi).
wanita(cantika).

pasangan(ruslan, cika).
pasangan(cahyo, siti).
pasangan(putra, lisa).
pasangan(dendi, cantika).

anak(ruslan, fajar).
anak(ruslan, sekar).
anak(riki, fajar).
anak(riki, sekar).
anak(dwi, fajar).
anak(dwi, sekar).

anak(siti, dita).
anak(siti, budi).
anak(cahyo, dita).
anak(cahyo, budi).

anak(putra, sari).
anak(putra, yanto).
anak(lisa, sari).
anak(lisa, yanto).
anak(dendi, sari).
anak(dendi, yanto).

% =====================
% GENERASI 4 (Cicit Andi & Tina)
% =====================
wanita(puspa).
wanita(ayu).
wanita(mega).
pria(eko).
wanita(nina).
pria(ferdi).
pria(kevin).
wanita(bella).

anak(puspa, ruslan).
anak(puspa, cika).
anak(ayu, ruslan).
anak(ayu, cika).

anak(mega, cahyo).
anak(mega, siti).
anak(eko, cahyo).
anak(eko, siti).
anak(nina, cahyo).
anak(nina, siti).

anak(ferdi, putra).
anak(ferdi, lisa).

anak(kevin, dendi).
anak(kevin, cantika).
anak(bella, dendi).
anak(bella, cantika).

% =====================
% ATURAN RELASI KELUARGA
% =====================

% Ayah dan Ibu
ayah(X, Y) :- pria(X), anak(Y, X).
ibu(X, Y) :- wanita(X), anak(Y, X).

% Saudara kandung
saudara(X, Y) :- anak(X, Z), anak(Y, Z), X \= Y.

% Kakek dan Nenek
kakek(X, Y) :- pria(X), anak(Z, X), anak(Y, Z).
nenek(X, Y) :- wanita(X), anak(Z, X), anak(Y, Z).

% Cucu
cucu(X, Y) :- anak(X, Z), anak(Z, Y).

% Pasangan simetris
pasangan(X, Y) :- pasangan(Y, X).
