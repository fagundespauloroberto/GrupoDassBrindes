object FrmCadastro: TFrmCadastro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Funcion'#225'rio'
  ClientHeight = 299
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 564
    Height = 254
    Align = alClient
    TabOrder = 0
    ExplicitTop = 38
    ExplicitHeight = 261
    object Label1: TLabel
      Left = 91
      Top = 46
      Width = 23
      Height = 13
      Caption = 'CPF:'
    end
    object Label3: TLabel
      Left = 25
      Top = 73
      Width = 89
      Height = 13
      Caption = 'Nome Funcionario:'
    end
    object ID: TLabel
      Left = 99
      Top = 19
      Width = 15
      Height = 13
      Caption = 'ID:'
    end
    object Label4: TLabel
      Left = 4
      Top = 127
      Width = 110
      Height = 13
      Caption = 'Tamanho de Camiseta:'
    end
    object Label5: TLabel
      Left = 10
      Top = 154
      Width = 104
      Height = 13
      Caption = 'Tamanho do Cal'#231'ado:'
    end
    object Label6: TLabel
      Left = 82
      Top = 100
      Width = 32
      Height = 13
      Caption = 'E-mail:'
    end
    object EdtCPF: TEdit
      Left = 120
      Top = 43
      Width = 121
      Height = 21
      MaxLength = 11
      TabOrder = 0
    end
    object EdtNome: TEdit
      Left = 120
      Top = 70
      Width = 121
      Height = 21
      MaxLength = 100
      TabOrder = 1
    end
    object EdtID: TEdit
      Left = 120
      Top = 16
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object EdtEmail: TEdit
      Left = 120
      Top = 97
      Width = 121
      Height = 21
      MaxLength = 150
      TabOrder = 3
    end
    object EdtTamanhoCalcado: TEdit
      Left = 120
      Top = 151
      Width = 121
      Height = 21
      MaxLength = 2
      TabOrder = 4
    end
    object CbTamanhoCamiseta: TComboBox
      Left = 120
      Top = 124
      Width = 121
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      Items.Strings = (
        'PP'
        'P'
        'M'
        'G'
        'GG'
        'XG')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 254
    Width = 564
    Height = 45
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 258
    object BtnSalvar: TButton
      Left = 48
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = BtnSalvarClick
    end
    object BtnCancelar: TButton
      Left = 147
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
    end
  end
end
