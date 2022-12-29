import 'dart:convert';
import 'package:http/http.dart' as http;

class SerieRepository {
    Future<List> getSeriesPerPage(int page) async {
    var requestUrl = Uri.parse('https://api.tvmaze.com/shows?page=$page');
    var response = await http.get(requestUrl);
    checkAndThrowError(response);
    var respJson = jsonDecode(response.body);
    return respJson;
  }

  /* getEpisodesBySerie(int id) async {
    var requestUrl = Uri.parse('https://api.tvmaze.com/shows/$id/episodes');
    var response = await http.get(requestUrl);
    checkAndThrowError(response);
    var respJson = jsonDecode(response.body);
    return respJson;
  } */

  static void checkAndThrowError(http.Response response) {
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
  }
}
