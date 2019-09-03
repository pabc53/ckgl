unit USPCKXX_SG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, dbclient, UntRemSql, untfunctions,
  DBGrids, TntStdCtrls, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDCustomMaskEdit,
  LMDCustomExtSpinEdit, LMDExtSpinEdit, Spin, uUserMaint, AdvObj, BaseGrid,
  AdvGrid, DBGridEh, Mask, DBCtrlsEh, DBLookupEh, DB;

const
    //�������������ڱ���Cells������
  cColQty1 = 11;

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
  cColProp1: array[0..cColQty1 - 1] of array[0..10] of string = (   //������
   //��ʾ �༭ ���� ���� ����     ��ɫ     ���    ����
    // 0   1    2    3    4       5         6      7          8     9       10
    ('Y', 'N', 'N', 'E', 'L', 'clBtnFace', '20', '', 'N', '', '0'),    // 0
    ('Y', 'N', 'N', 'E', 'L', 'clInfoBk', '100', '������', 'Y', 'POJBSUB', '2'),    // 1
    ('Y', 'N', 'N', 'C', 'L', 'clWindow', '112', '��Ʒ����', 'Y', 'POJBSUB', '3'),    // 2
    ('Y', 'Y', 'N', 'E', 'L', 'clWindow', '60', '�������', 'Y', 'POJBSUB', '7'),    // 3
    ('Y', 'N', 'N', 'C', 'L', 'clWindow', '68', '��������', 'Y', 'POJBSUB', '5'),    // 4
    ('Y', 'N', 'N', 'C', 'L', 'clMoneyGr', '68', '��Ʒȥ��', 'Y', 'POJBSUB', '4'),    // 5
    ('Y', 'Y', 'N', 'E', 'L', 'clWindow', '60', '��Ʒ�ۼ�', 'Y', 'POJBSUB', '7'),    // 6
    ('Y', 'Y', 'N', 'E', 'L', 'clSkyBlue', '60', '��������', 'Y', 'POJBSUB', '6'),    // 7
    ('Y', 'Y', 'N', 'E', 'L', 'clWindow', '88', '��Ʒ����', 'Y', 'POJBSUB', '10'),   // 8
    ('Y', 'Y', 'N', 'M', 'L', 'clBtnFace', '115', '��ע', 'N', '', '0'),             //9
    ('N', 'N', 'N', 'E', 'L', 'clWindow', '20', '��Ʒ���', 'Y', 'POJBSUB', '6')     // 10
    );

type
  TSPCKXX_SG = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Edit4: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit6: TEdit;
    Memo1: TMemo;
    GroupBox3: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label12: TLabel;
    ComboBoxNAME: TComboBox;
    Label10: TLabel;
    CbbType: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    Label13: TLabel;
    EditDH: TEdit;
    ComboBoQX: TComboBox;
    CbbGoTo: TComboBox;
    Button1: TButton;
    AdvStringGrid1: TAdvStringGrid;
    procedure AdvStringGrid1Click(Sender: TObject);
    procedure AdvStringGrid1ComboChange(Sender: TObject; ACol, ARow, AItemIndex:
      Integer; ASelection: string);
    procedure AdvStringGrid1GetEditorType(Sender: TObject; ACol, ARow: Integer; var
      AEditor: TEditorType);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure CbbTypeChange(Sender: TObject);
    procedure ComboBoQXChange(Sender: TObject);
    procedure CbbGoToChange(Sender: TObject);
    procedure ComboBoxNAMEChange(Sender: TObject);
    procedure ComboBoxNAMEDropDown(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    function pCUST(SCUST: string): Integer;
    procedure AddCustPinglu(cid: String);

  private
    procedure ARIIX_Edit3;
    procedure prStg1Clear;
    procedure prStgInitialize1;
    procedure prClear(pMode: byte);
    procedure AdvBh;                   //�Զ���ȡ������

    { Private declarations }
  public
    procedure GetAll;   //�����������
    procedure posting;  //�ύ����
    Function CanSave: Boolean; //�ж��Ƿ񱣴�
    function ZQuyStr(STABL, sFIEL, Str: String): String;   //��������:���ֶΡ�ֵ
    function bh: string;   //�Զ����
    Procedure tr;   //ȥ�����ַ�
    procedure calculate;    //�������
    procedure QDelete(str, qixian: String);
    function comQTY: Integer;   //���ؿ����
    function DataTemp: Boolean;
    procedure InsertCust(user: string);       //����ͻ�
    procedure WiterCust;        //д��ͻ�
    procedure GetQX;    //ͨ����Ʒ���ƻ�ȡ�����иò�Ʒ������
    function KcbReCord(dRow: Integer): Integer;


    { Public declarations }
  end;

var
  SPCKXX_SG: TSPCKXX_SG;
  BtnTJ, BtnXG, kuan: BOOLEAN;
  QueryCKX, QuyKCB: TClientDataSet;
  OldCK: Integer;         //�ɳ����������޸ĳ�����Ϣʱ���ڱ����޸�ǰ�����ݣ�
  cRow, cCol: Integer;      //�����к�

implementation

uses zMAIN, ZAbstractDataset, USPCKXX_Z, zDM;

{$R *.dfm}

function TSPCKXX_SG.KcbReCord(dRow: Integer): Integer;
var                          //��ѯĳ��ĳ���޵�������û�з���-1
  cstr: String;
begin
  cstr := 'Select * From kcb Where (KCSP_SP_NOMB=''' + AdvStringGrid1.Cells[10, dRow] + ''') and (KCSP_QX=''' + AdvStringGrid1.Cells[8, dRow] + ''')';
  QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
  if QueryCKX.RecordCount > 0 then
    Result := QueryCKX.FieldByName('KCSP_QTY').AsInteger else
    Result := -1;
end;

procedure TSPCKXX_SG.AdvBh;
var
  sst, sst2: String;
begin
  sst := AdvStringGrid1.Cells[1, cRow];
  sst2 := Copy(sst, 13, 2);
  sst2 := IntToStr(StrToInt(sst2) + 1);
  AdvStringGrid1.Cells[1, cRow + 1] := Copy(sst, 1, 12) + sst2;    //�ϳ������
  AdvStringGrid1.Cells[7, cRow + 1] := '1';                        //Ĭ������
end;

procedure TSPCKXX_SG.AdvStringGrid1Click(Sender: TObject);
begin
  cRow := AdvStringGrid1.Row;
  cCol := AdvStringGrid1.Col;
     //�жϸü�¼��������Ƿ�����Ӧ��¼
//  if (AdvStringGrid1.Cells[8, cRow]='') and (cCol > 8) then
//  begin
//    Application.MessageBox('����д��Ч�ڣ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
////    x := MessageBox(0, 'δ¼��Ч���Ƿ������', 'ѯ��', MB_OKCANCEL);
//    Exit;
//  end;
  if (cRow >= AdvStringGrid1.RowCount - 1) and CanSave and (cCol > 8) then
  begin
    with AdvStringGrid1 do
    begin
      begin
        InsertCust(trim(Cells[4, cRow]));                   //��1�γ��ֵĿͻ������뵽cust����
        RowCount := RowCount + 1;        //���һ��
        Cells[0, cRow + 1] := IntToStr(cRow + 1);    //д���
        AdvBh;               //д���±��
        Cells[5, cRow + 1] := Cells[5, cRow];    //����һ����ͬ
        Cells[4, cRow + 1] := Cells[4, cRow];    //����һ����ͬ
        Cells[7, cRow + 1] := Cells[7, cRow];    //����һ����ͬ����
//        Cells[8, cRow + 1] := Cells[8, cRow];    //����һ����ͬ����
      end;
    end;
  end;
end;

procedure TSPCKXX_SG.AdvStringGrid1ComboChange(Sender: TObject; ACol, ARow,
  AItemIndex: Integer; ASelection: string);
var
  cstr: string;
begin
  cRow := ARow;
  cCol := ACol;
  AdvStringGrid1.Cells[ACol, ARow] := ASelection;       //ASelectionΪѡ��Ԫ�������
  case ACol of
    2:
    begin
      ComboBox5.ItemIndex := AItemIndex;        //��������Ż�ȡѡ����Ʒ�ı��
      with AdvStringGrid1 do                    //AdvStringGrid1.Cells[2, ARow]  ��Ʒ����
      begin
        Cells[10, ARow] := ComboBox5.Text;      //��Ʒ�ı��
        cstr := 'Select SP_JINJA ����,SP_XIAOSOJA ���ۼ� from GYSXX G,SPJBXX J ';
        cstr := cstr + ' where (GYSNAME=' + '''' + ComboBox1.Text + ''') and (SP_JNAME=' + '''' + ASelection + ''')';
        QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ��ȡ���ۡ����ۼ�
//        if QueryCKX.FieldByName('����').Value <> null then
//        if QueryCKX.FieldByName('���ۼ�').Value <> null then
        if QueryCKX.Fields[1].Value <> null then
          Cells[6, ARow] := QueryCKX.Fields[1].Value;
        GetQX;          //��ȡ����
        if Cells[2, ARow] <> '' then
          Cells[3, ARow] := IntToStr(comQTY) else  //���������д��
          Cells[3, ARow] := '';
        if ARow = 1 then                      //��һ���Զ���д
        begin
          Cells[5, ARow] := '����';           //Ĭ��ֵ
          Cells[4, ARow] := '����';
        end;
      end;
    end;
    4:
    begin
      CbbType.Text := ASelection;
      WiterCust;
      if ASelection = '����' then
      begin
        AdvStringGrid1.Cells[5, ARow] := '����';
        AdvStringGrid1.Cells[4, ARow] := '����';
      end else           //��д�����Ĭ����Դ
        AdvStringGrid1.Cells[5, ARow] := '';
    end;
    8:       //�����������
    begin
      AdvStringGrid1.Cells[3, ARow] := IntToStr(comQTY);  //���ؿ����
    end;
  end;
end;

procedure TSPCKXX_SG.AdvStringGrid1GetEditorType(Sender: TObject; ACol, ARow:
  Integer; var AEditor: TEditorType);
begin
  case ACol of
    2: //��3����Ʒ��
    begin
      AEditor := edComboList;  //���õ�Ԫ���������Ϊ �����б�
      AdvStringGrid1.Combobox.Items := ComboBoxNAME.Items; //��̬���������б�����
    end;
    4: // ����
    begin
      AEditor := edComboList;  //���õ�Ԫ���������Ϊ �����б�
      AdvStringGrid1.Combobox.Items := CbbType.Items; //��̬���������б�����
    end;
    5:    //ȥ��
    begin
      AEditor := edComboEdit;  //���õ�Ԫ���������Ϊ �����б�ɱ༭
      AdvStringGrid1.Combobox.Items := CbbGoTo.Items; //��̬���������б�����
    end;
    8:    //����
    begin
      AEditor := edComboList;  //���õ�Ԫ���������Ϊ �����б�
      AdvStringGrid1.Combobox.Items := ComboBoQX.Items; //��̬���������б�����
    end;
  end;
end;

//AdvStringGrid��ʼ������
procedure TSPCKXX_SG.prStgInitialize1;
Var
  I: Integer;
begin
    //�趨������ʼ����������
  AdvStringGrid1.RowCount := 2;
  AdvStringGrid1.ColCount := cColQty1;
  AdvStringGrid1.FixedRows := 1;
  AdvStringGrid1.FixedCols := 1;

    //�趨�п�Ⱥ��б���(ʹ�������е�����)
  for I := 0 to cColQty1 - 1 do begin
    AdvStringGrid1.Cells[I, 0] := cColProp1[I, 7];              //���⣺I�� ,0��
    if cColProp1[I, 0] = 'Y' then
      AdvStringGrid1.ColWidths[I] := strToInt(cColProp1[I, 6])  //�п�
    else
      AdvStringGrid1.ColWidths[I] := 0;                        //�п�
  end;
end;

//������մ���
procedure TSPCKXX_SG.prClear(pMode: byte);
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
procedure TSPCKXX_SG.prStg1Clear;
Var
  I: integer;
  J: integer;
begin
  for I := 1 to AdvStringGrid1.RowCount - 1 do begin
    for J := 0 to cColQty1 - 1 do begin
      AdvStringGrid1.Cells[J, I] := '';
    end;
  end;
  AdvStringGrid1.Cells[0, 1] := '1';       //��һ���к�
  AdvStringGrid1.Cells[1, 1] := bh;        //�ϳ������
  AdvStringGrid1.Cells[7, 1] := '1';       //Ĭ������
  AdvStringGrid1.RowCount := 2;
end;

procedure TSPCKXX_SG.InsertCust(user: string);   //�����1�γ��ֵĿͻ�
var
  cstr: String;
begin
  if CbbType.Text <> '' then
  begin
    cstr := 'Select DISTINCT CUST_NAME from CUST ';                //��ѯ�ͻ������Ƿ����
    cstr := cstr + ' Where CUST_NAME=''' + trim(user) + '''';   //��ѯ�ͻ��з����CbbType.Text
    QueryCKX.Data := MyObj.OpenSQL(cstr);                        //����Ʒ���ݱ�
    if (QueryCKX.Recordcount = 0) then                              //��������д�����
    begin
      cstr := 'INSERT INTO CUST(CUST_NAME)';
      cstr := cstr + 'Values(''' + user + ''')';
      MyObj.ExecSQL(cstr);
    end;
  end;
end;

procedure TSPCKXX_SG.QDelete(str, qixian: String);   //��Ʒ�š�����
begin              //ɾ����¼
  MyObj.ExecSQL('Delete From KCB Where (KCSP_SP_NOMB=''' + str + ''') and (KCSP_QX=''' + qixian + ''')');
end;

function TSPCKXX_SG.ZQuyStr(STABL, sFIEL, Str: String): String;
var
  cstr: String;
begin
  Result := '';
  cstr := 'select * from ' + STABL;                //��ѯ�ͻ������Ƿ����
  cstr := cstr + ' Where ' + sFIEL + '=''' + str + '''';
  QueryCKX.Data := MyObj.OpenSQL(cstr);                        //����Ʒ���ݱ�
  Result := QueryCKX.FieldByName(sFIEL).AsString;
end;

procedure TSPCKXX_SG.tr;
var
  i: integer;
begin
  for i := ComponentCount - 1 downto 0 do
    if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := trim(TEdit(Components[i]).Text);
end;

procedure TSPCKXX_SG.GetAll;//�����������
begin
//  Edit1.Text := QueryCK.FieldByName('������').AsString;
//  ComboBox1.Text := QueryCK.FieldByName('��Ӧ������').AsString;
//  ComboBoxNAME.Text := QueryCK.FieldByName('��Ʒ����').AsString;
//  CbbType.Text := QueryCK.FieldByName('��������').AsString;
//  CbbType.Text := QueryCK.FieldByName('ȥ��').AsString;
//  ComboBox5.Text := QueryCK.FieldByName('��Ʒ���').AsString;
//  ComboBoQX.Text := QueryCK.FieldByName('��Ʒ����').AsString;
//  Edit3.Text := QueryCK.FieldByName('����').AsString;
//  EditDH.Text := QueryCK.FieldByName('������').AsString;
//  Edit4.Text := QueryCK.FieldByName('���ۼ�').AsString;
//  Cells[7, cRow].Value := QueryCK.FieldByName('��������').AsInteger;
//  if Cells[7, cRow].Value = 0 then
//    Cells[7, cRow].Value := 1;              //Ĭ��ֵ
//  DateTimePicker1.Date := QueryCK.FieldByName('��������').AsDateTime;
//  Edit6.Text := QueryCK.FieldByName('������').AsString;
//  Cells[9, cRow] := QueryCK.FieldByName('��ע').AsString;
end;

procedure TSPCKXX_SG.Posting;          //�ύ����
var
  cstr: String;
  i: Integer;
begin
  with AdvStringGrid1 do
  begin
    if Cells[6, cRow] = '' then           //���ۼ�
      Cells[6, cRow] := '0';              //�ո�תΪ0
    if ActionCD = 'N' then
    begin
      cRow := i;
      calculate;        //����������������kuan
      if not kuan then  //��������û�д��󣬲�������
      begin
        Cstr := 'INSERT INTO SPCKXX(CK_GYS_NOMB, CK_SP_NOMB, CK_TYPE, CK_DJ, CK_QTY, CK_DATE, CK_JSR, CK_MEMO, CK_NOMB, CK_GOTOID, CK_DH,CK_QX)';
        Cstr := Cstr + ' Values(''' + ComboBox4.Text + ''',''' + Cells[10, cRow] + ''',''' + Cells[4, cRow] + ''',' + Cells[6, cRow]
          + ',' + Cells[7, cRow] + ',''' + FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + ''',''' + Trim(Edit6.Text) + ''',''' + Cells[9, cRow] + ''',''' + Cells[1, cRow] + ''',';
        Cstr := Cstr + '''' + IntToStr(pCUST(Cells[5, cRow])) + ''',''' + Trim(EditDH.Text) + ''',''' + Cells[8, cRow] + ''')';
        MyObj.ExecSQL(cstr);     //CK_GOTOID=' + IntToStr(pCUST(Cells[4, cRow]))
      end else Exit;
    end;
  end;
end;

function TSPCKXX_SG.CanSave: Boolean;  //�ж��Ƿ񱣴�
begin
  Result := True;
  if (AdvStringGrid1.Cells[3, cRow] = '') and (cCol > 3) then
  begin
    Result := False;
    Application.MessageBox('�������Ͳ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if (AdvStringGrid1.Cells[4, cRow] = '') and (cCol > 4) then
  begin
    Result := False;
    Application.MessageBox('��Ʒȥ����Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if (AdvStringGrid1.Cells[1, cRow] = '') and (cCol > 1) then
  begin
    Result := False;
    Application.MessageBox('�����Ų���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if (AdvStringGrid1.Cells[2, cRow] = '') and (cCol > 2) then
  begin
    Result := False;
    Application.MessageBox('��Ʒ���Ʋ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if (AdvStringGrid1.Cells[7, cRow] = '0') and (cCol > 7) then
  begin
    Result := False;
    Application.MessageBox('��Ʒ��������Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
end;

function TSPCKXX_SG.bh: String;       //�Զ����
var
  s, m, cstr: string;
  i: integer;
begin
  cstr := 'Select  CK_NOMB From SPCKXX  ';
  QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
  s := 'CK' + FormatDateTime('yyyymmdd', Now());
  If QueryCKX.FieldByName('CK_NOMB').Value = null then
    s := s + '001'
  else
  begin
    QueryCKX.Last;
    m := Trim(QueryCKX.FieldByName('CK_NOMB').Value);
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

procedure TSPCKXX_SG.SpeedButton5Click(Sender: TObject);
begin
  ActionCD := '';
  BtnTJ := False;        //���״̬
  BtnXG := False;        //�޸�״̬
  SpeedButton2.Enabled := True;
  prStg1Clear;
  Close;
end;

procedure TSPCKXX_SG.WiterCust;     //�����������ѡ����Ʒ��Դ�б�
var
  i: Integer;
  cStr, qstr: string;
begin
  CbbGoTo.clear;
  if CbbType.Text = '����' then            //��Ϊ�����������ʹ�SPRKXX�й��˳������롱��
  begin
    cStr := 'CUST_NAME';                            //Ҫ��ȡ���ֶ�
    qstr := 'Select DISTINCT CUST_NAME From SPRKXX, CUST ';
    qstr := qstr + ' Where (RK_GYS_NOMB=''' + ComboBox4.Text + ''') and (RK_TYPE=''����'') AND (CUST_ID=RK_FROMID)';    //ֻ���˳������롱�Ŀͻ�
    qstr := qstr + ' ORDER BY RK_DATE  DESC';    //�����������������ǰ
  end else
  begin                                           //�ǡ����������CUST���ж�ȡ�û�
    cStr := 'CUST_NAME';                          //Ҫ��ȡ���ֶ�
    qstr := 'select * from CUST';
    qstr := qstr + ' Order By pinglu DESC';
  end;
  QueryCKX.Data := MyObj.OpenSQL(qstr);    //�����ݱ�
  if QueryCKX.Recordcount > 0 then         //���м�¼����д��CbbGoTo
  begin
    CbbGoTo.Clear;
    for i := 0 to QueryCKX.Recordcount - 1 do
    begin
      CbbGoTo.Items.Add(QueryCKX.FieldByName(cStr).AsString);
      QueryCKX.next;
    end;
  end;
end;

procedure TSPCKXX_SG.FormCreate(Sender: TObject);
begin                    //��������ʱ
  kuan := False;
  BtnTJ := False;        //���״̬
  BtnXG := False;        //�޸�״̬
  prClear(0);
  cCol := 1;
  cRow := 1;
end;

procedure TSPCKXX_SG.FormShow(Sender: TObject);
begin
  QuyKCB := TClientDataSet.Create(self);    //�����Ϣ�� QueryCKX
  QueryCKX := TClientDataSet.Create(self);  //�����Ϣ��
  //�жϰ�ť�Ƿ�ѡ��״̬
  GroupBox1.Enabled := False;
  if ActionCD = 'M' then
    GetAll
  else if ActionCD = 'N' then
  begin
    GroupBox1.Enabled := False;
  end;
  ARIIX_Edit3;
  SpeedButton1Click(Sender);
  ComboBoxNAMEDropDown(Sender);
end;

procedure TSPCKXX_SG.SpeedButton1Click(Sender: TObject);
begin    //������Ӱ�ť���ؼ���ʼ��
  GroupBox1.Enabled := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  ComboBox1.Text := 'ARIIX';
  ComboBox4.Text := 'GS20150126001';
  Edit3.Clear;
  Edit4.Clear;
  Edit6.Text := 'pjj';    //Ĭ��ֵ
  DateTimePicker1.Date := now;
  Memo1.Clear;
  BtnTJ := True;        //���״̬
  BtnXG := False;        //�޸�״̬
  ActionCD := 'N';
  BtnTJ := True;         //���״̬
  prStg1Clear;
  EditDH.SetFocus;
  SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
end;

procedure TSPCKXX_SG.SpeedButton3Click(Sender: TObject);   //��������
var
  kQTY, nQTY, i: Integer;                 //kQTY���д�����nQTY��ǰ���������
  cstr: String;
begin
  InsertCust(trim(AdvStringGrid1.Cells[4, cRow]));                   //��1�γ��ֵĿͻ������뵽cust����
  if not DataTemp then       //�������ݼ��
  begin
    Application.MessageBox('¼�����ݲ�ȫ�����飡', '��ʾ��', 64);
    Exit;
  end;
  if (AdvStringGrid1.Cells[2, AdvStringGrid1.RowCount - 1] = '') then  //�ж���Ʒ����Ϊ��
  begin
    AdvStringGrid1.RowCount := AdvStringGrid1.RowCount - 1;   //����-1(һ��Ϊ���һ����Ʒ����Ϊ�գ�
  end;
  kuan := False;      //����������޴��־
  if BtnTJ then      //���״̬
  begin
    MyObj.StarTrans;       //����ʼ
    for i := 1 to AdvStringGrid1.RowCount - 1 do
    begin
      if not kuan then                   //�޴��������
      begin
        cRow := i;
        if (comQTY - StrToInt(AdvStringGrid1.Cells[7, cRow]) >= 0) then  //�жϿ����-�������Ƿ���ڵ���0
        begin
          if (cansave) then
          begin
            Posting;          //�ύ����
          end;
        end else
        begin
          MyObj.RollTrans;    //����ع�
          Application.MessageBox(PChar(AdvStringGrid1.Cells[2, cRow] + ' �����������ڿ��������'), '��ʾ��', 64);
          AdvStringGrid1.Cells[7, cRow] := '1';             //Ĭ������ֵ
          Exit;
        end;
      end else
      begin
        MyObj.RollTrans;    //����ع�
        Break;              //�д��ж�ѭ��
        Exit;
      end;
    end;
    if not kuan then        //����������޴���
    begin
      MyObj.ComTrans;       //�������
      cstr := 'Select CUST_ID from cust Where CUST_NAME=''' + AdvStringGrid1.Cells[4, 1] + '''';
      QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
      AddCustPinglu(QueryCKX.Fields[0].AsString);     //���û�ʹ��Ƶ�ʼ�һ
      GroupBox1.Enabled := False;
      Application.MessageBox('����ɹ�!', '��ʾ!', 64);
      SPCKXX_Z.FormShow(Sender);         //ˢ��
                 //���¸�ԭ
      GroupBox1.Enabled := True;
      SpeedButton3.Enabled := True;
      SpeedButton4.Enabled := True;
      Edit1.Clear;
      Edit3.Clear;
      Edit4.Clear;
      Edit6.Text := 'pjj';    //Ĭ��ֵ
      ActionCD := 'N';
      AdvStringGrid1.Cells[1, cRow] := bh;
      EditDH.SetFocus;
      SpeedButton1.Enabled := False;
      prStg1Clear;    //���StringGrid1,������Ϊ2
    end;
  end else
  if BtnXG then     //�޸�
  begin
    with AdvStringGrid1 do
    begin
      kQTY := comQTY;
      nQTY := kQTY + OldCK - StrToInt(Cells[7, cRow]);      //��������ֵ  �����+����ǰ������-�����������
      if nQTY < 0 then  //��������ֵС��0����ʾ���������ڿ����
      begin
        Application.MessageBox('�����������ܴ��ڿ��������', '��ʾ��', 64);
        Exit;
      end else
      if nQTY > 0 then  //
      begin
        if kQTY = 0 then        //����0���ڿ����в���һ����¼
        begin                      //����Ʒ�ڿ����в����ڣ������ݲ��������
          cstr := 'INSERT INTO KCB(KCSP_SP_NOMB,KCSP_QTY,KCSP_GYSID,KCSP_QX)';
          cstr := cstr + ' Values(''' + Cells[10, cRow] + ''',' + Cells[7, cRow] + ',''' + ComboBox1.Text + '''' + Cells[8, cRow] + ''')';
          MyObj.ExecSQL(cstr);
        end;
//      kNOMB := QueryCKX.FieldByName('KCSP_SP_NOMB').Value;  //���浱ǰ��¼����Ʒ���
        cstr := 'Update kcb set KCSP_QTY=' + IntToStr(nQTY);
        cstr := cstr + ' Where (KCSP_SP_NOMB=''' + Cells[10, cRow] + ''') and (KCSP_QX=''' + Cells[8, cRow] + ''')';   //��������š�����
        MyObj.ExecSQL(cstr);     //���¿����

        Cstr := 'Update SPCKXX set CK_GYS_NOMB=''' + ComboBox4.Text + ''',CK_SP_NOMB=''' + Cells[10, cRow] + ''',CK_TYPE=''' + Cells[3, cRow]
          + ''',CK_DJ=' + Cells[6, cRow] + ',CK_QTY=' + Cells[7, cRow] + ',CK_DATE=''' + FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date)
          + ''',CK_DH=''' + EditDH.Text + ''',CK_QX=''' + Cells[8, cRow]
          + ''',CK_JSR=''' + Edit6.Text + ''',CK_MEMO=''' + Cells[9, cRow] + ''', CK_GOTOID=' + IntToStr(pCUST(Cells[4, cRow]));
        cstr := cstr + ' Where CK_NOMB=''' + Cells[1, cRow] + '''';       //����������CK_NOMB= Edit1.Text
        MyObj.ExecSQL(cstr);      //���³����¼
        SPCKXX_Z.FormShow(Sender);         //ˢ��
      end else
      if nQTY = 0 then  //�жϳ������Ƿ����0
      begin
        Cstr := 'Update SPCKXX set CK_GYS_NOMB=''' + ComboBox4.Text + ''',CK_SP_NOMB=''' + Cells[10, cRow] + ''',CK_TYPE=''' + Cells[3, cRow]
          + ''',CK_DJ=' + Edit4.Text + ',CK_QTY=' + Cells[7, cRow] + ',CK_DATE=''' + FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date)
          + ''',CK_DH=''' + EditDH.Text + ''',CK_QX=''' + Cells[8, cRow]
          + ''',CK_JSR=''' + Edit6.Text + ''',CK_MEMO=''' + Cells[9, cRow] + ''', CK_GOTOID=' + IntToStr(pCUST(Cells[4, cRow]));
        cstr := cstr + ' Where CK_NOMB=''' + Cells[1, cRow] + '''';       //����������CK_NOMB= Edit1.Text
        MyObj.ExecSQL(cstr);     //���³����¼
        SPCKXX_Z.FormShow(Sender);         //ˢ��
        QDelete(ComboBox5.Text, Cells[8, cRow]);          //��������������0��ɾ������¼
      end;
      //TipInfo('����ɹ�!', []);
      Application.MessageBox('����ɹ�!', '��ʾ!', 64);
    end;
  end;
end;

procedure TSPCKXX_SG.AddCustPinglu(cid: String);
var
//  QuyCust : TClientDataSet;
  cstr: String;
begin
//    QuyCust := TClientDataSet.Create(self);  //�����û���Ϣ��
  cstr := 'update CUST set PINGLU=PINGLU+1 where CUST_ID=' + cid;
  MyObj.ExecSQL(cstr);   //�����ݱ�
//  QuyCust.Free;����������//�ͷ�
end;

procedure TSPCKXX_SG.ARIIX_Edit3;
begin
  if ComboBox1.Text = 'ARIIX' then
  begin
    Edit3.left := 336;
    Edit3.Width := 128;
    Label4.Caption := '��Ʒ���ۣ���';
  end else
  begin
    Edit3.left := 314;
    Edit3.Width := 150;
    Label4.Caption := '��Ʒ���ۣ�';
  end;
end;

procedure TSPCKXX_SG.Button1Click(Sender: TObject);
var
  cstr: String;
  i: integer;
begin                       //�˹���û��ʹ��
  cstr := 'Select * from cust ';
//  QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
  for i := 1 to QueryCKX.RecordCount do
  begin
    cstr := 'Update sprkxx set RK_FROMID=' + IntToStr(pCUST(QueryCKX.fieldbyname('CUST_NAME').AsString));
    cstr := cstr + ' Where (RK_FROM=''' + QueryCKX.fieldbyname('CUST_NAME').AsString + ''')';
        //and (KCSP_QX=''' + Cells[8, cRow] + ''')';   //��������š�����
//    MyObj.ExecSQL(cstr);     //���¿����
    QueryCKX.Next;
  end;
//  x := MessageBox(0, '��ȷ���˲�����', 'ѯ��', MB_OKCANCEL);
//     //�ж�ʱ������
//  if x = 1 then  //.��if x=idok then...
//    Button1.Caption := 'OK' else
//    Button1.Caption := 'NOT';
end;

function TSPCKXX_SG.pCUST(SCUST: string): Integer;
var
  cstr: string;
begin
  cstr := 'Select * From cust';
  cstr := cstr + ' Where CUST_NAME=''' + scust + '''';
  QuyKCB.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
  Result := QuyKCB.FieldByName('CUST_ID').Value;    //����id
end;

procedure TSPCKXX_SG.SpeedButton4Click(Sender: TObject);
begin
  SpeedButton1.Enabled := True;     //����ȡ�����ؼ���ť����״̬
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
  GroupBox1.Enabled := False;
  ActionCD := '';
  prStg1Clear;
end;

procedure TSPCKXX_SG.ComboBox1Change(Sender: TObject);
begin
  ComboBox4.ItemIndex := ComboBox1.ItemIndex;
  Edit3.Clear;
  Edit4.Clear;
  ARIIX_Edit3;
  ComboBoxNAMEDropDown(Sender);
end;

procedure TSPCKXX_SG.ComboBox1DropDown(Sender: TObject);
var              //����Ӧ������ʾ��ComboBox1��
  i: integer;
  cstr: string;
begin
  ComboBox1.Clear;
  ComboBox4.Clear;
  cstr := 'select DISTINCT GYSNAME, GYS_NOMB from SPRKXX S,GYSXX G';    //�������Ϣ�������Ӧ������
  cstr := cstr + ' Where RK_GYS_NOMB=GYS_NOMB';
  QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
  if (QueryCKX.recordcount > 0) then
  begin
    QueryCKX.first;
    for i := 0 to QueryCKX.recordcount - 1 do
    begin
      combobox1.Items.add(QueryCKX.FieldByName('GYSNAME').asstring);
      combobox4.Items.add(QueryCKX.FieldByName('GYS_NOMB').asstring);
      QueryCKX.next;
    end;
    ComboBoxNAME.Clear;
    ComboBox5.Clear;
    Edit3.Clear;
    Edit4.Clear;
  end;
end;

function TSPCKXX_SG.comQTY: Integer;
var
  cstr: String;
begin      //���ؿ����
  cstr := 'Select KCSP_QTY,KCSP_SP_NOMB from KCB where (KCSP_SP_NOMB=' + '''' + AdvStringGrid1.Cells[10, cRow] + ''') and (KCSP_QX=' + '''' + trim(AdvStringGrid1.Cells[8, cRow]) + ''')';

  QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
  if QueryCKX.RecordCount = 0 then
    Result := 0 else
    Result := QueryCKX.FieldByName('KCSP_QTY').Value;    //���ؿ����
end;

procedure TSPCKXX_SG.calculate;
var
  kQTY: Integer;
  kNOMB, cstr: String;
begin        //�жϳ����������������Ƿ���ȣ������ɾ����¼�������ȥ������   QuyKCB
  with AdvStringGrid1 do
  begin
    if KcbReCord(cRow) > 0 then
    begin
      if QueryCKX.FieldByName('KCSP_QTY').Value = Cells[7, cRow] then
      begin
        QDelete(Cells[10, cRow], Cells[8, cRow]);          //�����������������ɾ������¼
        ComboBoxNAMEDropDown(self);                      //����������
      end else
      begin
        kQTY := QueryCKX.FieldByName('KCSP_QTY').AsInteger - StrToInt(Cells[7, cRow]);       //�������������
        kNOMB := QueryCKX.FieldByName('KCSP_SP_NOMB').Value;  //���浱ǰ��¼����Ʒ���
        cstr := 'Update kcb set KCSP_QTY=' + IntToStr(kQTY);
        cstr := cstr + ' Where (KCSP_SP_NOMB=''' + kNOMB + ''') and (KCSP_QX=''' + Cells[8, cRow] + ''')';
        MyObj.ExecSQL(cstr);
      end;
    end else
    begin
      Application.MessageBox('δ�ҵ������Ϣ�����¼��¼�����ݣ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
      kuan := True;                         //�д���
//      Exit;
    end;
  end;
end;

procedure TSPCKXX_SG.CbbTypeChange(Sender: TObject);
begin
  with Sender as TComboBox do
  begin
    hide;
    if Text <> '' then
      with AdvStringGrid1 do
        Cells[3, row] := CbbType.Text else   //�˳�Combobox
      //TipInfo('�������Ͳ���Ϊ��!', []);
      Application.MessageBox('�������Ͳ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
  end;
  WiterCust;          //�����������ѡ����Ʒ��Դ�б�
  if CbbType.Text = '����' then
  begin
    AdvStringGrid1.Cells[4, crow] := '����';
  end;
end;

procedure TSPCKXX_SG.ComboBoQXChange(Sender: TObject);
begin
  with Sender as TComboBox do
  begin
    hide;
    if Text <> '' then
      with AdvStringGrid1 do
        Cells[8, row] := ComboBoQX.Text;   //�˳�Combobox
  end;
end;

procedure TSPCKXX_SG.CbbGoToChange(Sender: TObject);
begin                                           //��Ʒȥ��
  CbbGoTo.hide;
  if CbbGoTo.Text <> '' then
    with AdvStringGrid1 do
      Cells[4, crow] := CbbGoTo.Text else   //�˳�Combobox
    Application.MessageBox('��Ʒȥ����Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
end;

procedure TSPCKXX_SG.ComboBoxNAMEChange(Sender: TObject);
begin          //ͨ����Ӧ�����ƣ���Ʒ���ƽ����۵���Ϣ��ʾ�����Ӧ��EDIT��
  with Sender as TComboBox do
  begin
    hide;
    if Text <> '' then
      with AdvStringGrid1 do
        Cells[2, row] := ComboBoxName.Text else   //�˳�Combobox
      Application.MessageBox('��Ʒ���Ʋ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
  end;
end;

procedure TSPCKXX_SG.GetQX;    //ͨ����Ʒ���ƻ�ȡ�����иò�Ʒ������
var
  cstr: string;
  i: Integer;
begin
  with AdvStringGrid1 do
  begin
    cstr := 'Select * from kcb ';
    cstr := cstr + ' where (KCSP_SP_NOMB=' + '''' + Cells[10, cRow] + ''') Order By KCSP_QX';
    QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
    if QueryCKX.RecordCount <> 0 then
    begin
      ComboBoQX.Clear;
      for i := 1 to QueryCKX.RecordCount do
      begin
        ComboBoQX.Items.Add(QueryCKX.fieldbyname('KCSP_QX').AsString);
        QueryCKX.Next;
      end;
    end;
    QueryCKX.First;
    Cells[8, cRow] := QueryCKX.fieldbyname('KCSP_QX').AsString;   //�����������¼��ֱ�Ӹ�ֵ�������
  end;
end;

procedure TSPCKXX_SG.ComboBoxNAMEDropDown(Sender: TObject);
var
  i: Integer;
  cstr: string;
begin              //  ͨ����Ӧ�����ƣ����ù�Ӧ��������Ʒ���������ComboBoxNAME��
  ComboBoxNAME.Clear;
  ComboBox5.Clear;
  begin
    //�����а���Ʒ�����飬��������
    cstr := 'Select SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,Sum(KCSP_QTY) ����,SP_NOMB from KCB,SPJBXX,GYSXX ';
    cstr := cstr + 'Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB) and (SP_GYSID=''' + ComboBox4.Text + ''')';
    cstr := cstr + 'Group by SP_NAME Order By ���� DESC';

    QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
    with QueryCKX do
    begin
      if (recordcount > 0) then
        first;
      for i := 0 to recordcount - 1 do
      begin
        ComboBoxNAME.Items.add(FieldByName('��Ʒ���').asstring);
        ComboBox5.Items.add(FieldByName('SP_NOMB').asstring);      //��Ʒ���
        next;
      end;
    end;
    Edit3.Clear;
    Edit4.Clear;
  end;
end;

function TSPCKXX_SG.DataTemp: Boolean;
begin
  Result := False;
  with AdvStringGrid1 do
  begin
    if (Cells[2, cRow] <> '') and (Cells[3, cRow] <> '') and (Cells[4, cRow] <> '') and (Cells[7, cRow] <> '') then
      Result := True;
  end;
  // TODO -cMM: TSPCKXX_SG.DataTemp default body inserted
end;

procedure TSPCKXX_SG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SpeedButton4Click(Sender);
  QueryCKX.Free;
  QuyKCB.Free;
end;

procedure TSPCKXX_SG.SpeedButton2Click(Sender: TObject);
begin
  GroupBox1.Enabled := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  EditDH.SetFocus;
  SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
  OldCK := StrToInt(AdvStringGrid1.Cells[7, cRow]);        //�����޸�ǰ������
  BtnTJ := False;        //���״̬
  BtnXG := True;        //�޸�״̬
end;

end.
