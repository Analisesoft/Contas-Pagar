unit menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image2: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure calcula_dia;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses bancodados, pagar_res;

{$R *.dfm}

procedure TForm1.calcula_dia;
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

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
Try
  Application.CreateForm(TFres_pagar, Fres_pagar);
  Fres_pagar.BorderStyle := bsDialog;
  Fres_pagar.ShowModal;
Finally
  Fres_pagar.Free;
 End;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var f:textfile; s:string;
begin
  Application.CreateForm(TDM, dm);
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
end;

end.
