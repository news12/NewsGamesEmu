unit Base.Color;

interface

Const
  BRANCO = $00F9F9F9; // branco
  AZUL = $00A00000; // azul
  AZULC = $00FFAC59; // Azul Claro
  AZULE = $00400000; // azul escuro
  VERMELHO = $002020FF; // vermelho
  VERMELHOC = $008080FF; // vermelho claro
  VERDE = $00408000; // verde
  VERDEC = $0080FF00; // verde claro
  PRETO = $00171717; // preto
  CINZA = $00C5C5C5; // cinza
  LARANJA = $000080FF; // laranja
  AMARELOC = $00BFFFFF; //Amarelo

Type
  COR = Record
    BRANCO: word; // branco
    AZUL: word; // azul
    AZULC: word; // Azul Claro
    AZULE: word; // azul escuro
    VERMELHO: word; // vermelho
    VERMELHOC: word; // vermelho claro
    VERDE: word; // verde
    VERDEC: word; // verde claro
    PRETO: word; // preto
    CINZA: word; // cinza
    LARANJA: word; // laranja

  End;

implementation

end.
