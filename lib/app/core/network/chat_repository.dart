import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> generateResponse(String prompt) async {


  var url = Uri.https("api.openai.com", "/v1/chat/completions");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $apiKey"
    },
    body: json.encode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content":
              "You are an assistant and people will ask you about hair care products, if anyone askes about anything that is not related to hair care say that you don't know"
        },
        {
          "role": "user",
          "content": prompt,
        },
      ]
    }),
  );

  Map<String, dynamic> newresponse = jsonDecode(response.body);
  return newresponse['choices'][0]['message']['content'];
}
