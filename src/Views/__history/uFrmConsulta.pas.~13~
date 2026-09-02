unit uFrmConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls,
  uFuncionarioController, uDMConnection;

type
  TFrmConsulta = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CbCampoFiltro: TComboBox;
    EdtValorFiltro: TEdit;
    BtnPesquisar: TButton;
    DBGridFuncionarios: TDBGrid;
    Panel2: TPanel;
    BtnNovo: TButton;
    BtnEditar: TButton;
    BtnExcluir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);

  private
    { Private declarations }
    FController: TFuncionarioController;
    procedure AtualizarGrid;
  public
    { Public declarations }
  end;

var
  FrmConsulta: TFrmConsulta;

implementation

  uses
    uFrmCadastro;
{$R *.dfm}

{ TFrmConsulta }

procedure TFrmConsulta.AtualizarGrid;
begin
  FController.Listar(CbCampoFiltro.Text, EdtValorFiltro.Text);
end;

procedure TFrmConsulta.BtnExcluirClick(Sender: TObject);
var
  Erro: string;
  IDFuncionario: Integer;
begin
  if DMConnection.cdsFuncionario.IsEmpty then
  begin
    MessageDlg('Nenhum funcionário selecionado para exclusão.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o funcionário selecionado?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    IDFuncionario := DMConnection.cdsFuncionario.FieldByName('ID').AsInteger;

    if FController.Excluir(IDFuncionario, Erro) then
    begin
      ShowMessage('Funcionário excluído com sucesso!');
      AtualizarGrid;
    end
    else
    begin
      MessageDlg('Erro ao excluir: ' + Erro, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFrmConsulta.BtnNovoClick(Sender: TObject);
var
  FrmCadastro: TFrmCadastro;
begin
  FrmCadastro := TFrmCadastro.Create(Self);
  try
    FrmCadastro.LimparCampos;
    if FrmCadastro.ShowModal = mrOk then
      AtualizarGrid;
  finally
    FrmCadastro.Free;
  end;
end;

procedure TFrmConsulta.FormCreate(Sender: TObject);
begin
  FController := TFuncionarioController.Create;
end;

procedure TFrmConsulta.BtnPesquisarClick(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TFrmConsulta.FormDestroy(Sender: TObject);
begin
  FController.Free;
end;

procedure TFrmConsulta.FormShow(Sender: TObject);
begin
  AtualizarGrid;
end;

end.
