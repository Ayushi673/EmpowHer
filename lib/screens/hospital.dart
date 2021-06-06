import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class GetHospital extends StatefulWidget {
  @override
  _GetHospitalState createState() => _GetHospitalState();
}

class _GetHospitalState extends State<GetHospital> {

  static const lat= 40.74;
  static const long= -73.98;
  static const API_KEY= '';

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<List<String>> searchNearBy(String keyword) async{
    var dio=Dio();
    var url='https://maps.googleapis.com/maps/api/place/nearbysearch/json';
    var parameters={
      'key':API_KEY,
      'location':'$lat,$long',
      'radius':'500',
      'keyword':keyword,
    };
    var response=await dio.get(url,data:parameters);
    return response.data['results'].map<String>((result)=>result['name'].toString()).toList();
  }
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    print(await searchNearBy('hospital'));
  }


}
