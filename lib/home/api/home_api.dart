// var port = '10.0.2.2';
var port = '127.0.0.1:8000';

Future<int> getCount(request) async {
  var url = 'https://ecoist.up.railway.app/get-campaign-sum/';
  final response = await request.get(url);
  final data = response;
  return data;
}

Future<String> getLastQuestion(request) async {
  var url = 'https://ecoist.up.railway.app/get_last_question/';
  final response = await request.get(url);
  final data = response;
  return data;
}

void addQuestion(request, question) async {
  // var url = 'http://$port/logout/';
  var url = 'https://ecoist.up.railway.app/submit-question/';
  await request.post(url,
      // 'http://$port/flutter_notes/',
      {"question": question});
}
