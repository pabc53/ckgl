unit USPRKXX_Adv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, dbclient, UntRemSql, untfunctions, Buttons,
  TntStdCtrls, Spin, Grids, AdvObj, BaseGrid, AdvGrid, uUserMaint;

const
    //�������������ڱ���Cells������
  cColQty1 = 10;

    //�����������飬����Cells�ĸ������ԣ��������Ժ������£�
    {0-��ʾ
    1-�༭
    2-����
    3-����
    4-����
    5-��ɫ
    6-���
    7-����
    8-�Ƿ�����ݿ��ж�ȡ
    9-���ݱ�����
    10-�ֶ���
    11-�ֶγ���
    12-�ı��ж�ȡ
    13-�ı���λ��    }
  cColProp1: array[0..cColQty1 - 1] of array[0..13] of string = (   //������
   //��ʾ �༭ ���� ���� ����     ��ɫ       ���    ����
    // 0   1    2    3    4       5         6      7     8  9  10 11
    ('Y', 'N', 'N', 'E', 'L', 'clBtnFace', '21', '', 'N', '', '', '0', 'N', '0'),    // 0
    ('Y', 'N', 'N', 'E', 'L', 'clInfoBk', '110', '�����', 'Y', 'POJBSUB', 'PART_NO', '30', 'Y', '2'),         // 1
    ('Y', 'N', 'N', 'C', 'L', 'clWindow', '90', '��Ʒ����', 'Y', 'POJBSUB', 'ORDER_QUANTITY', '9', 'Y', '3'),    // 2
    ('Y', 'N', 'N', 'C', 'L', 'clWindow', '66', '�������', 'Y', 'POJBSUB', 'DELIVERY_TO_DEPT', '3', 'Y', '5'),    // 3
    ('Y', 'Y', 'N', 'C', 'L', 'clMoneyGr', '70', '��Ʒ��Դ', 'Y', 'POJBSUB', 'UNIT_OF_MEASURE', '2', 'Y', '4'),    // 4
    ('Y', 'Y', 'N', 'E', 'L', 'clWindow', '60', '��Ʒ����', 'Y', 'POJBSUB', 'GROUP_A', '3', 'Y', '7'),    // 5
    ('Y', 'Y', 'N', 'E', 'L', 'clSkyBlue', '60', '��Ʒ����', 'Y', 'POJBSUB', 'PART_NAME_C', '70', 'Y', '8'),      // 6
    ('Y', 'Y', 'N', 'E', 'L', 'clWindow', '70', '��Ʒ����', 'Y', 'POJBSUB', 'VENDOR_NO', '5', 'Y', '6'),          // 7
    ('Y', 'Y', 'N', 'M', 'L', 'clBtnFace', '125', '��ע', 'N', '', '', '0', 'N', '0'),                    // 8
    ('N', 'N', 'N', 'E', 'L', 'clWindow', '70', '��Ʒ���', 'Y', 'POJBSUB', 'VENDOR_NO', '5', 'Y', '6')   // 9
    );
    //���������������кţ������޸�������
  cC1NO = 0;
  cC1PART_NO = 1;
  cC1ORDER_QUANTITY = 2;
  cC1UNIT_OF_MEASURE = 3;
  cC1DELIVERY_TO_DEPT = 4;
  cC1GROUP_A = 5;
  cC1PART_NAME_C = 6;
  cC1Data_Flag = 7;

type
  TSPRKXX_Adv = class(TForm)
    GroupBox3: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Edit2: TEdit;
    ComboBox2: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Edit7: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit3: TComboBox;
    Label12: TLabel;
    ComboBox4: TComboBox;
    EditJJ: TEdit;
    Label8: TLabel;
    Label6: TLabel;
    EdHDH: TEdit;
    AdvStringGrid1: TAdvStringGrid;
    ComboBox3: TComboBox;
    procedure AdvStringGrid1Click(Sender: TObject);
    procedure AdvStringGrid1ComboChange(Sender: TObject; ACol, ARow, AItemIndex:
      Integer; ASelection: string);
    procedure AdvStringGrid1GetEditorType(Sender: TObject; ACol, ARow: Integer; var
      AEditor: TEditorType);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox3DropDown(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit7Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function pCUST(SCUST: string): Integer;              //ͨ�����Ʋ�ID
    function pCUSTID(SCUSTID: Integer): string;          //ͨ��ID������

  private
    procedure ARIIX_Edit5;
    procedure prStgInitialize1;
    procedure prStg1Clear;
    procedure prClear(pMode: byte);
    procedure AdvBh;                  //AdvStringGrid1�ĵ�һ��д����
    procedure StringGridClear;
    procedure AddShiYong(SPNOMB: String);      //��Ʒʹ��Ƶ�ʼ�1

    { Private declarations }
  public
    procedure GetAll;     //�������
    procedure posting;    //�ύ����
    Function CanSave: Boolean;  //�ж��Ƿ񱣴�
    function bh: String;     //�Զ����
    function DataTemp: Boolean;
    Procedure tr;            //ȥ�����ַ�
    procedure InsertCust;    //�ͻ����в����¼
    procedure WiterCust;     //�ͻ�д��Combobox


    { Public declarations }
  end;

var
  SPRKXX_Adv: TSPRKXX_Adv;
  QueryRKX, QueryCX: TClientDataSet;
  kuan, ComWrite: Boolean;
  cRow, cCol: Integer;      //�����к�

implementation

uses zMAIN, USPRKXX_Z;

{$R *.dfm}

procedure TSPRKXX_Adv.FormDestroy(Sender: TObject);
begin
end;

//{$O-}
//{$OPTIMIZATION OFF}

function TSPRKXX_Adv.pCUSTID(SCUSTID: Integer): string;
var
  cstr: string;
begin
  if scustid <> 0 then
  begin
    cstr := 'Select * From cust';
    cstr := cstr + ' Where CUST_ID=' + IntToStr(scustID);
    QueryCX.Data := MyObj.OpenSQL(cstr);  //�����ݱ�
    Result := QueryCX.FieldByName('CUST_NAME').Value;    //����id
  end else
    Result := '';
end;

//AdvStringGrid��ʼ������
procedure TSPRKXX_Adv.prStgInitialize1;
Var
  I: Integer;
begin

    //�趨��ʼ����������
  AdvStringGrid1.RowCount := 2;
  AdvStringGrid1.ColCount := cColQty1;
  AdvStringGrid1.FixedRows := 1;
  AdvStringGrid1.FixedCols := 1;

    //�趨�п�Ⱥ��б���
  for I := 0 to cColQty1 - 1 do begin
    AdvStringGrid1.Cells[I, 0] := cColProp1[I, 7];                 //����
    if cColProp1[I, 0] = 'Y' then
      AdvStringGrid1.ColWidths[I] := strToInt(cColProp1[I, 6])  //�п�
    else
      AdvStringGrid1.ColWidths[I] := 0;                        //�п�
  end;
  AdvStringGrid1.Cells[0, 1] := '1';
end;

//������մ���
procedure TSPRKXX_Adv.prClear(pMode: byte);
begin
  case pMode of
    0: begin
      prStgInitialize1;
    end;
    1: begin
      prStg1Clear;
    end;
  end;
//�����������
end;

//AdvStringGrid��չ���
procedure TSPRKXX_Adv.prStg1Clear;
Var
  I: integer;
  J: integer;
begin
  for I := 1 to AdvStringGrid1.RowCount - 1 do begin
    for J := 0 to cColQty1 - 1 do begin
      AdvStringGrid1.Cells[J, I] := '';
//      StringGrid1.SetCheckBoxState(J, I, false);
    end;
  end;
end;

procedure TSPRKXX_Adv.tr;
var
  i: integer;
begin
  for i := ComponentCount - 1 downto 0 do
    if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := trim(TEdit(Components[i]).Text);
end;

procedure TSPRKXX_Adv.ARIIX_Edit5;
begin
  if ComboBox1.Text = 'ARIIX' then
  begin
    EditJJ.left := 356;
    EditJJ.Width := 139;
    Label8.Caption := '��Ʒ���ۣ���';
  end else
  begin
    EditJJ.left := 338;
    EditJJ.Width := 158;
    Label8.Caption := '��Ʒ���ۣ�';
  end;
end;

procedure TSPRKXX_Adv.GetAll;     //�����������
begin
//  ComboBox1.Text := USPRKXX_Z.QueryRK.FieldByName('��Ӧ������').AsString;    //
//  EdHDH.Text := USPRKXX_Z.QueryRK.FieldByName('������').AsString;
//  EdQX.Text := USPRKXX_Z.QueryRK.FieldByName('��Ʒ����').AsString;
//  Edit1.Text := USPRKXX_Z.QueryRK.FieldByName('��Ӧ�̱��').AsString;
//  Edit2.Text := USPRKXX_Z.QueryRK.FieldByName('�����').AsString;         //�����
//  ComboBox2.Text := USPRKXX_Z.QueryRK.FieldByName('��Ʒ����').AsString;    //��ƷID
//  ComboBox3.Text := USPRKXX_Z.QueryRK.FieldByName('��Դ').AsString;    //
//  Edit3.Text := USPRKXX_Z.QueryRK.FieldByName('�������').AsString;         //�������
//  SpinEdit.Value := USPRKXX_Z.QueryRK.FieldByName('�������').AsInteger;          //�������
//  DateTimePicker1.Date := USPRKXX_Z.QueryRK.FieldByName('�������').AsDateTime;  //RK_DATE
//  Edit7.Text := USPRKXX_Z.QueryRK.FieldByName('������').AsString;    //RK_JSR
//  Memo1.Text := USPRKXX_Z.QueryRK.FieldByName('��ע').AsString;    //��ע
end;

function TSPRKXX_Adv.pCUST(SCUST: string): Integer;
var
  cstr: string;
begin
  cstr := 'Select * From cust';
  cstr := cstr + ' Where CUST_NAME=''' + scust + '''';
  QueryCX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
  Result := QueryCX.FieldByName('CUST_ID').Value;    //����id
end;

procedure TSPRKXX_Adv.Posting;        //�ύ����
var
  Qstr, CxTj: String;
  qtys, i: Integer;
begin
  if ActionCD = 'N' then
  begin
    try
      MyObj.StarTrans;         //����ʼ
      for i := 1 to AdvStringGrid1.RowCount - 1 do
      begin                        //��˾���   ��Ʒ���   ����  ����  �������  ����  ����   ������  ��ע    �����  ��Դ  ����
        with AdvStringGrid1 do
        begin
          if Cells[2, i] <> '' then
          begin
            qtys := pCUST(Cells[4, i]);
            Qstr := 'INSERT INTO SPRKXX(RK_GYS_NOMB,RK_SP_NOMB,RK_DH,RK_QX,RK_TYPE,RK_QTY,RK_DATE,RK_JSR,RK_MEMO,RK_NOMB,RK_FROMID,RK_JINJA)';
            Qstr := Qstr + ' Values(''' + Edit1.Text + ''',''' + Cells[9, i] + ''',''' + Trim(EdHDH.Text) + ''',''' + Cells[7, i]
              + ''',''' + Cells[3, i] + ''',' + Cells[6, i]
              + ',''' + FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + ''',''' + Trim(Edit7.Text) + ''',''' + Cells[8, i] + ''',''' + Cells[1, i] + ''',';
            Qstr := Qstr + IntToStr(qtys) + ',''' + Cells[5, i] + ''')';
            MyObj.ExecSQL(Qstr);
            CxTj := '(KCSP_SP_NOMB=''' + Cells[9, i] + ''') and (KCSP_QX=''' + Cells[7, i] + ''')';
            Qstr := 'Select * from KCB where ' + CxTj;
            QueryRKX.Data := MyObj.OpenSQL(Qstr);   //����Ʒ���ݱ�
            if QueryRKX.RecordCount = 1 then    //����Ʒ�ڿ����д��ڣ������������
            begin
              qtys := QueryRKX.fieldbyname('KCSP_QTY').AsInteger + StrToInt(Cells[6, i]);
              MyObj.ExecSQL('Update kcb set KCSP_QTY=' + IntToStr(qtys) + ' Where ' + CxTj);
            end
            else
            begin                      //����Ʒ�ڿ����в����ڣ������ݲ��������
              Qstr := 'INSERT INTO KCB(KCSP_SP_NOMB,KCSP_QTY,KCSP_GYSID,KCSP_QX)';
              Qstr := Qstr + ' Values(''' + Cells[9, i] + ''',' + Cells[6, i] + ',''' + ComboBox1.Text + ''',''' + Cells[7, i] + ''')';
              MyObj.ExecSQL(Qstr);
            end;
          end;
//        AddShiYong(Cells[9, i]);      //��Ʒʹ��Ƶ�ʼ�1
        end;
      end;
      MyObj.ComTrans;         //�������
    except
      MyObj.RollTrans;        //����ع�
      Application.MessageBox(PChar(AdvStringGrid1.Cells[2, i] + ' ���ִ���'), '��ʾ��', 64);
      Exit;
    end;
  end;
end;

procedure TSPRKXX_Adv.AddShiYong(SPNOMB: String);      //��Ʒʹ��Ƶ�ʼ�1
var
  cstr: string;
begin
  cstr := 'Select * from SPJBXX where SP_NOMB=''' + SPNOMB + '''';
  QueryRKX.Data := MyObj.OpenSQL(cstr);   //����Ʒ���ݱ�

end;

function TSPRKXX_Adv.CanSave: Boolean;//�ж��Ƿ񱣴�
begin
//  showmessage('�ж��Ƿ񱣴� ');
  Result := True;
  if (AdvStringGrid1.Cells[6, cRow] = '0') and (cCol > 6) then
  begin
    Result := False;
    Application.MessageBox('��Ʒ��������', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
//  if ComboBox1.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('��Ӧ�����Ʋ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
//  if StringGrid1.Cells[6, cRow] = '' then
//  begin
//    Result := False;
//    Application.MessageBox('��Ӧ�̱�Ų���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
  if (AdvStringGrid1.Cells[1, cRow] = '') and (cCol > 1) then
  begin
    Result := False;
    Application.MessageBox('����Ų���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if (AdvStringGrid1.Cells[2, cRow] = '') and (cCol > 2) then
  begin
    Result := False;
    Application.MessageBox('��Ʒ���Ʋ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if (AdvStringGrid1.Cells[3, cRow] = '') and (cCol > 3) then
  begin
    Result := False;
    Application.MessageBox('������Ͳ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
end;

procedure TSPRKXX_Adv.AdvBh;
var
  sst, sst2: String;
begin
  sst := AdvStringGrid1.Cells[1, cRow];
  sst2 := Copy(sst, 13, 2);
  sst2 := IntToStr(StrToInt(sst2) + 1);
  AdvStringGrid1.Cells[1, cRow + 1] := Copy(sst, 1, 12) + sst2;    //�ϳ������
  AdvStringGrid1.Cells[6, cRow + 1] := '1';                        //Ĭ������
end;

procedure TSPRKXX_Adv.AdvStringGrid1Click(Sender: TObject);
begin
  cRow := AdvStringGrid1.Row;
  cCol := AdvStringGrid1.Col;
  if (cRow >= AdvStringGrid1.RowCount - 1) and CanSave and (cCol > 7) then
  begin
//    lenn := Length(StringGrid1.Cells[7, cRow]);
//    if (lenn <> 7) and (lenn <> 4) then
//    begin
//      Application.MessageBox('��Ч�ڲ���ȷ�����������룡', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//      Exit;
//    end;
    with AdvStringGrid1 do
    begin
      RowCount := RowCount + 1;        //���һ��
      Cells[0, RowCount] := IntToStr(RowCount);    //д���
      AdvBh;               //д���±��
      Cells[3, cRow + 1] := Cells[3, cRow];    //����һ����ͬ
      Cells[4, cRow + 1] := Cells[4, cRow];    //����һ����ͬ
      Cells[6, cRow + 1] := Cells[6, cRow];    //����һ����ͬ
      Cells[8, cRow + 1] := Cells[8, cRow];    //����һ����ͬ
    end;
  end;

end;

procedure TSPRKXX_Adv.AdvStringGrid1ComboChange(Sender: TObject; ACol, ARow,
  AItemIndex: Integer; ASelection: string);
var
  qstr: string;
begin
  AdvStringGrid1.Cells[ACol, ARow] := ASelection;
  case ACol of
    2:
    begin
      ComboBox4.ItemIndex := AItemIndex;        //��ȡѡ����Ʒ�ı��
      AdvStringGrid1.Cells[9, ARow] := ComboBox4.Text;
      qstr := 'Select * from SPJBXX where SP_NAME=' + '''' + ASelection + '''';
      QueryRKX.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
      if QueryRKX.FieldByName('SP_JINJA').Value <> null then
        AdvStringGrid1.Cells[5, ARow] := QueryRKX.FieldByName('SP_JINJA').Value else    //��д����
        AdvStringGrid1.Cells[5, ARow] := '';
      if ARow = 1 then                      //��һ���Զ���д
      begin
        AdvStringGrid1.Cells[4, ARow] := '��˾';
        AdvStringGrid1.Cells[3, ARow] := '����';
      end;
    end;
    3:
    begin
      WiterCust;
      if ASelection = '����' then
      begin
        AdvStringGrid1.Cells[4, ARow] := '��˾';
        AdvStringGrid1.Cells[3, ARow] := '����';
      end else           //��д�����Ĭ����Դ
        AdvStringGrid1.Cells[4, ARow] := '';
    end;
    4:
    begin
    end;
  end;
end;

procedure TSPRKXX_Adv.AdvStringGrid1GetEditorType(Sender: TObject; ACol, ARow:
  Integer; var AEditor: TEditorType);
begin
  case ACol of
    2: //��3����Ʒ��
    begin
      AEditor := edComboList;  //���õ�Ԫ���������Ϊ �����б�
      AdvStringGrid1.Combobox.Items := ComboBox2.Items; //��̬���������б�����
    end;
    3: // ����
    begin
      AEditor := edComboList;  //���õ�Ԫ���������Ϊ �����б�
      AdvStringGrid1.Combobox.Items := Edit3.Items; //��̬���������б�����
    end;
    4:    //��Դ
    begin
      AEditor := edComboEdit;  //���õ�Ԫ���������Ϊ �����б�ɱ༭
      AdvStringGrid1.Combobox.Items := ComboBox3.Items; //��̬���������б�����
    end;
  end;
end;

function TSPRKXX_Adv.bh: String;       //�Զ����
var
  s, m, qstr: string;
  i: integer;
begin
  qstr := 'Select RK_NOMB From SPRKXX ';
  if QueryRKX = nil then
    QueryRKX := TClientDataSet.Create(self);  //������Ϣ��
  QueryRKX.Data := MyObj.OpenSQL(qstr);
  s := 'RK' + FormatDateTime('yyyymmdd', Now());
  If QueryRKX.RecordCount = 0 then
    s := s + '001'
  else
  begin
    QueryRKX.Last;
    m := Trim(QueryRKX.FieldByName('RK_NOMB').Value);
    i := StrToInt(Trim(Copy(m, 11, 8)));
    if i < 9 then
      s := s + '00' + InttoStr(i + 1)
    else if i < 99 then
      s := s + '0' + InttoStr(i + 1)
    else
      s := s + InttoStr(i + 1);
  end;
  Result := s;
end;

procedure TSPRKXX_Adv.SpeedButton5Click(Sender: TObject);
begin
  ActionCD := '';
  StringGridClear;         //���StringGrid
  Close;
end;

procedure TSPRKXX_Adv.StringGridClear;
var
  i: Integer;
begin
  for i := 1 to 8 do
  begin
    AdvStringGrid1.Cells[i, 1] := '';
  end;
end;

procedure TSPRKXX_Adv.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#13, #46]) then         //�س�
    key := #0;
  if key = #13 then
    Edit1.SetFocus;
end;

procedure TSPRKXX_Adv.FormCreate(Sender: TObject);
begin        //
  if QueryRKX = nil then
    QueryRKX := TClientDataSet.Create(self);  //������Ϣ��
  QueryCX := TClientDataSet.Create(self);
  ComboBox3.ImeName := MyIme;
  kuan := False;
  ComWrite := False;
  prClear(0);
  cCol := 1;
  cRow := 1;
end;

procedure TSPRKXX_Adv.FormShow(Sender: TObject);
begin
  ComboBox1.Clear;
  GroupBox1.Enabled := False;
  GroupBox2.Enabled := False;
  if ActionCD = 'M' then
    GetAll
  else if ActionCD = 'N' then
  begin
    GroupBox1.Enabled := False;
    GroupBox2.Enabled := False;
  end;
  SpeedButton1Click(Sender);
end;

procedure TSPRKXX_Adv.SpeedButton1Click(Sender: TObject);
begin
  if not GroupBox1.Enabled then
    DateTimePicker1.Date := Now;
  GroupBox1.Enabled := True;            //�ؼ���ʼ��
  GroupBox2.Enabled := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  Edit2.Clear;
  EditJJ.Clear;
  Edit7.Text := 'pjj';
  ActionCD := 'N';
  if not SpeedButton1.Enabled then      //�жϡ���ӡ��Ƿ񼤻δ���������
  begin
  end else
  begin
    ComboBox1.Text := 'ARIIX';
    Edit1.Text := 'GS20150126001';
  end;
  ComboBox2DropDown(Sender);
  ComboBox3DropDown(Sender);
  SpeedButton1.Enabled := False;
  StringGridClear;
  AdvStringGrid1.Cells[1, 1] := bh;    //�ϳ������
  AdvStringGrid1.Cells[6, 1] := '1';                        //Ĭ������
  AdvStringGrid1.RowCount := 2;
end;

procedure TSPRKXX_Adv.SpeedButton3Click(Sender: TObject);
begin
  if not DataTemp then
  begin
    Application.MessageBox('¼�����ݲ�ȫ�����飡', '��ʾ��', 64);
//    Exit;
  end;
//  if (CanSave) then
  begin
    Posting; //  �ύ����
//    GroupBox1.Enabled := False;
//    GroupBox2.Enabled := False;
    TipInfo('����ɹ�!', []);
//    Application.MessageBox('����ɹ�!', '��ʾ!', 64);
    InsertCust;       //�¿ͻ��������
    SPRKXX_Z.ShowData;;
    SpeedButton1Click(Sender);
  end;
  AdvStringGrid1.Col := 1;
end;

procedure TSPRKXX_Adv.SpeedButton4Click(Sender: TObject);
begin
  SpeedButton1.Enabled := True;
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
  GroupBox1.Enabled := False;
  GroupBox2.Enabled := False;
  ActionCD := '';
  StringGridClear;
  AdvStringGrid1.Cells[1, 1] := bh;    //�ϳ������
  AdvStringGrid1.Cells[6, 1] := '1';                        //Ĭ������
  AdvStringGrid1.RowCount := 2;

//  GetAll;
end;

procedure TSPRKXX_Adv.ComboBox1Change(Sender: TObject);
Var
  qstr: String;
begin
  Edit1.Clear;                            //ͨ����Ӧ�����ƽ���Ӧ�̱����ʾ��EDIT1��
  qstr := 'Select DISTINCT GYS_NOMB from GYSXX where GYSNAME=''' + ComboBox1.Text + '''';
  QueryRKX.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  Edit1.Text := QueryRKX.FieldByName('GYS_NOMB').Value;
  ComboBox2DropDown(Sender);
  //ARIIX_Edit5;
end;

procedure TSPRKXX_Adv.ComboBox1DropDown(Sender: TObject);
var
  i: integer;
  qstr: String;
begin              //����Ӧ��������ʾ��ComboBox1��
  ComboBox1.Clear;
  qstr := 'select GYS_NOMB,GYSNAME from GYSXX';
  QueryRKX.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  if (QueryRKX.recordcount > 0) then
  begin
    QueryRKX.First;
    for i := 0 to QueryRKX.recordcount - 1 do
    begin
      combobox1.Items.add(QueryRKX.FieldByName('GYSNAME').asstring);
      QueryRKX.next;
    end;
  end;
end;

procedure TSPRKXX_Adv.ComboBox2Change(Sender: TObject);
var
  qstr: String;
begin         //ͨ����Ʒ���ƣ��ѹ�񡢵�λ����Ʒ������ʾ�����Ӧ�ı�ſ������
  ComboBox4.ItemIndex := Combobox2.ItemIndex;        //��ȡѡ����Ʒ�ı��
  AdvStringGrid1.Cells[9, cRow] := ComboBox4.Text;
  with Sender as TComboBox do
  begin
    hide;
    if itemindex >= 0 then         //���ComboBox��itemindex >= 0
      with AdvStringGrid1 do
      begin
        Cells[2, row] := Text;   //δ�������ֵ
      end;
  end;

  EditJJ.Clear;
  qstr := 'Select * from SPJBXX where SP_NAME=' + '''' + ComboBox2.Text + '''';
  QueryRKX.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  begin
    if QueryRKX.FieldByName('SP_JINJA').Value <> null then
      AdvStringGrid1.Cells[5, cRow] := QueryRKX.FieldByName('SP_JINJA').Value;
  end;
end;                               //   DM.QSPXX.FieldByName('SP_NOMB').Value;

procedure TSPRKXX_Adv.ComboBox2DropDown(Sender: TObject);
var
  i: Integer;
  qstr: String;
begin
  ComboBox2.Clear;
  combobox4.Clear;
  qstr := 'select SP_JNAME, SP_NOMB from SPJBXX where SP_GYSID=' + '''' + Edit1.Text + '''';
  qstr := qstr + ' Order By shiyong DESC';
  QueryRKX.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  if (QueryRKX.RecordCount > 0) then
    QueryRKX.first;
  for i := 0 to QueryRKX.recordcount - 1 do         //��Edit1.Text��ʾ�Ĺ�˾��Ʒд��
  begin
    combobox2.Items.add(QueryRKX.FieldByName('SP_JNAME').asstring);
    combobox4.Items.add(QueryRKX.FieldByName('SP_NOMB').asstring);
    QueryRKX.next;
  end;

end;

procedure TSPRKXX_Adv.ComboBox3Change(Sender: TObject);
begin
  ComboBox3.hide;
  if ComboBox3.Text <> '' then
    with AdvStringGrid1 do
      Cells[4, row] := ComboBox3.Text else   //�˳�Combobox
    Application.MessageBox('��Ʒ��Դ����Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
end;

procedure TSPRKXX_Adv.ComboBox3DropDown(Sender: TObject);
begin
  WiterCust;
end;

function TSPRKXX_Adv.DataTemp: Boolean;
begin
  Result := False;
  with AdvStringGrid1 do
  begin
    if (Cells[2, cRow] <> '') and (Cells[3, cRow] <> '') and (Cells[4, cRow] <> '') and (Cells[6, cRow] <> '') then
      Result := True;
  end;
end;

procedure TSPRKXX_Adv.Edit3Change(Sender: TObject);
begin
  with Sender as TComboBox do
  begin
    hide;
    if itemindex >= 0 then         //���ComboBox��itemindex >= 0
      with AdvStringGrid1 do
      begin
        Cells[3, row] := Text;   //δ�������ֵ
        if (AdvStringGrid1.Cells[3, Row] = '����') then
          AdvStringGrid1.Cells[4, Row] := '��˾';
      end;
  end;
  WiterCust;
end;

procedure TSPRKXX_Adv.WiterCust;     //�ͻ�д��Combobox ,�ͻ�Ҫ�����ǻ����
var
  i: Integer;
  cStr, sComb3, qstr: string;
begin
  sComb3 := ComboBox3.Text;            //���浱ǰֵ
  ComboBox3.Clear;
  qstr := 'select SP_NAME from SPJBXX where SP_GYSID=' + '''' + Edit1.Text + '''';
  if Edit3.Text = '����' then               //��Ϊ�����롱�����spcrxx�й��˳������
  begin
    cStr := 'CK_GOTOID';
    qstr := 'Select DISTINCT CK_GOTOID From SPCKXX ';
    qstr := qstr + 'Where CK_GYS_NOMB=''' + Edit1.Text + ''' and (CK_TYPE=''���'')';    //
    qstr := qstr + ' Group By CK_GOTOID';
    qstr := qstr + ' ORDER BY CK_DATE  DESC';      //�����������������ǰ
  end else
  begin
    cStr := 'CUST_NAME';
    qstr := 'select * from CUST';
    qstr := qstr + ' Order By pinglu DESC';
  end;
  QueryRKX.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  if QueryRKX.Recordcount > 0 then      //���м�¼����д��ComboBox3
  begin
    for i := 0 to QueryRKX.Recordcount - 1 do
    begin
      if Edit3.Text = '����' then
        ComboBox3.Items.Add(pCUSTID(QueryRKX.FieldByName(cStr).AsInteger)) else
        ComboBox3.Items.Add(QueryRKX.FieldByName(cStr).AsString);
      QueryRKX.next;
    end;
  end;
  ComboBox3.Text := sComb3;           //��ԭ��ǰֵ
end;

procedure TSPRKXX_Adv.Edit7Change(Sender: TObject);
begin
  Edit7.Text := Trim(Edit7.Text);
end;

procedure TSPRKXX_Adv.Edit7Enter(Sender: TObject);
begin
  Edit7.ImeName := MyIme;
end;

procedure TSPRKXX_Adv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SpeedButton4Click(Sender);
end;

procedure TSPRKXX_Adv.InsertCust;      //�����ڵĿͻ��������
var
  qstr: String;
begin
  if Trim(AdvStringGrid1.Cells[4, cRow]) <> '' then
    qstr := 'Select DISTINCT CUST_NAME from CUST';                //��ѯ�ͻ������Ƿ����
  qstr := qstr + ' Where CUST_NAME=''' + AdvStringGrid1.Cells[4, cRow] + '''';   //��ѯ�ͻ��з����ComboBox3.Text
  QueryRKX.Data := MyObj.OpenSQL(qstr);                        //����Ʒ���ݱ�
  if (QueryRKX.Recordcount = 0) then                              //��������д�����
  begin
    qstr := 'INSERT INTO CUST(CUST_NAME)';
    qstr := qstr + 'Values(''' + Trim(AdvStringGrid1.Cells[4, cRow]) + ''')';
    MyObj.ExecSQL(qstr);
  end;
end;

end.
