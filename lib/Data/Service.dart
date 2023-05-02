import 'dart:convert';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as https;
import 'dart:io';

import 'Utilities.dart';

// class Utilities {
//   static dynamic link;
// }

class ServiceProvider {
  static String link = 'https://www.inferdo.com/img/nsfw-1-raw.jpg';

  Future<dynamic> GetNfswurl() async {
    // const url =
    //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0KQ5AbhKjCg9QM_W_VJoStePFz1SGFr8dXrzTNPLdhw&usqp=CAU&ec=48600113';
    const url =
        'https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373__340.jpg';
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
    print(output);
    // for (var key in output.keys) print(key); // prints Key_1 then Key_2
    // for (var value in output.values) print(value); // prints Value_1 then Value_2
    for (dynamic entry in output.entries) {
      Utilities.value.add(entry.value);
      // print(entry.value);
    }
    // Map<String,String> datas =Map();
    List<dynamic> s = [];
    Utilities.safeornot.add(Utilities.value[2]);
    // print(Utilities.safeornot);
    // datas[Utilities.value[2]];
    // print(datas);
    for (dynamic entry in Utilities.value[2].entries) {
      // Utilities.value.add('${entry.value}');
      s.add(entry.key.toString() + ' ' + entry.value.toString());
      // s.add(entry.value);
    }
    Utilities.sd = s[1];
    Utilities.er = s[2];
    // print(Utilities.sd);
    // print(Utilities.er);
    // print(s[1]);
    // print(s[2]);
    // print(s[3]);
    // print(s[4]);
    // print(s[5]);
  }

  Future<dynamic> Getimages()async{
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
      Utilities.data = output;
      print(Utilities.data);
      print(output);
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
