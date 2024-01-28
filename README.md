

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
>Assembly Programlama
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
- Bu nedenle register ile bellek arasında data transferi yapacak bellek komutlarına ihtiyaç vardır.
  - Veri transferi komutları (Data transfer instructions).

## MIPS Bellek Organizasyonu

- Pek çok mimari byte adreslemeyi yetersiz bulduğundan "word" adı verilen bellek satırlarını kullanırlar.
  - 32-bit, 48-bit, 64-bit...
- MIPS 32-bit uzunluğundaki Word'ler için BYTE ADRESLEME kullanır.
  - Adresler her zaman 4 sayısının katları şeklinde olacaktır.    

## Veri Transfer Komutları

- lw: (Load Word) Bellekten register'a veri transfer eder
  - ```php
    lw $s1 , 100($s2)  # $s1 = Bellek[$s2 + 100]
    ``` 
- sw: (Store Word) Register'dan belleğe veri transfer eder (Bellek yazma)    
  - ```php
    sw $s1 , 100($s2)  # Bellek[$s2 + 100] = $s1
    ``` 
    - C/C++ Kodu: a[9] = h + a[8]; 
    - $s3 register'ı "a[0]" adresini tutsun, $s2 ise "h" parametresini tutsun
    - ```php
      MIPS Kodu:
      
      lw  $t0, 32($s3)  # $st0 = a[8]
      add $t0, $s2, $t0  # $t0 = h + a[8]
      sw  $t0, 36($s3)  # a[9] = h + a[8] 
      ```


## Özet

- MIPS bir Load / Store Mimarisidir
  - Byte adresleme ile bellekten okuma/yazma yapar
  - Operand olarak register, tam sayı sabiti ve bellek verisi kullanabilir
  - Bellek verisini önce veri transfer komutları ile register'a almak zorundadır
  -   | Komut | Syntax                   | Anlamı                     |
      |:-----:|:------------------------:|:--------------------------:|
      | add   | add $source, $op1, $op2  | $src = $op1 + $op2         |
      | addi  | addi $source, $op1, int  | $src = $op1 + int          |
      | sub   | sub $source, $op1, $op2  | $src = $op1 - $op2         |
      | lw    | lw $register, byte_adres | $reg = bellek[byte_adres]  |
      | sw    | sw $register, byte_adres | bellek[byte_adres] = $reg  |     

## MIPS MANTIK KOMUTLARI    
  -   | İşlem | C Syntax  | MIPS  Karşılığı|
      |:-----:|:------------------------:|:--------------------------:|
      | AND   | &  | and, andi |
      | OR    | \| | or, ori   |
      | XOR   | ^  | xor, xori |
      | NOT   | ~  | nor       |  
  - ```php
        and $t1, $t2, $t3 # $t1 = $t2 & $t3 (bitwise and)
        or  $t1, $t2, $t3 # $t1 = $t2 | $t3 (bitwise or)
        xor $t1, $t2, $t3 # $t1 = $t2 ^ $t3 (bitwise xor)

        andi $t1, $t2, 0xF0 # $t1 = $t2 & 0xF0 (bitwise and)
        ori  $t1, $t2, 0xFF # $t1 = $t2 | 0xFF (bitwise or)
        xori $t1, $t2, 0x0F # $t1 = $t2 ^ 0x0F (bitwise xor)
    ```           

## Bit Kaydırma (Shift)
  - Shift işlemi adındanda anlaşılacağı üzere kaydırma demektir. Bilgisayar dünyasında shift, bir sayının bitlerini sağa veya sola kaydırmayı ifade eder. Kısaca binary shift işlemi yaptığımzda sayıyı basamak değeri kadar katlamış veya bölmüş oluruz.
  - Sola her birim shift etmek sayıyı 2 ile çarpmak anlamına gelir.
  - Sağa her birim shift etmek sayıyı 2 ile bölmek anlamına gelir.
  - İki tür shift işlemi vardır. "Aritmetik" ve "Logic" shift. Bunların farkı, kaydırma sırasında bit genişliğinden taşan bitlerin yerine yazılacak değerlerin farklı olmasıdır.
  - Sola logic shift yapıldığında en düşük anlamlı bite(LSB) 0 yazılır.
  - Sağa logic shift yapıldığında en yüksek anlamlı bite(MSB) 0 yazılır.
  - Sola aritmetik shift yapıldığında en düşük anlamlı bite(LSB) 0 yazılır.
  - Sağa aritmetik shift yapıldığında en yüksek anlamlı bite(MSB) sayının işaretine göre 1 veya 0 yazılır.
  -   | Komut | Örnek  | Anlamı |
      |:-----:|:------------------------:|:---------:|
      | sll  | sll  $t2, $t3, 2    | $t2 = $t3 << 2   |
      | sllv | sllv $t3, $t4, $t5 | $t3 = $t4 << $t5 |
      | sra  | sra  $t4, $t3, 1    | $t4 = $t3 >> 1   |
      | srav | srav $t7, $t2, $t4 | $t7 = $t2 >> $t4 | 
      | srl  | srl  $t2, $t3, 7    | $t2 = $t3 >> 7   |  
      | srlv | srlv $t3, $t4, $t6 | $t3 = $t4 >> $t6 | 

## Aritmetic Logic Unit (ALU) 

  - Aga tamam biz bu assembly ile aritmetik işlemler yaptık mantık kapıları ile programlama falan yaptık fakat bunlar işlemcide nasıl çalışıyor ?
    - Bu sorunun cevabı artimetic logic unit' dir. Bu nihayetinde işlemci de bulunan bir devreden başka bir şey değildir. Neredeyse bütün aritmetik, mantık, adres hesaplama, atlama kontrolü gibi işlemler bu birimde gerçekleşir
    - ALU içinde ki her bir operasyonun bir kimlik kodu bulunur.
    - | ALU Operasyonu | Fonksiyon  |
      |:-----:|:------------------:|
      | 0000  | and              |
      | 0001  | or               | 
      | 0010  | add              |
      | 0110  | subtract         | 
      | 0111  | Set on less than | 
      | 1100  | NOR              |

## MIPS Çarpma Komutları
#### MDU Birimi
- Çarpma bölme işlemleri bilgisayar açısından oldukça maliyetli işlemlerdir peşi sıra birbirini takip etmesi gereken bir çok işlem bulunur. Bu sebepten bu işlemleri farklı bir birime alarak (MDU) ALU nun hantallaşmasının önüne geçilmek istenmiştir.
- MDU birimi, sonuçları HI ve LO adında iki farklı registerda tutar.
- İki adet 32-bit sayının çarpımı 64-bit uzunluğunda sonuç verir. MIPS'e ait tüm kaynak ve hedef operandları 32-bit olduğundan çarpma işleminin 64-bit sonucunu saklamak için 2 adet registera ihtiyacı vardır.
  - HI registeri yüksek anlamlı 32-bit kısmı tutarken LO registeri düşük anlamlı 32-bit kısmını tutar
- İki adet çarpma komutu bulunur: "mult" ve "multu". "multu" sayının işaretsiz sayılar içindir.
- Çarpım sonucunu istenen registerlara almak için iki adet komut çalıştırmak gerekir.
  - mflo: LO resgiter'inda bulunan datayı alır.
  - mfhi: HI resgiter'inda bulunan datayı alır.
- Örnek:
  - ```php
    mult $s2, $s3  # (HI, LO) = $s2 * $s3
    mfhi $t1       # $t1 = HI
    mflo $t0       # $t0 = LO
    ```
## MIPS Bölme Komutları
#### MDU Birimi

- Bir bölme işleminin sonucu bölüm ve kalan olarak iki kısımda elde edilir. Eğer sadece bölüm kısmını saklarsak sayıyı yuvarlamış oluruz, tam değeri elde edemeyiz. MIPS'te bölme komutu sonrasında hem bölüm hem de kalan kısımlarını ayrı şekilde işlememiz gerekir.
  - Çarpmada ki aynı HI ve LO 32-bit registerlar kullanılır.
- İki adet bölme komutu bulunur. "div" ve "divu" .
- Bölüm ve kalanı registerlara almak için iki adet komut çalıştırmak gerekir.
  - mflo: LO registerda ki bulunan datayı alır.
  - mfhi: HI registerda ki bulunan datayı alır.
- Örnek:
  - ```php
    div $s2, $s3  # LO = $s2 / $s3 (bölüm)
                  # HI = $s2 % $s3 (kalan)
    mfhi $t1      # $t1 = HI
    mflo $t0      # $t0 = LO
    ```  

## Koşullu, Koşulsuz Atlama
  <p>
  Bir bilgisayarı basit bir hesap makinesinden ayıran yegane şeylerden biri akışa göre programın davranışını değiştirebilmesi, belirli bir koşul sağlandığında veya sağlanmadığında normal çalışma akışını değiştirebilmesidir. Buna kısaca karar verme diyoruz. Bilgisayar mimarilerinde karar verme işlemi koşullu veya koşulsuz atlama komutları ile gerçekleştirilir.
  </p>

## Bilgisayarda Karar Verme ve Atlama
- Üst düzey programlamada koşula bağlı olarak karar verme işlemi genellikle "if" ve "else" ile ifade edilir.
- ```javascript
   //Javascript Kodu
   let x = 10;
   let y = 20;
   let result = 0;
   if (x != y) result = x + y;
   else result = x - y;
  ``` 
- Programlamada koşulsuz atlama genellikle "return" ile ifade edilir.
   - ```php
      return main();
     ``` 

## Program Sayacı (Program Counter)
- Komutlar program belleğinde tutulur (ROM, RAM).
  - Fetch. Decode, Execute
- Program sayacı; şu anda execute edilen komutun adresini tutan özel bir işlemci register'idir.
- Bellekten komut okuması yapabilmek için gerekli olan adres bilgisi Program Sayacı Register'indan alınır.
- Komut Fetch edilir edilmez Program Sayacının değeri +1 artar. Böylece yeni fetch edilecek komutun adresi hesaplanmış olur.
- Program bittiğinde veya bilgisayar kapatıldığında Program Sayacı genellikle 0 değerine döner.
- | MIPS Bellek Organizasyonu|
  |:------------:|
  | STACK        |
  | HEAP         | 
  | STATİC DATA  |
  | INSTRUCTIONS |

## Karar Verme

- Program sayacının normalde +1 olarak artarak ilerleyen seyrini bir koşula bağlı veya bağlı olmadan değiştirmektir.
  - Böylece ilgili duruma göre programın belirli kısımları çalışmış olur.
- koşullu komutlar "branch" olarak adlandırılır.
- Koşulsuz komutlar jump olarak adlandırılır.
- "Target" ise program sayacının alacağı değeri, yani program akışında atlanacak hedef lokasyonu temsil eder.

## Etiketler (LABEL)

- Bellekteki bir lokasyonu "string" olarak isimlendirmek için kullanılır.

## Koşullu Atlama
- Branch Equal (Eşitse Atla)
  - beq
    - ```php
        beq $t1, $t2, label1 
        # $t1 içeriği $t2'ye eşitse label1 konumuna atla
      ```
- Branch Not Equal (Eşit Değilse Atla)
  - bne
    - ```php
        bne $t1, $t2, label1
        # $t1 içeriği $t2' ye eşit değilse label1 konumuna atla  
      ```
- Set On less Than (Küçükse atama yap)
    - slt, sltu
      - ```php
          slt $s1, $s2, $s3 
          # $s2 < $s3 => $s1 = 1, değilse $s1 = 0
        ```
- Set On Less Than Immediate (Sayıdan küçükse atama yap)
    - slti, sltiu
      - ```php
          slti $s1, $s2, 100 
          # $s2 < 100 => $s1 = 1, değilse $s1 = 0
        ```
- MIPS mimarisinde doğrudan, küçükse atla büyükse atla gibi komutlar söz konusu değildir. Mimari yaklaşımı gereği bu komutlar komut setine dahil edilmemiştir.
- Koşullu atlama ihtiyacını "slt" komutu yardımıyla gerçekleştiriyoruz.
  - ```php
      slti $t0, $a0, 1  # $s2 < 100 => $s1 = 1, değilse $s1 = 0
      beq $t0, $zero, L1 # $t0 = 0 ise L1'e atla ($a0 >= kontrolü sağlanmış oldu)
    ```  

## Koşulsuz Atlama
- Jump (Atla)
  - j
    - ```php
      j label1 #label1 konuma atla
      ``` 
## Döngüler
- Assembly de while, for... gibi özel döngü kurabileceğimiz komutlar bulunmaz. Bunları kendimiz kurgulamalıyız. Label'lar ve koşul yapıları ile üst seviye dillerde da bulunan döngü sistemlerinin tamamını kurgulamak mümkündür.
- Assembly de ki döngüleri, üst seviye programlama dillerinde kurguladığımız öz yinelemeli fonkisyonlar gibi düşünebilirsiniz.
- For loop örneği
  - ```php
      //C Kodu
      for(i=0; i < 10; i++){
        a = a + i;
      }

      //Assembly Kodu
      //s0 = i; s1 = a; t0 = temp; olduğunu varsayalım
              addi $s0, $zero, 0
              addi $t0, $zero, 10
      Loop:   beq  $s0, $t0, Exit
              add  $s1, $s1, $s0
              addi $s0, $s0, 1
              j    Loop
      
      Exit:   ...
    ```
## Prosedürler (Sub-Routine)
- Özel bir işi yerine getirmek için kullanılan alt programlardır.
- Kendilerine tanımlanan parametreleri işleyerek sonuç üretirler.
- Kompleks problemleri parçalara ayırıp çözemeye olanak tanır(Divide & Conquer)
- Prosedür sadece tanımlandığı işi yapabilir. Program akışında dilendiği kadar çağırılıp kullanılabilir.

## Bir Sub Routine Çalıştırmak için
 
  1. Kullanılacak parametreler prosedürün ulaşabileceği bir noktaya yerleştirilir.
  2. Programın prosedüre transferi kontrol edilir.
  3. Prosedür için gereken hafıza kaynakları oluşturulur.
  4. İstenilen görev gerçekleştirilir.
  5. Sonuçlar, çağıran programın erişebileceği bir noktada hafızaya alınır.
  6. Çağıran programın sonuçları kaydedilen yapıdan okuması ve kontrolü tekrar eline alması sağlanır. 

## Sub Routine Parametrelerinin Kaydedilmesi
  - Registerlar en hızlı veri kayıt yapılarıdır. Prosedürlere özel registerlar şunlarıdr:
    1. $a0 - $a3: Kullanılacak parametreler için dört adet argüman registeri
    2. $v0 - $v1: Döndürülen değerler(return parameters) için iki adet değer registeri
    3. $ra: Return Address Register (programın orijinal noktasına geri dönebilmek için)
  - Komut: jump-and-link (jal)
    - ```php
        jal Prosedür Adı
      ``` 
  - Bu komut prosedür adresine atlar, aynı zamanda takip eden komutun adresini $ra' ya kaydeder.
  - $ra register'ina kaydedilen return adres = "PC + 4" değeridir.
  - her prosedürün sonunda bulunan "jr $ra" komutu ile $ra' da belirtilen dönüş adresine koşulsuz atlama yapılır.   

## Prosedür Çağrılması Özet

  1. Çağıran program argümanları $a0 - $a3 içerisine koyar ve jal A ile sub routine A'ya atlanır.
    - jal komutu PC+4 değerini sub routine'den dönüş için $ra register'inde saklar.
  2. Prosedür görevini tamamlar, sonuçları $v0  - $v1 içerisini atar ve jr $ra komutunu çalıştırır.
    - "jr $ra" komutu ile $ra'da saklanan "return" adrese geri dönülebilir.
  - Tüm bu kayıt işlemleri belleğin "Stack" adı verilen özel bölümünde gerçekleşir.

## Bellek Organizasyonu (Memory Allocation)

<table>
  <tr>
    <td align="center"> Reserved </td>
    <td align="center" rowspan="4"> Kernel Level </td>
  </tr>
  <tr>
    <td align="center"> Memory Mapped IO </td>
  </tr>
  <tr>
    <td align="center"> Kernel Data </td>
  </tr>
  <tr>
    <td align="center"> Kernel Text </td>
  </tr>
  <tr>
    <td align="center"> Stack Segment </td>
        <td align="center" rowspan="5"> User Level </td>
  </tr>
  <tr>
    <td>
      <p align="center">&darr;</p>
      <p align="center">&uarr;</p>
     </td>
  </tr>
  <tr>
    <td align="center"> Dynamic Data </td>
  </tr>
  <tr>
    <td align="center"> Static Data </td>
  </tr>
  <tr>
    <td align="center"> Text Segment </td>
  </tr>
  <tr>
    <td align="center"> Reserved </td>
    <td align="center"> Kernel Level </td>
  </tr>
</table>

<br />

- User level
  - <table>
      <tr>
        <td align="center"> 
          <p>Stack</p>
          <p align="center">&darr;</p>
          <p align="center">&uarr;</p>
          <p>Dynamic Data</p>
        </td>
      </tr>
      <tr>
        <td align="center"> 
          <p>Static Data</p> 
        </td>
      </tr>
      <tr>
        <td align="center"> 
          <p>Text</p> 
        </td>
      </tr>
      <tr>
        <td align="center"> 
          <p>Reserved</p> 
        </td>
      </tr>
    </table> 

- Mimaride ki bellek iki ana kısımdan oluşur, "Kernel" seviyesi ve "Kullanıcı" seviyesi.

- Kernel bir çekirdek programıdır. İşletim sisteminin çalışması için gerekli olan temel verilerden oluşur.

- Kullanıcı seviyesinde ki bellekte sırasıyla  { Stack, Dynamic Data }, Static Data, Text, Reserved kısımları bulunur. 
  - Kısımları aşağıdan yukarıya doğru inceleyecek olursak.
    - Text kısmında program sayacı bulunur. Bu da demek oluyor ki bu kısımda komutlar saklanıyor. yazdığımız programlar mimariye uygun olarak makine koduna çevrilerek Text kısmında saklanıyor.
    - Static Data kısmının işaretçisi global pointer'dir (gp). bu kısımda programa ait global veriler yani tüm modüllerin erişebileceği veriler saklanıyor.
    - Dynamic Data ve Stack kısmı Runtime Memory Allocation veya Dynamic Memory Allocation alanı olarak adlandırılır. Bunun anlamı programdan önce değil. Program çalıştığı esnada programın gerekliliklerine göre bu kısımlardan gerekli bellek bölgesi ayrılmasıdır. Bu bellek alanının tahsis mikarı önceden belirlenmiş değildir program çalıştığı esnada ihtiyaca göre alan tahsis edilir. Bu işleme "Dynamic Memory Allocation" denir.
    - Dynamic Data bölgesinin elemanları Stack ve Heap olarak geçer. Heap kısaca programın belleğidir, store komutları ile register'da ki verileri belleğe kaydettiğimizde bu veriler dynamic data bölgesinde ki heap kısmında kayıt edilir. Stack bölgesi ise tamamen sub routine ler ve prosedürler ile alakalıdır. Prosedür parametrelerini ve atlamalar sırasında ki return adresleri zincirlerini kaydeden, sub routine' in gerçekleşmesini sağlayan bölge stack bölgesidir.

## Stack
- Stack programın çalışması boyunca çağrılan fonksiyonların yani prosedür ve sub routine' lerin doğru çalışması için gerekli olan prosedüre gidecek olan parametrelerin, return adresinin ve prosedür çalışması sırasında değerini kaybetmemesi gereken, bittikten sonra tekrar eski haline dönmesi gereken register değerlerinin saklanmasından sorumludur.
- Stack Pointer
  - Stack pointer stack belleğine ait veri satırlarının adreslerini tutan yapıdır.
  - Stack pointer ($sp) stack'e en son eklenen verinin adresini tutar.
  - Upside-down yapıdadır.
  - Stack içerisinde ki pop veya push işlemlerinin hangi lokasyonda gerçekleşeceğini belirler.

## Neden Dinamik Bellek Tahsisi Yapılır ?
- Programın ne kadar belleğe ihtiyacı olduğunu onu çalıştırmadan bilemeyiz.
- Bağlı liste, Sözlük gibi veri yapılarını sınırlayan bir yapı istemeyiz, bunların dinamik, genişletibilir olmasını isteriz. Çünkü bu veri yapılarının var olma amacı belli bir üst limiti olmamasıdır. Teoride ki bu sınırsız üst limiti sağlayan sağlayan sistem dynamic memory allocation dur.
- Bellek İsrafını önlemek.
- Sadece basit adres manipülasyonları ile yapılabilir. Statik olarak bellekten veri ayırmak, bu lokasyonlara silme, taşıma, ekleme, takas yapmak gibi işlemler doğrudan veri taşıma ile yapılması gerektiğinden çok daha fazla kaynak tüketir.
- Object Oriented Programlama için şarttır. Structure , Class gibi obje tabanlı programlamada dynamic memory allocation zorunluluktur. Çünkü bu yapılara eklenebilecek verilerin ve fonksiyonların teoride bir sınırı olmaması gerekir.