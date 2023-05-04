import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:stealth_startup_project/Data/Models/Nfswselectimage.dart';
import 'package:stealth_startup_project/Data/Models/nfswusingurl.dart';
import 'Utilities.dart';

class ServiceProvider {
  static String link = 'https://www.inferdo.com/img/nsfw-1-raw.jpg';

  Future<Nfswusingurl> GetNfswurl() async {
    const url =
        'https://cdni.pornpics.com/460/1/298/14940439/14940439_016_ad42.jpg';
    const models = 'nudity-2.0';
    const apiUser = '1114383217';
    const apiSecret = 'ukDSf6oVXzR2TAAeErTU';
    final uri = Uri.https('api.sightengine.com', '/1.0/check.json', {
      'url': url,
      'models': models,
      'api_user': apiUser,
      'api_secret': apiSecret,
    });
    final response = await https.get(uri);
    final output = json.decode(response.body);
    dynamic data = output['nudity'];
    print(data);
    Nfswusingurl list = nfswusingurlFromJson(jsonEncode(data));
    return list;
  }

  Future<Nfswselectimage?> Getimages() async {
    var request = https.MultipartRequest(
      'POST',
      Uri.parse('https://api.sightengine.com/1.0/check.json'),
    );

    var file = await https.MultipartFile.fromPath(
      'media',
      Utilities.images.toString(),
    );

    request.files.add(file);

    request.fields.addAll({
      'models': 'nudity-2.0',
      'api_user': '1114383217',
      'api_secret': 'ukDSf6oVXzR2TAAeErTU',
    });

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var output = json.decode(responseBody);
      dynamic data = output['nudity'];
      Nfswselectimage list = nfswselectimageFromJson(jsonEncode(data));
      print(list.sexualDisplay);
      return list;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<https.Response> Textcheck(String title) {
    return https.get(
      Uri.parse(
          'https://api.api-ninjas.com/v1/profanityfilter?text=${Utilities.text}'),
      headers: {'X-Api-Key': 'anc1gnMtyMswfC90xxeJpg==N4CL9WFVWSQ8SjUs'},
    );
  }
}
