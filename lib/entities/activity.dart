/*
import 'package:farmplus/core/validators/date_time_helper.dart';
import 'package:farmplus/core/validators/number_helper.dart';

class Activity {
  int id;
  int businessId;
  int machineId;
  int plantingId;
  int implementId;
  int activityTypeId;
  DateTime date;
  String planting;
  String business;
  double hourmeterStart;
  double hourmeterEnd;
  String implement;
  String machine;
  String activityType;
  String activityGuid;
  bool isSync;
  int masterCode;

  Activity({
    this.id = 0,
    this.businessId,
    this.machineId,
    this.plantingId,
    this.implementId,
    this.activityTypeId,
    this.date,
    this.planting,
    this.business,
    this.hourmeterStart,
    this.hourmeterEnd,
    this.implement,
    this.machine,
    this.activityType,
    this.activityGuid,
    this.masterCode,
    this.isSync,
  });

  static Activity fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Activity(
      id: json['CodigoDaAtividade'],
      businessId: json['CodigoDaEmpresa'],
      machineId: json['CodigoDaMaquina'],
      plantingId: json['CodigoDoEmpreendimento'],
      implementId: json['CodigoDoImplemento'],
      activityTypeId: json['CodigoDoTipoDeAtividade'],
      date: DateTimeHelper.stringToDateTime(json['DataDaAtividade'], format: 'dd/MM/yyyy'),
      planting: json['Empreendimento'],
      business: json['Empresa'],
      hourmeterStart: NumberHelper.toDouble(json['HorimetroFinal']),
      hourmeterEnd: NumberHelper.toDouble(json['HorimetroInicial']),
      implement: json['Implemento'],
      machine: json['Maquina'],
      activityType: json['TipoDeAtividade'],
      activityGuid: json['guidDaAtividade'],
      masterCode: json['CodigoMs'],
      isSync: json['Lido'],
    );
  }

  static Map<String, dynamic> toJson(Activity entity) {
    if (entity == null) return null;

    return {
      'CodigoDaAtividade': entity.id ?? 0,
      'CodigoDaEmpresa': entity.businessId,
      'CodigoDaMaquina': entity.machineId,
      'CodigoDoEmpreendimento': entity.plantingId,
      'CodigoDoImplemento': entity.implementId,
      'CodigoDoTipoDeAtividade': entity.activityTypeId,
      'DataDaAtividade': DateTimeHelper.dateTimeToString(entity.date, format: 'dd/MM/yyyy'),
      'Empreendimento': entity.planting,
      'Empresa': entity.business,
      'HorimetroFinal': entity.hourmeterStart,
      'HorimetroInicial': entity.hourmeterEnd,
      'Implemento': entity.implement,
      'Maquina': entity.machine,
      'TipoDeAtividade': entity.activityType,
      'guidDaAtividade': entity.activityGuid,
      'CodigoMs': entity.masterCode,
      'Lido': entity.isSync,
    };
  }

  static List<Activity> fromJsonArray(List<dynamic> jsonArray) {
    if (jsonArray == null) return null;

    return jsonArray.where((model) => model is Map<String, dynamic>).map((model) => fromJson(model)).toList(growable: false);
  }

  static List<Map<String, dynamic>> toJsonArray(List<Activity> entities) {
    return entities?.map((entity) => toJson(entity))?.toList(growable: false);
  }

  @override
  String toString() => activityType;

  @override
  operator ==(o) => o is Activity && o.id == id;

  @override
  int get hashCode => id.hashCode ^ activityType.hashCode;
}
*/