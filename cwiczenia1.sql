-- ZAPYTANIA AGREGUJĄCE SQL


-- zad 1
SELECT count(g) as 'Liczba grup', g as 'Grupa', tytul
FROM PlanWMI
GROUP BY tytul, g;

-- zad 1a
SELECT count(g) as 'Liczba grup', g as 'Grupa', tytul, f
FROM PlanWMI
GROUP BY tytul, g, f;

-- zad 2
SELECT count(g) as 'Liczba grup', dzien, sem
from PlanWMI
GROUP BY sem, dzien
order by dzien;

-- zad 2a
SELECT count(g) as 'Liczba grup', dzien, sem, f
from PlanWMI
GROUP BY sem, dzien, f
order by dzien;

-- zad 3
SELECT count(g) as 'Liczba zajęć w danym dniu', dzien
FROM PlanWMI
GROUP BY dzien
ORDER BY dzien;

-- zad 4a
SELECT count(g) as 'Liczba zajęć', imie, nazwisko, left(sem, 4)
FROM PlanWMI
GROUP BY imie, nazwisko, left(sem, 4);

-- zad 4b
SELECT count(g) as 'Liczba zajęć', sum(godzin) as 'Suma godzin',  imie, nazwisko, left(sem, 4) as 'Rok'
from PlanWMI
GROUP BY imie, nazwisko, left(sem, 4);

-- zad 4c
SELECT count(g) as 'Liczba zajęć', sum(godzin) as 'Suma godzin',  imie, nazwisko, sem
from PlanWMI
GROUP BY imie, nazwisko, sem;

-- zad 4d
SELECT count(g) as 'Liczba zajęć', sum(godzin) as 'Suma godzin',  imie, nazwisko, sem, f
from PlanWMI
GROUP BY imie, nazwisko, sem, f;

-- zad 5a
SELECT [nazwa  przedmiotu                                    ], imie, nazwisko,  left(sem, 4) as 'Rok'
FROM PlanWMI
GROUp BY imie, nazwisko, [nazwa  przedmiotu                                    ],  left(sem, 4);

-- zad 5b
SELECT [nazwa  przedmiotu                                    ], sum(godzin) as 'Liczba godzin', imie, nazwisko, left(sem, 4) as 'Rok'
FROM PlanWMI
GROUp BY imie, nazwisko, [nazwa  przedmiotu                                    ], left(sem, 4);

-- zad 5c
SELECT [nazwa  przedmiotu                                    ], sum(godzin) as 'Liczba godzin', imie, nazwisko, sem
FROM PlanWMI
GROUp BY imie, nazwisko, [nazwa  przedmiotu                                    ], sem;

-- zad 5d
SELECT [nazwa  przedmiotu                                    ], sum(godzin) as 'Liczba godzin', imie, nazwisko, sem, f
FROM PlanWMI
GROUp BY imie, nazwisko, [nazwa  przedmiotu                                    ], sem, f;

-- zad 6
DECLARE @ROK integer
SET @ROK = 2011;
DECLARE @NAZWISKO varchar(50)
SET @NAZWISKO = 'Nawrocki';

SELECT  *
FROM PlanWMI
WHERE left(sem, 4) =@rok and nazwisko =@NAZWISKO;

-- zad 7
SELECT count(zaj), dzien, sem, godz_od as 'godzina'
FROM PlanWMI
GROUP BY godz_od, dzien, sem
ORDER BY  dzien;

-- zad 8
SELECT dzien, sem, mc as 'miejsca na zajęciach', zaj as 'miejsca zajęte', (mc - zaj) as 'miejsca wolne', sala, [nazwa  przedmiotu                                    ]
FROM PlanWMI
GROUP BY dzien, sem, sala, mc, zaj, [nazwa  przedmiotu                                    ]
ORDER BY dzien;