class Produto  {
  String _id;
  String _title;
  String _description;
  String _categoria;
  double _price;
  String _imageUrl;
  bool _isFavorite;

  Produto();

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "id"          : this.id,
      "title"       : this.title,
      "description" : this.description,
      "categoria"   : this.categoria,
      "price"       : this.price,
      "imageUrl"    : this.imageUrl,
      "isFavorite"  : this.isFavorite
    };
    return map;
  }

  get id => this._id;

  set id( value) => this._id = value;

  get title => this._title;

  set title( value) => this._title = value;

  get description => this._description;

  set description( value) => this._description = value;

  get categoria => this._categoria;

  set categoria(String value) => this._categoria = value;

  get price => this._price;

  set price( value) => this._price = value;

  get imageUrl => this._imageUrl;

  set imageUrl( value) => this._imageUrl = value;

  get isFavorite => this._isFavorite;

  set isFavorite( value) => this._isFavorite = value;


}
