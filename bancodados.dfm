object DM: TDM
  OldCreateOrder = False
  Left = 328
  Top = 59
  Height = 610
  Width = 941
  object dados: TIBDatabase
    Connected = True
    DatabaseName = '127.0.0.1:\pagar\dados\dados.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = transacao
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 24
    Top = 8
  end
  object pagar: TIBDataSet
    Database = dados
    Transaction = Trans_pagar
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PAGAR'
      'where'
      '  NOTA = :OLD_NOTA and'
      '  FORNEC = :OLD_FORNEC and'
      '  EMISSAO = :OLD_EMISSAO')
    InsertSQL.Strings = (
      'insert into PAGAR'
      
        '  (NOTA, FORNEC, EMISSAO, VENCTO, VALOR, DATPAG, FLAG, OBSERVACA' +
        'O, OBSPAGTO, '
      
        '   BOMPRA, CHEQUE, JUROS, PRORROG, OBSERVA, FILIAL, NOMEFOR, DES' +
        'GRU, VLRPAG)'
      'values'
      
        '  (:NOTA, :FORNEC, :EMISSAO, :VENCTO, :VALOR, :DATPAG, :FLAG, :O' +
        'BSERVACAO, '
      
        '   :OBSPAGTO, :BOMPRA, :CHEQUE, :JUROS, :PRORROG, :OBSERVA, :FIL' +
        'IAL, :NOMEFOR, '
      '   :DESGRU, :VLRPAG)')
    RefreshSQL.Strings = (
      'Select '
      '  NOTA,'
      '  FORNEC,'
      '  EMISSAO,'
      '  VENCTO,'
      '  VALOR,'
      '  DATPAG,'
      '  FLAG,'
      '  OBSERVACAO,'
      '  OBSPAGTO,'
      '  BOMPRA,'
      '  CHEQUE,'
      '  JUROS,'
      '  PRORROG,'
      '  OBSERVA,'
      '  FILIAL,'
      '  NOMEFOR,'
      '  DESGRU,'
      '  VLRPAG'
      'from PAGAR '
      'where'
      '  NOTA = :NOTA and'
      '  FORNEC = :FORNEC and'
      '  EMISSAO = :EMISSAO')
    SelectSQL.Strings = (
      'select * from PAGAR')
    ModifySQL.Strings = (
      'update PAGAR'
      'set'
      '  NOTA = :NOTA,'
      '  FORNEC = :FORNEC,'
      '  EMISSAO = :EMISSAO,'
      '  VENCTO = :VENCTO,'
      '  VALOR = :VALOR,'
      '  DATPAG = :DATPAG,'
      '  FLAG = :FLAG,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  OBSPAGTO = :OBSPAGTO,'
      '  BOMPRA = :BOMPRA,'
      '  CHEQUE = :CHEQUE,'
      '  JUROS = :JUROS,'
      '  PRORROG = :PRORROG,'
      '  OBSERVA = :OBSERVA,'
      '  FILIAL = :FILIAL,'
      '  NOMEFOR = :NOMEFOR,'
      '  DESGRU = :DESGRU,'
      '  VLRPAG = :VLRPAG'
      'where'
      '  NOTA = :OLD_NOTA and'
      '  FORNEC = :OLD_FORNEC and'
      '  EMISSAO = :OLD_EMISSAO')
    Left = 176
    Top = 64
    object pagarNOTA: TIBStringField
      FieldName = 'NOTA'
      Origin = 'PAGAR.NOTA'
      Required = True
      Size = 15
    end
    object pagarFORNEC: TIntegerField
      FieldName = 'FORNEC'
      Origin = 'PAGAR.FORNEC'
      Required = True
    end
    object pagarEMISSAO: TIBStringField
      FieldName = 'EMISSAO'
      Origin = 'PAGAR.EMISSAO'
      Required = True
      EditMask = '!99/99/0000;1;_'
      Size = 10
    end
    object pagarVENCTO: TDateField
      FieldName = 'VENCTO'
      Origin = 'PAGAR.VENCTO'
      EditMask = '!99/99/0000;1;_'
    end
    object pagarVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'PAGAR.VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
    object pagarDATPAG: TDateField
      FieldName = 'DATPAG'
      Origin = 'PAGAR.DATPAG'
      EditMask = '!99/99/0000;1;_'
    end
    object pagarFLAG: TIBStringField
      FieldName = 'FLAG'
      Origin = 'PAGAR.FLAG'
      Size = 1
    end
    object pagarOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'PAGAR.OBSERVACAO'
      Size = 30
    end
    object pagarOBSPAGTO: TMemoField
      FieldName = 'OBSPAGTO'
      Origin = 'PAGAR.OBSPAGTO'
      BlobType = ftMemo
      Size = 8
    end
    object pagarBOMPRA: TDateField
      FieldName = 'BOMPRA'
      Origin = 'PAGAR.BOMPRA'
      EditMask = '!99/99/0000;1;_'
    end
    object pagarCHEQUE: TIBStringField
      FieldName = 'CHEQUE'
      Origin = 'PAGAR.CHEQUE'
      Size = 15
    end
    object pagarJUROS: TIBBCDField
      FieldName = 'JUROS'
      Origin = 'PAGAR.JUROS'
      currency = True
      Precision = 9
      Size = 2
    end
    object pagarPRORROG: TDateField
      FieldName = 'PRORROG'
      Origin = 'PAGAR.PRORROG'
    end
    object pagarOBSERVA: TMemoField
      FieldName = 'OBSERVA'
      Origin = 'PAGAR.OBSERVA'
      BlobType = ftMemo
      Size = 8
    end
    object pagarFILIAL: TIBStringField
      FieldName = 'FILIAL'
      Origin = 'PAGAR.FILIAL'
      Size = 5
    end
    object pagarNOMEFOR: TIBStringField
      DisplayWidth = 100
      FieldName = 'NOMEFOR'
      Origin = 'PAGAR.NOMEFOR'
      Size = 100
    end
    object pagarDESGRU: TIBStringField
      FieldName = 'DESGRU'
      Origin = 'PAGAR.DESGRU'
      Size = 35
    end
    object pagarVLRPAG: TIBBCDField
      FieldName = 'VLRPAG'
      Origin = 'PAGAR.VLRPAG'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object transacao: TIBTransaction
    Active = True
    DefaultDatabase = dados
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 40
    Top = 177
  end
  object sql: TIBQuery
    Database = dados
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    Left = 192
    Top = 235
  end
  object sql3: TIBQuery
    Database = dados
    Transaction = transacao
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    Left = 112
    Top = 232
  end
  object sql2: TIBQuery
    Database = dados
    Transaction = transacao
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    Left = 152
    Top = 232
  end
  object trans_cadastros: TIBTransaction
    Active = False
    DefaultDatabase = dados
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 32
    Top = 88
  end
  object Trans_pagar: TIBTransaction
    Active = True
    DefaultDatabase = dados
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 224
    Top = 64
  end
  object dspagar: TDataSource
    DataSet = pagar
    Left = 288
    Top = 64
  end
  object Fornec: TIBDataSet
    Database = dados
    Transaction = trans_cadastros
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from FORNECEDOR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into FORNECEDOR'
      
        '  (CODIGO, FORNECEDOR, DTCADASTRO, ENDERECO, BAIRRO, CIDADE, CON' +
        'TATO, TELEFONE, '
      
        '   CELULAR, WEPAGE, EMAIL, UF, CEP, CGC, IE, COTACAO, IBGE, OBSE' +
        'RVA)'
      'values'
      
        '  (:CODIGO, :FORNECEDOR, :DTCADASTRO, :ENDERECO, :BAIRRO, :CIDAD' +
        'E, :CONTATO, '
      
        '   :TELEFONE, :CELULAR, :WEPAGE, :EMAIL, :UF, :CEP, :CGC, :IE, :' +
        'COTACAO, '
      '   :IBGE, :OBSERVA)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  FORNECEDOR,'
      '  DTCADASTRO,'
      '  ENDERECO,'
      '  BAIRRO,'
      '  CIDADE,'
      '  CONTATO,'
      '  TELEFONE,'
      '  CELULAR,'
      '  WEPAGE,'
      '  EMAIL,'
      '  UF,'
      '  CEP,'
      '  CGC,'
      '  IE,'
      '  COTACAO,'
      '  IBGE,'
      '  OBSERVA'
      'from FORNECEDOR '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select * from FORNECEDOR')
    ModifySQL.Strings = (
      'update FORNECEDOR'
      'set'
      '  CODIGO = :CODIGO,'
      '  FORNECEDOR = :FORNECEDOR,'
      '  DTCADASTRO = :DTCADASTRO,'
      '  ENDERECO = :ENDERECO,'
      '  BAIRRO = :BAIRRO,'
      '  CIDADE = :CIDADE,'
      '  CONTATO = :CONTATO,'
      '  TELEFONE = :TELEFONE,'
      '  CELULAR = :CELULAR,'
      '  WEPAGE = :WEPAGE,'
      '  EMAIL = :EMAIL,'
      '  UF = :UF,'
      '  CEP = :CEP,'
      '  CGC = :CGC,'
      '  IE = :IE,'
      '  COTACAO = :COTACAO,'
      '  IBGE = :IBGE,'
      '  OBSERVA = :OBSERVA'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 120
    Top = 64
    object FornecCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'FORNECEDOR.CODIGO'
      Required = True
    end
    object FornecFORNECEDOR: TIBStringField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR.FORNECEDOR'
      Size = 40
    end
    object FornecDTCADASTRO: TDateTimeField
      FieldName = 'DTCADASTRO'
      Origin = 'FORNECEDOR.DTCADASTRO'
    end
    object FornecENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'FORNECEDOR.ENDERECO'
      Size = 30
    end
    object FornecBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'FORNECEDOR.BAIRRO'
      Size = 30
    end
    object FornecCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'FORNECEDOR.CIDADE'
      Size = 30
    end
    object FornecCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Origin = 'FORNECEDOR.CONTATO'
    end
    object FornecTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'FORNECEDOR.TELEFONE'
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 15
    end
    object FornecCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'FORNECEDOR.CELULAR'
      EditMask = '!\(99\)00000-0000;1;_'
      Size = 15
    end
    object FornecWEPAGE: TIBStringField
      FieldName = 'WEPAGE'
      Origin = 'FORNECEDOR.WEPAGE'
      Size = 70
    end
    object FornecEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'FORNECEDOR.EMAIL'
      Size = 70
    end
    object FornecUF: TIBStringField
      FieldName = 'UF'
      Origin = 'FORNECEDOR.UF'
      Size = 2
    end
    object FornecCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'FORNECEDOR.CEP'
      EditMask = '00000\-9999;1;_'
      Size = 10
    end
    object FornecCGC: TIBStringField
      FieldName = 'CGC'
      Origin = 'FORNECEDOR.CGC'
    end
    object FornecIE: TIBStringField
      FieldName = 'IE'
      Origin = 'FORNECEDOR.IE'
    end
    object FornecCOTACAO: TSmallintField
      FieldName = 'COTACAO'
      Origin = 'FORNECEDOR.COTACAO'
    end
    object FornecIBGE: TIBStringField
      FieldName = 'IBGE'
      Origin = 'FORNECEDOR.IBGE'
      Size = 25
    end
    object FornecOBSERVA: TMemoField
      FieldName = 'OBSERVA'
      Origin = 'FORNECEDOR.OBSERVA'
      BlobType = ftMemo
      Size = 8
    end
  end
end
