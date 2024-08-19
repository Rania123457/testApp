// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DatabaseHelper {
// String serverUrl = "http://192.168.30.106:8000/api"; // Mobile (ip change, check)

  String serverUrl = "http://127.0.0.1:8000/api"; // Chrome
  var status;

/////////////////////////////// login fun ////////////////////////////////////////////

  Future<bool> loginData(String Phone, String password) async {
    String myUrl = "$serverUrl/login/Doctor";
    final response = await http.post(Uri.parse(myUrl),
        headers: {'Accept': 'application/json'},
        body: {"Phone": "$Phone", "password": "$password"});
    var status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["seccess"]}');
    }
    return status;
  }

///////////////////////////////////// register fun /////////////////////////////////////////

  registerData(
      String name, String Phone, String password, String special) async {
    String myUrl = "$serverUrl/register";
    final response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "name": "jhjkhl",
      "Phone": "7894561230",
      "password": "$password",
      "special": "bjgj"
    });
    status = response.body.contains('error');
    var data = json.decode(response.body);
    print(response.statusCode);
    if (status) {
      print(response.statusCode);
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["seccess"]}');
    }
  }

////////////////////////// (post) index fun all data from database ///////////////////////////////////////////

  Future<List> getPost() async {
    String myUrl = "$serverUrl/PostIndex_D";
    http.Response response = await http.get(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    });
    return json.decode(response.body);
  }

////////////////////////  delete fun (post) /////////////////////////////////////////////////////////////

  void deletePost(int id) async {
    String myUrl = "$serverUrl/deletePost_D/$id";
    http.delete(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

////////////////////////////// store data to database (post) /////////////////////////////////////////

  void addPost(
      String title, String content, String image, String record) async {
    String myUrl = "$serverUrl/StorePost_D";
    http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "title": "$title",
      "content": "$content",
      "image": "$image",
      "record": "$record"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

//

///////////////////////////// edit data (post)       ////////////////////////////////////////////////////
//
//
  void editPost(
      int id, String title, String content, String image, String record) async {
    String myUrl = "$serverUrl/api/UpdatePost_D/$id";
    http.put(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "title": "$title",
      "content": "$content",
      "image": "$image",
      "record": "$record"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

//
//
// ///////////////////////////////// post done ///////////////////////////////////////////////////////////

//////////////////////////////////// comment to post //////////////

  void addCommentToPost(String content, String record) async {
    String myUrl = "$serverUrl/comment";
    http.post(Uri.parse(myUrl),
        headers: {'Accept': 'application/json'},
        body: {"content": "$content", "record": "$record"}).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

// ////////////////////////// (consul) index fun all data from database //////

  Future<List> getconsul() async {
    String myUrl = "$serverUrl/AskIndex_D";
    http.Response response = await http.get(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    });
    return json.decode(response.body);
  }

////////////////////////  delete fun (consul) //////////

  void deleteConsul(int id) async {
    String myUrl = "$serverUrl/deleteAsk/$id";
    http.delete(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

////////////////////////////// store data to database (consul) ///////

  void addConsul(
      String title, String content, String image, String record) async {
    String myUrl = "$serverUrl/storeAsk";
    http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "title": "$title",
      "content": "$content",
      "image": "$image",
      "record": "$record"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

// ///////////////////////////////// consul edit ///////////

  void editConsul(
      int id, String title, String content, String image, String record) async {
    String myUrl = "$serverUrl/api/UpdateAsk/$id";
    http.put(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "title": "$title",
      "content": "$content",
      "image": "$image",
      "record": "$record"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

/////////////////////////////  consul  done/////////////////////////////////////////
//////////////////////////// comment to consul //////////////////////////////////

  void addCommenttoConsul(String content, String record) async {
    String myUrl = "$serverUrl/commentAsk_D";
    http.post(Uri.parse(myUrl),
        headers: {'Accept': 'application/json'},
        body: {"content": "$content", "record": "$record"}).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<List> getprofile(int id) async {
    String myUrl = "$serverUrl/doctor_profile";
    http.Response response = await http.get(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    });
    return json.decode(response.body);
  }

  void editProfile(String name, String phone, String password) async {
    String myUrl = "$serverUrl/Benificary_profile/update";
    http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "name": "$name",
      "phone": "$phone",
      "password": "$password"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  //////////////////////////////////   chat    //////////////////////////////////////////////////////////////////////////////////

  Future<List> getChat() async {
    String myUrl = "$serverUrl/Index_chat";
    http.Response response = await http.get(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    });
    return json.decode(response.body);
  }

/////////////////////////////////////////////////////

  void addChatAsk(String content, String record) async {
    String myUrl = "$serverUrl/saveask";
    http.post(Uri.parse(myUrl),
        headers: {'Accept': 'application/json'},
        body: {"content": "$content", "record": "$record"}).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  /////////////////////////////////////////////////////

  Future<List> showanswer() async {
    String myUrl = "$serverUrl/showanswer";
    http.Response response = await http.get(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    });
    return json.decode(response.body);
  }

  ////////////////////////////  الحصول على الرمز    //////////////////////////////////////////////

  void Get_the_code(String Phone) async {
    String myUrl = "$serverUrl/Get_the_code";
    http.post(Uri.parse(myUrl),
        headers: {'Accept': 'application/json'},
        body: {"Phone": "$Phone"}).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  ////////////////////////////////////////////////////////////////////////////////////
  void code_confirmation(
    String num,
  ) async {
    String myUrl = "$serverUrl/code_confirmation";
    http.post(Uri.parse(myUrl),
        headers: {'Accept': 'application/json'},
        body: {"num": "$num"}).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
}
