program ProjetoUespar;

uses
  Forms,
  U_Modelo in 'U_Modelo.pas' {F_Modelo},
  U_Estado in 'U_Estado.pas' {F_Estado},
  U_Cidade in 'U_Cidade.pas' {F_Cidade},
  U_Cliente in 'U_Cliente.pas' {F_Cliente},
  U_Principal in 'U_Principal.pas' {F_Principal},
  U_Produto in 'U_Produto.pas' {F_Produto},
  U_Venda in 'U_Venda.pas' {F_Venda},
  Vcl.Themes,
  Vcl.Styles,
  U_Entrada in 'U_Entrada.pas' {F_Entrada},
  UDM in 'UDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Obsidian');
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TF_Modelo, F_Modelo);
  Application.CreateForm(TF_Estado, F_Estado);
  Application.CreateForm(TF_Cidade, F_Cidade);
  Application.CreateForm(TF_Cliente, F_Cliente);
  Application.CreateForm(TF_Produto, F_Produto);
  Application.CreateForm(TF_Venda, F_Venda);
  Application.CreateForm(TF_Entrada, F_Entrada);
  Application.CreateForm(TDM, DM);
  Application.Run;

end.
