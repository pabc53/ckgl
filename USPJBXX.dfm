object SPJBXX: TSPJBXX
  Left = 373
  Top = 144
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #21830#21697#22522#26412#20449#24687
  ClientHeight = 366
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 6
    Top = 8
    Width = 500
    Height = 296
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 72
      Width = 60
      Height = 12
      Caption = #21830#21697#32534#21495#65306
    end
    object Label3: TLabel
      Left = 24
      Top = 124
      Width = 60
      Height = 12
      Caption = #35268'    '#26684#65306
    end
    object Label5: TLabel
      Left = 266
      Top = 124
      Width = 60
      Height = 12
      Caption = #20135'    '#22320#65306
    end
    object Label7: TLabel
      Left = 266
      Top = 150
      Width = 60
      Height = 12
      Caption = #36827'    '#20215#65306
    end
    object Label9: TLabel
      Left = 266
      Top = 177
      Width = 60
      Height = 12
      Caption = #38646' '#21806' '#20215#65306
    end
    object Label11: TLabel
      Left = 24
      Top = 209
      Width = 60
      Height = 12
      Caption = #22791'    '#27880#65306
    end
    object Label2: TLabel
      Left = 266
      Top = 72
      Width = 60
      Height = 12
      Caption = #21830#21697#21517#31216#65306
    end
    object Label4: TLabel
      Left = 266
      Top = 98
      Width = 60
      Height = 12
      Caption = #20445' '#36136' '#26399#65306
    end
    object Label6: TLabel
      Left = 24
      Top = 150
      Width = 60
      Height = 12
      Caption = #21333'    '#20301#65306
    end
    object Label8: TLabel
      Left = 24
      Top = 177
      Width = 60
      Height = 12
      Caption = #25209' '#21457' '#20215#65306
    end
    object Label12: TLabel
      Left = 24
      Top = 98
      Width = 60
      Height = 12
      Caption = #21830#21697#31616#31216#65306
    end
    object Label13: TLabel
      Left = 257
      Top = 26
      Width = 72
      Height = 12
      Caption = #20379#24212#21830#32534#21495#65306
    end
    object Label10: TLabel
      Left = 18
      Top = 26
      Width = 72
      Height = 12
      Caption = #20379#24212#21830#21517#31216#65306
    end
    object Bevel1: TBevel
      Left = 6
      Top = 13
      Width = 487
      Height = 39
      Shape = bsFrame
    end
    object Edit1: TEdit
      Left = 85
      Top = 68
      Width = 155
      Height = 20
      Enabled = False
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      ReadOnly = True
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 328
      Top = 68
      Width = 155
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 1
      OnEnter = Edit2Enter
      OnExit = Edit2Exit
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 85
      Top = 120
      Width = 155
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 4
      OnEnter = Edit3Enter
      OnKeyPress = Edit3KeyPress
    end
    object Edit4: TEdit
      Left = 328
      Top = 95
      Width = 155
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 3
      OnEnter = Edit4Enter
      OnKeyPress = Edit4KeyPress
    end
    object Edit7: TEdit
      Left = 328
      Top = 147
      Width = 155
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 5
      Text = '0'
      OnExit = Edit7Exit
      OnKeyPress = Edit7KeyPress
    end
    object Edit8: TEdit
      Left = 85
      Top = 173
      Width = 155
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 6
      Text = '0'
      OnKeyPress = Edit8KeyPress
    end
    object Edit9: TEdit
      Left = 328
      Top = 173
      Width = 155
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 7
      Text = '0'
      OnKeyPress = Edit9KeyPress
    end
    object Memo1: TMemo
      Left = 85
      Top = 207
      Width = 396
      Height = 81
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 10
      OnEnter = Memo1Enter
    end
    object Edit10: TEdit
      Left = 85
      Top = 94
      Width = 155
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 2
      OnEnter = Edit10Enter
      OnKeyPress = Edit10KeyPress
    end
    object ComboBox1: TComboBox
      Left = 85
      Top = 24
      Width = 155
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 12
      TabOrder = 8
      OnChange = ComboBox1Change
      OnDropDown = ComboBox1DropDown
      OnKeyPress = ComboBox1KeyPress
    end
    object Edit11: TEdit
      Left = 328
      Top = 24
      Width = 155
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 9
      OnKeyPress = Edit11KeyPress
    end
    object Edit6: TComboBox
      Left = 85
      Top = 147
      Width = 155
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 12
      TabOrder = 11
      Text = #29942
      OnEnter = Edit6Enter
      OnKeyPress = Edit6KeyPress
      Items.Strings = (
        #22871
        #29942
        #30418
        #34955
        #25903
        #31570
        #20010
        #26465
        #21488
        #26550
        #21548
        #29255
        #25171
        #26412)
    end
    object Edit5: TComboBox
      Left = 328
      Top = 120
      Width = 155
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 12
      Text = #32654#22269
      OnEnter = Edit5Enter
      OnKeyPress = Edit5KeyPress
      Items.Strings = (
        #32654#22269
        #39321#28207
        #20013#22269
        #21152#25343#22823
        #26032#21152#22369)
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 307
    Width = 500
    Height = 52
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 27
      Top = 9
      Width = 70
      Height = 36
      Caption = #28155#21152
      Flat = True
      Glyph.Data = {
        D6090000424DD60900000000000036000000280000001D0000001C0000000100
        180000000000A0090000C30E0000C30E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC0BFBC857575816E6C85737185737185737185737185
        7371857371857371857372867575877773847371887571AD9F9EFBFBFAFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB
        AAA2272823132E2F2043491E3F471E3E461E3E461E3E461E3E461E3E461E3E46
        1F3E461F3E441F41441E3D442547517B9FA8FFFEFEFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA69E9C1A10111B61674DCBCC
        58DADA55D7D955D7D855D7D855D7D855D7D855D7D855D7D856D7D856D6D753D7
        D850D5D848D5DC6CE3F0F2FCFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFBFCFD8F878616070B1D5A675FE2E572FFFF6BF6FF69F9FF69F9
        FF6AF9FF6AF9FF6AF9FF6AF9FF6AF9FF6BF9FF72FBFF79FFFF75FEFF5EF8FF5C
        E9FFE9FAFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFECE4
        E2706D6C2766785BDBE370FCFF6AECFF6DF0FF6FF0FF6DECFF6AEAFF69EAFF6B
        EAFF6BEAFF6DEAFF6DEBFF56E8FE39DBFB46D7F843DFF580E9FEF8FDFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFF5F3F18DD9DB61E6F468
        F1FF5DE9FF79F4FF99FAFB98FAF89AFFFE9EFDFF96F9FF91F9FF8FF9FF8EF9FF
        99F9FF80F4FF2ADBFD26C9FC83DDFAE0FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFD0F7FF66F3FF65F2FF5BE6FF71F2FF8DEFEE
        639B9A65B8C57EE3F98DEFF6A7FFFEABFFFF99FFFF92FFFFA4FFFF9DFDFF3CE3
        FF35D5FEE2F4FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFB8EFFF58E4FF58E5FF6BEEFF9BFFFF99EADD6293985094C12FA5
        E42ABEEE54E9FE7AF9FF99FFFFA2FFFFA7FFFF94FBFF28E2FF23DBFFE4FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFBCF2
        FF4BE4FF58EBFF84F8FF96FEFF98FAF083CDE541B4DD05C3E500C5F80FC4FF28
        D9FF48EBFF73F4FF94FBFF56EEFF0CDAFF66E9FFE9FDFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFCBF6FF57E2FF6BEBFF82
        F0FF7BF0FF85F5FF78D7FB1BDBF100FEFA00F4FF04C9FF05BEFF15D6FF44E7FF
        73EEFF7EEFFF90EBFFE5FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFF0FCFFC4F3FFC1F3FFC0F2FFBEF2FFBFF2FF
        C1F0FE7EF3FF14F6FF00FFFE00F1FE04CBFF32CDFF92ECFFC4F5FFF4FDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FF89EB
        FF17F1FE00FFFE00EFFF15CDFF7CD9FFEBF8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F8FF8DEDFF15F6FF00
        FFFE00EDFE00CAFE5DD5FFDFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFF8CF4FE15F9FE00FFFF00EEFF
        00CEFE5DCFE8E7EAE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFDFCFF8AF3FE13F7FE00FFFD08E1E122918A809C
        7EE7EFE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF7F9FF81F1FD1CE3E14ABFA57091653B766977A3D0E6EEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF1F8FAA9C8C18FA88D8BB0A24C88CA3576FF90B2FDFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF0E9
        B3C6BB7DB1CA87B9FF73A5FDBBD0F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFFC7DFFDA6CE
        FFDAEAFCFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFF8FBFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 120
      Top = 9
      Width = 70
      Height = 36
      Caption = #20462#25913
      Flat = True
      Glyph.Data = {
        66090000424D660900000000000036000000280000001C0000001C0000000100
        18000000000030090000C30E0000C30E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F5
        F5F5F6F6F6F6F6F6F6F6F6F6F6F6F8F8F8F9F8F8F8F8F8F8F8F8F7F7F6F6F6F6
        F6F6F6F6F6F6F6F6F6F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFDEDFDE656665515151585A585859585959595A
        5B5C5C5E5C5A5A58565658545656585856585856585A5858595858585A555556
        B9BAB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
        FDB5B6B5929292A2A1A2A6A7A6A4A4A4A7A7A6A0A0A0726E70686A6B76787584
        88889D9B9DA3A4A3A6A7A6A7A7A7A09FA0363536989899FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAC7C7C7F4F4F4F2F2F2DBDB
        DBEBEBEBE7E7E7ADABADAAACACBDC2C2EEECEEF9FAF8F2F2F1F9F9FAE1E1E1E3
        E3E3FFFFFF6A686A969396FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFAFAFAC7C7C7E5E5E5E6E6E6CDCDCDBCBCBCA6A7A72B2C2C5E61
        62C7C9C7B5B5BAAFB1B0B8B8B6A2A3A2929393BABABAFCFCFC5F5F5F929392FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAC9C9C9
        E3E2E3C2C3C2C9C9C9A4A4A4C5C6C671726F20230D717050C1C1A7F0F4EBFBFC
        FCEEEDF0F2F2F2FDFCFDFFFFFF5C5D5C939493FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAC7C8C8E0E1E09A9A9BACACADA3A3A2
        AAABACD0D2C9C1C78082844347472282865FD9DBBDFFFFFBEEEFF2EEEFEFFFFF
        FF5D5D5D949494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFAFAFAC5C4C6E9EBEBD1D3D3C8C6C8B7B9B7B4B7B3BDBFC3DBDBB8FBF399
        A5A4593134153F421B96956ECECDC9E7EAEAFFFFFF5C5B5A969493FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAC5C5C7E7E6E7D0
        CCC9B3B1AFBFB7B6B8B7B3B1B3B7C6C8C4E9DDA6FFF79CB7B769484522221A00
        746B4BF5F2E9FFFFFF5B5A59969494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFAFAFACDC7C5F3EDEF81A0B2223D434E5F69385F6953
        5B54ACA8AAD0CFB1F6E6A3E1CB759C85384B3C131C1A00686242E7E1D967696C
        959596FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
        FCC1BCBB8FACB442B2D81E8FBD3992AD34A8C5153946544B4CA9ADABE1CF99E0
        A43FA676298E6A2A4C3B131E1F01776F545452509CA0A0FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF8CBED2117DA01899C23FAE
        D856A1B573A5B160A7C109536A5A646CD0CECDE1BA75E29E30A77929906B284B
        3F172420051C190BACAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFBFDFD84CDE32C9FC8329BC266A8BF4CA2BD689EB163BADA3B97
        B650595DACA9AFBCC3C7ECC786E2A033A9782B926D284F40151B1C04808077FC
        FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFE62BAD7
        0B749B86C1D375A6B513A7DB20B5E53DBEE84A9BBC2B3C42958F8E999DA5BBC1
        C3DAB877E19F31AA7E2E916D294D3A13313117F3F4F3FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFDFE6FC6E5196C8F7099A886A7AB187994
        2B8BAB359AB93DB9E53A778C958F91C5C5C4D6D9DDE6E9E9E7C080DB9C32AA7B
        2A906A284A3C16F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFAFCFD8FCDE05BADCB1C556D638891668B95609AB51F98BF1F7792929DA3
        BFBBB9C5C6C6C8C7C7D9D9DBBABEC4DEB87BDE9E32A978298C6A2AF8F6F3FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFAABB8C073CEEE54
        B9DB387A902777982896BE32B2DB679DADEDE8E6FEFEFDF1F1F1EFEFEFF7F6F6
        F1F4F8F8F7F7EDC687E39E32A87A2EF7F6F3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFCFCB8B8BC80A8B685BDCA7DC4D850B3D74DA4C182
        B1C4B3C6CED0D2CECDCECDCFCFCFCFCFCFCECECECFCFCECFD0D0C0C3C6C59F61
        DD9C31FCF9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFEFEFEEE0DCD9E5DDDBC7DBE0A5D9EDD1DFE4E7DEDCE4E0DFDCDDDADBDCDBDB
        DBDBDBDBDBDBDBDBDBDBDBDCDCDCDDE0E4DDDFE0EBC88BFEFBF4FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFEFEFDFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 214
      Top = 9
      Width = 70
      Height = 36
      Caption = #20445#23384
      Enabled = False
      Flat = True
      Glyph.Data = {
        66090000424D660900000000000036000000280000001C0000001C0000000100
        18000000000030090000C30E0000C30E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEE1DEE5D5CCE4DDD2E3E4D6E3E3D5E3
        E3D5E3E3D5E3E3D5E3E3D5E3E3D5E3E3D5E3E3D5E2E3D4E4DDD3E8D8D1EEE5DF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF7F1EBD9BEB1C9A188C44749C41429C11529C11529C11529C11529C11529C1
        1529C11529C11529C11429CB5152D8C4B1C3A69CEAE1DBFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EADCCDB6AA6E645CECA9
        B8FA849CF68A9EF68AA0F68AA0F68AA0F68AA0F68AA0F68AA0F68AA0F7839CF4
        B2BAFBF2ECA0A3A5BAB9B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF5E9E0D3BFB47A6C69EBD6D1FFF0E9FFECE4FFECE4FFEC
        E4FFECE4FFECE4FFECE4FFECE4FFECE4FFEAE4F8E4DEF8E7E39F9DA3BFBDBCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E4D7
        EDD8CFD6B8AFECCEC7FFE0DBFFDCD9FFDCD9FFDCD9FFDCD9FFDCD9FFDCD9FFDC
        D9FFDBD9FFD8D4F9DFD9F8EDE3A5A1A3C1BDBCFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E4DAEBD7CCCBB1A8EDCCC7FFD7D4
        FFD4D1FFD5D2FFD5D2FFD5D2FFD5D2FFD5D2FFD5D2FFD4D1FFD3CFF8DAD5FBEB
        DEA19FA3BBBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF2E6DCEBD9D0CBB1A7ECD1CCFFE3E0FFDDDBFFDEDCFFDEDCFFDEDC
        FFDEDCFFDEDCFFDEDCFFDEDBFFDEDCF8E1DAFAECDFA19FA4BCBCBCFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E5DBEBD8CECD
        B2A8EDCEC8FFDAD6FFD8D4FFD8D5FFD8D5FFD8D5FFD9D5FFD8D5FFD8D5FFD8D4
        FFD5D2F8DDD7FAEEE0A19FA4BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF2E6DCEBD8D0CAACA2EDCDC8FEDCDAFDDAD8FD
        DAD8FDDAD8FDDAD8FDDAD8FDDAD6FDDAD7FDD9D7FDD4D4F7DDD8FAEDDFA09EA3
        BBBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF1E6DBE8D6CCDCC8C2DCC5B6E6D4C8EBDDD3EDDED4ECDFD3EBDBCFEADCD2ED
        DDD0EDDDD0EDE0D5E8DBD0E1CABEF8E9E5A79DA6C1BDBCFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E5D7E9D6C6FFFFFFF3E8
        E5ECDDD4D8C9CCDACBCDDDCFCEE1D1D0E0CFCFD5C3BFD0BFBAD1BEBBE6D7D0F0
        E5E3FCFAFCA09B9FBEBDBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF3E8DCEAD7D1E0CDCDF1E1D5EEE2D89D75629469508351
        3D7A423177443EAD928CB5A4A2A99495A78272FFFBF8FFFFFF9D9D9BBBBDBCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E7DB
        EBD9CEC5A091DFC8B0F9EFE5CBA175BA8859A86B41823B12662A11DBC7B9FAF6
        EDE3D1C7976D5DFCF1F0FFFFFF9F9EA1BCBDBCFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E7DBE9D8CCC6A599DFC6B1FBF5EC
        E4C9ABCFA67DC29169A96C417B4326DAC7B7FFF5EAC8A17F9A6F58FDF6F4FFFF
        FFA39AA1C0BCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF2E6DAEAD8CBC7AA9EE0CBAEFAF7EDF1E4DDDDBEA0CBA17AC38F65
        8A573BD6C5B6FDF2E8A8714C976A50FDF6F6FFFFFFA09B9EBEBDBCFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E6D8EAD6CDC5
        A49BE1C5AAFEF9F3FBFAFEF4E6DDDFC0ABCE9F7795613FCDB5A4E6DCD16A2B12
        8B5242FFFAFBFFFFFF969598BCBDBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF7EFE9EAD8CBCFAFA0E1C2AAF1E0D0F0E3DDEF
        E0DDE8D1BCDEC1A0C89F7DA1745A8C6B5A744C3CAB856DF3E4D5E7D8D2B1B2B0
        F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFAF6F2F9F3ECF7F0EBF7F0E9F6EEE5F7EFE9F8F2EAF7F3EEFBF7F3FD
        F8F0FFFAF3FFFEF9FEF8F3F5EDE2F7F0E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 307
      Top = 9
      Width = 70
      Height = 36
      Caption = #21462#28040
      Enabled = False
      Flat = True
      Glyph.Data = {
        D6090000424DD60900000000000036000000280000001D0000001C0000000100
        180000000000A0090000C30E0000C30E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0EFEDB08B7B8F554090
        5C46B2988EF5F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF6EDEFB8765DA23103C24600C85200A94811975845
        D3C2C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDB97758542919272936734424F0801CF37F05C850009D5535CABBBEFFFF
        FFFFFFFFF7F7F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8DCDE9CA29E736C6194AA
        AA8BBCD325607F5B4226EF750CFE890BCF5400A2593CC6BCBECEC3C19F7B6BFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFE4E0E3879EAC6492A282ABB8B6D7DBE9FFFFEEFFFFB3DFEC6D
        8E9C906240F88F2EFF8E17D351009E4B228F4D2D966244FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3DB94A5B382
        9EA885AEC2A7D6DECDF6FAECFFFFBCD7E0CAE8EAD4EAEFBFD3DEBCC1C4A1785C
        D68231FE9F3DD4630AA33600A47056FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFF8A9FAF7193A680A4B291BDCED4F7FFDBFAF8
        D0EEF1ADC4D591AEC18BB0C1A4C4CED1E7EDE0FAFF9BAAB1865A37FCB461FFBC
        68C35A09613933AEC3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFF78A0BAC0DBE6C2F2FF408AB3ACD8EDBFDEF192B1B88EABB393AF
        B98DA9B998B6BDA4D8DC9FE1F19B998FA74B0BD46A15D98338B543006140355E
        ADCFB9C7CFF0EFF1FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF88B0
        C8BBBCB9AD97884638318A6D5CAA7C65725E4C7C939E98BBCA98B4BF95A9B58E
        B5BC82BCC7818885B07A5CBD92719A7152D8A586ACC6B95BBEEE2B6B918F9EB3
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFAFC4D06D685FB44C0FE1
        6901CC4D00AA490AAE968198B1BE89AABC91AFBF98C0CF8FB3C088A3B18BABBE
        B1CEDEE4FEFFB1E0EA9BE2FF65B0CA5892B76792ACABBBC8FFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA88E81DF833EFFB657FF8E16C0611D
        D0CBC2E4FFFFA0BDC286A5B389BCCC8FBECCAEC0CCCFE1E6D3FCFFA3DDF36DB7
        D34489AA728FAAB0BBC3F4EEEAFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFCDA497CF7F41E5A470FEAA4BE77203B96735CDC7C1DDF9
        FDA5C0C8A2B6C3CDE5E8D2FAFFAEE3F46BB2C4438CB25C87A6B2B5B6FFFCF7FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFC29988B05E30BF865AE19351FF9C25E36200B05D2FCAC7C0DFFAFFD2F4FCB3
        ECFC6DB7CD41829D618FA1ACB9BEFAF3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDAD9CC6A496DD
        D6D0CD9C77E3873AFF9720E86400BF692DAAB9B079CBE0337CA3333539A28679
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F4F2FFFFFFFFFFFFEDE6E3D49878
        E38432FA8E14FC71008E480C393D4A613026BC623EFFDACDFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3ECEACC8F6BDA782CF78A
        1BE76900BF3A00C26133EBD5C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FAFEE7C7B6E0986EDC8C51E79E5FFD
        E3CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton
      Left = 401
      Top = 9
      Width = 70
      Height = 36
      Caption = #36864#20986
      Flat = True
      Glyph.Data = {
        12090000424D120900000000000036000000280000001C0000001B0000000100
        180000000000DC080000C30E0000C30E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FFFFE7F5EFFAFBF8FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF1FFFFE1F3ECF9FAF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF2FCFBEDF9F7E7FCFBF0F8F6A7FEFD8AD4
        BEE9ECE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFCF9FBFA
        EDFDFB92D6C162B69447D6C376CCB592EFE7D2E9DEEDE0D0FCFAF8FCFFFFFEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFEAE9E8B9A9A39CC6BAAAF4E699B8956EA47BB0B898
        CDDBCCC1ECE37ACBB2B9C0A1C0F5F0BCFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5DBCC64
        6054270D0044987B65E6DF5C6B602DBCA832A0A0A1B7B2CCE1D04DE9DF97D7C6
        41F6F37CFFFFF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFCFBF9F5F4EEFBF9F1E1D7C9686248204A4939463997A98E8C928953
        272868C4B52E4E41AEA2A2BFC6A77EA379CBDFD1E4FDFDF9FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE7D4E5D9BDCEBD
        9E615D473C6C6769B8BC4B4A3E628B6880B287A8392A848E887A6A5FC6C8C9B3
        F8EB91EFE4ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEBEBEAACA697A1977FB0A590726B57345F5B85D7D66AB0AE4247
        3D6B8C7596C0AB881613513C348A9D92C4B6B4C9C1C3D0C4C5C3C0C0BFBFBFBB
        BBBBEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0CE4C4A47
        6363654C4D502746407FD0CF84CFC86DA6A93552452FA96247E994725329693A
        3C9185887C70705F6060626262626262626262595959D7D7D7FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFAFAFCFBF9FBA9A7A825494A8DDDD8
        619995374C530F2C45217B5A2DED1E2CCD0E5D0600BF727CF9F8F8F6F7F7F6F6
        F6F6F6F6F6F6F6F5F5F5FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFB8B6B62647458BDCD751807D0B0B0E0124463D7FA6
        63CD6D2FCB2A353A13AE9198FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2
        AEB026484684D1CD75BBB66483931D623F00D21532F4858DAA9D7D7C4AC3C8BA
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2AFB026484682CECA7FCAC472
        ADC13D604061C2009BFF4587C7B3938F6DE5D0B2FEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFB2AFB026484683CFCB7CC4BE589CAF4C5D3DDDC100FFFF0769
        F49575AD88B9995AEAE7DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2AFB02648
        4683CFCB7CC4BE5B9DB04A5D3DCBC100FFFF00B4FD4742B3B97F849DF0E1D8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2AFB026484683CFCB7CC4BE5C9DB0495D
        3DC9C100FFFF00D3FF3C138EAB7D8FD9FFF7F8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB2AFB026484683CFCB7CC4BE5C9DB0495E3EC9C100FFFF00EEFF2E84BA
        8CB7C8DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2AFB026484683CFCB
        7CC5BF5C99AB494A2FC9B800FFFF00FFFF059698239B9EA3F9FAFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFB2AFB027464580CCCF75B9BC56A9C441A68AC5E41A
        FFFF00FFFF00838100868485F7F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1
        AFB227595598ECD49FD4BF7CF7E195FF84FFFF0BFFFF08FFFF0B9595008E8E8A
        F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABA6AE00251C56954183721367
        742D62661D837F007D7B008E8A01353300808180FCFCFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFDAD9D97875747F7F7B827F7C817C7B807B7D7E7D7F7D7D807F
        7E80727278C5C4C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF5F3
        F3F3F1F4F1F2F6F2F2F5F3F3F5F2F2F6F2F2F6F1F1F6F3F3F5FBFBFBFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = SpeedButton5Click
    end
  end
end
