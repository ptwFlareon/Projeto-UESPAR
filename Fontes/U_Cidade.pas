unit U_Cidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Modelo, ComCtrls, Buttons, ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls;

type
  TF_Cidade = class(TF_Modelo)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    label4: TLabel;
    Edit5: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    FDQuery1ID_CIDADE: TIntegerField;
    FDQuery1NOME_CIDADE: TStringField;
    FDQuery1CEP: TStringField;
    FDQuery1ID_ESTADO: TIntegerField;
    Label5: TLabel;
    procedure SBNovoClick(Sender: TObject);
    procedure SBSalvarClick(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SBEditarClick(Sender: TObject);
  private
    procedure habilitacampos;
    procedure limpacampos;
    { Private declarations }
  public
    { Public declarations }
    crud: string;
  end;

var
  F_Cidade: TF_Cidade;

implementation

{$R *.dfm}

uses UDM;

procedure TF_Cidade.SBCancelarClick(Sender: TObject);
begin
  inherited;
  limpacampos;
end;

procedure TF_Cidade.SBEditarClick(Sender: TObject);
begin
  inherited;
  habilitacampos;
  crud := 'Alterar';
  Edit2.SetFocus;
  SBExcluir.Enabled := false;
  SBEditar.Enabled := false;
end;

procedure TF_Cidade.SBExcluirClick(Sender: TObject);
var
  sql: string;
begin
  inherited;
  sql := 'Delete from cidade where id_cidade =' + Edit1.Text;
  dm.FDConnection1.ExecSQL(sql);
  dm.FDConnection1.CommitRetaining;
  limpacampos;
end;

procedure TF_Cidade.SBNovoClick(Sender: TObject);
begin
  inherited;
  crud := 'Inserir';
  TabSheet1.Show;
  habilitacampos;
  Edit1.Enabled := false;
  Edit2.SetFocus;
end;

procedure TF_Cidade.SBSalvarClick(Sender: TObject);
var
  sql: string;
  max: integer;
begin
  if Edit2.Text = '' then
  begin
    ShowMessage('Nome da Cidade deve ser preenchido');
    Edit2.SetFocus;
  end
  else if Edit3.Text = '' then
  begin
    ShowMessage('CEP deve ser preenchido corretamente');
    Edit3.SetFocus;
  end
  else
  begin
    if crud = 'Inserir' then
    begin
      dm.FDQCidade.Close;
      dm.FDQCidade.Open();
      max := dm.fdqcidadeMAX.AsInteger;
      Edit1.Text := IntToStr(max + 1);
      sql := 'Insert into cidade values(' +
      //
        Edit1.Text + ',' + //
        QuotedStr(Edit2.Text) + ',' + //
        QuotedStr(Edit3.Text) + ',' + //
        Edit4.Text + ')';
    end
    else if crud = 'Alterar' then
    begin
      sql := 'update cidade set' + //
        ' nome_cidade=' + QuotedStr(Edit2.Text) + //
        ', CEP =' + QuotedStr(Edit3.Text) + //
        ', id_Estado =' + Edit4.Text + //
        ' where id_cidade =' + Edit1.Text;
    end;
    dm.FDConnection1.ExecSQL(sql);
    dm.FDConnection1.CommitRetaining;
    limpacampos;

  end;

end;

procedure TF_Cidade.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Edit1.Text := FDQuery1ID_CIDADE.AsString;
  Edit2.Text := FDQuery1NOME_CIDADE.AsString;
  Edit3.Text := FDQuery1CEP.AsString;
  Edit4.Text := FDQuery1ID_ESTADO.AsString;
  PageControl1.TabIndex := 0;
  SBExcluir.Enabled := true;
  SBEditar.Enabled := true;
end;

procedure TF_Cidade.Edit5Change(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.ParamByName('NomeCidade').AsString := Edit5.Text + '%';
  FDQuery1.Open();
end;

procedure TF_Cidade.habilitacampos;
begin
  Edit1.Enabled := true;
  Edit2.Enabled := true;
  Edit3.Enabled := true;
  Edit4.Enabled := true;
end;

procedure TF_Cidade.limpacampos;
begin
  Edit1.Text := EmptyStr;
  Edit2.Text := EmptyStr;
  Edit3.Text := EmptyStr;
  Edit4.Text := EmptyStr;
  crud := EmptyStr;
  Edit1.Enabled := false;
  Edit2.Enabled := false;
  Edit3.Enabled := false;
  Edit4.Enabled := false;
end;

end.
