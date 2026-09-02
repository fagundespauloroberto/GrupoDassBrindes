unit uValidacoes;

interface

uses
  SysUtils;

/// <summary>
/// Valida se uma string contem um CPF valido com base no calculo de digitos verificadores (Modulo 11).
/// </summary>
function ValidarCPF(const ACPF: string): Boolean;

implementation

function ValidarCPF(const ACPF: string): Boolean;
var
  CPFLimpo: string;
  I, Soma, Resto, Digito1, Digito2: Integer;
begin
  Result := False;

  // Remove caracteres não numéricos caso existam
  CPFLimpo := '';
  for I := 1 to Length(ACPF) do
  begin
    if CharInSet(ACPF[I], ['0'..'9']) then
      CPFLimpo := CPFLimpo + ACPF[I];
  end;

  // Verifica tamanho exato de 11 dígitos
  if Length(CPFLimpo) <> 11 then
    Exit;

  // Elimina sequências conhecidas de CPFs inválidos (ex: 111.111.111-11, 000.000.000-00)
  if (CPFLimpo = '00000000000') or (CPFLimpo = '11111111111') or
     (CPFLimpo = '22222222222') or (CPFLimpo = '33333333333') or
     (CPFLimpo = '44444444444') or (CPFLimpo = '55555555555') or
     (CPFLimpo = '66666666666') or (CPFLimpo = '77777777777') or
     (CPFLimpo = '88888888888') or (CPFLimpo = '99999999999') then
    Exit;

  // --- PRIMEIRO DÍGITO VERIFICADOR ---
  Soma := 0;
  for I := 1 to 9 do
    Soma := Soma + (StrToInt(CPFLimpo[I]) * (11 - I));

  Resto := 11 - (Soma mod 11);
  if (Resto = 10) or (Resto = 11) then
    Digito1 := 0
  else
    Digito1 := Resto;

  if Digito1 <> StrToInt(CPFLimpo[10]) then
    Exit;

  // --- SEGUNDO DÍGITO VERIFICADOR ---
  Soma := 0;
  for I := 1 to 10 do
    Soma := Soma + (StrToInt(CPFLimpo[I]) * (12 - I));

  Resto := 11 - (Soma mod 11);
  if (Resto = 10) or (Resto = 11) then
    Digito2 := 0
  else
    Digito2 := Resto;

  if Digito2 <> StrToInt(CPFLimpo[11]) then
    Exit;

  // Se passou em todas as verificações
  Result := True;
end;

end.
