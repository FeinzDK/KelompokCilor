import 'package:cilore/models/makanan_model.dart';
import 'package:cilore/services/makanan_service.dart';
import 'package:cilore/widgets/makanan_card.dart';
import 'package:flutter/material.dart';

class Api extends StatelessWidget {
  final MakananService _makananService = MakananService();

  Api({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar Makanan Seafood",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<MakananModel>>(
        future: _makananService.fetchMakanan(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text("Tidak ada Makanan yang tersedia!"));
          } else {
            final makanan = snapshot.data!;
            return ListView.builder(
              itemCount: makanan.length,
              itemBuilder: (context, index) {
                return MakananCard(makananModel: makanan[index]);
              },
            );
          }
        },
      ),
    );
  }
}
