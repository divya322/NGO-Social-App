import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'OUR CHILDREN AND TEAM LOVE VISITORS!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'IF YOU WOULD LIKE TO VISIT US, PLEASE GIVE US A CALL AND BE OUR GUEST!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'ANIKET SEVABHAVI SANSTHA',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Residential Rehabilitation Centre',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'For Specially-Abled Individuals',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Urawade (Gadewadi), Taluka Mulshi, Pune 412115',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Phone: +91-9921187127',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Email: info@aniket.org',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              "Get in touch.. we'd love to hear from you!",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
