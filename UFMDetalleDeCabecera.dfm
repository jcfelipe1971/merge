inherited FMDetalleDeCabecera: TFMDetalleDeCabecera
  Caption = 'Detalles de documento'
  ClientHeight = 371
  ClientWidth = 690
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 690
    Height = 347
    object LTransportistaInstalador: TLFLabel [0]
      Left = 4
      Top = 52
      Width = 118
      Height = 13
      Alignment = taRightJustify
      Caption = 'Transportista / Instalador'
    end
    object LTipoVehiculo: TLFLabel [1]
      Left = 57
      Top = 121
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Vehiculo'
    end
    object LTelefono: TLFLabel [2]
      Left = 80
      Top = 248
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telefono'
    end
    object LContacto: TLFLabel [3]
      Left = 79
      Top = 226
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Contacto'
    end
    object LDireccion: TLFLabel [4]
      Left = 77
      Top = 151
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Direccion'
    end
    object LEmail: TLFLabel [5]
      Left = 97
      Top = 270
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Email'
    end
    object LTipoServicio: TLFLabel [6]
      Left = 60
      Top = 74
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Servicio'
    end
    inherited TBMain: TLFToolBar
      Width = 686
      TabOrder = 8
      object NavDetalleDeCabecera: THYMNavigator [0]
        Left = 0
        Top = 0
        Width = 112
        Height = 22
        DataSource = DMDetalleDeCabecera.DSQMCabecera
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object ToolButton1: TToolButton [1]
        Left = 112
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 120
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object DBETransportistaInstalador: TLFDbedit
      Left = 128
      Top = 48
      Width = 545
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'TRANSP_INSTAL'
      DataSource = DMDetalleDeCabecera.DSQMCabecera
      TabOrder = 0
    end
    object DBETipoVehiculo: TLFDbedit
      Left = 128
      Top = 117
      Width = 545
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'TIPO_VEHICULO'
      DataSource = DMDetalleDeCabecera.DSQMCabecera
      TabOrder = 3
    end
    object DBCBVehiculoEspecial: TLFDBCheckBox
      Left = 128
      Top = 96
      Width = 545
      Height = 17
      Caption = 'Vehiculo Especial'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 2
      TabStop = True
      Alignment = taLeftJustify
      DataField = 'VEHICULO_ESPECIAL'
      DataSource = DMDetalleDeCabecera.DSQMCabecera
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBETelefono: TLFDbedit
      Left = 128
      Top = 244
      Width = 545
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'TELEFONO'
      DataSource = DMDetalleDeCabecera.DSQMCabecera
      TabOrder = 6
    end
    object DBEContacto: TLFDbedit
      Left = 128
      Top = 222
      Width = 545
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CONTACTO'
      DataSource = DMDetalleDeCabecera.DSQMCabecera
      TabOrder = 5
    end
    object DBEEmail: TLFDbedit
      Left = 128
      Top = 266
      Width = 545
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'EMAIL'
      DataSource = DMDetalleDeCabecera.DSQMCabecera
      TabOrder = 7
    end
    object MDireccion: TLFDBMemo
      Left = 128
      Top = 147
      Width = 545
      Height = 70
      DataField = 'DIRECCION'
      DataSource = DMDetalleDeCabecera.DSQMCabecera
      TabOrder = 4
    end
    object DBETipoServicio: TLFDbedit
      Left = 128
      Top = 70
      Width = 545
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'TIPO_SERVICIO'
      DataSource = DMDetalleDeCabecera.DSQMCabecera
      TabOrder = 1
    end
  end
  inherited TBActions: TLFToolBar
    Top = 347
    Width = 690
  end
  inherited CEMain: TControlEdit
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Top = 4
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Top = 0
  end
end
