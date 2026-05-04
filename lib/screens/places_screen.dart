import 'dart:ui';
import 'package:flutter/material.dart';
import 'background_painter.dart'; 

class PlacesScreen extends StatelessWidget {
  final String areaName;
  final String serviceName;
  
  final Map<String, List<Map<String, String>>> mockData = const {
    'رستم-صيدليات': [
      {'name': 'ناهد محمد (رجب)', 'address': 'محطة رستم', 'phone': '01002070033'},
      {'name': 'رجب محمد', 'address': 'ملف رستم', 'phone': '01002070033'},
      {'name': 'فاطمه', 'address': 'شارع ورشة البلاط', 'phone': '01007732150'},
      {'name': 'ماجده', 'address': 'شارع سيد البابلي', 'phone': '01226330171'},
   
    ],
    'رستم-كافيهات': [
      {'name': 'كافيه تامر', 'address': 'شارع ورشة البلاط', 'phone': '01020105578'},
      {'name': 'كافيه الاهلويه', 'address': 'محطة رستم', 'phone': '01198776899'},

    ],
    'رستم-مطاعم': [
      {'name': 'أبو علي الكبابجي', 'address': 'محطة رستم', 'phone': '01010447410'},
      {'name': 'بيتزا وفطائر افندينا', 'address': 'محطة رستم', 'phone': '01015405540'},
      {'name': 'جمبري الشرقاوي', 'address': 'محطة رستم', 'phone': '01149393621'},
    ],
    'شارع فارس-صيدليات': [
      
    ],
    'شارع فارس-مطاعم': [
      
    ],
    'السوق-مطاعم': [

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