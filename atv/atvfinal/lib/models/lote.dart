class Lote {
  final String? id;
  final String nome;
  final String capacidade;
  final String tamanho;
  final String ocupado;

  const Lote(
      {this.id,
      required this.nome,
      required this.capacidade,
      required this.tamanho,
      required this.ocupado});
}
