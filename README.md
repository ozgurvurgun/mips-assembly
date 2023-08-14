

## Bilgisayar Mimarileri ve Assembly

| Abstraction Level | How do we Design |
| -------------     |:----------------------:|
| System            |  Specifications        |
| Chip              |  Algorithms            |
| Register          |  State Transition Maps |
| Gate              |  Boolean Algebra       |
| Circuit           |  Diff Eq, KVL, KCL     |
| Silicon           |  Device Physicsz       |



## Bilgisayar Nasıl Programlanır ? 
>Yüksek Seviye Programlama (C kodlama)
```
  swap (int v[], int k){
  int temp;
  temp = v[k];
  v[k] = v[k+1];
  v[k+1] = temp;
 }
```
```
↓↓↓↓↓↓↓↓↓
Derleyici
↓↓↓↓↓↓↓↓↓
```
>Assembly Programlama (mips)
```
 swap:
muli $2, $5, 4
add  $2, $4, $2
lw   $15, 0($2)
lw   $16, 4($2)
sw   $16, 0($2)
sw   $15, 4($2)
jr   $31
```
```
↓↓↓↓↓↓↓↓↓
Assembler
↓↓↓↓↓↓↓↓↓
```
>Binary Makine Dili Programı
```
0000000000101000000001000000000000001
1000000000001000011100000000000110000
0010000000011000011000001100011000000
```


## Yazılım Soyutlama

- Bilgisayarın anladığı tek dil düşük voltaj/yüksek voltajı ifade eden 1 ve 0
  binary sayıların oluşturduğu makine dilidir.
    - Bu en alt soyutlama katmanıdır. Doğrudan elektronik bileşenleri ifade eder.
- Soyutlama tamamen insanlar(programcılar) içindir.
- Soyutlama ile:
  - Sadece ilgili bilgilere odaklanılır.
  - Gereksiz ayrıntılara hiç bakılmaz.
      
## RISC Mimarisi

- Komut uzunluğu ve formatı sabittir.
- Adresleme modeli sabittir.
- Operasyon sayısı sınırlı (özel işlemler yok).
- Load-Store Komut Seti:
    - Bellek erişim
    - İşlemler(ALU, Multiply/Divide, Shift)
    
    
## RISC Komut Seti Temel Prensipleri

- Basitlik düzenliliği getirir.
    - Sabit bit genişliğindeki komutlar
    - Az sayıda komut formatı
- En küçük en hızldır.
    - Sınırlı komut seti
    - Sınırlı sayıda register
	- Sınırlı sayıda adresleme modu
- Çok kullanılanı hızlı yap.
	- Komutlar register ile işlem yapar.
	- Sabit değer(immediate) alan komutlar
- İyi tasarım, iyi tavizler verilerek oluşur.
	- MIPS içerisinde 3 farklı komut formatı vardır.
	
	
	
## CISC Mimarisi (Complex Instruction Set Computer)

- Karmaşık işlemler için özelleştirilmiş komutlar mevcut.
- Kompleks yapıda pek çok komut içcerebilir.
- Intel x86
	
	
## Komut Seti Mimarisi

- Donanım ile düşük seviye yazılım arasındaki arayüz
- Bir bilgisayarın donanımı ile haberleşebilmek 
  için, ilgili mimarinin dilini bilmek gerekir.
- Bilgisayar dilinin kelimelerine komut(instruction) denir.
    - Bu kelimelerin bütününe komut seti diyoruz
- Komut seti her zaman Assembly dili ile kullanıcıya açılır.
- Modern komut seti mimarileri: x86, MIPS, SPARC, HP, ARM



## MIPS ISA 

- RISC Mimarisi: Sade yapı, az sayıda komut
- %100 açık kaynak
- Eğitim için çok uygun (Üniversiteler, akademik çalışmalar)
	
	


## MIPS Assembly Komut Yapısı

- Temel bir komutunun sırasıyla 4 temel bileşeni vardır.
	1. İşlem adı
	2. Sonucun saklanacağı kaynak
	3. Birinci işlenen veri(operand)
	4. İkinci işlenen veri(operand)
- Operand sayısı esnetilemez!!
- C/C++ Kodu: a = b + c;
```php
              kaynak
                ↑
 MIPS Kodu: add a, b, c   → 000000 01001 01010 01000 00000 100000  
              ↓      ↓
            işlem  operandlar
```
- !! a, b ve c birer register
- Assembly' de her satır kod tek bir komutun icra edilemsi içindir.
- Birim zamanda (clock cycle) sadece 1 komut gerçekleştirilir.
- C/C++ Kodu: a= b + c + d + e;
($s0, $s1, $s2, $s3, $s4 register'ları sırasıyla A,B,C,D değerlerini içeriyor kabul edelim)
```php
MIPS Kodu:
add  $t0, $s1, $s2
add  $t1, $t0, $s3
add  $s0, $t1, $s4

(add toplama komutu 2 adet operand alabilir)
```
## Operand Türleri ve Aritmetik MIPS Komutları

1. REGISTER
    - Komutlarda işlenen verilerin saklandığı, hızlı ve belleğe göre çok daha basit yapıdaki elemanlardır.
    - Üzerine tekrar veri yazılmadıkça ve bilgisayar kapatılmadığı sürece, son kayıtlı değerini korumaya devam eder.
    - Okuma/yazma işlemi, RAM gibi hafıza elemanlarına kıyasla çok daha hızlı olduğu için, işlem parametreleri özellikle register'da saklanır.
        - Neden ?
            - Çünkü işlemci ve ALU yapılarına doğrudan bağlı ve fiziksel olarak çok yakın.



- #### MIPS Register
    - MIPS bir load/Store mimarisidir.
        - Aritemtik/Mantık komutları bellek verisiyle doğrudan çalışmaya izin vermez. Veriler önce Register'a çekilir.
	    - Intel işlemciler bellek verisiyle doğrudan çalışmaya izin verir (Mimari tercihi, trade-off)
- MIPS Mimarisinde toplam 32 adet 32-bit genel amaçlı Register vardır (Bazıları özelleşmiştir).
    - 32-bit genişliğinde ki her Register satırına "Word" denir.
    - "Daha küçük daha hızlıdır" kuralı gereği 33 adet Register, 32 adet Register yapısına göre daha yavaştır.
    - RISC mimarileri donanımı olabildiğince basit tutmayı hedefler.
    - Register "$" işareti ile tanımlanır.
    - Derleyiciler Register'ları kullanarak derleme işlemi yapar.

| isim         | Adres Değeri   | Kullanım                                |
|:------------:|:--------------:|:---------------------------------------:|
| $zero        |  0             | Sabit 0 değeri                          |
| $at          |  1             | Assembler için ayrılmıştır              |
| $v0 - $v1    |  2-3           | Sub-routine sonuç register              |
| $a0 - a3     |  4-7           | Sub-routine argümanlar                  |
| $t0 - $t9    |  8-15 , 24-25  | Geçici işlem parametreleri (temporaries)|
| $s0 - $s7    |  16-23         | Kaydedilmiş parametreler                |   
| $k0 - $k1    |  26-27         | İşletim sistemi kernel için ayrılmıştır |
| $gp          |  28            | Global pointer                          |
| $sp          |  29            | Stack pointer                           |
| $fp          |  30            | Frame pointer                           |
| $ra          |  31            | Return address                          | 

## Toplama / Çıkarma Komutları 

- add : operand1 ve operand2 parametrelerini toplayıp source parametresine yazar.
- sub : operand1 ve operand2 parametrelerini çıkarıp source parametresine yazar.
- örnek
  - C/C++ Kodu: f = (g + h) - (i + j); ($s0, $s1, $s2, $s3, $s4 register'ları sırasıyla f,g,h,i,j değerlerini içeriyor kabul edelim)
```php
MIPS Kodu:
add  $t0, $s1, $s2  # t0 = g + h
add  $t1, $s3, $s4  # t1 = i + j
sub  $s0, $t0, $t1  # f = (g+h) - (i+j)
```

## 2 - Tam Sayı

- Register ve belleğin getirdiği okuma/yazma yükünü kaldırmak için kullanılır.
  - Kural-3: Çok kullanılanı hızlı yap.
- Sabit bir sayı doğrudan aritmetik işlemde operand olarak kullanılabilir.
- Tam sayı kullanımı için özel MIPS komutu vardır.
  - addi (add immediate)
  - örnek
```php
addi  $s3, $s3, 4  # $s3'de bulunan değere 4 ekleyip $s3'e geri kaydeder.
```
- MIPS Assembly kodlamada tam sayılar ondalık, 16'lık (hexadecimal) veya 8'lik (octal) sayı tabanında ifade edilebilir.
- Tam sayılar makine kodunda 32-bit'e dönüştürülerek ifade edilir.
- Sayılar negatif olabilir (signed).

## 3 - Bellek

- Yapı olarak tek boyutlu bir array gibidir.
- Her bellek satırının kendine özel bir bellek adresi vardır.
- Bellekteki veriye erişebilmek için, komutlar mutlaka bellek adresini belirtmek zorundadır!
- Bellekte hem komutlar hem de veriler saklanır.
  - Bellekte kendilerine ayrılmış bölümlerde saklanabilirler, birbirlerinin yerini işgal etmezler (Memomry Organization).

## Register / Bellek Karşılaştırması

- Aritmetik / Mantık komutlarının operandları register'dan gelmek zorundadır.
- Tipik bir program toplam register sayısından çok daha fazla veri kullanır.
  - Örneğin devasa büyüklükteki array veri yapıları.
- Bu nedenle register ile bellek arasında data transferi yapacak bellek komutlaına ihtiyaç vardır.
  - Veri transferi komutları (Data transfer instructions).

## MIPS Bellek Organizasyonu

- Pek çok mimari byte adreslemeyi yetersiz bulduğundan "word" adı verilen bellek satırlarını kullanırlar.
  - 32-bit, 48-bit, 64-bit...
- MIPS 32-bit uzunluğundaki Word'ler için BYTE ADRESLEME kullanır.
  - Adresler her zaman 4 sayısının katları şeklinde olacaktır.    