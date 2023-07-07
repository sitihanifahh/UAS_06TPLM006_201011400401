import 'package:cek_cuaca/pages/DateWidget.dart';
import 'package:flutter/material.dart';
import '../provider/cuaca_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CuacaProvider cuacaProvider = CuacaProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/first.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Consumer<CuacaProvider>(
              builder: (context, provider, child) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      // TextButton(
                      //   onPressed: () {
                      //     provider.showWeatherData();
                      //   },
                      //   child: const Text("Tampilkan Data Cuaca"),
                      // ),
                      SizedBox(
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(provider.cuacaModel.name ?? " ",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      Text(
                          provider.cuacaModel.weather?.first.main ??
                              "Waiting Data",
                          style: TextStyle(fontSize: 20)),

                      Text(
                        "${provider.cuacaModel.main?.temp} Celcius",
                        style: TextStyle(fontSize: 55),
                      ),
                      TextFormField(
                        controller: provider.cityNameText,
                        decoration: InputDecoration(
                          hintText: "Masukkan Nama Kota",
                          labelText: "Nama Kota",
                          alignLabelWithHint:
                              true, // Mengatur posisi label sesuai dengan hint
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20), // Mengatur padding konten input
                        ),
                        textAlign: TextAlign
                            .center, // Mengatur penempatan teks menjadi tengah
                        onEditingComplete: () {
                          provider.showWeatherData();
                        },
                      ),
                      SizedBox(
                        height: 150,
                      ),
                      DateWidget(),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
