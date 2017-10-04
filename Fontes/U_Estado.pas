unit U_Estado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Modelo, ComCtrls, Buttons, ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TF_Estado = class(TF_Modelo)
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    FDQuery1ID_ESTADO: TIntegerField;
    FDQuery1NOME_ESTADO: TStringField;
    FDQuery1SIGLA_ESTADO: TStringField;
    Label1: TLabel;
    procedure SBNovoClick(Sender: TObject);
    procedure SBSalvarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBEditarClick(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    procedure limpaCampos;
    procedure habilitacampos;
    { Private declarations }
  public
    { Public declarations }
    crud: string;
  end;

var
  F_Estado: TF_Estado;

implementation

{$R *.dfm}

uses UDM, U_Principal;

procedure TF_Estado.SBCancelarClick(Sender: TObject);
begin
  inherited;
  limpaCampos;
end;

procedure TF_Estado.SBEditarClick(Sender: TObject);
begin
  inherited;
  habilitacampos;
  crud := 'Alterar';
  Edit2.SetFocus;
  SBExcluir.Enabled := false;
  SBEditar.Enabled := false;
end;

procedure TF_Estado.SBExcluirClick(Sender: TObject);
var
  sql: string;
begin
  inherited;
  sql := 'Delete from estado where id_estado =' + Edit1.Text;
  dm.FDConnection1.ExecSQL(sql);
  dm.FDConnection1.CommitRetaining;
  limpaCampos;
  SBExcluir.Enabled := false;
end;

procedure TF_Estado.limpaCampos;
begin
  Edit1.Text := EmptyStr;
  Edit2.Text := EmptyStr;
  Edit3.Text := EmptyStr;
  crud := EmptyStr;
  Edit1.Enabled := false;
  Edit2.Enabled := false;
  Edit3.Enabled := false;
end;

procedure TF_Estado.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Edit1.Text := FDQuery1ID_ESTADO.AsString;
  Edit2.Text := FDQuery1NOME_ESTADO.AsString;
  Edit3.Text := FDQuery1SIGLA_ESTADO.AsString;
  PageControl1.TabIndex := 0;
  SBExcluir.Enabled := true;
  SBEditar.Enabled := true;
end;

procedure TF_Estado.Edit4Change(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.ParamByName('NomeEstado').AsString := Edit4.Text + '%';
  FDQuery1.Open();
end;

procedure TF_Estado.habilitacampos;
begin
  Edit1.Enabled := false;
  Edit2.Enabled := true;
  Edit3.Enabled := true;
end;

procedure TF_Estado.SBNovoClick(Sender: TObject);
begin
  inherited;
  TabSheet1.Show;
  habilitacampos;
  Edit2.SetFocus;
  crud := 'Inserir';
  SBEditar.Enabled := false;
end;

procedure TF_Estado.SBSalvarClick(Sender: TObject);
var
  sql: string;
  max: integer;
begin
  if Edit2.Text = '' then
  begin
    ShowMessage('Nome do Estado deve ser preenchido');
    Edit2.SetFocus;
  end
  else if (Length(Edit3.Text) <> 2) then
  begin
    ShowMessage('Sigla do Estado deve ser preenchida corretamente');
    Edit3.SetFocus;
  end

  else
  begin
    if crud = 'Inserir' then
    begin
      dm.FDQEstado.Close;
      dm.FDQEstado.Open();
      max := dm.FDQEstadoMAX.AsInteger + 1;
      Edit1.Text := IntToStr(max);
      sql := 'Insert into estado values(' +
      //
        Edit1.Text + ',' + //
        QuotedStr(Edit2.Text) + ',' + //
        QuotedStr(Edit3.Text) + ')';
    end
    else
    begin
      sql := 'update estado set' + //
        ' nome_estado=' + QuotedStr(Edit2.Text) + //
        ', sigla_estado =' + QuotedStr(Edit3.Text) + //
        ' where id_estado =' + Edit1.Text;
    end;
    dm.FDConnection1.ExecSQL(sql);
    dm.FDConnection1.CommitRetaining;
    limpaCampos;
    inherited;
  end;

end;

end.
