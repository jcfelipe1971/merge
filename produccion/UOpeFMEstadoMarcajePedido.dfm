inherited OpeFMEstadoMarcajePedido: TOpeFMEstadoMarcajePedido
  Caption = 'Mantenimiento Estados Marcaje Pedido'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = OpeDMEstadoMarcajePedido.DSEstadoMarcajePedido
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          inherited G2KTableLoc: TG2KTBLoc
            Left = 82
            Top = 37
            DataSource = OpeDMEstadoMarcajePedido.DSEstadoMarcajePedido
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'OPE_ESTADO_MARCAJE_PEDIDO'
            CampoNum = 'ID_ESTADO_MARCAJE_PEDIDO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'ORDEN_EJECUCION')
          end
          object LIdEstadoMarcajePedido: TLFLabel
            Left = 75
            Top = 17
            Width = 11
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID'
          end
          object LTitulo: TLFLabel
            Left = 58
            Top = 39
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LOrdenEjecucion: TLFLabel
            Left = 30
            Top = 61
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden Ejec.'
          end
          object LFechaAsociada: TLFLabel
            Left = 10
            Top = 101
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha asociada'
          end
          object DBIdEstadoMarcajePedido: TLFDbedit
            Left = 92
            Top = 14
            Width = 47
            Height = 21
            TabStop = False
            DataField = 'ID_ESTADO_MARCAJE_PEDIDO'
            DataSource = OpeDMEstadoMarcajePedido.DSEstadoMarcajePedido
            TabOrder = 0
          end
          object DBTitulo: TLFDbedit
            Left = 92
            Top = 36
            Width = 255
            Height = 21
            TabStop = False
            DataField = 'TITULO'
            DataSource = OpeDMEstadoMarcajePedido.DSEstadoMarcajePedido
            TabOrder = 1
          end
          object DBOrdenEjecucion: TLFDbedit
            Left = 92
            Top = 58
            Width = 255
            Height = 21
            TabStop = False
            DataField = 'ORDEN_EJECUCION'
            DataSource = OpeDMEstadoMarcajePedido.DSEstadoMarcajePedido
            TabOrder = 2
          end
          object DBChkAfectaStock: TLFDBCheckBox
            Left = 92
            Top = 81
            Width = 255
            Height = 16
            Caption = 'Afecta Stockal poner visibles las hojas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'STOCK_AFECTA'
            DataSource = OpeDMEstadoMarcajePedido.DSEstadoMarcajePedido
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBAsociarFechaMarcaje: TLFDBComboBoxValue
            Left = 92
            Top = 99
            Width = 145
            Height = 21
            DataField = 'ASOCIAR_FECHA_MARCAJE'
            DataSource = OpeDMEstadoMarcajePedido.DSEstadoMarcajePedido
            ItemHeight = 13
            Items.Strings = (
              'Sin asociaci'#243'n'
              'Corte'
              'Uni'#243'n'
              'Macarr'#243'n'
              'Montaje'
              'Terminado'
              'Preparado'
              'Motor')
            Values.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7')
            TabOrder = 4
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = OpeDMEstadoMarcajePedido.DSEstadoMarcajePedido
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ESTADO_MARCAJE_PEDIDO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN_EJECUCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STOCK_AFECTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ASOCIAR_FECHA_MARCAJE'
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
