inherited FMTiposEfectos: TFMTiposEfectos
  Left = 443
  Top = 296
  HelpContext = 293
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Tipos de efectos'
  ClientHeight = 227
  ClientWidth = 349
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 349
    Height = 203
    inherited TBMain: TLFToolBar
      Width = 345
      inherited NavMain: THYMNavigator
        DataSource = DMTiposEfectos.DSQMTiposEfectos
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        Width = 69
        DataSource = DMTiposEfectos.DSQMTiposEfectos
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 297
      end
      inherited TbuttComp: TToolButton
        Left = 305
      end
    end
    inherited PCMain: TLFPageControl
      Width = 345
      Height = 173
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 337
          Height = 145
          inherited G2KTableLoc: TG2KTBLoc
            Left = 80
            DataSource = DMTiposEfectos.DSQMTiposEfectos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TIPO_EFECTO'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LTipo: TLFLabel
            Left = 54
            Top = 29
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LTitulo: TLFLabel
            Left = 47
            Top = 51
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LTipoEfectoFacturaE: TLFLabel
            Left = 7
            Top = 73
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. FacturaE'
          end
          object LMedioPagoFacturaECL: TLFLabel
            Left = 18
            Top = 95
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medio Pago'
          end
          object DBETipo: TLFDbedit
            Left = 80
            Top = 25
            Width = 41
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TIPO'
            DataSource = DMTiposEfectos.DSQMTiposEfectos
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 80
            Top = 47
            Width = 201
            Height = 21
            DataField = 'TITULO'
            DataSource = DMTiposEfectos.DSQMTiposEfectos
            TabOrder = 1
          end
          object CBTipoEfectoFacturaE: TDBComboBoxValue
            Left = 80
            Top = 69
            Width = 201
            Height = 21
            Style = csDropDownList
            DataField = 'TIPO_EFECTO_FACTURAE'
            DataSource = DMTiposEfectos.DSQMTiposEfectos
            DropDownCount = 20
            ItemHeight = 13
            Items.Strings = (
              'Ninguno'
              'Al contado'
              'Recibo Domiciliado'
              'Recibo'
              'Transferencia'
              'Letra aceptada'
              'Credito Documentario'
              'Contrato Adjudicacion'
              'Letra de cambio'
              'Pagare a la Orden'
              'Pagare No a la Orden'
              'Cheque'
              'Reposicion'
              'Especiales'
              'Compensacion'
              'Giro Postal'
              'Cheque conformado'
              'Cheque bancario'
              'Pago contra reembolso'
              'Pago mediante tarjeta')
            Values.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12'
              '13'
              '14'
              '15'
              '16'
              '17'
              '18'
              '19')
            TabOrder = 2
          end
          object DBCBMedioPagoFacturaECL: TDBComboBoxValue
            Left = 80
            Top = 91
            Width = 201
            Height = 21
            Hint = 'Medio de Pago Factura Electronica Chile'
            Style = csDropDownList
            DataField = 'MEDIO_PAGO_FACTURAE_CL'
            DataSource = DMTiposEfectos.DSQMTiposEfectos
            DropDownCount = 20
            ItemHeight = 13
            Items.Strings = (
              'Cheque'
              'Cheque a fecha'
              'Letra'
              'Efectivo'
              'Pago A Cta.Cte.'
              'Tarjeta Cr'#233'dito'
              'Otro')
            Values.Strings = (
              'CH'
              'CF'
              'LT'
              'EF'
              'PE'
              'TC'
              'OT')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 337
          Height = 145
          DataSource = DMTiposEfectos.DSQMTiposEfectos
          CamposAOrdenar.Strings = (
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 249
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 203
    Width = 349
  end
  inherited CEMain: TControlEdit
    DataSource = DMTiposEfectos.DSQMTiposEfectos
    Left = 192
    Top = 34
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 230
    Top = 38
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
