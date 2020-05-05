# Menggunakan Fungsi pada Program
Dalam pemrograman, fungsi atau prosedur sering digunakan untuk membungkus program menjadi bagian-bagian kecil.

Tujuannya agar program tidak menumpuk pada fungsi `main()` saja.
Bayangkan saja, kalau program kita tambah besar dan kompleks..
Kalau semua kodenya ditulis di dalam fungsi `main()`, maka kita akan kesulitan membacanya.

Karena itu, kita harus menggunakan Fungsi.

## Apa itu Fungsi
Fungsi adalah sub-program yang bisa digunakan kembali baik di dalam program itu sendiri, maupun di program yang lain.

Fungsi dapat menerima input dan menghasilkan output.
Contoh fungsi yang sering kita buat adalah fungsi `main()`.
Fungsi ini memang wajib ada di setiap program C++, karena fungsi inilah yang akan dieksekusi pertama kali saat program berjalan.

## Tujuan pembuatan fungsi
- Untuk mengurangi pengulangan program yang sama
- Agar program menjadi terstruktur, rapi dan lebih mudah dikembangkan.
- Untuk memudahkan dalam pengembangan program, karena program dipecah menjadi beberapa program yang lebih kecil.
- Untuk menghemat ukuran program, ini akan terasa kalau ada beberapa deretan instruksi yang sama dan digunakan pada beberapa tempat di dalam program.
- Deklarasi / prototipe fungsi.


## Struktur atau Sintaks pada Fungsi
Sebuah fungsi sederhana mempunyai bentuk penulisan sebagai berikut:
```C++
return_type nama_fungsi(parameter) {
    pernyataan 
}
```
Keterangan:
- return_type adalah nilai balik saat fungsi dipanggil 
- nama_fungsi, biasanya disesuaikan dengan kegunaan dari fungsi, namun boleh ditulis secara bebas dengan ketentuan tidak menggunakan spasi dan nama-nama fungsi yang memiliki arti sendiri. 
- parameter/argumen, diletakan di antara tanda kurung setelah nama fungsi, argumen digunakan sebagai nilai masukan untuk fungsi dan dapat dibuat lebih dari satu atau tidak sama sekali.

### Contoh -1
```C++
#include <iostream>
using namespace std;

// membuat fungsi say_hello()
void say_hello(){
    cout << "Selamat Pagi, Belajar Petruk!\n";
}

int main(){
    // memanggil fungsi say_hello()
    say_hello();
    say_hello();
    return 0;
}
```

### Contoh -2
jika ingin menuliskan `int main()` diposisi atas program, `tidak benar` ditulis seperti berikut:
```C++
#include <iostream>
using namespace std;

int main(){
    // memanggil fungsi say_hello()
    say_hello();
    say_hello();
    return 0;
}

// membuat fungsi say_hello()
void say_hello(){
    cout << "Selamat Pagi, Belajar Petruk!\n";
}
```
#### pesan error:

`prog.cpp: In function ‘int main()’:`

`prog.cpp:6:15: error: ‘say_hello’ was not declared in this scope say_hello();`

error: `‘say_hello’` belum di deklarasikan sehingga harus menambahkan `deklarasi fungsi`.
Caranya `copy` fungsi `void say_hello()` lalu `paste` sebelum `int main()`.

```C++
#include <iostream>
using namespace std;

void say_hello(); //deklarasi fungsi say_hello()

int main(){
    ...
```

### Contoh -3
```C++
#include < iostream>
using namespace std;

//declaring the function
int sum (int x, int y);

int main()
{
    int a = 10;
    int b = 20;
    int c = sum (a, b);    //calling the function
    cout << c;
}

//defining the function
int sum (int x, int y)
{
    return (x + y);
}
```
