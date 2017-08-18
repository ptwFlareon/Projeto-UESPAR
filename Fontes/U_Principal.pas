unit U_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TF_Principal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Estado1: TMenuItem;
    Cidade1: TMenuItem;
    Cliente1: TMenuItem;
    Venda1: TMenuItem;
    EntradeProdutos1: TMenuItem;
    Relatrios1: TMenuItem;
    Produtos1: TMenuItem;
    Produtos2: TMenuItem;
    Clientes1: TMenuItem;
    Vendas1: TMenuItem;
    Estoque1: TMenuItem;
    Image1: TImage;
    procedure Estado1Click(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure EntradeProdutos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

uses U_Cidade, U_Cliente, U_Estado, U_Modelo, U_Produto, U_Venda, U_Entrada;

{$R *.dfm}

procedure TF_Principal.Cidade1Click(Sender: TObject);
begin
  F_Cidade.ShowModal;
end;

procedure TF_Principal.Cliente1Click(Sender: TObject);
begin
  F_Cliente.ShowModal;
end;

procedure TF_Principal.EntradeProdutos1Click(Sender: TObject);
begin
F_Entrada.showmodal;
end;

procedure TF_Principal.Estado1Click(Sender: TObject);
begin
  F_Estado.ShowModal;
end;

procedure TF_Principal.Produtos1Click(Sender: TObject);
begin
  F_Produto.ShowModal;
end;

procedure TF_Principal.Venda1Click(Sender: TObject);
begin
F_Venda.showmodal;
end;

end.
