```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InputDataProduk(),
    );
  }
}


class InputDataProduk extends StatefulWidget {
  const InputDataProduk({super.key});

  @override
  State<InputDataProduk> createState() => _InputDataProdukState();
}

class _InputDataProdukState extends State<InputDataProduk> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaProdukController = TextEditingController();
  final TextEditingController _stokProdukController = TextEditingController();
  final TextEditingController _hargaProdukController = TextEditingController();
  List<Map<String, dynamic>> _products = [];

  void _simpanProduk(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _products.add({
          'nama': _namaProdukController.text,
          'stok': int.parse(_stokProdukController.text),
          'harga': int.parse(_hargaProdukController.text),
        });
      });
      Navigator.pop(context); // Close the input widget
    }
  }

  void _showInputForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to take more height
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _namaProdukController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Produk',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama produk tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _stokProdukController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Jumlah Produk',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Stok produk tidak boleh kosong';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Masukkan angka yang valid untuk stok';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _hargaProdukController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Harga Produk',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'harga produk tidak boleh kosong';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Masukkan angka yang valid untuk harga';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () => _simpanProduk(context),
                  child: const Text('Simpan Produk'),
                ),
                const SizedBox(height: 8.0), // Add some space at the bottom
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Produk'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Text('Nama Produk')),
              DataColumn(label: Text('Stok')),
              DataColumn(label: Text('Harga')),
            ],
            rows: _products.map((product) {
              return DataRow(cells: <DataCell>[
                DataCell(Text(product['nama'])),
                DataCell(Text('${product['stok']}')),
                DataCell(Text('${product['harga']}')),
              ]);
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showInputForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

```
