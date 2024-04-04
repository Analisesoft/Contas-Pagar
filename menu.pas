unit menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, ExplBtn;

type
  TFrmmenu = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    ExplorerButton1: TExplorerButton;
    ExplorerButton2: TExplorerButton;
    ExplorerButton3: TExplorerButton;
    procedure calcula_dia;
    procedure FormShow(Sender: TObject);
    procedure ExplorerButton1Click(Sender: TObject);
    procedure ExplorerButton2Click(Sender: TObject);
    procedure ExplorerButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmmenu: TFrmmenu;

implementation

uses bancodados, pagar_res, uncadfor;

{$R *.dfm}

procedure TFrmmenu.calcula_dia;
var dia:string;
begin
  dia := formatdatetime('mm/dd/yyyy',date);
  dm.sql.active:=false;
  dm.sql.SQL.Text:='select vencto,sum(valor) as Total from pagar where flag = '+QuotedStr('D')+' and vencto = '+QuotedStr(dia)+' group by vencto';
  dm.sql.active:=true;
  if not dm.sql.IsEmpty then
     Begin
        label2.caption := datetostr(date);
        label3.caption := 'R$ '+formatcurr('########0.00',dm.sql.fieldbyname('total').Value);
     end
  else begin
         label2.caption := datetostr(date);
         label3.caption := '0,00';
       end;
  dm.sql.active:=false;
end;

procedure TFrmmenu.FormShow(Sender: TObject);
var f:textfile; s:string;
begin
  Assignfile(f,'\pagar\pagar.ini');
  reset(f);
  readln(f,s);
  dm.dados.Connected:=false;
  dm.dados.DatabaseName:=s;
  closefile(f);
  try
    calcula_dia;
    finally;
  end;
 dm.pagar.Active:=false;

end;

procedure TFrmmenu.ExplorerButton1Click(Sender: TObject);
begin
Try
  Application.CreateForm(TFcadfor, Fcadfor);
  Fcadfor.BorderStyle := bsDialog;
  Fcadfor.ShowModal;
Finally
  Fcadfor.Free;
 End;
end;

procedure TFrmmenu.ExplorerButton2Click(Sender: TObject);
begin
Try
  Application.CreateForm(TFres_pagar, Fres_pagar);
  Fres_pagar.BorderStyle := bsDialog;
  Fres_pagar.ShowModal;
  Finally
    Fres_pagar.Free;
  end;
  try
    calcula_dia;
    finally;
    dm.pagar.active:=false;
  End;

end;

procedure TFrmmenu.ExplorerButton3Click(Sender: TObject);
begin
 dm.dados.Connected:=false;
 close;
end;

end.
