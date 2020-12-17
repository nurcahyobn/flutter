# Program Penjualan

## Step 1 : persiapkan Model Data `class Transaksi`

```dart
class Transaksi {
  String pelanggan;
  String barang;
  int jumlah;
  int harga;

  Transaksi({this.pelanggan, this.barang, this.jumlah, this.harga});
}
```

## Step 2 : Buat Data Transaksi pada List<Transaksi>

```dart
  final List<Transaksi> transaksi = [
    Transaksi(pelanggan: "Nurcahyo", barang: "Sepatu", jumlah: 2, harga: 300000),
    Transaksi(pelanggan: "Arsyla", barang: "Tali Pinggang", jumlah: 3, harga: 37000),
  ];
```

## Step 3 : Tampilan Data ListView

```dart
     ListView.builder(
        itemCount: transaksi.length,
        itemBuilder: (context, index) {
          final trans = transaksi[index];
          return ListTile(
            title: Text(trans.pelanggan),
            subtitle: Text("${trans.jumlah}, ${trans.barang}"),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(
                builder: (context) => DetailTransaksi(trans: transaksi[index])));
            },
          );
        },
      ),
```

## Step 4 : Buat class `DetailTransaksi` untuk klik item pada Step3

```dart
class DetailTransaksi extends StatelessWidget {
  final Transaksi trans;

  DetailTransaksi({this.trans});

  Widget build(BuildContext context) {
    var total = trans.jumlah * trans.harga;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Transaksi"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading: Icon(Icons.check),
              title: Text("Nama Pelanggan"),
              trailing: Text(trans.pelanggan),
            ),            
          ],
        ).toList(),
      ),
    );
  }
}
```
