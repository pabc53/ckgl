object SPKCCX: TSPKCCX
  Left = 845
  Top = 201
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #21830#21697#24211#23384#26597#35810
  ClientHeight = 601
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 789
    Height = 601
    ActivePage = TabSheet2
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    TabStop = False
    TabWidth = 66
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #24211#23384#26597#35810
      DesignSize = (
        781
        570)
      object Bevel1: TBevel
        Left = 552
        Top = 8
        Width = 225
        Height = 553
        Shape = bsFrame
        Visible = False
      end
      object SpeedButton1: TSpeedButton
        Left = 589
        Top = 144
        Width = 72
        Height = 26
        Caption = #26597'   '#35810
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 681
        Top = 144
        Width = 70
        Height = 26
        Caption = #20840#37096#24211#23384
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton2Click
      end
      object Label6: TLabel
        Left = 568
        Top = 20
        Width = 65
        Height = 18
        AutoSize = False
        Caption = 'Label6'
      end
      object SpeedButton3: TSpeedButton
        Left = 589
        Top = 198
        Width = 70
        Height = 26
        Caption = #23548'  '#20986
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton3Click
      end
      object SpeedButPD: TSpeedButton
        Left = 681
        Top = 198
        Width = 70
        Height = 26
        Caption = #24211#23384#30424#28857
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButPDClick
      end
      object Label13: TLabel
        Left = 560
        Top = 320
        Width = 24
        Height = 13
        Caption = #26816#32034
        Visible = False
      end
      object SpeedButton4: TSpeedButton
        Left = 683
        Top = 312
        Width = 70
        Height = 26
        Caption = #25628#32034
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object DBGrid1: TDBGridEh
        Left = 0
        Top = 8
        Width = 545
        Height = 563
        AutoFitColWidths = True
        DataGrouping.GroupLevels = <>
        EvenRowColor = clWhite
        Flat = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        OddRowColor = clWhite
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
        RowDetailPanel.Color = clBtnFace
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = #23435#20307
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnTitleClick = DBGrid1TitleClick
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Button3: TButton
        Left = 443
        Top = -34
        Width = 70
        Height = 26
        Anchors = [akRight, akBottom]
        Caption = #32479'  '#35745
        TabOrder = 1
        OnClick = Button3Click
      end
      object CheckBox4: TCheckBox
        Left = 563
        Top = 57
        Width = 81
        Height = 17
        Caption = #20379#24212#21830#21517#31216
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox4Click
      end
      object RzDBLookupComboBox4: TTntComboBox
        Left = 648
        Top = 56
        Width = 120
        Height = 21
        Enabled = False
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ItemHeight = 13
        TabOrder = 3
        OnChange = RzDBLookupComboBox4Change
        OnClick = RzDBLookupComboBox4Click
        Items.Strings = (
          #33457#28165#32032
          #32500#29983#32032
          #38041#29255
          #38081#29255
          'VE'#29255
          #28165#32032)
      end
      object CheckBox2: TCheckBox
        Left = 563
        Top = 98
        Width = 81
        Height = 17
        Caption = #21830' '#21697' '#21517' '#31216
        TabOrder = 4
        OnClick = CheckBox2Click
      end
      object ComboBox1: TTntComboBox
        Left = 648
        Top = 96
        Width = 120
        Height = 21
        Enabled = False
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ItemHeight = 13
        TabOrder = 5
        Items.Strings = (
          #33457#28165#32032
          #32500#29983#32032
          #38041#29255
          #38081#29255
          'VE'#29255
          #28165#32032)
      end
      object Edit1: TEdit
        Left = 592
        Top = 316
        Width = 73
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ParentFont = False
        TabOrder = 6
        Visible = False
      end
      object Button6: TButton
        Left = 589
        Top = 252
        Width = 70
        Height = 25
        Caption = #32479'   '#35745
        TabOrder = 7
        OnClick = Button6Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20837#24211#26597#35810
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 73
        Width = 781
        Height = 497
        Align = alClient
        TabOrder = 0
        object DBGridRK: TDBGridEh
          Left = 1
          Top = 1
          Width = 779
          Height = 495
          Align = alClient
          DataGrouping.GroupLevels = <>
          Flat = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FooterRowCount = 1
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentFont = False
          RowDetailPanel.Color = clBtnFace
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGridRKDrawColumnCell
          OnTitleClick = DBGridRKTitleClick
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object grp1: TGroupBox
        Left = 0
        Top = 0
        Width = 781
        Height = 73
        Align = alTop
        Caption = #26597#35810#26465#20214
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          781
          73)
        object lbl2: TLabel
          Left = 95
          Top = 21
          Width = 42
          Height = 12
          Caption = #26102#38388#36215':'
        end
        object lbl3: TLabel
          Left = 94
          Top = 48
          Width = 42
          Height = 12
          Caption = #26102#38388#27490':'
        end
        object Label4: TLabel
          Left = 8
          Top = 48
          Width = 36
          Height = 12
          Caption = 'Label4'
        end
        object btn2: TButton
          Left = 702
          Top = 14
          Width = 66
          Height = 22
          Anchors = [akRight, akBottom]
          Caption = #24320#22987#26597#35810
          TabOrder = 0
          OnClick = btn2Click
        end
        object chk1: TCheckBox
          Left = 7
          Top = 19
          Width = 81
          Height = 17
          Caption = #25353#20837#24211#26085#26399
          TabOrder = 1
          OnClick = chk1Click
        end
        object chk2: TCheckBox
          Left = 244
          Top = 44
          Width = 81
          Height = 17
          Caption = #25353#20135#21697#21517#31216
          TabOrder = 2
          OnClick = chk2Click
        end
        object RzDateTimeEdit1: TRzDateTimeEdit
          Left = 142
          Top = 17
          Width = 91
          Height = 20
          CaptionTodayBtn = #20170#26085
          CaptionClearBtn = #28165#31354
          CaptionAM = #19978#21320
          CaptionPM = #19979#21320
          CaptionSet = #35774#32622
          EditType = etDate
          Enabled = False
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          TabOrder = 3
        end
        object RzDateTimeEdit2: TRzDateTimeEdit
          Left = 142
          Top = 45
          Width = 91
          Height = 20
          CaptionTodayBtn = #20170#26085
          CaptionClearBtn = #28165#31354
          CaptionAM = #19978#21320
          CaptionPM = #19979#21320
          CaptionSet = #35774#32622
          EditType = etDate
          Enabled = False
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          TabOrder = 4
        end
        object chk3: TCheckBox
          Left = 455
          Top = 18
          Width = 81
          Height = 17
          Caption = #25353#20837#24211#31867#22411
          TabOrder = 5
          OnClick = chk3Click
        end
        object chk4: TCheckBox
          Left = 244
          Top = 18
          Width = 81
          Height = 17
          Caption = #20379#24212#21830#21517#31216
          Checked = True
          State = cbChecked
          TabOrder = 6
          OnClick = chk4Click
        end
        object btn3: TButton
          Left = 630
          Top = 43
          Width = 66
          Height = 22
          Anchors = [akRight, akBottom]
          Caption = #32479'  '#35745
          TabOrder = 7
          OnClick = btn3Click
        end
        object cbRKSPLX: TComboBox
          Left = 540
          Top = 16
          Width = 79
          Height = 20
          Enabled = False
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 8
          Text = #36141#20837
          Items.Strings = (
            #36141#20837
            #20511#20837
            #36192#20837)
        end
        object cbRKSPNAME: TComboBox
          Left = 329
          Top = 42
          Width = 115
          Height = 20
          Enabled = False
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 12
          TabOrder = 9
          OnChange = cbRKSPNAMEChange
          OnDropDown = cbRKSPNAMEDropDown
        end
        object CbSPBH: TComboBox
          Left = 224
          Top = 50
          Width = 52
          Height = 20
          Enabled = False
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 12
          TabOrder = 10
          Visible = False
        end
        object chk5: TCheckBox
          Left = 455
          Top = 44
          Width = 81
          Height = 17
          Caption = #25353#20135#21697#26469#28304
          TabOrder = 11
          OnClick = chk5Click
        end
        object cbSPLY: TComboBox
          Left = 539
          Top = 42
          Width = 79
          Height = 22
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 14
          ParentFont = False
          TabOrder = 12
          OnDropDown = cbSPLYDropDown
        end
        object ComboBoxGYS2: TComboBox
          Left = 329
          Top = 17
          Width = 115
          Height = 20
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 12
          TabOrder = 13
          Text = 'ARIIX'
          OnChange = ComboBoxGYS2Change
        end
        object ComboBoxGysN2: TComboBox
          Left = 256
          Top = 8
          Width = 89
          Height = 20
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 12
          TabOrder = 14
          Text = 'GS20150126001'
          Visible = False
        end
        object ButRkDc: TButton
          Left = 702
          Top = 43
          Width = 66
          Height = 22
          Anchors = [akRight, akBottom]
          Caption = #23548'  '#20986
          TabOrder = 15
          OnClick = ButRkDcClick
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #20986#24211#26597#35810
      ImageIndex = 2
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 781
        Height = 73
        Align = alTop
        Caption = #26597#35810#26465#20214
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          781
          73)
        object Label2: TLabel
          Left = 95
          Top = 21
          Width = 42
          Height = 12
          Caption = #26102#38388#36215':'
        end
        object Label3: TLabel
          Left = 94
          Top = 48
          Width = 42
          Height = 12
          Caption = #26102#38388#27490':'
        end
        object Label5: TLabel
          Left = 8
          Top = 48
          Width = 6
          Height = 12
        end
        object Label1: TLabel
          Left = 8
          Top = 48
          Width = 12
          Height = 12
          Caption = '::'
        end
        object btnCK: TButton
          Left = 702
          Top = 14
          Width = 63
          Height = 22
          Anchors = [akRight, akBottom]
          Caption = #24320#22987#26597#35810
          TabOrder = 0
          OnClick = btnCKClick
        end
        object CheckBox1: TCheckBox
          Left = 7
          Top = 19
          Width = 81
          Height = 17
          Caption = #25353#20986#24211#26085#26399
          TabOrder = 1
          OnClick = CheckBox1Click
        end
        object RzDateTimeEdit3: TRzDateTimeEdit
          Left = 142
          Top = 17
          Width = 91
          Height = 20
          CaptionTodayBtn = #20170#26085
          CaptionClearBtn = #28165#31354
          CaptionAM = #19978#21320
          CaptionPM = #19979#21320
          CaptionSet = #35774#32622
          EditType = etDate
          Enabled = False
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          TabOrder = 2
        end
        object RzDateTimeEdit4: TRzDateTimeEdit
          Left = 142
          Top = 45
          Width = 91
          Height = 20
          CaptionTodayBtn = #20170#26085
          CaptionClearBtn = #28165#31354
          CaptionAM = #19978#21320
          CaptionPM = #19979#21320
          CaptionSet = #35774#32622
          EditType = etDate
          Enabled = False
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          TabOrder = 3
        end
        object Button2: TButton
          Left = 630
          Top = 43
          Width = 63
          Height = 22
          Anchors = [akRight, akBottom]
          Caption = #32479'  '#35745
          TabOrder = 4
          OnClick = Button2Click
        end
        object chkC_GYS: TCheckBox
          Left = 244
          Top = 18
          Width = 81
          Height = 17
          Caption = #20379#24212#21830#21517#31216
          Checked = True
          State = cbChecked
          TabOrder = 5
          OnClick = chkC_GYSClick
        end
        object CHKC_SPNAME: TCheckBox
          Left = 244
          Top = 44
          Width = 81
          Height = 17
          Caption = #25353#20135#21697#21517#31216
          TabOrder = 6
          OnClick = CHKC_SPNAMEClick
        end
        object ComboBox2: TComboBox
          Left = 304
          Top = 53
          Width = 52
          Height = 20
          Enabled = False
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 12
          TabOrder = 7
          Visible = False
        end
        object cbCKSPNAME: TComboBox
          Left = 329
          Top = 43
          Width = 115
          Height = 20
          Enabled = False
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 12
          TabOrder = 8
          OnChange = cbCKSPNAMEChange
          OnDropDown = cbCKSPNAMEDropDown
          OnExit = cbCKSPNAMEExit
        end
        object CHKC_TYPE: TCheckBox
          Left = 455
          Top = 18
          Width = 81
          Height = 17
          Caption = #25353#20986#24211#31867#22411
          TabOrder = 9
          OnClick = CHKC_TYPEClick
        end
        object CHKC_GOTO: TCheckBox
          Left = 455
          Top = 44
          Width = 81
          Height = 17
          Caption = #25353#20135#21697#21435#21521
          TabOrder = 10
          OnClick = CHKC_GOTOClick
        end
        object CBC_GOTO: TComboBox
          Left = 540
          Top = 42
          Width = 79
          Height = 22
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 14
          ParentFont = False
          TabOrder = 11
          OnDropDown = CBC_GOTODropDown
        end
        object cbCKTYPE: TComboBox
          Left = 540
          Top = 16
          Width = 79
          Height = 20
          Enabled = False
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 12
          TabOrder = 12
          Text = #21806#20986
          Items.Strings = (
            #21806#20986
            #20511#20986
            #36824#20986
            #33258#29992
            #24402#36824
            #36192#36865)
        end
        object ComboBoxGYS1: TComboBox
          Left = 329
          Top = 17
          Width = 115
          Height = 20
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 12
          TabOrder = 13
          Text = 'ARIIX'
          OnChange = ComboBoxGYS1Change
        end
        object ComboBoxGysN1: TComboBox
          Left = 272
          Top = 8
          Width = 105
          Height = 20
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 12
          TabOrder = 14
          Text = 'GS20150126001'
          Visible = False
        end
        object ButCkDc: TButton
          Left = 702
          Top = 43
          Width = 66
          Height = 22
          Anchors = [akRight, akBottom]
          Caption = #23548'  '#20986
          TabOrder = 15
          OnClick = ButCkDcClick
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 73
        Width = 781
        Height = 497
        Align = alClient
        TabOrder = 1
        object DBGridCK: TDBGridEh
          Left = 1
          Top = 1
          Width = 779
          Height = 495
          Align = alClient
          DataGrouping.GroupLevels = <>
          Flat = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FooterRowCount = 1
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentFont = False
          RowDetailPanel.Color = clBtnFace
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGridCKDrawColumnCell
          OnTitleClick = DBGridCKTitleClick
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #21830#21697#26597#35810
      ImageIndex = 3
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 781
        Height = 73
        Align = alTop
        Caption = #26597#35810#26465#20214
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          781
          73)
        object Label8: TLabel
          Left = 16
          Top = 52
          Width = 36
          Height = 12
          Caption = #35760#24405#65306
        end
        object btnSPCX: TButton
          Left = 630
          Top = 24
          Width = 63
          Height = 22
          Anchors = [akRight, akBottom]
          Caption = #24320#22987#26597#35810
          TabOrder = 0
          OnClick = btnSPCXClick
        end
        object CheckBox3: TCheckBox
          Left = 242
          Top = 26
          Width = 81
          Height = 17
          Caption = #25353#20135#21697#31616#31216
          TabOrder = 1
          OnClick = CheckBox3Click
        end
        object CheckBox5: TCheckBox
          Left = 20
          Top = 26
          Width = 81
          Height = 17
          Caption = #20379#24212#21830#21517#31216
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = CheckBox5Click
        end
        object RzDBLookupComboBox2: TRzDBLookupComboBox
          Left = 105
          Top = 24
          Width = 115
          Height = 20
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          TabOrder = 3
          OnClick = btnSPCXClick
        end
        object ComboBox5: TComboBox
          Left = 328
          Top = 8
          Width = 81
          Height = 20
          Enabled = False
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 12
          TabOrder = 4
          Visible = False
        end
        object CheckBox6: TCheckBox
          Left = 447
          Top = 26
          Width = 81
          Height = 17
          Caption = #25353#20135#21697#26469#28304
          TabOrder = 5
          Visible = False
          OnClick = CheckBox6Click
        end
        object ComboBox6: TComboBox
          Left = 532
          Top = 24
          Width = 53
          Height = 20
          Enabled = False
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 12
          TabOrder = 6
          Visible = False
          OnChange = btnSPCXClick
        end
        object ComboBox4: TTntComboBox
          Left = 325
          Top = 25
          Width = 124
          Height = 20
          Enabled = False
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 12
          TabOrder = 7
          OnChange = btnSPCXClick
          OnDropDown = ComboBox4DropDown
          Items.Strings = (
            #33457#28165#32032
            #32500#29983#32032
            #38041#29255
            #38081#29255
            'VE'#29255
            #28165#32032)
        end
        object Button1: TButton
          Left = 702
          Top = 24
          Width = 63
          Height = 22
          Anchors = [akRight, akBottom]
          Caption = #32479'  '#35745
          TabOrder = 8
          OnClick = Button1Click
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 73
        Width = 781
        Height = 497
        Align = alClient
        TabOrder = 1
        object DBGridSP: TDBGridEh
          Left = 1
          Top = 1
          Width = 779
          Height = 495
          Align = alClient
          DataGrouping.GroupLevels = <>
          Flat = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FooterRowCount = 1
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentFont = False
          RowDetailPanel.Color = clBtnFace
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = [fsBold]
          OnTitleClick = DBGridSPTitleClick
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #21382#21490#30424#28857
      ImageIndex = 4
      OnShow = TabSheet5Show
      object DBGridEhPD: TDBGridEh
        Left = 0
        Top = 49
        Width = 781
        Height = 521
        Align = alClient
        DataGrouping.GroupLevels = <>
        Flat = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
        RowDetailPanel.Color = clBtnFace
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = [fsBold]
        OnTitleClick = DBGridSPTitleClick
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 781
        Height = 49
        Align = alTop
        TabOrder = 1
        DesignSize = (
          781
          49)
        object Label7: TLabel
          Left = 95
          Top = 18
          Width = 60
          Height = 13
          Caption = #30424#28857#26085#26399#65306
        end
        object CheckBox7: TCheckBox
          Left = 324
          Top = 18
          Width = 81
          Height = 17
          Caption = #20379#24212#21830#21517#31216#65306
          TabOrder = 0
          OnClick = CheckBox7Click
        end
        object ComboBox3: TComboBox
          Left = 152
          Top = 15
          Width = 145
          Height = 21
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 13
          TabOrder = 1
          OnChange = ComboBox3Change
        end
        object ComboBox7: TComboBox
          Left = 417
          Top = 15
          Width = 115
          Height = 21
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ItemHeight = 13
          TabOrder = 2
          Text = 'ARIIX'
          OnClick = ComboBox7Click
        end
        object But_Ck_Rk: TButton
          Left = 664
          Top = 11
          Width = 104
          Height = 22
          Hint = #23558#20837#24211#19982#20986#24211#26597#35810#34920#20013#30340#25968#25454#21516#26102#23548#20986
          Anchors = [akRight, akBottom]
          Caption = #20837#24211#19982#20986#24211#23548#20986
          Enabled = False
          TabOrder = 3
          OnClick = But_Ck_RkClick
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #32467'  '#31639
      ImageIndex = 5
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 781
        Height = 570
        Align = alClient
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 1
          Top = 1
          Width = 779
          Height = 73
          Align = alTop
          Caption = #26597#35810#26465#20214
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          DesignSize = (
            779
            73)
          object Label9: TLabel
            Left = 15
            Top = 29
            Width = 49
            Height = 14
            Caption = #26102#38388#36215':'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 166
            Top = 29
            Width = 49
            Height = 14
            Caption = #26102#38388#27490':'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Label12: TLabel
            Left = 548
            Top = 27
            Width = 56
            Height = 14
            Caption = #32467#31639#23545#35937
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 340
            Top = 29
            Width = 70
            Height = 14
            Caption = #20379#24212#21830#21517#31216
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Button4: TButton
            Left = 702
            Top = 14
            Width = 66
            Height = 22
            Anchors = [akRight, akBottom]
            Caption = #24320#22987#26597#35810
            TabOrder = 0
            OnClick = Button4Click
          end
          object RzDateTimeEdit5: TRzDateTimeEdit
            Left = 68
            Top = 25
            Width = 91
            Height = 20
            CaptionTodayBtn = #20170#26085
            CaptionClearBtn = #28165#31354
            CaptionAM = #19978#21320
            CaptionPM = #19979#21320
            CaptionSet = #35774#32622
            EditType = etDate
            ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
            TabOrder = 1
          end
          object RzDateTimeEdit6: TRzDateTimeEdit
            Left = 218
            Top = 25
            Width = 91
            Height = 20
            CaptionTodayBtn = #20170#26085
            CaptionClearBtn = #28165#31354
            CaptionAM = #19978#21320
            CaptionPM = #19979#21320
            CaptionSet = #35774#32622
            EditType = etDate
            ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
            TabOrder = 2
          end
          object ComboBoxJS: TComboBox
            Left = 610
            Top = 25
            Width = 79
            Height = 20
            ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
            ItemHeight = 12
            TabOrder = 3
            OnDropDown = cbSPLYDropDown
          end
          object ComboBoxGYS3: TComboBox
            Left = 421
            Top = 25
            Width = 115
            Height = 20
            ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
            ItemHeight = 12
            TabOrder = 4
            Text = 'ARIIX'
            OnChange = ComboBoxGYS3Change
          end
          object ComboBoxGysN3: TComboBox
            Left = 376
            Top = 8
            Width = 129
            Height = 20
            ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
            ItemHeight = 12
            TabOrder = 5
            Text = 'GS20150126001'
            Visible = False
          end
          object ButtonJS_DC: TButton
            Left = 702
            Top = 43
            Width = 66
            Height = 22
            Anchors = [akRight, akBottom]
            Caption = #23548'  '#20986
            Enabled = False
            TabOrder = 6
            OnClick = ButtonJS_DCClick
          end
        end
        object Panel6: TPanel
          Left = 1
          Top = 74
          Width = 779
          Height = 495
          Align = alClient
          TabOrder = 1
          object DBGridEhJS: TDBGridEh
            Left = 1
            Top = 1
            Width = 424
            Height = 493
            Align = alLeft
            DataGrouping.GroupLevels = <>
            Flat = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            FooterRowCount = 1
            ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
            ParentFont = False
            RowDetailPanel.Color = clBtnFace
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = [fsBold]
            OnTitleClick = DBGridSPTitleClick
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object sg_JS: TStringGrid
            Left = 432
            Top = 1
            Width = 346
            Height = 493
            Align = alRight
            ColCount = 4
            DefaultRowHeight = 20
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnDrawCell = sg_JSDrawCell
          end
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = #23458'  '#25143
      ImageIndex = 6
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 781
        Height = 570
        Align = alClient
        TabOrder = 0
        object DBGridCust: TDBGrid
          Left = 1
          Top = 1
          Width = 344
          Height = 568
          Align = alLeft
          DataSource = dsCust
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object Button5: TButton
          Left = 528
          Top = 128
          Width = 75
          Height = 25
          Caption = #20445#23384#25968#25454
          TabOrder = 1
          OnClick = Button5Click
        end
        object DBNavigator1: TDBNavigator
          Left = 432
          Top = 80
          Width = 280
          Height = 33
          DataSource = dsCust
          TabOrder = 2
        end
        object Memo1: TMemo
          Left = 369
          Top = 368
          Width = 411
          Height = 201
          Align = alCustom
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 3
          Visible = False
        end
      end
    end
  end
  object SaveDialog: TSaveDialog
    Title = #20445#23384#25991#20214
    Left = 284
    Top = 144
  end
  object dsCust: TDataSource
    DataSet = DModule.cdsCust
    Left = 392
    Top = 304
  end
end
