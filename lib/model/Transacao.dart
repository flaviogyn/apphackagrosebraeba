import 'package:apphackagrosebraeba/model/Produto.dart';
import 'package:apphackagrosebraeba/model/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Transacao {

  String _id;
  Usuario _idUsuario;
  Produto _idProduto;
  String _status;
  String _tipo;
  double _preco;
  DateTime _entrega;
  int _quantidade;
  String local;

  Transacao(){
    Firestore db = Firestore.instance;
    
    DocumentReference ref = db.collection("transacao").document();
    this.id = ref.documentID;
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> transacao = {
      "id" : this.id,
      "idProduto" : this.idProduto,
      "idUsuario" : this.idUsuario,
      "status" : this.status,
      "tipo" : this.tipo,
      "preco": this.preco,
      "entrega": this.entrega,
      "quantidade": this.quantidade,
      "local" : this.local,
    };
    return transacao;
  }

  // DateTimeHelper.stringToDateTime(json['DataDaAtividade'], format: 'dd/MM/yyyy'),
  get id => this._id;

  set id( value) => this._id = value;

  get idUsuario => this._idUsuario;

  set idUsuario( value) => this._idUsuario = value;

  get idProduto => this._idProduto;

  set idProduto( value) => this._idProduto = value;

  get status => this._status;

  set status( value) => this._status = value;

  get tipo => this._tipo;

  set tipo( value) => this._tipo = value;

  get preco => this._preco;

  set preco( value) => this._preco = value;

  get entrega => this._entrega;

  set entrega( value) => this._entrega = value;

  get quantidade => this._quantidade;

  set quantidade( value) => this._quantidade = value;

  get getLocal => this.local;

  set setLocal( local) => this.local = local;

}