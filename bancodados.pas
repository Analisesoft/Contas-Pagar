unit bancodados;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, dialogs, IBUpdateSQL,
  IBQuery, kbmMemTable, ADODB, DBTables, printers,windows,forms;

type
  TDM = class(TDataModule)
    dados: TIBDatabase;
    pagar: TIBDataSet;
    transacao: TIBTransaction;
    sql: TIBQuery;
    sql3: TIBQuery;
    sql2: TIBQuery;
    trans_cadastros: TIBTransaction;
    Trans_pagar: TIBTransaction;
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
    dspagar: TDataSource;
    Fornec: TIBDataSet;
    FornecCODIGO: TIntegerField;
    FornecFORNECEDOR: TIBStringField;
    FornecDTCADASTRO: TDateTimeField;
    FornecENDERECO: TIBStringField;
    FornecBAIRRO: TIBStringField;
    FornecCIDADE: TIBStringField;
    FornecCONTATO: TIBStringField;
    FornecTELEFONE: TIBStringField;
    FornecCELULAR: TIBStringField;
    FornecWEPAGE: TIBStringField;
    FornecEMAIL: TIBStringField;
    FornecUF: TIBStringField;
    FornecCEP: TIBStringField;
    FornecCGC: TIBStringField;
    FornecIE: TIBStringField;
    FornecCOTACAO: TSmallintField;
    FornecIBGE: TIBStringField;
    FornecOBSERVA: TMemoField;
  private
    { Private declarations }
  public
    altpre,tipogav,tipoimp,codcli,codigo,usuario,admin,locprint,locprint2,comuta,drive,iecf,fismat,repete,ultped,pet,cfor,path_arq:string;
    NOTA_D1,zeropro,chepre,admini,tipocota,filizola,atupag,libcota,etiqueta,chave,mareti,tipcod,email_esc,mostra_chq,npar_et,codcon,taluguel:string;
    logrado,bairro,cep,munici,unidade,pnuvem,dnuvem,completa,caminho,i_nome,empresa,empresap,codbar,abac,cpf:string;
    nomeani,nomecli,setor_servico:string[70];
    mensag1,mensag2,mensag3,mensag4,Qpesq,empre_sel,idade,refnome,refcod,buscapre:string;
    ibge_cnpj,nome_cnpj,inscri_cnpj,endereco_cnpj,bairro_cnpj,numero_cnpj,cidade_cnpj,cep_cnpj,estado_cnpj,abertura_cnpj,telefone_cnpj,email_cnpj:string;
    fiel_card:string[1];
    maxdes,vlrparc:currency;
    digitos,DIGITOS_C :smallint;
    ph1,ph2,ph3,ph4,ph5,ph6,val:byte;
    { Public declarations }

  end;

var
  DM: TDM;
    procedure CriaLog(rotina,operador,item:string);
    procedure CriaLogex(rotina,operador,item,obs:string);
    procedure grava_servidor;
    function DifDias(DataVenc:TDateTime; DataAtual:TDateTime): String;
    function GeraCodigo(s:string;inicio:string):string ;
    function ReplaceStr (Text,oldstring,newstring:string):string;
    procedure TrimAppMemorySize;

implementation

{$R *.dfm}

procedure TrimAppMemorySize;
var
MainHandle : THandle;
begin
try
 MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
 SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
 CloseHandle(MainHandle) ;
 except
end;
Application.ProcessMessages;
end;



function ReplaceStr (Text,oldstring,newstring:string):string;
var atual, strtofind, originalstr:pchar;
NewText:string;
lenoldstring,lennewstring,m,index:integer;
begin //ReplaceStr
  NewText:=Text;
  originalstr:=pchar(Text);
  strtofind:=pchar(oldstring);
  lenoldstring:=length(oldstring);
  lennewstring:=length(newstring);
  Atual:=StrPos(OriginalStr,StrtoFind);
  index:=0;
  while Atual<>nil do
  begin //Atual<>nil
  m:=Atual - OriginalStr - index + 1;
  Delete(NewText,m,lenoldstring);
  Insert(newstring,NewText,m);
  inc(index,lenoldstring-lennewstring);
  Atual:=StrPos(Atual+lenoldstring,StrtoFind);
  end; //Atual<>nil
  Result:=NewText;
end; //ReplaceStr

function DifDias(DataVenc:TDateTime; DataAtual:TDateTime): String;
Var Data: TDateTime;
dia, mes, ano: Word;
begin
  if DataAtual < DataVenc then
   begin
     Result := '0';
   end
  else
     begin
      Data := DataAtual - DataVenc;
      DecodeDate( Data, ano, mes, dia);
      Result := FloatToStr(Data);
    end;
end;

function GeraCodigo(s:string;inicio:string):string ;
var
 tam,x:byte ;
begin
 tam := Length(s) ;
 for x := tam to 3 do Insert('0',s,1) ;
 Result := inicio+s ;
end;

procedure recibo;
begin
end;

procedure CriaLog(rotina,operador,item:string);
VAR
  NomeArq, Data, datarq, Hora : String;
  Arquivo : TextFile;
  Cor : String;
Begin
  Cor := '"#FF3300"';;

  Data := DateToStr(Now);    // Retorna a Data Corrente
  Datarq := DateToStr(Now); // Retorna a Data Corrente
  Hora := TimeToStr(Now);   // Retorna a Hora Corrente

// Remove as barras da data para usar como nome de arquivo
  while pos('/',datarq) > 0 do
        delete(datarq,pos('/',datarq),1);

  While Length(rotina)<15 do
        rotina := rotina + '.';

  NomeArq := '\pagar\Log\'+datarq+'.txt';
  AssignFile(Arquivo, NomeArq);
   IF FileExists(NomeArq) THEN  // Se o Arquivo Existe
    Append(Arquivo)             // Abre o Arquivo
   ELSE
    Begin
     ReWrite(Arquivo); // Se nao Cria um Novo
     WriteLn(Arquivo, 'Contas a Pagar vr 1.3 LOG DO SISTEMA');
     WriteLn(Arquivo, 'by Analise Soft Informatica - Tecnologia em Softwares');
     WriteLn(Arquivo, '--------------------------------------------------------------------------------');
    end;
// Grava o Erro no Arquivo
  WriteLn(Arquivo,'|'+ Data + '|'+hora+'|'+ operador + '|' + rotina +'|'+ item );
// Fecha o Arquivo
  CloseFile(Arquivo);

end;

procedure CriaLogex(rotina,operador,item,obs:string);
VAR
  Data, datarq, Hora : String;
  Cor : String;
Begin
  Cor := '"#FF3300"';;

  Data := DateToStr(Now);    // Retorna a Data Corrente
  Datarq := DateToStr(Now); // Retorna a Data Corrente
  Hora := TimeToStr(Now);   // Retorna a Hora Corrente

// Remove as barras da data para usar como nome de arquivo
  while pos('/',datarq) > 0 do
        delete(datarq,pos('/',datarq),1);

end;

procedure grava_servidor;
begin
try
 if DM.transacao.Active      =true  then DM.transacao.Commit ;
 if dm.Trans_pagar.Active    =true  then DM.Trans_pagar.Commit;
 if dm.trans_cadastros.Active =true  then DM.Trans_cadastros.Commit;
 except
    on E: Exception do
       begin
         if DM.transacao.Active      =true  then DM.transacao.Rollback ;
         if dm.Trans_pagar.Active    =true  then DM.Trans_pagar.Rollback ;
         if dm.Trans_cadastros.Active    =true  then DM.Trans_cadastros.Rollback ;
         dm.dados.Connected:=false;
         showmessage('Nao Atualizado/Gravado. Problemas ao Salvar ');
         exit;
       end;
 end;
 dm.dados.Connected:=false;
end;

end.
