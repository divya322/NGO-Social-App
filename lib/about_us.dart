import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'ABOUT US',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '''The ANIKET Sevabhavi Sanstha journey began out of the determination and ambition of Ms. Kalpana Varpe to provide refuge, rehabilitation, education and most importantly, a place to call home for the children of the section of society who are deemed ‘mentally retarded’, rejected and ruthlessly abandoned by the poorer socio-economic strata.

Kalpana Tai is herself a mother of one such special child. The experiences she went through with her own son has driven her to become the lighthouse of many such children. Her unfettered determination, hard work and selfless efforts are responsible for helping scores of individuals from the age of 4 years to 46 years in the format of a residential rehabilitation centre and school.

There are many children who are complete orphans because they were abandoned due to their mental condition and many children are left there permanently by known parents who offer little or no support to their care. The goal is to help these special kids stand in unison with their peers and make them self-sufficient in their own capacity within their capabilities. At the institution, the children help each other, look after one another under the guidance of well-trained staff who act as their only family.

ANIKET Sevabhavi Sanstha is a small organization, but one where each individual who is taken in for refuge becomes a part of the ANIKET family and given a place to call HOME for life.''',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'OUR ACTIVITIES',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '''- SCHOOL FOR SPECIAL CHILDREN: We run a school designed to take care of the needs of these special children between the ages of 4 to 18 years. The segregation is done on the basis of IQ, and they are clubbed together for studies accordingly.

- REHABILITATION WORKSHOPS: As children grow up beyond the age of 18 years, they are transferred to our rehabilitation unit and engaged in special workshops.

- GIRLS AND BOYS HOSTEL: We have separate supervised residential units for girls and boys in order to cater to their special needs and ensure safety.

- MEAL FACILITY: We facilitate cooking and provision of food for all students who live in-house or come for rehabilitation workshops.

- PLAY INSTRUMENTS AND RECREATION AREA: Engaging our children in play and recreation, including games and sports, is key in ensuring their all-round development and mental stability.

- MEDICAL FACILITY: Basic nursing care is provided at our institution, and medical support is made available on demand.''',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'THE TEAM',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '''‘Individually we are one drop, but together we are an ocean...’ Our team shows immense dedication and commitment to ANIKET, and without the support of each other, this work would not be achievable.''',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

