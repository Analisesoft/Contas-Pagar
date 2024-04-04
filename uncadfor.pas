unit uncadfor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mylabel, Buttons, ExtCtrls, DB, Mask, DBCtrls, Grids,
  DBGrids;

type
  TFcadfor = class(TForm)
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    Panel4: TPanel;
    myLabel3d1: TmyLabel3d;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    DBGrid1: TDBGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcadfor: TFcadfor;

implementation

uses bancodados;

{$R *.dfm}

procedure TFcadfor.BitBtn1Click(Sender: TObject);
var codigo:integer;
begin
 dm.sql.Active:= false;
 dm.sql.sql.Text:= 'select max(codigo) as codigo from fornecedor';
 dm.sql.Active:= true;
 if dm.sql.IsEmpty then
    codigo := 1
 else codigo := (dm.sql.fieldbyname('codigo').AsInteger+1);
 dm.sql.Active:= false;

 dm.fornec.Active:= false;
 dm.fornec.selectsql.Text:= 'select * from fornecedor order by fornecedor';
 dm.fornec.Active:= true;

 dm.fornec.insert;
 dm.fornecCODIGO.Value      := codigo;
 dm.fornecDTCADASTRO.Value  := DATE;
 dm.fornecUF.Value          := 'SP';
 dbedit1.setfocus;
end;

procedure TFcadfor.BitBtn3Click(Sender: TObject);
begin
 DM.fornec.post;
 messagedlg('Registro Salvo Com Sucesso !',mtInformation,[mbok],0);
end;

procedure TFcadfor.BitBtn13Click(Sender: TObject);
begin
 dm.fornec.First;
end;

procedure TFcadfor.BitBtn14Click(Sender: TObject);
begin
 dm.fornec.Last;
end;

procedure TFcadfor.BitBtn4Click(Sender: TObject);
begin
 if messagedlg('Confirma a Exclusao do Registro ?!',mtConfirmation,[mbok,mbno],0)=mrok then
     Begin
       dm.pagar.Active:=false;
       dm.pagar.selectsql.text:='select * from pagar where codfor = '+QuotedStr(dm.fornecCODIGO.AsString);
       dm.pagar.Active:=true;
       if not dm.pagar.IsEmpty then
          if messagedlg('Existem Lançamentos para Fornecedor. Excluir mesmo Assim ?',mtConfirmation,[mbok,mbno],0)=mrok then
             begin
               dm.pagar.Active:=false;
               dm.pagar.selectsql.text:='delete  from pagar where codfor = '+QuotedStr(dm.fornecCODIGO.AsString);
               dm.pagar.prepare;
               dm.pagar.ExecSQL;
             End
         else exit;
      CriaLog('Exclusao',dm.usuario,dm.fornecFORNECEDOR.AsString);
      dm.pagar.Delete;
     end;
end;

procedure TFcadfor.SpeedButton1Click(Sender: TObject);
begin
 if dm.Trans_cadastros.Active =true  then
    DM.Trans_cadastros.Commit;
  close;
end;

procedure TFcadfor.FormShow(Sender: TObject);
begin
 dm.fornec.Active:= false;
 dm.fornec.selectsql.Text:= 'select * from fornecedor order by fornecedor';
 dm.fornec.Active:= true;
end;

procedure TFcadfor.DBGrid1CellClick(Column: TColumn);
begin
 dm.fornec.edit;
end;

end.
