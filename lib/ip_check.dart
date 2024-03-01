//https://api.ipify.org
import "dart:convert";

import "package:http/http.dart" as http;

import "models/ip.dart";

const sito = "https://ipapi.co/json/";

Future<Ip> getIP() async {
  //con l'async dico che questo metodo è asincrono le cose succedono una dietro l'altra
  final url = Uri.parse(
      sito); //Crea un nuovo oggetto Uri analizzando una stringa che viene dal metodo URI
  final res = await http.get(
      url); //farà una request di quel URL atraverso il metodo GET //await serve per fare aspettare la get fino a  che non ti risponde
  final Map<String, dynamic> data = json.decode(res.body);
  Ip ip = Ip(
      ip: data["ip"],
      region: data["region"],
      postal: data["postal"],
      city: data["city"]);

  return ip;
}
