object OpeFMHorarioCalenEmpl: TOpeFMHorarioCalenEmpl
  Left = 554
  Top = 280
  Width = 193
  Height = 116
  Caption = 'Horario Especial'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 89
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LHorarioEspecial: TLFLabel
      Left = 9
      Top = 15
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'Horario Especial'
    end
    object EFHorario: TLFEditFind2000
      Left = 96
      Top = 13
      Width = 64
      Height = 21
      TabOrder = 0
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'HORARIO'
      CampoStr = 'DESCRIPCION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'OPE_HORARIOS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'HORARIO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object BBOk: TBitBtn
      Left = 6
      Top = 47
      Width = 80
      Height = 30
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
    object BBCancel: TBitBtn
      Left = 99
      Top = 47
      Width = 80
      Height = 30
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 208
    Top = 164
  end
end
