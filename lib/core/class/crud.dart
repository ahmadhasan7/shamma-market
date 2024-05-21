import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shamamarket/core/class/stutusconntection.dart';

import '../functions/checkinternet.dart';

class Crud {
  //////////////getdata////////////////////////////
  Future<Either<StatusRequest, List<dynamic>>> getdata(
      String linkurl, @required String Token) async {
    Map<String, String> header = {};
    if (Token != null) {
      header.addAll({"authorization": "token ${Token}"});
    }

    if (await checkInternet()) {
      var response = await http.get(Uri.parse(linkurl), headers: header);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responsebody = jsonDecode(response.body);
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> getdataasmap(
      String linkurl, @required String Token) async {
    Map<String, String> header = {};
    if (Token != null) {
      header.addAll({"authorization": "token ${Token}"});
    }

    if (await checkInternet()) {
      var response = await http.get(Uri.parse(linkurl), headers: header);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responsebody = jsonDecode(response.body);
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  /////////////postdata////////////////////////////////////////
  Future<Either<StatusRequest, Map>> postData(
      String linkurl, Map data, @required String Token) async {
    Map<String, String> header = {};
    if (Token != null) {
      header.addAll({"authorization": "token ${Token}"});
    }

    if (await checkInternet()) {
      var response =
          await http.post(Uri.parse(linkurl), body: data, headers: header);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  //////////////////////////////deletedata//////////////////////////////////
  Future<Either<StatusRequest, Map<String, dynamic>>> deletedata(
      String linkurl, @required String Token) async {
    Map<String, String> header = {};
    if (Token != null) {
      header.addAll({"authorization": "token ${Token}"});
    }

    if (await checkInternet()) {
      var response = await http.delete(Uri.parse(linkurl), headers: header);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responsebody = jsonDecode(response.body);
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  /////////////putdata/////////////////////////////////////
  Future<Either<StatusRequest, Map>> putdata(
      String linkurl, Map data, @required String Token) async {
    Map<String, String> header = {};
    if (Token != null) {
      header.addAll({"authorization": "token ${Token}"});
    }

    if (await checkInternet()) {
      var response =
          await http.put(Uri.parse(linkurl), body: data, headers: header);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
