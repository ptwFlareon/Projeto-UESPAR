unit U_Modelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TF_Modelo = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    SBNovo: TSpeedButton;
    SBSalvar: TSpeedButton;
    SBCancelar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBEditar: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    procedure SBNovoClick(Sender: TObject);
    procedure SBSalvarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Modelo: TF_Modelo;

implementation

{$R *.dfm}

uses U_Estado;

procedure TF_Modelo.SBCancelarClick(Sender: TObject);
begin
  SBNovo.Enabled := true;
  SBSalvar.Enabled := False;
  SBCancelar.Enabled := False;
  StatusBar1.Panels[0].Text := 'Registro Cancelado';
end;

procedure TF_Modelo.SBEditarClick(Sender: TObject);
begin
  SBNovo.Enabled := False;
  SBSalvar.Enabled := true;
  SBCancelar.Enabled := true;
  StatusBar1.Panels[0].Text := 'Editando Registro Atual';
end;

procedure TF_Modelo.SBExcluirClick(Sender: TObject);
begin
  SBNovo.Enabled := true;
  SBSalvar.Enabled := False;
  SBCancelar.Enabled := False;
  StatusBar1.Panels[0].Text := 'Exclu�do com Sucesso';
end;

procedure TF_Modelo.SBNovoClick(Sender: TObject);
begin
  SBSalvar.Enabled := true;
  SBNovo.Enabled := False;
  SBCancelar.Enabled := true;
  StatusBar1.Panels[0].Text := 'Inserindo Registro';
end;

procedure TF_Modelo.SBSalvarClick(Sender: TObject);
begin
  SBNovo.Enabled := true;
  SBSalvar.Enabled := False;
  SBCancelar.Enabled := False;
  StatusBar1.Panels[0].Text := 'Registro Salvo com Sucesso';
end;

end.
