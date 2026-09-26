import 'dart:io';

void main(){
  stdout.writeln("Digite o nome do seu estado (Ex: São Paulo): ");
  stdout.writeln("Norte: Acre, Amapá, Amazonas, Pará, Rondônia, Roraima, Tocantins");
  stdout.writeln("Nordeste: Alagoas, Bahia, Ceará, Maranhão, Paraíba, Pernambuco, Piauí, Rio Grande do Norte, Sergipe");
  stdout.writeln("Centro-Oeste: Goiás, Mato Grosso, Mato Grosso do Sul, Distrito Federal");
  stdout.writeln("Sudeste: Espírito Santo, Minas Gerais, Rio de Janeiro, São Paulo");
  stdout.writeln("Sul: Paraná, Rio Grande do Sul, Santa Catarina\n");

  String? uf = stdin.readLineSync()!;
  String regiao;

  if (uf.isEmpty) {
    stdout.writeln("Voce não digitou nada!");
    return;
  }

  switch (uf){
    case "Acre":
      regiao = "Norte";
    break; 
    case "Amapá":
      regiao = "Norte";
    break; 
    case "Amazonas":
      regiao = "Norte";
    break; 
    case "Pará":
      regiao = "Norte";
    break; 
    case "Rondônia":
      regiao = "Norte";
    break; 
    case "Roraima":
      regiao = "Norte";
    break; 
    case "Tocantins":
      regiao = "Norte";
    break;
    case "Alagoas":
      regiao = "Nordeste";
    break;
    case "Bahia":
      regiao = "Nordeste";
    break;
    case "Ceará":
      regiao = "Nordeste";
    break;
    case "Maranhão":
      regiao = "Nordeste";
    break;
    case "Paraíba":
      regiao = "Nordeste";
    break;
    case "Pernambuco":
      regiao = "Nordeste";
    break;
    case "Piauí":
      regiao = "Nordeste";
    break;
    case "Rio Grande do Norte":
      regiao = "Nordeste";
    break;
    case "Sergipe":
      regiao = "Nordeste";
    break;
    case "Goiás":
      regiao = "Centro-Oeste";
    break;
    case "Mato Grosso":
      regiao = "Centro-Oeste";
    break;
    case "Mato Grosso do Sul":
      regiao = "Centro-Oeste";
    break;
    case "Distrito Federal":
      regiao = "Centro-Oeste";
    break;
    case "Espírito Santo":
      regiao = "Sudeste";
    break;
    case "Minas Gerais":
      regiao = "Sudeste";
    break;
    case "Rio de Janeiro":
      regiao = "Sudeste";
    break;
    case "São Paulo":
      regiao = "Sudeste";
    break;
    case "Paraná":
      regiao = "Sul";
    break;
    case "Rio Grande do Sul":
      regiao = "Sul";
    break;
    case "Santa Catarina":
      regiao = "Sul";
    break;
    default:
    stdout.writeln("Estado não reconhecido.");
    return;
  }

  stdout.writeln("A região do estado de $uf é $regiao");

}