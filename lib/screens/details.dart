import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {

  List<Hospitals> userlist=new List();

  @override
  void initState() {
    _getRequest();
    super.initState();
  }


  Future<List<Hospitals>> _getRequest() async{
    String url="http://localhost:50738/users/REHABILITATION";
    http.Response res=await http.get(url);
    var rb=res.body;
    var list=json.decode(rb) as List;
    List<Hospitals> listval=list.map((e)=>Hospitals.fromJson(e)).toList();

    setState(() {
      userlist.addAll(listval);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: userlist.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(userlist[index].nAME),
            subtitle: Text(userlist[index].aDDRESS),
          );
        },
      ),
    );
  }
}


class Hospitals {
  double x;
  double y;
  int oBJECTID;
  int iD;
  String nAME;
  String aDDRESS;
  String cITY;
  String sTATE;
  int zIP;
  String zIP4;
  String tELEPHONE;
  String tYPE;
  String sTATUS;
  int pOPULATION;
  String cOUNTY;
  String cOUNTYFIPS;
  String cOUNTRY;
  double lATITUDE;
  double lONGITUDE;
  int nAICSCODE;
  String nAICSDESC;
  String sOURCE;
  String sOURCEDATE;
  String vALMETHOD;
  String vALDATE;
  String wEBSITE;
  String sTATEID;
  String aLTNAME;
  int sTFIPS;
  String oWNER;
  int tTLSTAFF;
  int bEDS;
  String tRAUMA;
  String hELIPAD;

  Hospitals(
      {this.x,
        this.y,
        this.oBJECTID,
        this.iD,
        this.nAME,
        this.aDDRESS,
        this.cITY,
        this.sTATE,
        this.zIP,
        this.zIP4,
        this.tELEPHONE,
        this.tYPE,
        this.sTATUS,
        this.pOPULATION,
        this.cOUNTY,
        this.cOUNTYFIPS,
        this.cOUNTRY,
        this.lATITUDE,
        this.lONGITUDE,
        this.nAICSCODE,
        this.nAICSDESC,
        this.sOURCE,
        this.sOURCEDATE,
        this.vALMETHOD,
        this.vALDATE,
        this.wEBSITE,
        this.sTATEID,
        this.aLTNAME,
        this.sTFIPS,
        this.oWNER,
        this.tTLSTAFF,
        this.bEDS,
        this.tRAUMA,
        this.hELIPAD});

  Hospitals.fromJson(Map<String, dynamic> json) {
    x = json['X'];
    y = json['Y'];
    oBJECTID = json['OBJECTID'];
    iD = json['ID'];
    nAME = json['NAME'];
    aDDRESS = json['ADDRESS'];
    cITY = json['CITY'];
    sTATE = json['STATE'];
    zIP = json['ZIP'];
    zIP4 = json['ZIP4'];
    tELEPHONE = json['TELEPHONE'];
    tYPE = json['TYPE'];
    sTATUS = json['STATUS'];
    pOPULATION = json['POPULATION'];
    cOUNTY = json['COUNTY'];
    cOUNTYFIPS = json['COUNTYFIPS'];
    cOUNTRY = json['COUNTRY'];
    lATITUDE = json['LATITUDE'];
    lONGITUDE = json['LONGITUDE'];
    nAICSCODE = json['NAICS_CODE'];
    nAICSDESC = json['NAICS_DESC'];
    sOURCE = json['SOURCE'];
    sOURCEDATE = json['SOURCEDATE'];
    vALMETHOD = json['VAL_METHOD'];
    vALDATE = json['VAL_DATE'];
    wEBSITE = json['WEBSITE'];
    sTATEID = json['STATE_ID'];
    aLTNAME = json['ALT_NAME'];
    sTFIPS = json['ST_FIPS'];
    oWNER = json['OWNER'];
    tTLSTAFF = json['TTL_STAFF'];
    bEDS = json['BEDS'];
    tRAUMA = json['TRAUMA'];
    hELIPAD = json['HELIPAD'];
  }
}
/*
WomensLaw.org has state-by-state information about laws including protective and restraining orders and child custody laws.
Legal Services Corporation is an independent nonprofit established by Congress in 1974 to provide financial support for civil legal aid to low-income Americans. The Corporation currently provides funding to 134 independent nonprofit legal aid organizations in every state, the District of Columbia, and U.S. Territories.
VINE allows crime victims to obtain timely and reliable information about criminal cases and the custody status of offenders 24 hours a day. Victims and other concerned citizens can also register to be notified by phone, email or TTY device.
National Clearinghouse for the Defense of Battered Women assists battered women charged with crimes and members of their defense teams such as defense attorneys, advocates, expert witnesses.
Ask a volunteer legal services provider (attorneys who offer free legal services to low-income individuals) or a local advocacy group about actions against your partner for behaviors like criminal assault, aggravated assault, harassment, stalking, or interfering with child custody.
 */