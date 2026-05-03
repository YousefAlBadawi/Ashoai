import 'dart:ui';
import 'package:flutter/material.dart';
import 'background_painter.dart'; // استدعاء ملف الخلفية

class PlacesScreen extends StatelessWidget {
  final String areaName;
  final String serviceName;
  
  final Map<String, List<Map<String, String>>> mockData = const {
    'رستم-صيدليات': [
      {'name': 'صيدلية الشفاء', 'address': 'شارع رستم الرئيسي', 'phone': '01012345678'},
      {'name': 'صيدلية النور', 'address': 'نص رستم جنب البنك', 'phone': '01198765432'},
      {'name': 'صيدلية 19006', 'address': 'أخر شارع رستم', 'phone': '01554321678'},
    ],
    'رستم-كافيهات': [
      {'name': 'كافيه نوت', 'address': 'أول رستم', 'phone': '01000000000'},
      {'name': 'كافيه الورد', 'address': 'آخر رستم', 'phone': '01222222222'},
    ],
    'رستم-مطاعم': [
      {'name': 'مطعم الخيام', 'address': 'شارع رستم', 'phone': '01111111111'},
    ],
    'شارع فارس-صيدليات': [
      {'name': 'صيدلية الفارس', 'address': 'بداية شارع فارس', 'phone': '01555555555'},
    ],
    'شارع فارس-مطاعم': [
      {'name': 'مطعم السلطان', 'address': 'وسط شارع فارس', 'phone': '01666666666'},
      {'name': 'كشري أبو طارق', 'address': 'نهاية شارع فارس', 'phone': '01777777777'},
    ],
    'السوق-مطاعم': [
      {'name': 'مطعم الشرق', 'address': 'داخل السوق', 'phone': '01888888888'},
    ],
  };

  const PlacesScreen({super.key, required this.areaName, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    String searchKey = '$areaName-$serviceName';
    List<Map<String, String>> places = mockData[searchKey] ?? [];

    return Scaffold(
      body: Stack(
        children: [
          // طبقة الخلفية
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
          
          // طبقة الواجهة
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){ Navigator.pop(context); }, icon: const Icon(Icons.arrow_back, color: Colors.white)),
                      const SizedBox(width: 10),
                      Expanded(child: Text('$serviceName $areaName', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
                Expanded(
                  child: places.isEmpty
                      ? const Center(child: Text('لا توجد بيانات حالياً', style: TextStyle(color: Colors.white38)))
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
                                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.08),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white.withOpacity(0.15)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(color: const Color(0xFF7B2FBE).withOpacity(0.3), borderRadius: BorderRadius.circular(10)),
                                              child: const Icon(Icons.place, color: Color(0xFFD8B4FE)),
                                            ),
                                            const SizedBox(width: 15),
                                            Expanded(
                                              child: Text(place['name']!, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        _buildInfoRow(Icons.location_on_outlined, place['address']!),
                                        const SizedBox(height: 10),
                                        _buildInfoRow(Icons.phone_outlined, place['phone']!),
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