import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class ServiceModel {
  final String name;
  final Color color;
  final String iconPath;
  final String? bannerText; // Optional banner text
  final Color? bannerColor; // Optional banner color

  ServiceModel({
    required this.name,
    required this.color,
    required this.iconPath,
    this.bannerText,
    this.bannerColor,
  });
}

class JumbotronModel {
  final String imagePath;

  JumbotronModel({required this.imagePath});
}

class _DashboardState extends State<Dashboard> {
  final List<String> makananList = [
    'Nasi Goreng',
    'Mie Ayam',
    'Sate Padang',
    'Rendang',
    'Ayam Geprek',
  ];

  final List<JumbotronModel> jumbotronItems = [
    JumbotronModel(imagePath: 'images/jumbotron.png'),
    JumbotronModel(imagePath: 'images/jumbotron2.png'),
    JumbotronModel(imagePath: 'images/jumbotron3.jpg'),
    JumbotronModel(imagePath: 'images/jumbotron4.jpg'),
  ];

  final List<ServiceModel> services = [
    ServiceModel(
      name: 'GoRide',
      color: const Color(0xFF00AA13),
      iconPath: 'images/goride.png',
      bannerText: '5RB!', // Add banner text
      bannerColor: Colors.black, // Banner color
    ),
    ServiceModel(
      name: 'GoCar',
      color: const Color(0xFF00AA13),
      iconPath: 'images/gocar.png',
      bannerText: '6RB!',
      bannerColor: Colors.black,
    ),
    ServiceModel(
      name: 'GoFood',
      color: const Color(0xFFEE2737),
      iconPath: 'images/gofood.png',
      bannerText: '-75%',
      bannerColor: Colors.black,
    ),
    ServiceModel(
      name: 'GoSend',
      color: const Color(0xFF00AA13),
      iconPath: 'images/gosend.png',
      bannerText: '5RB!',
      bannerColor: Colors.black,
    ),
    ServiceModel(
      name: 'GoMart',
      color: const Color(0xFFED2739),
      iconPath: 'images/gomart.png',
      // No banner for this service
    ),
    ServiceModel(
      name: 'GoTagihan',
      color: const Color(0xFF0081A0),
      iconPath: 'images/gotagihan.png',
    ),
    ServiceModel(
      name: 'GoTix',
      color: const Color(0xFFFF0066),
      iconPath: 'images/gotix.png',
    ),
  ];

  int _currentIndex = 0;
  int _currentJumbotronIndex = 0;
  Timer? _timer;
  Timer? _jumbotronTimer;
  late PageController _jumbotronController;

  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _jumbotronController = PageController();
    _startHintChanger();
    _startJumbotronChanger();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset > 10 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 10 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  void _startHintChanger() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % makananList.length;
      });
    });
  }

  void _startJumbotronChanger() {
    _jumbotronTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentJumbotronIndex < jumbotronItems.length - 1) {
        _currentJumbotronIndex++;
      } else {
        _currentJumbotronIndex = 0;
      }

      if (_jumbotronController.hasClients) {
        _jumbotronController.animateToPage(
          _currentJumbotronIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _jumbotronTimer?.cancel();
    _jumbotronController.dispose();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {},
            child: CustomScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(top: 85),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            GestureDetector(
                              onHorizontalDragEnd: (details) {
                                if (details.primaryVelocity! > 0) {
                                  if (_currentJumbotronIndex > 0) {
                                    _jumbotronController.previousPage(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                } else if (details.primaryVelocity! < 0) {
                                  if (_currentJumbotronIndex <
                                      jumbotronItems.length - 1) {
                                    _jumbotronController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                }
                              },
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 220,
                                child: PageView.builder(
                                  controller: _jumbotronController,
                                  onPageChanged: (index) {
                                    setState(() {
                                      _currentJumbotronIndex = index;
                                    });
                                  },
                                  itemCount: jumbotronItems.length,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        // Image
                                        Image.asset(
                                          jumbotronItems[index].imagePath,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 220,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Column(
                            children: [
                              _buildGopayContainer(),
                              const SizedBox(height: 30),

                              Wrap(
                                spacing: 4,
                                runSpacing: 16,
                                children: [
                                  ...services.map((service) {
                                    return InkWell(
                                      onTap: () {
                                        print("Mengklik ${service.name}");
                                      },
                                      child: SizedBox(
                                        width: 80,
                                        child: ServiceItem(service: service),
                                      ),
                                    );
                                  }).toList(),
                                  InkWell(
                                    onTap: () {},
                                    child: SizedBox(
                                      width: 80,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: const Icon(
                                              Icons.more_horiz,
                                              color: Colors.grey,
                                              size: 30,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          const Text(
                                            'Lainnya',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),

                              // GoPay Plus
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF00880C),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Color(0xFF00880C),
                                          size: 20,
                                          weight: 1000,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Expanded(
                                        child: Text(
                                          'Diskon s.d. 10rb/transaksi. Yuk, langganan',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          shape: BoxShape.circle,
                                        ),
                                        child: const FaIcon(
                                          FontAwesomeIcons.arrowRight,
                                          size: 14,
                                          color: Color(0xFF00880C),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Promo Cards with InkWell
                              InkWell(
                                onTap: () {},
                                child: _buildPromoCard(
                                  'images/promo1.png',
                                  'Gopay Pinjam',
                                  'Cicilan mulai dari 0.06%/hari! Segera aktifkan dan rasakan kemudahannya',
                                ),
                              ),

                              const SizedBox(height: 20),

                              InkWell(
                                onTap: () {},
                                child: _buildPromoCard(
                                  'images/promo2.jpg',
                                  'Cobain Kirim Barang Besar, Diskon s.d. Rp100.000! ✅',
                                  'Khusus Buat kamu, GoBox kasih kamu diskon s.d. Rp100.000 yang bisa kamu pakai untuk kirim barang besar, pindahan, beli peralatan furniture, hingga angkut motor untuk di service.',
                                ),
                              ),

                              const SizedBox(height: 20),

                              InkWell(
                                onTap: () {},
                                child: _buildPromoCard(
                                  'images/promo3.jpg',
                                  'Bepergian ke Mana pun, Lebih Hemat Naik GoCar/GoRide 🚗',
                                  'Lagi mau bepergian? Mending pake GoCar/GoRide aja karena udah pasti aman dan nyaman. Selain itu bayarnya lebih hemat karena ada voucher diskon senilai total Rp50.000 pakai GoPay',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 90,
              decoration: BoxDecoration(
                color: _isScrolled ? Colors.white : const Color(0xFF03AA15),
                boxShadow:
                    _isScrolled
                        ? [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                        : [],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SafeArea(
                bottom: false,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.grey[600],
                              ),
                            ),
                            Positioned(
                              left: 60,
                              child: Text(
                                makananList[_currentIndex],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 0.5),
                        ),
                        child: const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Color(0xFF00880C)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          children: [
            Expanded(
              child: _buildNavItem(
                'images/bottombar/home-active.png',
                'Home',
                0,
              ),
            ),
            Expanded(
              child: _buildNavItem('images/bottombar/promos.png', 'Promo', 1),
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

  Widget _buildGopayContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            GestureDetector(
              // Bungkus dengan GestureDetector dari sini
              onTap: () {
                Navigator.pushNamed(context, '/riwayat');
              },
              child: Row(
                // Tambahkan Row untuk mengelompokkan wallet icon dan text
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'images/wallet.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rp150.703',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '0 Coins',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/qris');
              },
              child: Column(
                children: [
                  Container(
                    height: 23,
                    width: 23,
                    decoration: BoxDecoration(
                      color: const Color(0xFF09B0D6),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xFF09B0D6),
                        width: 0.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.white,
                      weight: 1000,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Bayar',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/topup');
              },
              child: Column(
                children: [
                  Container(
                    height: 23,
                    width: 23,
                    decoration: BoxDecoration(
                      color: const Color(0xFF09B0D6),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xFF09B0D6),
                        width: 0.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Top Up',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                print("Lainnya button tapped");
                Navigator.pushNamed(context, '/home');
              },
              child: Column(
                children: [
                  Container(
                    height: 23,
                    width: 23,
                    decoration: BoxDecoration(
                      color: const Color(0xFF09B0D6),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: const Color(0xFF09B0D6),
                        width: 0.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.white,
                      weight: 2000,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Lainnya',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index) {
    bool isSelected = index == 0;
    return InkWell(
      onTap: () {
        if (index == 1) {
          // Navigate to Promo page
          Navigator.pushNamed(context, '/promo');
        } else if (index == 2) {
          // Navigate to Activities (implement later)
        } else if (index == 3) {
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

Widget _buildPromoCard(String images, String title, String subtitle) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey, width: 0.5),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(images, fit: BoxFit.fitWidth),
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

class ServiceItem extends StatelessWidget {
  final ServiceModel service;

  const ServiceItem({required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: service.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(service.iconPath, width: 30, height: 30),
                ],
              ),
            ),
            // Banner (jika ada)
            if (service.bannerText != null)
              Positioned(
                top: -8,
                left: -8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: service.bannerColor ?? Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    service.bannerText!,
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
        const SizedBox(height: 8),
        Text(
          service.name,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
