// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RotasModel {
  final String rotaA;
  final String rotaB;
  final String telefone;
  final String nomeCompleto;

  RotasModel(
    this.rotaA,
    this.rotaB,
    this.telefone,
    this.nomeCompleto,
  );

  RotasModel copyWith({
    String? rotaA,
    String? rotaB,
    String? telefone,
    String? nomeCompleto,
  }) {
    return RotasModel(
      rotaA ?? this.rotaA,
      rotaB ?? this.rotaB,
      telefone ?? this.telefone,
      nomeCompleto ?? this.nomeCompleto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rotaA': rotaA,
      'rotaB': rotaB,
      'telefone': telefone,
      'nomeCompleto': nomeCompleto,
    };
  }

  factory RotasModel.fromMap(Map<String, dynamic> map) {
    return RotasModel(
      map['rotaA'] as String,
      map['rotaB'] as String,
      map['telefone'] as String,
      map['nomeCompleto'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RotasModel.fromJson(String source) =>
      RotasModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RotasModel(rotaA: $rotaA, rotaB: $rotaB, telefone: $telefone, nomeCompleto: $nomeCompleto)';
  }

  @override
  bool operator ==(covariant RotasModel other) {
    if (identical(this, other)) return true;

    return other.rotaA == rotaA &&
        other.rotaB == rotaB &&
        other.telefone == telefone &&
        other.nomeCompleto == nomeCompleto;
  }

  @override
  int get hashCode {
    return rotaA.hashCode ^
        rotaB.hashCode ^
        telefone.hashCode ^
        nomeCompleto.hashCode;
  }
}
