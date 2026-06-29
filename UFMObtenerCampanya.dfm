object FMObtenerCampanya: TFMObtenerCampanya
  Left = 573
  Top = 279
  Width = 399
  Height = 142
  ActiveControl = EFCampanya
  Caption = 'Cambia campa'#241'as a pedidos filtrados'
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
  object PNLMain: TPanel
    Left = 0
    Top = 0
    Width = 391
    Height = 115
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LCampanya: TLFLabel
      Left = 47
      Top = 21
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Campa'#241'a'
    end
    object BCancelar: TBitBtn
      Left = 214
      Top = 74
      Width = 80
      Height = 30
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 0
    end
    object BOk: TBitBtn
      Left = 102
      Top = 74
      Width = 80
      Height = 30
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
    object CBForzar: TLFCheckBox
      Left = 97
      Top = 40
      Width = 280
      Height = 25
      Caption = 'Reemplazar pedidos con campa'#241'a asignada'
      ClicksDisabled = False
      TabOrder = 2
      TabStop = True
      Alignment = taLeftJustify
    end
    object ECampanya: TLFEdit
      Left = 154
      Top = 16
      Width = 223
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
    object EFCampanya: TLFEditFind2000
      Left = 96
      Top = 16
      Width = 57
      Height = 21
      TabOrder = 4
      OnChange = EFCampanyaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CAMPANYA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CAMPANYAS_ACTIVAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CAMPANYA')
      Filtros = [obEmpresa, obEjercicio]
      Entorno = DMMain.EntornoBusqueda
    end
  end
end
