unit pagar_res;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, StdCtrls, Buttons, Mylabel,
  ExtCtrls, QRCtrls, QuickRpt, Menus, Mask, ComCtrls, DBCtrls, kbmMemTable,
  jpeg;

type
  TFres_pagar = class(TForm)
    Panel4: TPanel;
    myLabel3d1: TmyLabel3d;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    dspagar: TDataSource;
    DBGrid1: TDBGrid;
    dsresumo: TDataSource;
    DBGrid2: TDBGrid;
    BitBtn2: TBitBtn;
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    BitBtn5: TBitBtn;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText8: TQRDBText;
    pagar: TIBDataSet;
    pagarNOTA: TIBStringField;
    pagarFORNEC: TIntegerField;
    pagarEMISSAO: TIBStringField;
    pagarVENCTO: TDateField;
    pagarVALOR: TIBBCDField;
    pagarDATPAG: TDateField;
    pagarFLAG: TIBStringField;
    pagarOBSERVACAO: TIBStringField;
    pagarOBSPAGTO: TMemoField;
    pagarBOMPRA: TDateField;
    pagarCHEQUE: TIBStringField;
    pagarJUROS: TIBBCDField;
    pagarPRORROG: TDateField;
    pagarOBSERVA: TMemoField;
    pagarFILIAL: TIBStringField;
    pagarNOMEFOR: TIBStringField;
    pagarDESGRU: TIBStringField;
    pagarVLRPAG: TIBBCDField;
    QuickRep2: TQuickRep;
    QRBand2: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRBand3: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRBand4: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel19: TQRLabel;
    QRBand5: TQRBand;
    QRLabel20: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText16: TQRDBText;
    QRBand6: TQRBand;
    QRLabel22: TQRLabel;
    QRExpr4: TQRExpr;
    Label1: TLabel;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    VerificarPagos1: TMenuItem;
    Panel1: TPanel;
    Shape1: TShape;
    myLabel3d2: TmyLabel3d;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    BitBtn6: TBitBtn;
    Shape2: TShape;
    myLabel3d3: TmyLabel3d;
    desdobra: TkbmMemTable;
    desdobraVencimento: TDateField;
    desdobraValor: TCurrencyField;
    desdobraNota: TStringField;
    DataSource2: TDataSource;
    BitBtn10: TBitBtn;
    Panel3: TPanel;
    Shape3: TShape;
    myLabel3d4: TmyLabel3d;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    QRImage1: TQRImage;
    QRSysData1: TQRSysData;
    QRLabel10: TQRLabel;
    QRImage2: TQRImage;
    QRLabel8: TQRLabel;
    myLabel3d5: TmyLabel3d;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    Image1: TImage;
    Panel5: TPanel;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    Edit2: TEdit;
    UpDown1: TUpDown;
    Label8: TLabel;
    DBGrid3: TDBGrid;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Image2: TImage;
    RadioGroup1: TRadioGroup;
    BitBtn15: TBitBtn;
    BaixarPorData1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure pagarBeforePost(DataSet: TDataSet);
    procedure calcula_dia;
    procedure calcula_dia2;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure VerificarPagos1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BaixarPorData1Click(Sender: TObject);
  private
    somap,somad,total : currency;
    Vlrpar:currency;
    emissao,vencto:tdate;
    x:byte;
    nota,fornecedor:string;
     { Private declarations }
  public
    { Public declarations }
  end;

var
  Fres_pagar: TFres_pagar;

implementation

uses bancodados;

{$R *.dfm}

procedure TFres_pagar.calcula_dia;
begin
  somad := 0;
  dm.sql.DisableControls;
  dm.sql.active:=false;
  dm.sql.SQL.Text:='select vencto,sum(valor) as Total from pagar where flag = '+QuotedStr('D')+' group by vencto order by vencto';
  dm.sql.active:=true;
  while not dm.sql.eof do
     begin
        somad := (somad+dm.sql.fieldbyname('total').value);
        dm.sql.next;
     end;
  dm.sql.EnableControls;
  edit1.Text := formatcurr('####,###.00',somad);
end;

procedure TFres_pagar.calcula_dia2;
begin
  somap := 0;
  dm.sql.active:=false;
  dm.sql.SQL.Text:='select datpag,sum(valor) as Total from pagar where flag = '+QuotedStr('P')+' group by datpag order by datpag';
  dm.sql.active:=true;
  while not dm.sql.eof do
     begin
        somap := (somap+dm.sql.fieldbyname('total').value);
        dm.sql.next;
     end;
  edit1.Text := formatcurr('####,###.00',somap);
end;

procedure TFres_pagar.BitBtn1Click(Sender: TObject);
begin
 dm.pagar.insert;
 dm.pagarFLAG.Value   :='D';
 dm.pagarEMISSAO.Value:=datetostr(date);
 dm.pagarFORNEC.Value := 0;
 dm.pagarVALOR.Value := 0;
 dm.pagarDESGRU.Value := 'DIVERSOS';
 dm.pagarNOTA.Value   :='000';
 total := 0;
 bitbtn7.Enabled := false;
 desdobra.Active:=false;
 desdobra.Active:=true;
 panel1.Visible:=true;
 dbedit1.setfocus;
end;

procedure TFres_pagar.BitBtn3Click(Sender: TObject);
begin
 if not dm.pagarDATPAG.IsNull then
     dm.pagarFLAG.Value:='P';
 dm.pagar.post;
 try
    calcula_dia;
    finally;
 end;
end;

procedure TFres_pagar.BitBtn4Click(Sender: TObject);
begin
 if MessageDlg('Confirma a Exclusao ?',mtconfirmation,[mbyes, mbno],0) = mryes then
    begin
      panel4.Color := clFuchsia;
      panel4.Caption := 'Excluindo e Atualizando ...';
      panel4.Update;
      panel4.Show;
      CriaLog('Exclusao',dm.usuario,dm.pagarFORNEC.AsString);
      dm.pagar.delete;
      try
         calcula_dia;
         finally;
            panel4.Color := clnavy;
            panel4.Caption := 'Lançamento de Contas a Pagar Resumido';
            panel4.Update;
            panel4.Show;
       end;
    end;

end;

procedure TFres_pagar.pagarBeforePost(DataSet: TDataSet);
begin
 if not dm.pagarDATPAG.IsNull then
     dm.pagarFLAG.Value:='P';
end;

procedure TFres_pagar.SpeedButton1Click(Sender: TObject);
begin
 if dm.Trans_pagar.Active    =true  then
    DM.Trans_pagar.Commit;
 dm.dados.Connected := false;
 close;
end;

procedure TFres_pagar.FormShow(Sender: TObject);
var s:string;
    f:textfile;
begin
 if not FileExists('\pagar\pagar.ini') then
   Begin
     MessageDlg('Instalacao Incorreta. Falta Banco de Dados',mtInformation,[mbyes],0);
     close;
   end;

  Dm.dados.Connected := false;
  AssignFile(F,'\pagar\pagar.ini');
  Reset(F);
  Readln(F,s);
  closefile(f);
  Dm.dados.DatabaseName := s;

 dm.pagar.Active:=false;
 dm.pagar.SelectSQL.Text:='select * from pagar where flag = '+QuotedStr('D')+' order by vencto';
 dm.pagar.Active:=true;

 try
    calcula_dia;
    finally;
 end;

 DateTimePicker1.Date := now;
 DateTimePicker2.Date := now;

 panel1.Left := 136;
 panel1.Height := 441;
 panel1.Left := 104;

 panel3.Left := 376;
 panel3.Height := 265;
 panel3.Left := 184;

end;

procedure TFres_pagar.BitBtn2Click(Sender: TObject);
begin
 if dm.Dspagar.State in [dsinsert] then
     dm.pagar.Cancel;

 dm.pagar.Active:=false;
 dm.pagar.SelectSQL.Text:='select * from pagar where flag = '+QuotedStr('D')+' order by vencto';
 dm.pagar.Active:=true;
 try
   calcula_dia;
   finally;
 end;
 exit;
end;

procedure TFres_pagar.BitBtn5Click(Sender: TObject);
begin
 if dm.Dspagar.State in [dsinsert] then
     dm.pagar.Cancel;

 panel3.Visible := true;
end;

procedure TFres_pagar.DBGrid1CellClick(Column: TColumn);
begin
 dm.pagar.Edit;
end;

procedure TFres_pagar.DBGrid1DblClick(Sender: TObject);
begin
 dm.pagar.edit;
 dm.pagarDATPAG.Value := date;
 dm.pagarFLAG.Value   := 'P';
 dm.pagar.post;
 if dm.Trans_pagar.Active    =true  then
    DM.Trans_pagar.Commit;
 try
   calcula_dia;
   finally;
 end;
 dm.pagar.Active:=false;
 dm.pagar.SelectSQL.Text:='select * from pagar where flag = '+QuotedStr('D')+' order by vencto';
 dm.pagar.Active:=true;
end;

procedure TFres_pagar.VerificarPagos1Click(Sender: TObject);
begin
 dm.pagar.First;
 while not dm.pagar.Eof do
   Begin
      if not dm.pagarDATPAG.IsNull then
         Begin
            dm.pagar.Edit;
            dm.pagarFLAG.Value := 'P';
            dm.pagar.post;
         end;
     dm.pagar.Next;
   end;
end;

procedure TFres_pagar.BitBtn6Click(Sender: TObject);
begin
 dm.pagar.post;
 total := dm.pagarvalor.value;
 panel5.visible := true;
end;

procedure TFres_pagar.BitBtn7Click(Sender: TObject);
begin
   desdobra.Active := true;
   vlrpar     := dm.pagarVALOR.Value;
   emissao    := dm.pagarEMISSAO.AsDateTime;
   vencto     := dm.pagarVENCTO.value;
   fornecedor := dm.pagarNOMEFOR.value;
   nota       := dm.pagarNOTA.Value;
   x:=0;
   while (x<(Strtoint(edit2.text))) do
      Begin
         desdobra.insert;
         desdobraNota.Value          := nota +'/'+INTTOSTR(X+1);
         desdobraVencimento.Value    := vencto;
         desdobraValor.value         := vlrpar;
         desdobra.Post;
         x:=(x+1);
         vencto := (vencto+30);
       end;
end;

procedure TFres_pagar.BitBtn9Click(Sender: TObject);
begin
 desdobra.Active:=false;
 edit2.SetFocus;
end;

procedure TFres_pagar.BitBtn8Click(Sender: TObject);
begin
    bitbtn7.Enabled := false;
    desdobra.first;
    dm.pagar.Delete;
    while not desdobra.Eof do
       Begin
         dm.pagar.insert;
         dm.pagarNOTA.Value    := desdobraNota.Value;
         dm.pagarFORNEC.Value  := 0;
         dm.pagarNOMEFOR.Value := fornecedor;
         dm.pagarFLAG.Value    :='D';
         dm.pagarEMISSAO.Value := datetostr(emissao);
         dm.pagarVENCTO.Value  := desdobraVencimento.Value;
         dm.pagarVALOR.Value   := desdobraValor.Value;
         dm.pagarDESGRU.Value  := 'DIVERSOS';
         dm.pagar.post;
         desdobra.Next;
     end;
 panel5.visible:=false;
 panel1.Visible:=false;
 try
  calcula_dia;
  finally;
 end;

end;

procedure TFres_pagar.BitBtn10Click(Sender: TObject);
begin
 panel5.visible:=false;
 panel1.Visible := false;
end;

procedure TFres_pagar.BitBtn11Click(Sender: TObject);
var inicio,fim:string;
begin
 inicio := formatdatetime('mm/dd/yyyy',DateTimePicker1.date);
 fim    := formatdatetime('mm/dd/yyyy',DateTimePicker2.date);

 if RadioGroup1.ItemIndex = 0 Then
     begin
       pagar.Active:=false;
       pagar.SelectSQL.Text:='select * from pagar where flag = '+QuotedStr('D')+' and vencto >= '+QuotedStr(inicio)+' and vencto <= '+QuotedStr(fim)+
                             ' order by vencto';
       pagar.Active:=true;
       qrlabel10.Caption := 'PERIODO: '+datetostr(DateTimePicker1.DateTime)+ ' A '+ datetostr(DateTimePicker2.date);
       try
           Quickrep1.Preview;
           finally;
         end;
    end;
 if RadioGroup1.ItemIndex = 1 Then
    begin
       pagar.Active:=false;
       pagar.SelectSQL.Text:='select * from pagar where flag = '+QuotedStr('P')+' and datpag >= '+QuotedStr(inicio)+' and datpag <= '+QuotedStr(fim)+
                             ' order by datpag';
       pagar.Active:=true;
       qrlabel8.Caption := 'PERIODO: '+datetostr(DateTimePicker1.DateTime)+ ' A '+ datetostr(DateTimePicker2.date);
       try
          Quickrep2.Preview;
          finally;
         end;
    end;

  panel3.Visible:=false;
  pagar.Active:=false;
  dm.pagar.Active:=false;
  dm.pagar.SelectSQL.Text:='select * from pagar where flag = '+QuotedStr('D')+' order by vencto';
  dm.pagar.Active:=true;
  try
    calcula_dia;
    finally;
  end;
end;

procedure TFres_pagar.BitBtn12Click(Sender: TObject);
begin
 panel3.visible := false;
end;

procedure TFres_pagar.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
 if key =',' then
    key := '.';
end;

procedure TFres_pagar.MaskEdit1Enter(Sender: TObject);
begin
  if strtoint(edit2.Text)<= 1 then
     Begin
       Messagedlg('Para uma Parcela Nao e Preciso Desdobrar',mtinformation,[mbok],0);
       bitbtn10.setfocus;
       exit;
     end;
  maskedit1.text := formatcurr('######0.00',((total*strtoint(edit2.Text))));
  bitbtn7.Enabled := true;
end;

procedure TFres_pagar.BitBtn13Click(Sender: TObject);
begin
 dm.pagar.First;
end;

procedure TFres_pagar.BitBtn14Click(Sender: TObject);
begin
 dm.pagar.last;
end;

procedure TFres_pagar.BitBtn15Click(Sender: TObject);
begin
 dm.pagar.Active:=false;
 dm.pagar.SelectSQL.Text:='select * from pagar where flag = '+QuotedStr('P')+' order by datpag';
 dm.pagar.Active:=true;
 try
    calcula_dia2;
    finally;
 end;
end;

procedure TFres_pagar.BaixarPorData1Click(Sender: TObject);
var vencto:string;
begin
 vencto := inputbox('Baixa Por Data','Data Vencimento:',datetostr(date));
 if vencto = '' then
    exit;
 dm.pagar.First;
 while not dm.pagar.Eof do
   Begin
      if (dm.pagarVENCTO.Value=strtodate(vencto)) then
         Begin
            dm.pagar.Edit;
            dm.pagarFLAG.Value := 'P';
            dm.pagarDATPAG.Value := strtodate(vencto);
            dm.pagar.post;
         end;
     dm.pagar.Next;
   end;
  bitbtn2.Click;
end;

end.
