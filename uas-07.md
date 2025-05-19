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
  final List<Map<String, dynamic>> _products = [
    {'nama': 'Sepatu', 'harga': 12000}
  ];

  void _simpanProduk(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _products.add({});
      });
      Navigator.pop(context); // Close the input widget
    }
  }
  void _deleteProduk(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _products.remove({});
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
            bottom:
                MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
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
                  decoration: const InputDecoration(
                    labelText: 'Nama Produk',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Jumlah Produk',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Harga Produk',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {},
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
              DataColumn(label: Text('Delete')),
            ],
            rows: _products.map((product) {
              return DataRow(cells: <DataCell>[
                DataCell(Text(product['nama'])),
                DataCell(Text('${product['stok']}')),
                DataCell(Text('${product['harga']}')),
                DataCell(IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ))
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
