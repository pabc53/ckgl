unit USPCKXX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, dbclient, UntRemSql, untfunctions,
  DBGrids, TntStdCtrls, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDCustomMaskEdit,
  LMDCustomExtSpinEdit, LMDExtSpinEdit, Spin, uUserMaint;

type
  TSPCKXX = class(TForm)
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
    ComboBox2: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox3: TTntComboBox;
    SpinEdit: TSpinEdit;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    Label13: TLabel;
    ComboBoQX: TTntComboBox;
    EditDH: TEdit;
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3DropDown(Sender: TObject);
    procedure ComboBox3Enter(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure DateTimePicker1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxNAMEChange(Sender: TObject);
    procedure ComboBoxNAMEDropDown(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit6Enter(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    function pCUST(SCUST: string): Integer;              //ͨ�����Ʋ�ID
    function pCUSTID(SCUSTID: Integer): string;          //ͨ��ID������

  private
    procedure ARIIX_Edit3;

    { Private declarations }
  public
    procedure GetAll;   //�����������
    procedure posting;  //�ύ����
    Function CanSave: Boolean; //�ж��Ƿ񱣴�
    function ZQuyStr(STABL, sFIEL, Str: String): String;   //��������:���ֶΡ�ֵ
    procedure bh;   //�Զ����
    Procedure tr;   //ȥ�����ַ�
    procedure calculate;    //�������
    procedure QDelete(str: String);
    function comQTY: Integer;   //���ؿ����
    procedure InsertCust;       //����ͻ�
    procedure WiterCust;        //д��ͻ�
    procedure GetQX;            //ͨ����Ʒ���ƻ�ȡ�����иò�Ʒ������


    { Public declarations }
  end;

var
  SPCKXX: TSPCKXX;
  BtnTJ, BtnXG, kuan: BOOLEAN;
  OldCK: Integer;         //�ɳ����������޸ĳ�����Ϣʱ���ڱ����޸�ǰ�����ݣ�
  QueryCKX, QuyKCB: TClientDataSet;
  oldQx: String;

implementation

uses zMAIN, ZAbstractDataset, USPCKXX_Z;

{$R *.dfm}

function TSPCKXX.pCUSTID(SCUSTID: Integer): string;
var
  cstr: string;
begin
  if scustid <> 0 then
  begin
    cstr := 'Select * From cust';
    cstr := cstr + ' Where CUST_ID=' + IntToStr(scustID);
    QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
    Result := QueryCKX.FieldByName('CUST_NAME').Value;    //����id
  end else
    Result := '';
end;

function TSPCKXX.pCUST(SCUST: string): Integer;
var
  cstr: string;
begin
  cstr := 'Select * From cust';
  cstr := cstr + ' Where CUST_NAME=''' + scust + '''';
  QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
  Result := QueryCKX.FieldByName('CUST_ID').Value;    //����id
end;

procedure TSPCKXX.InsertCust;      //�����1�γ��ֵĿͻ�
var
  cstr: String;
begin
  ComboBox3.Text := trim(ComboBox3.Text);
  if ComboBox3.Text <> '' then
  begin
    cstr := 'Select DISTINCT CUST_NAME from CUST ';                //��ѯ�ͻ������Ƿ����
    cstr := cstr + ' Where CUST_NAME=''' + trim(ComboBox3.Text) + '''';   //��ѯ�ͻ��з����ComboBox3.Text
    QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
    if (QueryCKX.Recordcount = 0) then                              //��������д�����
    begin
      cstr := 'INSERT INTO CUST(CUST_NAME)';
      cstr := cstr + 'Values(''' + ComboBox3.Text + ''')';
      MyObj.ExecSQL(cstr);
    end;
  end;
end;

procedure TSPCKXX.QDelete(str: String);
begin              //ɾ�������м�¼
  MyObj.ExecSQL('Delete From KCB Where ' + str);
//  Gob_Rmo.BathExec;
end;

function TSPCKXX.ZQuyStr(STABL, sFIEL, Str: String): String;
var
  cstr: String;
begin
  Result := '';
  cstr := 'select * from ' + STABL;                //��ѯ�ͻ������Ƿ����
  cstr := cstr + ' Where ' + sFIEL + '=''' + str + '''';
  QueryCKX.Data := MyObj.OpenSQL(cstr);                        //����Ʒ���ݱ�
  Result := QueryCKX.FieldByName(sFIEL).AsString;
end;

procedure TSPCKXX.tr;
var
  i: integer;
begin
  for i := ComponentCount - 1 downto 0 do
    if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := trim(TEdit(Components[i]).Text);
end;

procedure TSPCKXX.GetAll;//�����������
begin
  Edit1.Text := QueryCK.FieldByName('������').AsString;
  ComboBox1.Text := QueryCK.FieldByName('��Ӧ������').AsString;
  ComboBoxNAME.Text := QueryCK.FieldByName('��Ʒ����').AsString;
  ComboBox2.Text := QueryCK.FieldByName('��������').AsString;
  ComboBox3.Text := QueryCK.FieldByName('ȥ��').AsString;
  ComboBox4.Text := QueryCK.FieldByName('��Ӧ�̱��').AsString;
  ComboBox5.Text := QueryCK.FieldByName('��Ʒ���').AsString;
  ComboBoQX.Text := QueryCK.FieldByName('��Ʒ����').AsString;
  oldQx := QueryCK.FieldByName('��Ʒ����').AsString;         //����
  Edit3.Text := QueryCK.FieldByName('����').AsString;
  EditDH.Text := QueryCK.FieldByName('������').AsString;
  Edit4.Text := QueryCK.FieldByName('���ۼ�').AsString;
  SpinEdit.Value := QueryCK.FieldByName('��������').AsInteger;
  OldCK := StrToInt(SpinEdit.Text);        //�����޸�ǰ������
  if SpinEdit.Value = 0 then
    SpinEdit.Value := 1;              //Ĭ��ֵ
  DateTimePicker1.Date := QueryCK.FieldByName('��������').AsDateTime;
  Edit6.Text := QueryCK.FieldByName('������').AsString;
  Memo1.Text := QueryCK.FieldByName('��ע').AsString;
end;

procedure TSPCKXX.Posting;          //�ύ����
var
  cstr: String;
begin
  if Edit4.Text = '' then
    Edit4.Text := '0';              //�ո�תΪ0
  if ActionCD = 'N' then
  begin
    try
      calculate;        //��������
      Cstr := 'INSERT INTO SPCKXX(CK_GYS_NOMB,CK_SP_NOMB,CK_TYPE,CK_DJ,CK_QTY,CK_DATE,CK_JSR,CK_MEMO,CK_NOMB,CK_GOTOID,CK_DH,CK_QX)';
      Cstr := Cstr + ' Values(''' + ComboBox4.Text + ''',''' + ComboBox5.Text + ''',''' + ComboBox2.Text + ''',' + Edit4.Text
        + ',' + IntToStr(SpinEdit.Value) + ',''' + FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + ''',''' + Edit6.Text + ''',''' + Memo1.Text + ''',''' + Edit1.Text + ''',';
      Cstr := Cstr + IntToStr(pCUST(ComboBox3.Text)) + ',''' + EditDH.Text + ''',''' + ComboBoQX.Text + ''')';
      MyObj.ExecSQL(cstr);
    TipInfo('����ɹ�!', []);
  except
    TipInfo('����ʧ��!', []);
    end;
  end;
end;

function TSPCKXX.CanSave: Boolean;//�ж��Ƿ񱣴�
begin
  if ComboBox1.Text = '' then
  begin
    Result := False;
    Application.MessageBox('��Ӧ�����Ʋ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if ComboBox2.Text = '' then
  begin
    Result := False;
    Application.MessageBox('�������ͳƲ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if ComboBox3.Text = '' then
  begin
    Result := False;
    Application.MessageBox('��Ʒȥ����Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if Edit1.Text = '' then
  begin
    Result := False;
    Application.MessageBox('�����Ų���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if ComboBoxNAME.Text = '' then
  begin
    Result := False;
    Application.MessageBox('��Ʒ���Ʋ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if SpinEdit.Value = 0 then
  begin
    Result := False;
    Application.MessageBox('��Ʒ��������Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
end;

procedure TSPCKXX.bh;     //�Զ����
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
  Edit1.Text := s;
end;

procedure TSPCKXX.SpeedButton5Click(Sender: TObject);
begin
  ActionCD := '';
  BtnTJ := False;        //���״̬
  BtnXG := False;        //�޸�״̬
  SpeedButton2.Enabled := True;
  Close;
end;

procedure TSPCKXX.WiterCust;     //д��ͻ�
var
  i: Integer;
  cName, cStr, qstr: string;
begin
  cName := ComboBox3.Text;
  ComboBox3.clear;
  qstr := 'select SP_NAME from SPJBXX where SP_GYSID=' + '''' + Edit1.Text + '''';
  if ComboBox2.Text = '����' then
  begin
    cStr := 'RK_FROMID';
    qstr := 'Select DISTINCT RK_FROM From SPRKXX ';
    qstr := qstr + ' Where (RK_GYS_NOMB=''' + ComboBox4.Text + ''') and (RK_TYPE=''����'')';    //
  end else
  begin
    cStr := 'CUST_NAME';
    qstr := 'select * from CUST';
  end;
  QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
  if QueryCKX.Recordcount > 0 then      //���м�¼����д��ComboBox3
  begin
    ComboBox3.Clear;
    for i := 0 to QueryCKX.Recordcount - 1 do
    begin
      if ComboBox2.Text = '����' then
        ComboBox3.Items.Add(pCUSTID(QueryCKX.FieldByName(cStr).AsInteger)) else
        ComboBox3.Items.Add(QueryCKX.FieldByName(cStr).AsString);
      QueryCKX.next;
    end;
  end;
  ComboBox3.Text := cName;
end;

procedure TSPCKXX.FormCreate(Sender: TObject);
begin                //��������ʱ
  QuyKCB := TClientDataSet.Create(self);  //�����Ϣ�� QueryCKX
  QueryCKX := TClientDataSet.Create(self);  //�����Ϣ��
  kuan := False;
  BtnTJ := False;        //���״̬
  BtnXG := False;        //�޸�״̬
  //WiterCust;           //д��ͻ�
end;

procedure TSPCKXX.FormShow(Sender: TObject);
begin                          //�жϰ�ť�Ƿ�ѡ��״̬
  GroupBox1.Enabled := True;
  if ActionCD = 'M' then
    GetAll
  else if ActionCD = 'N' then
  begin
    GroupBox1.Enabled := False;
    SpeedButton2Click(Sender);
  end;
  ARIIX_Edit3;
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
end;

procedure TSPCKXX.SpeedButton1Click(Sender: TObject);
begin    //������Ӱ�ť���ؼ���ʼ��
  GroupBox1.Enabled := True;
//  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  ComboBox1.Text := 'ARIIX';
  ComboBox4.Text := 'GS20150126001';
  ComboBoxNAME.Clear;
  Edit3.Clear;
  Edit4.Clear;
  SpinEdit.Value := 1;      //Ĭ��ֵ
  Edit6.Text := 'pjj';    //Ĭ��ֵ
  DateTimePicker1.Date := now;
  Memo1.Clear;
  BtnTJ := True;        //���״̬
  BtnXG := False;        //�޸�״̬
  ActionCD := 'N';
  bh;
  ComboBox1.SetFocus;
  SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
end;

procedure TSPCKXX.SpeedButton3Click(Sender: TObject);        //���
var
  kQTY, nQTY: Integer;                 //kQTY���д�����nQTY��ǰ���������
  kNOMB, cstr: String;
begin
  if BtnTJ then            //���
  begin
    if comQTY - SpinEdit.Value >= 0 then  //�жϿ����-�������Ƿ���ڵ���0
    begin
      if (cansave) then
      begin
        Posting;                      //  �ύ����
        GroupBox1.Enabled := False;
//        Application.MessageBox('����ɹ�!', '��ʾ!', 64);
        SPCKXX_Z.FormShow(Sender);         //ˢ��
                 //���¸�ԭ
        GroupBox1.Enabled := True;
        SpeedButton3.Enabled := True;
        SpeedButton4.Enabled := True;
        Edit1.Clear;
//        if ((ComboBoxNAME.Text = '������') or (ComboBoxNAME.Text = 'ά����')) and (not kuan) then
//        begin
//          if (ComboBoxNAME.Text = '������') then
//          begin
//            ComboBoxNAME.ItemIndex := ComboBoxNAME.ItemIndex + 1;
//          end else
//          if (ComboBoxNAME.Text = 'ά����') then
//          begin
//            ComboBoxNAME.ItemIndex := ComboBoxNAME.ItemIndex - 1;
//          end;
//          ComboBoxNAME.OnChange(Sender);
//          kuan := True;
//        end else
        begin
          ComboBoxNAME.Text := '';
          SpinEdit.Value := 1;      //Ĭ��ֵ
        end;
        Edit3.Clear;
        Edit4.Clear;
        Edit6.Text := 'pjj';    //Ĭ��ֵ
        ActionCD := 'N';
        bh;
        ComboBox1.SetFocus;
        SpeedButton1.Enabled := False;
      end;
    end else
    begin
      Application.MessageBox('�����������ܴ��ڿ��������', '��ʾ��', 64);
      SpinEdit.Value := 1;             //Ĭ��ֵ
      SpinEdit.SetFocus;
    end;
  end else
  if BtnXG then     //�޸�
  begin
    try
      kNOMB := IntToStr(pCUST(ComboBox3.Text));
      if OldCK <> SpinEdit.Value then         //�޸�ǰ�����뱣��ʱ����������ȱ�ʾ������������ִ�����������п���������޸�
      begin
        kQTY := comQTY;                      //��ȡ�������
        nQTY := kQTY + OldCK - StrToInt(SpinEdit.Text);      //��������ֵ  �����+����ǰ������-�����������
        if nQTY < 0 then  //��������ֵС��0����ʾ���������ڿ����
        begin
          Application.MessageBox('�����������ܴ��ڿ��������', '��ʾ��', 64);
          SpinEdit.SetFocus;
          Exit;
        end else
        if nQTY > 0 then      //
        begin
          if kQTY <> 0 then
          begin
            cstr := 'Update kcb set KCSP_QTY=' + IntToStr(nQTY);
            cstr := cstr + ' Where (KCSP_SP_NOMB=''' + ComboBox5.Text + ''') and (KCSP_QX=''' + ComboBoQX.Text + ''')';   //��������š�����
            MyObj.ExecSQL(cstr);    //���¿����
          end else              //����ǰ���������0���ڿ����в���һ����¼
          begin                 //����Ʒ�ڿ����в����ڣ������ݲ��������
            cstr := 'INSERT INTO KCB(KCSP_SP_NOMB,KCSP_QTY,KCSP_GYSID,KCSP_QX)';
            cstr := cstr + ' Values(''' + ComboBox5.Text + ''',' + IntToStr(nQTY) + ',''' + ComboBox1.Text + ''',''' + ComboBoQX.Text + ''')';
            MyObj.ExecSQL(cstr);
          end;
        end else
        if nQTY = 0 then  //���º����������0
        begin
          cstr := '(KCSP_SP_NOMB=''' + ComboBox5.Text + ''') and (KCSP_QX=''' + ComboBoQX.Text + ''')';
          QDelete(cstr);          //��������������0��ɾ������¼
        end;
      end;
  //���³����¼

      Cstr := 'Update SPCKXX set CK_SP_NOMB=''' + ComboBox5.Text + ''',CK_TYPE=''' + ComboBox2.Text + ''',CK_DJ=' + Edit4.Text
        + ',CK_QTY=' + IntToStr(SpinEdit.Value) + ',CK_DATE=''' + FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date)
        + ''',CK_DH=''' + EditDH.Text + ''',CK_QX=''' + ComboBoQX.Text
        + ''',CK_JSR=''' + Edit6.Text + ''',CK_MEMO=''' + Memo1.Text + ''',CK_GOTOID=' + kNOMB;
      cstr := cstr + ' Where CK_NOMB=''' + Edit1.Text + '''';       //����������CK_NOMB= Edit1.Text
      MyObj.ExecSQL(cstr);      //���³����¼
      SPCKXX_Z.FormShow(Sender);         //ˢ��
      Application.MessageBox('����ɹ�!', '��ʾ!', 64);
      Close;
    except
      TipInfo('����ʧ��!', []);
    end;
  end;
end;

procedure TSPCKXX.ARIIX_Edit3;
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

procedure TSPCKXX.SpeedButton4Click(Sender: TObject);
begin
//  SpeedButton1.Enabled := True;     //����ȡ�����ؼ���ť����״̬
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
//  GroupBox1.Enabled := False;
  ActionCD := 'N';
  GetAll;
end;

procedure TSPCKXX.ComboBox1Change(Sender: TObject);
begin
  ComboBox4.ItemIndex := ComboBox1.ItemIndex;
  Edit3.Clear;
  Edit4.Clear;
  ARIIX_Edit3;
end;

procedure TSPCKXX.ComboBox1DropDown(Sender: TObject);
var              //����Ʒ�����ʾ��ComboBox1��
  i: integer;
  cstr: string;
begin
  ComboBox1.Clear;
  ComboBox4.Clear;
  cstr := 'select DISTINCT GYSNAME, GYS_NOMB from SPRKXX S,GYSXX G';    //�������Ϣ�������Ӧ������
  cstr := cstr + ' Where RK_GYS_NOMB=GYS_NOMB';
  QueryCKX.Data := MyObj.OpenSQL(cstr);    //�����ݱ�
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

function TSPCKXX.comQTY: Integer;
var
  cstr: String;
begin      //���ؿ����
  if ComboBoQX.Text <> '' then
    cstr := 'Select KCSP_QTY,KCSP_SP_NOMB from KCB where (KCSP_SP_NOMB=' + '''' + ComboBox5.Text + ''') and (KCSP_QX=' + '''' + ComboBoQX.Text + ''')' else
    cstr := 'Select KCSP_QTY,KCSP_SP_NOMB from KCB where (KCSP_SP_NOMB=' + '''' + ComboBox5.Text + ''')';

  QueryCKX.Data := MyObj.OpenSQL(cstr);    //�����ݱ�
  if QueryCKX.RecordCount = 0 then
    Result := 0 else
    Result := QueryCKX.FieldByName('KCSP_QTY').Value;    //���ؿ����
end;

procedure TSPCKXX.calculate;
var
  kQTY: Integer;
  kNOMB, cstr: String;
begin        //�жϳ����������������Ƿ���ȣ������ɾ����¼�������ȥ������   QuyKCB
  if QueryCKX.FieldByName('KCSP_QTY').Value = SpinEdit.Value then
  begin
    cstr := '(KCSP_SP_NOMB=''' + ComboBox5.Text + ''') and (KCSP_QX=''' + ComboBoQX.Text + ''')';
    QDelete(cstr);          //�����������������ɾ������¼
  end else
  begin
    kQTY := QueryCKX.FieldByName('KCSP_QTY').AsInteger - SpinEdit.Value;
    kNOMB := QueryCKX.FieldByName('KCSP_SP_NOMB').Value;  //���浱ǰ��¼����Ʒ���
    cstr := 'Update kcb set KCSP_QTY=' + IntToStr(kQTY);
    cstr := cstr + ' Where KCSP_SP_NOMB=''' + kNOMB + '''';
    MyObj.ExecSQL(cstr);
  end;
end;

procedure TSPCKXX.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#13]) then
    key := #0;
  if key = #13 then
    SpinEdit.SetFocus;
end;

procedure TSPCKXX.ComboBox2Change(Sender: TObject);
begin
  //WiterCust;
  if ComboBox2.Text = '����' then
  begin
    ComboBox3.Text := '����';
    DateTimePicker1.SetFocus;
  end else
    ComboBox3.SetFocus;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
end;

procedure TSPCKXX.ComboBox3DropDown(Sender: TObject);
begin
  WiterCust;
end;

procedure TSPCKXX.ComboBox3Enter(Sender: TObject);
begin
  ComboBox3.ImeName := MyIme;
end;

procedure TSPCKXX.ComboBox3Exit(Sender: TObject);
begin
  InsertCust;
end;

procedure TSPCKXX.DateTimePicker1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Edit6.SetFocus;
end;

procedure TSPCKXX.ComboBoxNAMEChange(Sender: TObject);
var
  cstr: string;
begin          //ͨ����Ӧ�����ƣ���Ʒ���ƽ����۵���Ϣ��ʾ�����Ӧ��EDIT��
  ComboBox5.ItemIndex := ComboBoxNAME.ItemIndex;
  begin
    cstr := 'Select SP_JINJA ����,SP_XIAOSOJA ���ۼ� from GYSXX G,SPJBXX J ';
    cstr := cstr + ' where (GYSNAME=' + '''' + ComboBox1.Text + ''') and (SP_JNAME=' + '''' + ComboBoxNAME.Text + ''')';
    QueryCKX.Data := MyObj.OpenSQL(cstr);  //�����ݱ�
  end;
  if QueryCKX.FieldByName('����').Value <> null then
    Edit3.Text := QueryCKX.FieldByName('����').Value;
  if QueryCKX.FieldByName('���ۼ�').Value <> null then
    Edit4.Text := QueryCKX.FieldByName('���ۼ�').Value;
  ComboBoQX.Clear;      //���
  GetQX;                //��Ʒ����д����������
end;

procedure TSPCKXX.GetQX;    //ͨ����Ʒ���ƻ�ȡ�����иò�Ʒ������
var
  cstr: string;
begin
  cstr := 'Select * from kcb ';
  cstr := cstr + ' where (KCSP_SP_NOMB=' + '''' + ComboBox5.Text + ''') ';
  QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
  if QueryCKX.RecordCount <> 0 then
  begin
    ComboBoQX.text := QueryCKX.fieldbyname('KCSP_QX').AsString;
    QueryCKX.Next;
  end;
end;

procedure TSPCKXX.ComboBoxNAMEDropDown(Sender: TObject);
var
  i: Integer;
  cstr: string;
begin              //  ͨ����Ӧ�����ƣ����ù�Ӧ��������Ʒ���������ComboBoxNAME��
  ComboBoxNAME.Clear;
  ComboBox5.Clear;
  begin
    cstr := 'Select DISTINCT SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,SP_NOMB from Kcb S,GYSXX G,SPJBXX J';    //�������Ϣ�������Ӧ������
    cstr := cstr + ' Where (KCSP_SP_NOMB=SP_NOMB) and (SP_GYSID=''' + ComboBox4.Text + ''')';
    cstr := cstr + 'Order By KCSP_QTY DESC';
    QueryCKX.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
    if (QueryCKX.recordcount > 0) then
      QueryCKX.first;
    for i := 0 to QueryCKX.recordcount - 1 do
    begin
      ComboBoxNAME.Items.add(QueryCKX.FieldByName('��Ʒ���').asstring);   //��Ʒ����
      ComboBox5.Items.add(QueryCKX.FieldByName('SP_NOMB').asstring);       //��Ʒ���
      QueryCKX.next;
    end;
    Edit3.Clear;
    Edit4.Clear;
  end;
end;

procedure TSPCKXX.Edit4Change(Sender: TObject);
begin
  BtnXG := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
end;

procedure TSPCKXX.Edit6Enter(Sender: TObject);
begin
  Edit6.ImeName := MyIme;
end;

procedure TSPCKXX.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Memo1.SetFocus;
end;

procedure TSPCKXX.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SpeedButton4Click(Sender);
end;

procedure TSPCKXX.Memo1Change(Sender: TObject);
begin
  Memo1.Text := Trim(Memo1.Text);
  BtnXG := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
end;

procedure TSPCKXX.Memo1Enter(Sender: TObject);
begin
  Memo1.ImeName := MyIme;
end;

procedure TSPCKXX.SpeedButton2Click(Sender: TObject);
begin
  GroupBox1.Enabled := True;
//  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  ComboBox1.SetFocus;
  SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
  OldCK := StrToInt(SpinEdit.Text);        //�����޸�ǰ������
  BtnTJ := False;        //���״̬
  BtnXG := True;        //�޸�״̬
end;

end.
