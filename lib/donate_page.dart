import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DonatePage extends StatelessWidget {
  final String bankId =
      'gpay11176160238@okbizaxis'; // Replace with your bank ID

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: bankId));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('UPI ID copied to clipboard'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Thank you for your donation!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Image.asset(
                'assets/images/donation_image.jpg', // Replace with your image asset path
                width: 300,
                height: 500,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'UPI ID for Donations:',
                  style: TextStyle(fontSize: 20),
                ),
              ),

              SizedBox(height: 8),
              Center(
                child: Text(
                  bankId,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _copyToClipboard(context);
                  },
                  child: Text('Copy to Clipboard'),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'DETAILS FOR DIRECT BANK TRANSFER AND CHEQUES',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'CHEQUE NAME\n'
                'ANIKET SEVABHAVI SANSTHA',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Courier Address:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 8),
              Text(
                'Aniket Sevabhavi Sanstha,\n'
                'C/o Om Shree Sai Om School for Special Kids,\n'
                'Paud Mulshi Road,\n'
                'Old Jakat Naka,\n'
                'Near Surbhi Hotel,\n'
                'Bavdhan Khurd,\n'
                'Pune - 411021\n'
                'Phone: 9921187127',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Bank details for Direct Bank Transfer:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 8),
              Text(
                'Beneficiary Name: ANIKET SEVABHAVI SANSTHA\n'
                'Account No: 60305457250\n'
                'Bank: Bank of Maharashtra\n'
                'Branch: Bhugaon, Pune\n'
                'IFSC Code: MAHB0001749\n'
                'Pan Card No: AAHTA1082D',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'IMPORTANT NOTE FOR DONATION IN FUNDS:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 8),
              Text(
                'Please send us an email at info@aniket.org with your Full Name, Phone Number, and Address when you make a NEFT/IMPS transfer to our account, as your personal details to make Donation Receipt DO NOT reflect in the Bank Statement.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20), // Add some space for clarity
              // Additional payment section can be added here
            ],
          ),
        ),
      ),
    );
  }
}
