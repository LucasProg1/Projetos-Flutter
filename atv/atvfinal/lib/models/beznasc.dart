class Beznasc {
  final String? id;
  final String idBez;
  final String idMatriz;
  final String lote;
  final String dataNasc;
  final String descri;
  final String idRepro;
  final String sexo;
  final String? foto; //teste

  const Beznasc({
    this.id,
    required this.idBez,
    required this.idMatriz,
    required this.dataNasc,
    required this.lote,
    required this.descri,
    required this.idRepro,
    required this.sexo,
    this.foto,
  });
}
