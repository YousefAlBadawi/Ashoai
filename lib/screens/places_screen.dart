import 'dart:ui';
import 'package:flutter/material.dart';
import 'background_painter.dart';

class PlacesScreen extends StatelessWidget {
  final String areaName;
  final String serviceName;

  final Map<String, List<Map<String, String>>> mockData = const {
    'رستم-صيدليات': [
      {
        'name': 'ناهد محمد (رجب)',
        'address': 'محطة رستم',
        'phone': '01002070033'
      },
      {'name': 'رجب محمد', 'address': 'ملف رستم', 'phone': '01002070033'},
      {'name': 'فاطمه', 'address': 'شارع ورشة البلاط', 'phone': '01007732150'},
      {'name': 'ماجده', 'address': 'شارع سيد البابلي', 'phone': '01226330171'},
    ],
    'رستم-كافيهات': [
      {
        'name': 'كافيه تامر',
        'address': 'شارع ورشة البلاط',
        'phone': '01020105578'
      },
      {
        'name': 'كافيه الاهلويه',
        'address': 'محطة رستم',
        'phone': '01198776899'
      },
    ],
    'رستم-مطاعم': [
      {
        'name': 'أبو علي الكبابجي',
        'address': 'محطة رستم',
        'phone': '01010447410'
      },
      {
        'name': 'بيتزا وفطائر افندينا',
        'address': 'محطة رستم',
        'phone': '01015405540'
      },
      {
        'name': 'جمبري الشرقاوي',
        'address': 'محطة رستم',
        'phone': '01149393621'
      },
    ],
    'شارع فارس-صيدليات': [
      {
        'name': 'صيدليه حسام ومياده 1',
        'address': '18شارع فارس الرئيسي',
        'phone': '01288987690'
      },
      {
        'name': 'صيدليه حسام ومياده 2',
        'address': 'شارع احمد العجلاتي متفرع من شارع فارس',
        'phone': '01230778102'
      },
    ],
    'شارع فارس-مطاعم': [
      {
        'name': 'حلال كريب',
        'address': '21 شارع فارس الرئيسي ',
        'phone': '01288423047'
      },
    ],
    'السوق-كافيهات': [
      {
        'name': 'كافيه بحبح',
        'address': 'موقف بحبح اخر شارع السوق',
        'phone': '01299763938'
      },
    ],
    'السوق-صيدليات': [
      {
        'name': 'صيدليه مصطفي صلاح',
        'address': 'مخرج موقف بحبح',
        'phone': '0244075044'
      },
      {
        'name': 'صيدليه صحتك',
        'address': 'شارع المسجد القديم',
        'phone': '0244053657'
      },
    ],
    'اول البلد-مطاعم': [
      {
        'name': 'حلواني نجمة باسوس',
        'address': 'دخلة اول البلد',
        'phone': '01146120099'
      },
      {
        'name': 'حلواني الصافي',
        'address': 'دخلة اول البلد بجوار فرع وي',
        'phone': '0244072220'
      },
      {
        'name': 'بيتزا ابو عمر',
        'address': 'اول البلد امام الصافي وفرع وي',
        'phone': '01026810950'
      },
    ],
    'اول البلد-كافيهات': [
      {
        'name': 'كافيه قهوتك',
        'address': 'اول البلد امام الكنيسه',
        'phone': '01288414648'
      }
    ],
    'اول البلد-صيدليات': [
      {
        'name': 'صيدليه د/ زينب عبدالرازق',
        'address': 'اول البلد بجوار الكنيسه',
        'phone': '01104197142'
      },
      {
        'name': 'صيدليه مصطفي صلاح',
        'address': 'دخلة اول البلد',
        'phone': '0244075044'
      }
    ],
    'الموزه-كافيهات': [
      {
        'name': 'كافيه ركن السهرة',
        'address': 'شارع الموزة ',
        'phone': '01102377041'
      },
      {
        'name': 'كافيه الريان',
        'address': 'امام فرع اورنج',
        'phone': '01552066828'
      },
    ],
    'الموزه-مطاعم': [
      {
        'name': 'كشري الخديوي',
        'address': 'امام مستودع الانابيب',
        'phone': '01155501946'
      },
      {
        'name': 'ابوكرم السبكي للمشويات',
        'address': 'امام شارع الموزة',
        'phone': '01093124122'
      },
      {
        'name': 'فطاطري القليوبي',
        'address': 'امام شارع الموزة',
        'phone': '01110454750'
      },
    ],
    'الموزه-صيدليات': [
      {
        'name': 'صيدلية د/ فاطمة عربي',
        'address': 'امام مسجد الخلفاء',
        'phone': '01021549689'
      },
    ],
    'الدائري-مطاعم': [
      {
        'name': 'مخبز سوق العصر',
        'address': 'طلعه دائري باسوس',
        'phone': '01118876546'
      },
      {
        'name': 'بيتزا وفطائر المتوكل',
        'address': 'طلعه دائري باسوس',
        'phone': '01099883567'
      },
    ],
    'الدائري-كافيهات': [
      {
        'name': 'كافيه الدائري',
        'address': 'منطقة الزاويه',
        'phone': '01110872322'
      },
      {
        'name': 'كافيه السرايا',
        'address': 'طلعة دائري باسوس',
        'phone': '01110782314'
      },
    ],
    'الدائري-صيدليات': [
      {'name': 'صيدلية شريف', 'address': 'الفخراني', 'phone': '0244453324'},
    ],
  };

  const PlacesScreen(
      {super.key, required this.areaName, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    String searchKey = '$areaName-$serviceName';
    List<Map<String, String>> places = mockData[searchKey] ?? [];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0D001A), Color(0xFF2E1065)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: CustomPaint(painter: GlowyBackgroundPainter()),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back,
                              color: Colors.white)),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Text('$serviceName $areaName',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
                Expanded(
                  child: places.isEmpty
                      ? const Center(
                          child: Text('لا توجد بيانات حالياً',
                              style: TextStyle(color: Colors.white38)))
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: places.length,
                          itemBuilder: (context, index) {
                            final place = places[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.08),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color:
                                              Colors.white.withOpacity(0.15)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  color: const Color(0xFF7B2FBE)
                                                      .withOpacity(0.3),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Icon(Icons.place,
                                                  color: Color(0xFFD8B4FE)),
                                            ),
                                            const SizedBox(width: 15),
                                            Expanded(
                                              child: Text(place['name']!,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        _buildInfoRow(
                                            Icons.location_on_outlined,
                                            place['address']!),
                                        const SizedBox(height: 10),
                                        _buildInfoRow(Icons.phone_outlined,
                                            place['phone']!),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white54, size: 18),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(color: Colors.white70, fontSize: 15)),
      ],
    );
  }
}
