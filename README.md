# P2_Probstat_C_5025201272

Praktikum PROBSTAT 2022 Modul 2

## Sarah Alissa Putri - 5025201272

### Soal 1
> a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel
Untuk mencari standar deviasi, gunakan `sd`. Pertama, masukan data sebelum ke X dan sesudah ke Y menggunakan `c()`. Untuk mengetahui standar deviasinya, gunakan `sd(X)` dan `sd(Y)` untuk masing-masing variabel. Kemudian, gunakan `sd(Y-X)` atah `sd(X-Y)` untuk mencari nilai selisihnya.
```ruby
#data sebelum
X <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
#data sesudah
Y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

sd(X)
sd(Y)

#selisih (bisa sd(X-Y) juga, hasilnya sama)
sd(Y-X)
```

Output :

![Screenshot (30)](https://user-images.githubusercontent.com/81427127/170866673-9f49377b-a21f-4b11-8893-b06641431f29.png)

> b. Carilah nilai t (p-value)
Pada t.test(), nilai dari paired bernilai TRUE karena data X dan Y adalah sepasang. Selain itu, nilai dari var.equal adalah FALSE karena variabel X dan variabel Y memiliki varians yang berbeda.
```ruby
t.test(Y,X,paired = TRUE,var.equal = FALSE)
```
Output :

![Screenshot (31)](https://user-images.githubusercontent.com/81427127/170866924-add3342b-514d-47f9-a983-d4fec1671619.png)

> c. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

Karena didapatkan p-value sebesar 6.003e-05 yang mengakibatkan H0 ditolak dan hipotesis alternatif diterima. Hal ini berarti terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas A.


### Soal 2
>Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer.

> a. Apakah anda setuju dengan klaim tersebut?
Setuju

> b. Jelaskan maksud dari output yang dihasilkan!
![Screenshot (32)](https://user-images.githubusercontent.com/81427127/170868466-f2d40359-a9e8-4e97-959f-e0bf25bec0ad.png)

Diketahui n = 100, Rata-Rata (X̄) = 23500, dan standar deviasi(σ) = 3900, sehingga dari hasil output didapatkan nilai `z = 8.9744`,`p-value = 1`, null hipotesisnya adalah H0 : μ = 20000 dan alternatif hipotesisnya adalah H1 : μ > 20000.

> c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
```ruby
P(Z > 8.9744) = 1 - P(Z < 8.9744)
= 1 - 1
= 0
```
Kesimpulan : Hipotesis awal (H0) bahwa "Mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun" diterima.
