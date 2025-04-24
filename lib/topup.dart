import 'package:flutter/material.dart';

class _TopUpOption {
  final String name;
  final String iconPath;
  const _TopUpOption(this.name, this.iconPath);
}

const List<_TopUpOption> _addBankOptions = [
  _TopUpOption('BCA OneKlik', 'images/bca_oneklik.png'),
  _TopUpOption('Jago Pockets', 'images/jago_pockets.png'),
  _TopUpOption('BRI Direct Debit', 'images/bri_direct_debit.png'),
  _TopUpOption('blu by BCA Digital', 'images/blu_bca_digital.png'),
];

const List<_TopUpOption> _cashOptions = [
  _TopUpOption('Alfamart', 'images/alfamart.png'),
  _TopUpOption('Indomaret', 'images/indomaret.png'),
  _TopUpOption('Lawson', 'images/lawson.png'),
  _TopUpOption('Mitra Tokopedia', 'images/mitra_tokopedia.png'),
  _TopUpOption('ATM Bersama', 'images/atm_bersama.png'),
  _TopUpOption('Alfamidi', 'images/alfamidi.png'),
  _TopUpOption('Dan+Dan', 'images/dan_dan.png'),
  _TopUpOption('Pos Indonesia', 'images/pos_indonesia.png'),
];

const List<_TopUpOption> _bankOptions = [
  _TopUpOption('BRI', 'images/bri.png'),
  _TopUpOption('BCA', 'images/bca.png'),
  _TopUpOption('Mandiri', 'images/mandiri.png'),
  _TopUpOption('BNI', 'images/bni.png'),
  _TopUpOption('Jago', 'images/jago.png'),
  _TopUpOption('PermataBank', 'images/permata_bank.png'),
  _TopUpOption('CIMB Niaga', 'images/cimb_niaga.png'),
  _TopUpOption('ATM Bersama', 'images/atm_bersama.png'),
];

class TopUp extends StatelessWidget {
  const TopUp({Key? key}) : super(key: key);

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildOptionsGrid(List<_TopUpOption> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children:
            options.map((opt) {
              return SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(opt.iconPath, fit: BoxFit.contain),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      opt.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildMoreButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.green),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.green.withOpacity(0.1),
          ),
          child: Text(label, style: const TextStyle(color: Colors.green)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top up'),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Tambah akun bank'),
            _buildOptionsGrid(_addBankOptions),

            _buildSectionHeader('Pakai uang tunai'),
            _buildOptionsGrid(_cashOptions),
            _buildMoreButton('Cek 7 metode lain', () {}),

            _buildSectionHeader('Lewat bank'),
            _buildOptionsGrid(_bankOptions),
            _buildMoreButton('Cek 32 metode lain', () {}),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
