inherited FMRHPersona: TFMRHPersona
  Left = 429
  Top = 186
  Width = 889
  Height = 648
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Personas'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 879
    Height = 595
    inherited TBMain: TLFToolBar
      Width = 875
      inherited NavMain: THYMNavigator
        DataSource = DMRHPersona.DSQMRHPersona
        Hints.Strings = ()
        EditaControl = DBENombre
        InsertaControl = DBENombre
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      Width = 875
      Height = 565
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 867
          Height = 537
          inherited G2KTableLoc: TG2KTBLoc
            Left = 72
            Top = 22
            CamposADesplegar.Strings = (
              'NOMBRE')
            DataSource = DMRHPersona.DSQMRHPersona
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_RH_PERSONA'
            CampoNum = 'ID_PERSONA'
            CampoStr = 'APELLIDOS'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID_PERSONA')
          end
          object PNLDatosPersona: TLFPanel
            Left = 0
            Top = 0
            Width = 867
            Height = 247
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LTelefonos: TLFLabel
              Left = 21
              Top = 71
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Telefonos'
            end
            object LId: TLFLabel
              Left = 58
              Top = 5
              Width = 9
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id'
            end
            object LNombre: TLFLabel
              Left = 31
              Top = 26
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nombre'
            end
            object LApellidos: TLFLabel
              Left = 26
              Top = 47
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Apellidos'
            end
            object LCorreo: TLFLabel
              Left = 35
              Top = 91
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Correo'
            end
            object LGenero: TLFLabel
              Left = 455
              Top = 69
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Genero'
              FocusControl = DBEEstadoCivil
            end
            object LSegSoc: TLFLabel
              Left = 397
              Top = 26
              Width = 93
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nro Seguridad Soc.'
            end
            object LFNacimiento: TLFLabel
              Left = 688
              Top = 26
              Width = 77
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fec. Nacimiento'
            end
            object LblEstadoCivil: TLFLabel
              Left = 435
              Top = 48
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'Estado Civil'
              FocusControl = DBEEstadoCivil
            end
            object LPuestoTrabajo: TLFLabel
              Left = 35
              Top = 150
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Puesto'
            end
            object LEntrevistador: TLFLabel
              Left = 6
              Top = 128
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Entrevistador'
            end
            object LAceptado: TLFLabel
              Left = 585
              Top = 128
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Aceptado'
            end
            object LValoracion1: TLFLabel
              Left = 10
              Top = 172
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valoraci'#243'n 1'
            end
            object LValoracion2: TLFLabel
              Left = 10
              Top = 194
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valoraci'#243'n 2'
            end
            object LValoracion3: TLFLabel
              Left = 10
              Top = 216
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valoraci'#243'n 3'
            end
            object LFEntrevista: TLFLabel
              Left = 332
              Top = 128
              Width = 71
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fec. Entrevista'
            end
            object DBID: TLFDbedit
              Left = 72
              Top = 1
              Width = 50
              Height = 21
              DataField = 'ID_PERSONA'
              DataSource = DMRHPersona.DSQMRHPersona
              Enabled = False
              TabOrder = 0
            end
            object DBENombre: TLFDbedit
              Left = 72
              Top = 23
              Width = 317
              Height = 21
              DataField = 'NOMBRE'
              DataSource = DMRHPersona.DSQMRHPersona
              TabOrder = 1
            end
            object DBEApellidos: TLFDbedit
              Left = 72
              Top = 45
              Width = 317
              Height = 21
              DataField = 'APELLIDOS'
              DataSource = DMRHPersona.DSQMRHPersona
              TabOrder = 2
            end
            object DBETelefono1: TLFDbedit
              Left = 72
              Top = 67
              Width = 158
              Height = 21
              CharCase = ecUpperCase
              DataField = 'TELEFONO01'
              DataSource = DMRHPersona.DSQMRHPersona
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object DBECorreo: TLFDbedit
              Left = 72
              Top = 89
              Width = 317
              Height = 21
              DataField = 'EMAIL'
              DataSource = DMRHPersona.DSQMRHPersona
              TabOrder = 5
            end
            object DBETelefono2: TLFDbedit
              Left = 231
              Top = 67
              Width = 158
              Height = 21
              CharCase = ecUpperCase
              DataField = 'TELEFONO02'
              DataSource = DMRHPersona.DSQMRHPersona
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
            end
            object LFDBKBaja: TLFDBCheckBox
              Left = 639
              Top = 67
              Width = 49
              Height = 17
              Caption = 'Baja'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 11
              TabStop = True
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              Alignment = taLeftJustify
              DataField = 'BAJA'
              DataSource = DMRHPersona.DSQMRHPersona
              ValueChecked = '8'
              ValueUnchecked = '0'
            end
            object DBESegSoc: TLFDbedit
              Left = 495
              Top = 23
              Width = 183
              Height = 21
              DataField = 'N_SEGURIDAD_SOCIAL'
              DataSource = DMRHPersona.DSQMRHPersona
              TabOrder = 6
            end
            object DBDFNacimiento: TLFDBDateEdit
              Left = 770
              Top = 23
              Width = 87
              Height = 21
              DataField = 'FECHA_NACIMIENTO'
              DataSource = DMRHPersona.DSQMRHPersona
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 7
              Weekends = [Sun, Sat]
            end
            object DBCHKMinusvalia: TLFDBCheckBox
              Left = 639
              Top = 48
              Width = 85
              Height = 17
              Caption = 'Minusval'#237'a'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 9
              TabStop = True
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              Alignment = taLeftJustify
              DataField = 'MINUSVALIA'
              DataSource = DMRHPersona.DSQMRHPersona
              ValueChecked = '8'
              ValueUnchecked = '0'
            end
            object DBCBGenero: TRxDBComboBox
              Left = 495
              Top = 67
              Width = 110
              Height = 21
              DataField = 'GENERO'
              DataSource = DMRHPersona.DSQMRHPersona
              ItemHeight = 13
              Items.Strings = (
                'Desconocido'
                'Hombre'
                'Mujer')
              TabOrder = 10
              Values.Strings = (
                ' '
                'H'
                'M')
            end
            object DBEEstadoCivil: TLFDbedit
              Left = 495
              Top = 45
              Width = 110
              Height = 21
              DataField = 'ESTADO_CIVIL'
              DataSource = DMRHPersona.DSQMRHPersona
              TabOrder = 8
            end
            object DBDEFecha: TLFDBDateEdit
              Left = 407
              Top = 125
              Width = 87
              Height = 21
              DataField = 'FECHA_ENTREVISTA'
              DataSource = DMRHPersona.DSQMRHPersona
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 13
              Weekends = [Sun, Sat]
            end
            object DBEEntrevistador: TLFDbedit
              Left = 72
              Top = 125
              Width = 241
              Height = 21
              DataField = 'ENTREVISTADOR'
              DataSource = DMRHPersona.DSQMRHPersona
              TabOrder = 12
            end
            object DBEPuestoTrab: TLFDbedit
              Left = 72
              Top = 147
              Width = 422
              Height = 21
              DataField = 'PUESTO_TRABAJO'
              DataSource = DMRHPersona.DSQMRHPersona
              TabOrder = 16
            end
            object DBCHKAceptado: TLFDBCheckBox
              Left = 512
              Top = 127
              Width = 73
              Height = 17
              Caption = 'Aceptado'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 14
              TabStop = True
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              Alignment = taLeftJustify
              DataField = 'ACEPTADO'
              DataSource = DMRHPersona.DSQMRHPersona
              ValueChecked = '8'
              ValueUnchecked = '0'
            end
            object DBDEAceptado: TLFDBDateEdit
              Left = 648
              Top = 125
              Width = 87
              Height = 21
              DataField = 'FECHA_ACEPTADO'
              DataSource = DMRHPersona.DSQMRHPersona
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 15
              Weekends = [Sun, Sat]
            end
            object DBEValoracion1: TLFDbedit
              Left = 72
              Top = 169
              Width = 422
              Height = 21
              DataField = 'VALORACION_1'
              DataSource = DMRHPersona.DSQMRHPersona
              TabOrder = 17
            end
            object DBEValoracion2: TLFDbedit
              Left = 72
              Top = 191
              Width = 422
              Height = 21
              DataField = 'VALORACION_2'
              DataSource = DMRHPersona.DSQMRHPersona
              TabOrder = 18
            end
            object DBEValoracion3: TLFDbedit
              Left = 72
              Top = 213
              Width = 422
              Height = 21
              DataField = 'VALORACION_3'
              DataSource = DMRHPersona.DSQMRHPersona
              TabOrder = 19
            end
          end
          object PNLNotas: TLFPanel
            Left = 0
            Top = 247
            Width = 867
            Height = 290
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            OnResize = PNLNotasResize
            DesignSize = (
              867
              290)
            object LFormacion: TLFLabel
              Left = 19
              Top = 82
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Formaci'#243'n'
            end
            object LNotas: TLFLabel
              Left = 40
              Top = 0
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Notas'
            end
            object LExperienciaProfesional: TLFLabel
              Left = 13
              Top = 164
              Width = 55
              Height = 26
              Alignment = taRightJustify
              Caption = 'Experiencia'#13#10'Profecional'
            end
            object DBMNotas: TDBRichEdit
              Left = 72
              Top = 0
              Width = 766
              Height = 80
              Anchors = [akLeft, akTop, akRight]
              BevelInner = bvNone
              BevelOuter = bvNone
              DataField = 'NOTAS'
              DataSource = DMRHPersona.DSQMRHPersona
              TabOrder = 0
            end
            object DBMFormacion: TDBRichEdit
              Left = 72
              Top = 81
              Width = 766
              Height = 80
              Anchors = [akLeft, akTop, akRight]
              BevelInner = bvNone
              BevelOuter = bvNone
              DataField = 'FORMACION_INI'
              DataSource = DMRHPersona.DSQMRHPersona
              TabOrder = 1
            end
            object DBMExpProf: TDBRichEdit
              Left = 72
              Top = 163
              Width = 766
              Height = 80
              Anchors = [akLeft, akTop, akRight]
              BevelInner = bvNone
              BevelOuter = bvNone
              DataField = 'EXPERIENCIA_PROF'
              DataSource = DMRHPersona.DSQMRHPersona
              TabOrder = 2
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 867
          Height = 537
          DataSource = DMRHPersona.DSQMRHPersona
          Columns = <
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_PERSONA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APELLIDOS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GENERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POBLACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVINCIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONO01'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONO02'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_DOCUMENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_DOCUMENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'N_SEGURIDAD_SOCIAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_NACIMIENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_CIVIL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMACION_INI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EXPERIENCIA_PROF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MINUSVALIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PUESTO_TRABAJO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENTREVISTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTREVISTADOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMENTARIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALORACION_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALORACION_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALORACION_3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACEPTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ACEPTADO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 595
    Width = 879
  end
  inherited CEMain: TControlEdit
    Left = 480
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 364
    Top = 4
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 400
    Top = 8
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntoPersona: TAction
      Category = 'Adjuntos'
      Caption = 'Adjunto de Persona'
      ImageIndex = 59
      OnExecute = AAdjuntoPersonaExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 448
    Top = 8
  end
end
