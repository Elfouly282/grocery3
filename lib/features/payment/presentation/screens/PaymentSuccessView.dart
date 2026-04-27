import 'package:flutter/material.dart';
import 'package:grocery3/features/payment/domain/entities/PaymentDetails.dart';


class PaymentSuccessView extends StatelessWidget {
  final PaymentDetails details;

  const PaymentSuccessView({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF006400), width: 3),  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.check,
                  size: 80,
                  color: Color(0xFF006400),
                ),
              ),
              const SizedBox(height: 24),
              
              const Text(
                "Payment Successful",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006400),
                ),
              ),
              const SizedBox(height: 40),
              
              // كارت تفاصيل الدفع
              _buildDetailsCard(),
              
              const Spacer(flex: 2),
              
              // الأزرار السفلية
              _buildActionButtons(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FBFC),   borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blueGrey.withOpacity(0.1)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // الـ Label الصغير اللي فوق الكارت "Payment Details"
          Positioned(
            top: -35,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              color: const Color(0xFFF0F4F7),
              child: const Text(
                "Payment Details",
                style: TextStyle(color: Color(0xFF003D5B), fontSize: 14),
              ),
            ),
          ),
          Column(
            children: [
              _buildDataRow("Transaction ID", details.transactionId),
              _buildDataRow("Date", details.date),
              _buildDataRow("Type of Transaction", details.paymentMethod),
              _buildDataRow("Total", "${details.amount}£"),
              _buildDataRow("State", "Successful", isSuccessState: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value, {bool isSuccessState = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: isSuccessState ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              // Logic Track Order
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF003D5B), // نفس لون الزرار في الصورة
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text(
              "Track Your Order",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 55,
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF003D5B)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text(
              "Return Home",
              style: TextStyle(color: Color(0xFF003D5B), fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}