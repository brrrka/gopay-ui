import 'package:flutter/material.dart';

class Promo extends StatefulWidget {
  const Promo({super.key});

  @override
  State<Promo> createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  int _selectedBottomIndex = 1;
  final List<String> _filterButtons = [
    'Apa aja',
    'Pesta Kuliner',
    'GoFood',
    'GoCar',
    'GoRide',
    'GoSend',
    'GoMart',
  ];
  int _selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Promo',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey[200]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildInfoCard(
                      '46',
                      'Voucher & paket',
                      Colors.orange,
                      () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildInfoCard('0', 'Langganan', Colors.pink, () {}),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.confirmation_number,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Masukkan kode promo',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filterButtons.length,
                itemBuilder: (context, index) {
                  final isSelected = index == _selectedFilterIndex;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedFilterIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? const Color(0xFF00880C)
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color:
                                isSelected
                                    ? const Color(0xFF00880C)
                                    : Colors.grey[300]!,
                          ),
                        ),
                        child: Text(
                          _filterButtons[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey[600],
                            fontWeight:
                                isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Resto jempolan lagi promo nih~',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Ad',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 260,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildRestaurantCard(
                          'images/promo/martabak.jpg',
                          '9.51 km • 35 min',
                          'Martabak Bandung Mustika, Bandar B...',
                          4.8,
                          '800+',
                        ),
                        const SizedBox(width: 12),
                        _buildRestaurantCard(
                          'images/promo/sekoteng.jpg',
                          '9.49 km • 35 min',
                          'Skotang & Bandrek Simpang Gadut, R...',
                          4.5,
                          '200+',
                        ),
                        const SizedBox(width: 12),
                        _buildRestaurantCard(
                          'images/promo/nasi_padang.jpg',
                          '8.32 km • 30 min',
                          'Nasi Padang Sederhana, Padang',
                          4.7,
                          '1000+',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Diskon menu di sekitarmu~',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 218, 253, 219),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Lihat semua',
                          style: TextStyle(
                            color: Color(0xFF00880C),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 260,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildDiscountRestaurantCard(
                          'images/promo/ayam_geprek.jpg',
                          '2.22 km',
                          'Ayam Geprek D\'chicken Sambal...',
                          4.6,
                          '300+',
                          '50% off',
                          Colors.red,
                        ),
                        const SizedBox(width: 12),
                        _buildDiscountRestaurantCard(
                          'images/promo/mie_padeh.jpg',
                          '3.07 km',
                          'Mie Padeh Narako & Ayam Geprek SI O...',
                          4.8,
                          '2rb+',
                          '45% off',
                          Colors.red,
                        ),
                        const SizedBox(width: 12),
                        _buildDiscountRestaurantCard(
                          'images/promo/bakso.jpg',
                          '1.85 km',
                          'Bakso President, Padang',
                          4.5,
                          '500+',
                          '30% off',
                          Colors.red,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Promo Maksimal',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                'Best deal diskon s.d. 75% ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Icon(
                                Icons.local_fire_department,
                                color: Colors.orange,
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 218, 253, 219),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Lihat semua',
                          style: TextStyle(
                            color: Color(0xFF00880C),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 260,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildPromoMaksimalCard(
                          'images/promo/richeese.jpg',
                          '8.46 km • 40 min',
                          'Richeese Factory, Aie Pacah',
                          4.8,
                          '400+',
                          '32% off',
                          Colors.red,
                        ),
                        const SizedBox(width: 12),
                        _buildPromoMaksimalCard(
                          'images/promo/mcdonalds.jpg',
                          '7.81 km • 35 min',
                          'McDonald\'s, Padang A.Yani',
                          4.7,
                          '76rb+',
                          '27% off',
                          Colors.red,
                        ),
                        const SizedBox(width: 12),
                        _buildPromoMaksimalCard(
                          'images/promo/kfc.jpg',
                          '6.23 km • 28 min',
                          'KFC Padang Mall',
                          4.6,
                          '2rb+',
                          '25% off',
                          Colors.red,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Text(
                        'Hemat terus tanpa putus~ ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Text('🤑', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  const Text(
                    'Beragam promo GoCar & GoRide temani kebutuhan\nmobilitas harianmu',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildLandscapeCard(
                          'images/landscape/gocar_promo1.jpg',
                        ),
                        const SizedBox(width: 12),
                        _buildLandscapeCard(
                          'images/landscape/gocar_promo2.jpg',
                        ),
                        const SizedBox(width: 12),
                        _buildLandscapeCard(
                          'images/landscape/goride_promo1.jpg',
                        ),
                        const SizedBox(width: 12),
                        _buildLandscapeCard(
                          'images/landscape/gosend_promo1.jpg',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildPromoCard(
                    'images/gosend_instant.jpg',
                    '🎉 Baru: GoSend Instant Hemat!',
                    'Ongkir lebih hemaaat 💸 Kirim tetap cepat! ⚡ Dijemput dalam 30 menit',
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Menu Banting Harga ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Text('🤑', style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          const Text(
                            'Enak di lidah, enak di dompet!',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const Text(
                            'Diskon s.d. 50%!',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 218, 253, 219),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Lihat semua',
                          style: TextStyle(
                            color: Color(0xFF00880C),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildHorizontalFoodCard(
                          'images/menu/nasi_padang_bantingharga.jpg',
                          '5.58 km • 30 min',
                          'Nasi Padang Sederhana',
                          4.7,
                          '1000+',
                        ),
                        const SizedBox(width: 12),
                        _buildHorizontalFoodCard(
                          'images/menu/ayam_geprek_bantingharga.jpg',
                          '4.23 km • 25 min',
                          'Ayam Geprek Bang Jarwo',
                          4.5,
                          '800+',
                        ),
                        const SizedBox(width: 12),
                        _buildHorizontalFoodCard(
                          'images/menu/bakso_bantingharga.jpg',
                          '3.15 km • 20 min',
                          'Bakso Mas Kumis ',
                          4.6,
                          '650+',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Takasimuraaaa!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 218, 253, 219),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Lihat semua',
                          style: TextStyle(
                            color: Color(0xFF00880C),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildHorizontalFoodCard(
                          'images/takasimura/sushi_takasimura.jpg',
                          '3.21 km • 20 min',
                          'Sushi Tei, Plaza Andalas',
                          4.8,
                          '2000+',
                        ),
                        const SizedBox(width: 12),
                        _buildHorizontalFoodCard(
                          'images/takasimura/ramen_takasimura.jpg',
                          '2.85 km • 18 min',
                          'Ramen Ya!, Jalan Sudirman',
                          4.6,
                          '1500+',
                        ),
                        const SizedBox(width: 12),
                        _buildHorizontalFoodCard(
                          'images/takasimura/bento_takasimura.jpg',
                          '4.12 km • 25 min',
                          'Bento Box, Mall SKA',
                          4.7,
                          '900+',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  Row(
                    children: [
                      const Text(
                        'Liburan pas long weekend?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Text('✨', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  const Text(
                    'Belanja hemat, dapat cashback lagi!',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildLandscapeCard(
                          'images/landscape/gocar_promo1.jpg',
                        ),
                        const SizedBox(width: 12),
                        _buildLandscapeCard(
                          'images/landscape/gocar_promo2.jpg',
                        ),
                        const SizedBox(width: 12),
                        _buildLandscapeCard(
                          'images/landscape/goride_promo1.jpg',
                        ),
                        const SizedBox(width: 12),
                        _buildLandscapeCard(
                          'images/landscape/gosend_promo1.jpg',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  _buildPromoCard(
                    'images/gosend_instant.jpg',
                    '🎉 Baru: GoSend Instant Hemat!',
                    'Ongkir lebih hemaaat 💸 Kirim tetap cepat! ⚡ Dijemput dalam 30 menit',
                  ),

                  const SizedBox(height: 20),

                  _buildPromoCard(
                    'images/gosend_instant.jpg',
                    '🎉 Baru: GoSend Instant Hemat!',
                    'Ongkir lebih hemaaat 💸 Kirim tetap cepat! ⚡ Dijemput dalam 30 menit',
                  ),

                  const SizedBox(height: 20),

                  // GoFood Header
                  _buildServiceHeaderSmall(
                    'images/gofoodwhite.png',
                    Colors.red,
                    'GoFood',
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'GoFood Brand Day',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 218, 253, 219),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Lihat semua',
                          style: TextStyle(
                            color: Color(0xFF00880C),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Menu diskon s.d. 50%, spesial dari brand-brand pilihan ✨',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildBrandCard(
                          'images/gofood/mcd_promo1.jpg',
                          'Diskon 50%',
                          '5pcs Ayam McD',
                          'Berlangsung',
                          Colors.red,
                        ),
                        const SizedBox(width: 12),
                        _buildBrandCard(
                          'images/gofood/mcd_promo2.jpg',
                          'Diskon 50%',
                          'PaNas 1 Ayam McD +...',
                          'Promo',
                          Colors.red,
                        ),
                        const SizedBox(width: 12),
                        _buildBrandCard(
                          'images/gofood/kfc_promo1.jpg',
                          'Beli 2 Gratis 1',
                          '#BYURKFC Bucket',
                          'Berlangsung',
                          Colors.red,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      const Text(
                        'Hemat lagi, hemat terus',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Text('🤑', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  const Text(
                    'Belanja hemat, dapat cashback lagi!',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildLandscapeCard(
                          'images/landscape/gocar_promo1.jpg',
                        ),
                        const SizedBox(width: 12),
                        _buildLandscapeCard(
                          'images/landscape/gocar_promo2.jpg',
                        ),
                        const SizedBox(width: 12),
                        _buildLandscapeCard(
                          'images/landscape/goride_promo1.jpg',
                        ),
                        const SizedBox(width: 12),
                        _buildLandscapeCard(
                          'images/landscape/gosend_promo1.jpg',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // GoPay Google Play Card
                  _buildGooglePlayCard(),

                  const SizedBox(height: 30),

                  _buildPromoCard(
                    'images/gosend_instant.jpg',
                    '🎉 Baru: GoSend Instant Hemat!',
                    'Ongkir lebih hemaaat 💸 Kirim tetap cepat! ⚡ Dijemput dalam 30 menit',
                  ),

                  const SizedBox(height: 20),

                  // GoMart Header
                  _buildServiceHeaderSmall(
                    'images/gomartwhite.png',
                    const Color.fromARGB(255, 238, 103, 13),
                    'GoMart',
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'GoMart Daily Deals',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 218, 253, 219),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Lihat semua',
                          style: TextStyle(
                            color: Color(0xFF00880C),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Belanja kebutuhan harian dengan promo spesial ⚡',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildBrandCard(
                          'images/gomart/indomaret_promo1.jpg',
                          'Diskon 30%',
                          'Kebutuhan Sehari-hari',
                          'Hari Ini',
                          const Color.fromARGB(255, 238, 103, 13),
                        ),
                        const SizedBox(width: 12),
                        _buildBrandCard(
                          'images/gomart/alfamart_promo1.jpg',
                          'Cashback 25%',
                          'Produk Pilihan',
                          'Berlangsung',
                          const Color.fromARGB(255, 238, 103, 13),
                        ),
                        const SizedBox(width: 12),
                        _buildBrandCard(
                          'images/gomart/superindo_promo1.jpg',
                          'Buy 1 Get 1',
                          'Snack & Minuman',
                          'Promo',
                          const Color.fromARGB(255, 238, 103, 13),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  _buildServiceHeaderSmall(
                    'images/gopay.jpg',
                    const Color(0xFF005BAE),
                    'GoPay',
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Promo menarik dari brand populer',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Buat rileks atau produktif, kamu yang tentuin!',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildBrandCard(
                          'images/gofood/mcd_promo1.jpg',
                          'Google Play',
                          '',
                          'Berlangsung',
                          Colors.red,
                        ),
                        const SizedBox(width: 12),
                        _buildBrandCard(
                          'images/gofood/mcd_promo2.jpg',
                          'Tokopedia',
                          '',
                          'Promo',
                          Colors.red,
                        ),
                        const SizedBox(width: 12),
                        _buildBrandCard(
                          'images/gofood/kfc_promo1.jpg',
                          'myTelkomsel',
                          '',
                          'Berlangsung',
                          Colors.red,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      const Text(
                        'Jangan Ketinggalan Promo ini~ ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Text('🤑', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  const Text(
                    'Belanja hemat, dapat cashback lagi!',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildLandscapeCard(
                          'images/landscape/gocar_promo1.jpg',
                        ),
                        const SizedBox(width: 12),
                        _buildLandscapeCard(
                          'images/landscape/gocar_promo2.jpg',
                        ),
                        const SizedBox(width: 12),
                        _buildLandscapeCard(
                          'images/landscape/goride_promo1.jpg',
                        ),
                        const SizedBox(width: 12),
                        _buildLandscapeCard(
                          'images/landscape/gosend_promo1.jpg',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  _buildServiceHeaderSmall(
                    'images/gopay.jpg',
                    const Color(0xFF005BAE),
                    'GoPay',
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Mau ngapain hari ini?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Buat rileks atau produktif, kamu yang tentuin!',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildBrandCard(
                          'images/gofood/mcd_promo1.jpg',
                          'Google Play',
                          '',
                          'Berlangsung',
                          Colors.red,
                        ),
                        const SizedBox(width: 12),
                        _buildBrandCard(
                          'images/gofood/mcd_promo2.jpg',
                          'Tokopedia',
                          '',
                          'Promo',
                          Colors.red,
                        ),
                        const SizedBox(width: 12),
                        _buildBrandCard(
                          'images/gofood/kfc_promo1.jpg',
                          'myTelkomsel',
                          '',
                          'Berlangsung',
                          Colors.red,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    'Biar makin hemat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 20),

                  _buildLandscapeCard('images/landscape/gocar_promo1.jpg'),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          children: [
            Expanded(
              child: _buildNavItem('images/bottombar/home.png', 'Beranda', 0),
            ),
            Expanded(
              child: _buildNavItem(
                'images/bottombar/promos-active.png',
                'Promo',
                1,
              ),
            ),
            Expanded(
              child: _buildNavItem(
                'images/bottombar/orders.png',
                'Aktivitas',
                2,
              ),
            ),
            Expanded(
              child: _buildNavItem('images/bottombar/chat.png', 'Chat', 3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    String number,
    String title,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  number,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 16,
                ),
              ],
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 6),
            Container(
              height: 3,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantCard(
    String imagePath,
    String distance,
    String title,
    double rating,
    String reviews,
  ) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Container(
              height: 120,
              width: double.infinity,
              color: Colors.grey[200],
              child: const Icon(Icons.restaurant, size: 40, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  distance,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$rating • $reviews rating',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscountRestaurantCard(
    String imagePath,
    String distance,
    String title,
    double rating,
    String reviews,
    String discount,
    Color discountColor,
  ) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: const Icon(
                    Icons.restaurant,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: discountColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    discount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  distance,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$rating • $reviews rating',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoMaksimalCard(
    String imagePath,
    String distance,
    String title,
    double rating,
    String reviews,
    String discount,
    Color discountColor,
  ) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: const Icon(
                    Icons.fastfood,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: discountColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    discount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  distance,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$rating • $reviews rating',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeCard(String imagePath) {
    return Container(
      width: 360,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[200],
          child: const Icon(Icons.directions_car, size: 40, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildPromoCard(String imagePath, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 120,
            color: Colors.grey[200],
            child: const Icon(
              Icons.local_shipping,
              size: 40,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalFoodCard(
    String imagePath,
    String distance,
    String title,
    double rating,
    String reviews,
  ) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey[200],
                  child: const Icon(
                    Icons.restaurant,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Promo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    distance,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '$rating • $reviews rating',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceHeaderSmall(
    String iconPath,
    Color backgroundColor,
    String serviceName,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.fastfood, size: 12, color: Colors.grey),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          serviceName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildBrandCard(
    String imagePath,
    String discount,
    String title,
    String badge,
    Color badgeColor,
  ) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: const Icon(
                    Icons.fastfood,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  discount,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGooglePlayCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header GoPay di bagian atas dengan margin
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 4, 0),
            child: _buildServiceHeaderSmall(
              'images/gopay.jpg',
              const Color(0xFF005BAE),
              'GoPay',
            ),
          ),

          // Konten utama card dengan stack untuk positioning tombol
          Stack(
            children: [
              Row(
                children: [
                  // Placeholder untuk foto Google Play
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),

                  // Deskripsi
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Top Up Google Play',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Cashback 10% untuk top up pertama',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 30), // Beri ruang untuk tombol
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),

              // Tombol Klaim di pojok kanan bawah
              Positioned(
                right: 12,
                bottom: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Klaim',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index) {
    bool isSelected = index == _selectedBottomIndex;
    return InkWell(
      onTap: () {
        if (index == 0) {
          // Navigate to Home (Dashboard)
          Navigator.pushReplacementNamed(context, '/');
        } else if (index == 1) {
          // Already on Promo page - do nothing
        } else if (index == 2) {
          // Navigate to Activities (implement later)
        } else if (index == 3) {
          // Navigate to Chat
          Navigator.pushNamed(context, '/pesan');
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 4,
              color: isSelected ? const Color(0xFF00880C) : Colors.transparent,
            ),
            const SizedBox(height: 8),
            Image.asset(icon, width: 20, height: 20),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? const Color(0xFF00880C) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
