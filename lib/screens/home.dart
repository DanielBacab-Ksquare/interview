import 'package:flutter/material.dart';
import 'package:interview/repository/series_repository.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Series'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
        body: FutureBuilder(
      future: SerieRepository().getSeriesPerPage(1),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> series = snapshot.data!;

          return ListView.builder(
              itemCount: series.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/details", arguments: {
                        "product": series[index],
                      });
                    },
                    child: Container(
                      color: Colors.grey,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Image.network(series[index]['image']['medium']),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(series[index]['name'])
                        ],
                      ),
                    ));
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
