unit uFuncionarioModel;

interface

type
  TFuncionario = class
  private
    FID: Integer;
    FCPF: string;
    FNome: string;
    FEmail: string;
    FTamanhoCamiseta: string;
    FTamanhoCalcado: Integer;
  public
    property ID: Integer read FID write FID;
    property CPF: string read FCPF write FCPF;
    property Nome: string read FNome write FNome;
    property Email: string read FEmail write FEmail;
    property TamanhoCamiseta: string read FTamanhoCamiseta write FTamanhoCamiseta;
    property TamanhoCalcado: Integer read FTamanhoCalcado write FTamanhoCalcado;
  end;

implementation

end.
