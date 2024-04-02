program Pagar;

uses
  Forms,
  menu in 'menu.pas' {Form1},
  bancodados in 'bancodados.pas' {DM: TDataModule},
  pagar_res in 'pagar_res.pas' {Fres_pagar};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Contas a Pagar';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFres_pagar, Fres_pagar);
  Application.Run;
end.
