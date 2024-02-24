1) Öğrencinin adını, soyadını ve kitap aldığı tarihleri listeleyin.

          CEVAP: SELECT o.ograd, o.ogrsoyad, i.atarih
                 FROM ogrenci AS o, islem AS i
                 WHERE o.ogrno = i.ogrno


2) Fıkra ve hikaye türündeki kitapların adını ve türünü listeleyin.

          CEVAP: SELECT k.kitapadi, t.turadi
                 FROM kitap AS k, tur AS t
                 WHERE t.turno = k.turno
                 AND t.turadi IN ('Fıkra', 'Hikaye')


3) 10B veya 10C sınıfındaki öğrencilerin numarasını, adını, soyadını ve okuduğu kitapları listeleyin.

          CEVAP: SELECT o.ogrno, o.ograd, o.ogrsoyad, k.kitapadi, o.sinif
                 FROM ogrenci AS o, islem AS i, kitap AS k
                 WHERE o.ogrno = i.ogrno
                 AND i.kitapno = k.kitapno
                 AND o.sinif IN ('10B', '10C')

#join ile yazın
4) Öğrencinin adını, soyadını ve kitap aldığı tarihleri listeleyin.

          CEVAP: SELECT o.ograd, o.ogrsoyad, i.atarih
                 FROM ogrenci AS o
                 INNER JOIN islem AS i
                 ON o.ogrno = i.ogrno



5) Fıkra ve hikaye türündeki kitapların adını ve türünü listeleyin.

          CEVAP: SELECT k.kitapadi, t.turadi
                 FROM kitap AS k
                 INNER JOIN tur AS t
                 ON k.turno = t.turno


6) 10B veya 10C sınıfındaki öğrencilerin numarasını, adını, soyadını ve okuduğu kitapları, öğrenci adına göre listeleyin.

          CEVAP: SELECT o.ogrno, o.ograd, o.ogrsoyad, k.kitapadi, o.sinif
                 FROM ogrenci AS o
                 INNER JOIN islem AS i
                 ON o.ogrno = i.ogrno
                 INNER JOIN kitap AS k
                 ON k.kitapno = i.kitapno
                 WHERE o.sinif IN ('10B', '10C')


7) Kitap alan öğrencinin adı, soyadı, kitap aldığı tarih listelensin. Kitap almayan öğrencilerinde listede görünsün.

          CEVAP: SELECT o.ogrno, o.ograd, o.ogrsoyad, i.atarih
                 FROM ogrenci AS o
                 LEFT JOIN islem AS i
                 ON o.ogrno = i.ogrno
                 ORDER BY i.atarih


8) Kitap almayan öğrencileri listeleyin.

            CEVAP: SELECT o.ogrno, o.ograd, o.ogrsoyad, i.atarih
                   FROM ogrenci AS o
                   LEFT JOIN islem AS i
                   ON o.ogrno = i.ogrno
                   WHERE i.atarih is null


9) Alınan kitapların kitap numarasını, adını ve kaç defa alındığını kitap numaralarına göre artan sırada listeleyiniz.

          CEVAP: SELECT k.kitapno, k.kitapadi,
                 COUNT(i.kitapno) AS 'okunma sayisi'
                 FROM kitap AS k
                 INNER JOIN islem AS i
                 ON k.kitapno = i.kitapno
                 GROUP BY k.kitapno, k.kitapadi
                 ORDER BY k.kitapno ASC


10) Alınan kitapların kitap numarasını, adını kaç defa alındığını (alınmayan kitapların yanında 0 olsun) listeleyin.

          CEVAP: SELECT k.kitapno, k.kitapadi,
                 COUNT(i.kitapno) AS 'okunma sayisi'
                 FROM kitap AS k
                 LEFT JOIN islem AS i
                 ON k.kitapno = i.kitapno
                 GROUP BY k.kitapno, k.kitapadi
                 ORDER BY k.kitapno ASC


11) Öğrencilerin adı soyadı ve aldıkları kitabın adı listelensin.

          CEVAP: SELECT o.ograd, o.ogrsoyad, k.kitapadi
                 FROM ogrenci AS o
                 INNER JOIN islem AS i
                 ON o.ogrno = i.ogrno
                 INNER JOIN kitap AS k
                 ON k.kitapno = i.kitapno


12) Her öğrencinin adı, soyadı, kitabın adı, yazarın adı soyad ve kitabın türünü ve kitabın alındığı tarihi listeleyiniz. Kitap almayan öğrenciler de listede görünsün.

          CEVAP: SELECT o.ograd, o.ogrsoyad, k.kitapadi, y.yazarad, y.yazarsoyad, t.turadi, i.atarih
                 FROM ogrenci AS o
                 LEFT JOIN islem AS i
                 ON o.ogrno = i.ogrno
                 LEFT JOIN kitap AS k
                 ON k.kitapno = i.kitapno
                 LEFT JOIN yazar AS y
                 ON y.yazarno = k.yazarno
                 LEFT JOIN tur AS t
                 ON t.turno = k.turno


13) 10A veya 10B sınıfındaki öğrencilerin adı soyadı ve okuduğu kitap sayısını getirin.

          CEVAP: SELECT o.ograd, o.ogrsoyad,
                 COUNT(i.ogrno) AS total_read
                 FROM ogrenci AS o
                 INNER JOIN islem AS i
                 ON o.ogrno = i.ogrno
                 WHERE o.sinif IN  ('10A', '10B')
                 GROUP BY o.ograd, o.ogrsoyad


14) Tüm kitapların ortalama sayfa sayısını bulunuz.
#AVG

          CEVAP: SELECT AVG(k.sayfasayisi) AS 'ortalama sayfa sayisi' FROM kitap AS k


15) Sayfa sayısı ortalama sayfanın üzerindeki kitapları listeleyin.

          CEVAP: SELECT * FROM kitap AS k
                 WHERE k.sayfasayisi > (SELECT AVG(k.sayfasayisi) FROM kitap AS k)


16) Öğrenci tablosundaki öğrenci sayısını gösterin

          CEVAP: SELECT COUNT(ogrno) FROM ogrenci


17) Öğrenci tablosundaki toplam öğrenci sayısını toplam sayı takma(alias kullanımı) adı ile listeleyin.

          CEVAP: SELECT COUNT(ogrno) AS 'toplam ogrenci sayisi' FROM ogrenci


18) Öğrenci tablosunda kaç farklı isimde öğrenci olduğunu listeleyiniz.

          CEVAP: SELECT DISTINCT ograd FROM ogrenci



19) En fazla sayfa sayısı olan kitabın sayfa sayısını listeleyiniz.

          CEVAP: SELECT k.sayfasayisi FROM kitap AS k
                 ORDER BY k.sayfasayisi DESC
                 LIMIT 1


20) En fazla sayfası olan kitabın adını ve sayfa sayısını listeleyiniz.

          CEVAP: SELECT k.kitapadi, k.sayfasayisi FROM kitap AS k
                 ORDER BY k.sayfasayisi DESC
                 LIMIT 1


21) En az sayfa sayısı olan kitabın sayfa sayısını listeleyiniz.

          CEVAP: SELECT k.sayfasayisi FROM kitap AS k
                 ORDER BY k.sayfasayisi ASC
                 LIMIT 1


22) En az sayfası olan kitabın adını ve sayfa sayısını listeleyiniz.

          CEVAP: SELECT k.kitapadi, k.sayfasayisi FROM kitap AS k
                 ORDER BY k.sayfasayisi ASC
                 LIMIT 1


23) Dram türündeki en fazla sayfası olan kitabın sayfa sayısını bulunuz.

          CEVAP: SELECT * FROM kitap AS k
                 INNER JOIN tur AS t
                 ON t.turno = k.turno
                 WHERE turadi = 'Dram'
                 ORDER BY k.sayfasayisi DESC
                 LIMIT 1


24) numarası 15 olan öğrencinin okuduğu toplam sayfa sayısını bulunuz.

          CEVAP: SELECT o.ograd, o.ogrsoyad, SUM(k.sayfasayisi) AS 'toplam sayfa sayisi'
                 FROM ogrenci AS o
                 INNER JOIN islem AS i
                 ON o.ogrno = i.ogrno
                 INNER JOIN kitap AS k
                 ON k.kitapno = i.kitapno
                 WHERE o.ogrno = 15
                 GROUP BY o.ograd, o.ogrsoyad




25) İsme göre öğrenci sayılarının adedini bulunuz.(Örn: ali 5 tane, ahmet 8 tane )

          CEVAP: SELECT o.ograd, COUNT(o.ograd) AS 'adet'
                 FROM ogrenci AS o
                 GROUP BY o.ograd


26) Her sınıftaki öğrenci sayısını bulunuz.

          CEVAP: SELECT o.sinif, COUNT(o.ogrno) AS 'ogrenci sayisi'
                 FROM ogrenci AS o
                 GROUP BY o.sinif


27) Her sınıftaki erkek ve kız öğrenci sayısını bulunuz.

          CEVAP: SELECT o.sinif, o.cinsiyet,
                 COUNT(o.ogrno) AS 'ogrenci sayisi'
                 FROM ogrenci AS o
                 GROUP BY o.sinif, o.cinsiyet
                 ORDER BY o.sinif, o.cinsiyet


28) Her öğrencinin adını, soyadını ve okuduğu toplam sayfa sayısını büyükten küçüğe doğru listeleyiniz.

          CEVAP: SELECT o.ograd, o.ogrsoyad, SUM(k.sayfasayisi) AS 'toplam sayfa sayisi'
                 FROM ogrenci AS o
                 INNER JOIN islem AS i
                 ON o.ogrno = i.ogrno
                 INNER JOIN kitap AS k
                 ON k.kitapno = i.kitapno
                 GROUP BY o.ograd, o.ogrsoyad
                 ORDER BY SUM(k.sayfasayisi) DESC



29) Her öğrencinin okuduğu kitap sayısını getiriniz Ve listeyi büyükten kücüge sıralayınız.

          CEVAP: SELECT o.ograd, o.ogrsoyad,
                 COUNT(i.islemno) AS 'okunan kitap sayisi'
                 FROM ogrenci AS o
                 INNER JOIN islem AS i
                 ON o.ogrno = i.ogrno
                 GROUP BY o.ograd, o.ogrsoyad
                 ORDER BY COUNT(i.islemno) DESC
