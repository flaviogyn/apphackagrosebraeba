class Usuario {

  String _idUsuario;
  String _nome;
  String _email;
  String _senha;
  String _tipoUsuario;
  String _telefone;
  String _whastApp;
  String _cidade;
  String _estado;
  double _latitude;
  double _longitude;

  Usuario();

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "idUsuario"   : this.idUsuario,
      "nome"        : this.nome,
      "email"       : this.email,
      "tipoUsuario" : this.tipoUsuario,
      "telefone"    : this.telefone,
      "whastApp"    : this.whastApp,
      "cidade"      : this.cidade,
      "estado"      : this.estado,
      "latitude"    : this.latitude,
      "longitude"   : this.longitude,
    };
    return map;
  }

  String verificaTipoUsuario(bool tipoUsuario){
    return tipoUsuario ? "produtor" : "comprador";
  }

  get idUsuario => this._idUsuario;

  set idUsuario( value) => this._idUsuario = value;

  get nome => this._nome;

  set nome( value) => this._nome = value;

  get email => this._email;

  set email( value) => this._email = value;

  get senha => this._senha;

  set senha( value) => this._senha = value;

  get tipoUsuario => this._tipoUsuario;

  set tipoUsuario( value) => this._tipoUsuario = value;

  get telefone => this._telefone;

  set telefone( value) => this._telefone = value;

  get whastApp => this._whastApp;

  set whastApp( value) => this._whastApp = value;

  get cidade => this._cidade;

  set cidade( value) => this._cidade = value;

  get estado => this._estado;

  set estado( value) => this._estado = value;

  get latitude => this._latitude;

  set latitude( value) => this._latitude = value;

  get longitude => this._longitude;

  set longitude( value) => this._longitude = value;

}