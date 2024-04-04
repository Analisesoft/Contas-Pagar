program Pagar;

uses
  Forms,
  menu in 'menu.pas' {Frmmenu},
  bancodados in 'bancodados.pas' {DM: TDataModule},
  pagar_res in 'pagar_res.pas' {Fres_pagar},
  uncadfor in 'uncadfor.pas' {Fcadfor};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Contas a Pagar';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmmenu, Frmmenu);
  Application.Run;
end.
