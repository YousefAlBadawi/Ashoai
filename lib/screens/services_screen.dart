import 'dart:ui';
import 'package:flutter/material.dart';
import 'places_screen.dart';
import 'background_painter.dart'; // استدعاء ملف الخلفية

class ServicesScreen extends StatelessWidget {
  final String areaName;
  const ServicesScreen({super.key, required this.areaName});

  final Map<String, IconData> services = const {
    'كافيهات': Icons.coffee,
    'مطاعم': Icons.restaurant,
    'صيدليات': Icons.local_pharmacy,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // طبقة الخلفية
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0D001A), Color(0xFF1A0033)],
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
                      Text('خدمات $areaName', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ListView.builder(
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        String serviceName = services.keys.elementAt(index);
                        IconData icon = services.values.elementAt(index);
                        
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PlacesScreen(areaName: areaName, serviceName: serviceName)));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white.withOpacity(0.15)),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(icon, color: const Color(0xFFD8B4FE), size: 30),
                                      const SizedBox(width: 20),
                                      Text(serviceName, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
                                      const Spacer(),
                                      const Icon(Icons.arrow_forward_ios, color: Colors.white38, size: 16),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}