unit USPJBXX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, dbclient, uUserMaint;

type
  TSPJBXX = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Edit10: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label10: TLabel;
    ComboBox1: TComboBox;
    Bevel1: TBevel;
    Edit11: TEdit;
    Edit6: TComboBox;
    Edit5: TComboBox;
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit10Enter(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure Edit6Enter(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
  private
    procedure ARIIX_Edit7;

    { Private declarations }
  public
    procedure GetAll;          //��ȡ����
    procedure posting;        //�ύ����
    Function cansave: Boolean; //�ж��Ƿ񱣴�
    Function ZFinds(str: String): String;
    procedure bh;             //�Զ����
    Procedure tr;             //ȥ�����ַ�
    Function SPInTable: Boolean;  //��Ʒ�Ƿ����ڿ���
    Function Add_SP: Boolean;     //�����Ʒ״̬�´���EDIT2
    Function Edit_SP: Boolean;    //�޸���Ʒ״̬�´���EDIT2
     { Public declarations }
  end;

var
  SPJBXX: TSPJBXX;
  Querysp: TClientDataSet;
  aTop : Integer;

implementation

uses zMAIN, UGYSXX, USPJBXX_Z, DB;

{$R *.dfm}

Function TSPJBXX.ZFinds(str: String): String;
var
  qstr: String;
begin
  Result := '';
  qstr := 'Select GYSNAME From GYSXX Where GYS_NOMB=''' + str + '''';
  Querysp.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  Result := QuerySP.Fields[0].AsString;
  //QuerySP.Free;
end;

procedure TSPJBXX.tr;
var
  i: integer;
begin
  for i := ComponentCount - 1 downto 0 do
    if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := trim(TEdit(Components[i]).Text);
end;
procedure TSPJBXX.GetAll;//�����������  USPJBXX_Z   USPJBXX_Z.QueryJB USPJBXX_Z.QueryJB
begin
  Edit1.Text := USPJBXX_Z.QueryJB.FieldByName('��Ʒ���').AsString;
  Edit2.Text := USPJBXX_Z.QueryJB.FieldByName('��Ʒ����').AsString;
  Edit3.Text := USPJBXX_Z.QueryJB.FieldByName('���').AsString;
  Edit4.Text := USPJBXX_Z.QueryJB.FieldByName('������').AsString;
  if Edit5.Text <> '' then                 //��Ϊ�գ���ȡֵ
    Edit5.Text := USPJBXX_Z.QueryJB.fieldByName('����').AsString;     //SP_SCD
  if Edit6.Text <> '' then                 //��Ϊ�գ���ȡֵ
    Edit6.Text := USPJBXX_Z.QueryJB.FieldByName('��λ').AsString;       //�� λ
  Edit7.Text := USPJBXX_Z.QueryJB.FieldByName('����').AsString;    //�� Ʒ����
  if Edit7.Text = '' then
    Edit7.Text := '0';
  Edit8.Text := USPJBXX_Z.QueryJB.FieldByName('������').AsString;      //�� ����
  if Edit8.Text = '' then
    Edit8.Text := '0';
  Edit9.Text := USPJBXX_Z.QueryJB.FieldByName('���ۼ�').AsString;      //�� �ۼ�
  if Edit9.Text = '' then
    Edit9.Text := '0';
  Edit10.Text := USPJBXX_Z.QueryJB.FieldByName('��Ʒ���').AsString;    //�� Ʒ���
  Edit11.Text := USPJBXX_Z.QueryJB.FieldByName('��Ӧ�̱��').AsString;
  ComboBox1.Text := ZFinds(Edit11.Text);
  Memo1.Text := USPJBXX_Z.QueryJB.FieldByName('��ע').AsString;          //SP_MEMO
end;

procedure TSPJBXX.Posting;          //�ύ����
var
  qstr: String;
begin
    //QuerySP := Gob_DBMrg.GetAnQuery('qry_jshow4');   //��
  if ActionCD = 'N' then
  BEGIN
    qstr := 'INSERT INTO SPJBXX(SP_NAME,SP_JNAME,SP_GG,SP_BZQ,SP_SCD,SP_UNIT,SP_JINJA,SP_PIFAJA,SP_XIAOSOJA,SP_GYSID,SP_MEMO,SP_NOMB)';
    qstr := qstr + ' Values(''' + Edit2.Text + ''',''' + Edit10.Text + ''',''' + Edit3.Text + ''',''' + Edit4.Text + ''',''' + Edit5.Text + ''',''' + Edit6.Text + ''',' + (Edit7.Text) + ',' + (Edit8.Text) + ',' + (Edit9.Text) + ',''' + Edit11.Text + ''',';
    qstr := qstr + '''' + Memo1.Text + ''',''' + Edit1.Text + ''')';
  END else
  if ActionCD = 'M' then
  begin
    qstr := 'update SPJBXX Set SP_NAME=''' + Edit2.Text + ''',SP_JNAME=''' + Edit10.Text + ''',';
    qstr := qstr + ' SP_GG=''' + Edit3.Text + ''',SP_BZQ=''' + Edit4.Text + ''',SP_SCD=''' + Edit5.Text + ''',SP_UNIT=''' + Edit6.Text + ''',';
    qstr := qstr + ' SP_JINJA=' + Edit7.Text + ',SP_PIFAJA=' + Edit8.Text + ',SP_XIAOSOJA=' + Edit9.Text + ',SP_GYSID=''' + Edit11.Text + ''',SP_MEMO=''' + Memo1.Text + '''';
    qstr := qstr + ' Where SP_NOMB=''' + Edit1.Text + '''';
//      Params.Items[0].Value := Edit2.Text;
//      Params.Items[1].Value := Edit10.Text;
//      Params.Items[2].Value := Edit3.Text;
//      Params.Items[3].Value := Edit4.Text;
//      Params.Items[4].Value := Edit5.Text;       //������
//      Params.Items[5].Value := Edit6.Text;       //��λ
//      Params.Items[6].Value := StrToCurr(Edit7.Text);
//      Params.Items[7].Value := StrToCurr(Edit8.Text);
//      Params.Items[8].Value := StrToCurr(Edit9.Text);
//      Params.Items[9].Value := Edit11.Text;
//      Params.Items[10].Value := Memo1.Text;
//      Params.Items[11].Value := Edit1.Text;
//      Prepared := true;
//      Gob_Rmo.OpenDataset(Querysp, qstr, []);   //�����ݱ�
//      ExecSQL;
    SPJBXX.Close;
  end;
  MyObj.ExecSQL(qstr);
  //Querysp.Free;
end;

function TSPJBXX.cansave: Boolean;//�ж��Ƿ񱣴�
begin
  if Edit1.Text = '' then
  begin
    Result := False;
    Application.MessageBox('��Ʒ��Ų���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if Edit2.Text = '' then
  begin
    Result := False;
    Application.MessageBox('��Ʒ���Ʋ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if Edit10.Text = '' then
  begin
    Result := False;
    Application.MessageBox('��Ʒ��Ʋ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if Edit3.Text = '' then
  begin
    Result := False;
    Application.MessageBox('��Ʒ�����Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
//  if Edit4.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('�����ڲ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
  if Edit5.Text = '' then
  begin
    Result := False;
    Application.MessageBox('��Ʒ���ز���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if Edit6.Text = '' then
  begin
    Result := False;
    Application.MessageBox('��Ʒ��λ����Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
//  if Edit7.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('��Ʒ���۲���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
//  if Edit8.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('��Ʒ�����۲���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
  if Edit9.Text = '' then      //���Ϊ����ֵ"0"
  begin
    Edit9.Text := '0';
  end;
//  if ComboBox1.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('��Ӧ�����Ʋ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
  if Edit11.Text = '' then
  begin
    Result := False;
    Application.MessageBox('��Ӧ�̱�Ų���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
//  if strtofloat(Edit7.Text) > strtofloat(Edit8.Text) then
//  begin
//    Result := False;
//    Application.MessageBox('���۲��ܴ��������ۣ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
//  if strtofloat(Edit8.Text) > strtofloat(Edit9.Text) then
//  begin
//    Result := False;
//    Application.MessageBox('�����۲��ܴ������ۼۣ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
//  if strtofloat(Edit7.Text) > strtofloat(Edit9.Text) then
//  begin
//    Result := False;
//    Application.MessageBox('���۲��ܴ������ۼۣ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//    exit;
//  end;

end;

procedure TSPJBXX.bh;      //�Զ����
var
  s, m, qstr: string;
  i: integer;
begin
  qstr := 'Select SP_NOMB From SPJBXX';
  Querysp.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  s := 'SP' + FormatDateTime('yyyymmdd', Now());
  If Querysp.FieldByName('SP_NOMB').Value = null then
    s := s + '001'
  else
  begin
    Querysp.Last;
    m := Trim(Querysp.FieldByName('SP_NOMB').Value);
    i := StrToInt(Trim(Copy(m, 11, 8)));
    if i < 9 then
      s := s + '00' + InttoStr(i + 1)
    else if i < 99 then
      s := s + '0' + InttoStr(i + 1)
    else
      s := s + InttoStr(i + 1);
  end;
  Edit1.Text := s;
  //Querysp.Free;
end;

procedure TSPJBXX.SpeedButton5Click(Sender: TObject);
begin
  ActionCD := '';
  Close;
end;

procedure TSPJBXX.FormCreate(Sender: TObject);
begin                  //��������ʱ�����ݿ��
  aTop := Trunc((Screen.Height - SPJBXX.Height) / 2);
  QuerySP := TClientDataSet.Create(nil);   //��
end;

procedure TSPJBXX.FormShow(Sender: TObject);
begin
  GroupBox1.Enabled := False;
  if ActionCD = 'M' then
    GetAll
  else if ActionCD = 'N' then
  begin
    GroupBox1.Enabled := False;
  end;
  SpeedButton1.Enabled := True;
//SpeedButton2Click(Sender);
end;

procedure TSPJBXX.SpeedButton1Click(Sender: TObject);
begin                           //�����ʱ�� ����ؼ���ʼ��
  GroupBox1.Enabled := True;
  SpeedButton2.Enabled := False;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.ItemIndex := 0;
  Edit6.ItemIndex := 1;
  Edit7.Text := '0';
  Edit8.Text := '0';
  Edit9.Text := '0';
  Edit10.Clear;
  ARIIX_Edit7;
//  ComboBox1.ItemIndex := 0;
  Memo1.Clear;
  ActionCD := 'N';
  bh;
//  Edit2.SetFocus;
  SpeedButton1.Enabled := False;
  //SPJBXX.Top := 252;
end;

procedure TSPJBXX.ARIIX_Edit7;
begin
  if ComboBox1.Text='ARIIX' then
  begin
    Edit7.left := 344;
    Edit7.Width:= 139;
    Label7.Caption := '��    �ۣ���';
  end else
  begin
    Edit7.left := 328;
    Edit7.Width:= 155;
    Label7.Caption := '��    �ۣ�';
  end;
end;

procedure TSPJBXX.SpeedButton2Click(Sender: TObject);
begin
  GroupBox1.Enabled := True;
  SpeedButton1.Enabled := False;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  ACtionCD := 'M';
  SPJBXX.Top := aTop;
end;

procedure TSPJBXX.SpeedButton3Click(Sender: TObject);
var
  sSave: Boolean;
begin                     //����
  sSave := False;
  if SpeedButton2.Enabled then
  begin
    if Edit_SP then      //Ϊ���򱣴�
      sSave := True;
  end else
  begin
    if Add_SP then       //Ϊ���򱣴�
      sSave := True;
  end;
  if sSave then
  begin
    if (cansave) then
    begin
      Posting;              //  �ύ����
      GroupBox1.Enabled := False;
      Application.MessageBox('����ɹ�!', '��ʾ!', 64);
      if actioncd = 'N' then
      begin
        GroupBox1.Enabled := True;
        SpeedButton2.Enabled := False;
        SpeedButton3.Enabled := True;
        SpeedButton4.Enabled := True;
        Edit1.Clear;
        Edit2.Clear;
        Edit3.Clear;
        Edit4.Clear;
        Edit7.Text := '0';
        Edit8.Text := '0';
        Edit9.Text := '0';
        Edit10.Clear;               //��Ʒ���
        Memo1.Clear;
        bh;
        SpeedButton1.Enabled := False;
        Edit2.SetFocus;
      end else
        actioncd := '';
    end;
    SPJBXX_Z.FormCreate(Sender);
  end;
end;

procedure TSPJBXX.SpeedButton4Click(Sender: TObject);
begin
  SpeedButton1.Enabled := True;
  SpeedButton2.Enabled := True;
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
  GroupBox1.Enabled := False;
  ActionCD := '';
  GetAll;
end;

procedure TSPJBXX.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    tr;
    Edit10.SetFocus;
  end;
end;

procedure TSPJBXX.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    tr;
    Edit5.SetFocus;
  end;
end;

procedure TSPJBXX.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    tr;
    Edit3.SetFocus;
  end;
end;

procedure TSPJBXX.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Edit6.SetFocus;
end;

procedure TSPJBXX.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Edit7.SetFocus;
end;

procedure TSPJBXX.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.', #13, #8]) then
    key := #0;
  if key = #13 then
  begin
    tr;
    Edit8.SetFocus;
  end;
end;

procedure TSPJBXX.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.', #13, #8]) then
    key := #0;
  if key = #13 then
  begin
    tr;
    Edit9.SetFocus;
  end;
end;

procedure TSPJBXX.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.', #13, #8]) then
    key := #0;
  if key = #13 then
  begin
    tr;
    Memo1.SetFocus;
  end;
end;

procedure TSPJBXX.ComboBox1DropDown(Sender: TObject);
var
  i: integer;
  qstr: String;
begin              //����Ӧ��������ʾ��ComboBox1��
  ComboBox1.Clear;
  qstr := 'select GYS_NOMB,GYSNAME from GYSXX';
  //QuerySP := Gob_DBMrg.GetAnQuery('qry_jshow2');   //��
  Querysp.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  if (Querysp.recordcount > 0) then
    Querysp.First;
  for i := 0 to Querysp.recordcount - 1 do
  begin
    combobox1.Items.add(Querysp.FieldByName('GYSNAME').asstring);
    Querysp.next;
  end;
  //Querysp.Free;
end;

procedure TSPJBXX.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
//  if not (key in[#13,#46]) then
//    key:=#0;
  if key = #13 then
  begin
    tr;
    Edit11.SetFocus;
  end;
end;

procedure TSPJBXX.ComboBox1Change(Sender: TObject);
var
  qstr: String;
begin              //����Ӧ��������ʾ��ComboBox1��
  qstr := 'Select GYS_NOMB from GYSXX where GYSNAME=' + '''' + ComboBox1.Text + '''';
  //QuerySP := Gob_DBMrg.GetAnQuery('qry_jshow5');   //��
  Querysp.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  Edit11.Clear;      //ͨ����Ӧ�����ƣ�����Ӧ�̱����ʾ��Edit11�����
//  with DM.QGYSXX do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Add('Select GYS_NOMB from GYSXX where GYSNAME=' + '''' + ComboBox1.Text + '''');
//    Open;
//  end;
  Edit11.Text := Querysp.FieldByName('GYS_NOMB').Value;
  ARIIX_Edit7;
  Edit2.SetFocus;
  //QuerySP.Free;
end;

procedure TSPJBXX.Edit10Enter(Sender: TObject);
begin
  Edit10.ImeName := MyIme;
end;

procedure TSPJBXX.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    tr;
    Edit4.SetFocus;
  end;
end;

procedure TSPJBXX.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#13]) then
    key := #0;
  if key = #13 then
  begin
    tr;
    Memo1.SetFocus;
  end;
end;

procedure TSPJBXX.Edit2Enter(Sender: TObject);
begin
  Edit2.ImeName := MyIme;
end;

procedure TSPJBXX.Edit2Exit(Sender: TObject);
begin
  if (not SpeedButton2.Enabled) and (Edit10.Text = '') then   //��Ʒδ¼��ʱ��Edit10Ϊ��
    Edit10.Text := Edit2.Text;       //��Ƶ�Ĭ��ֵ         //Edit10��Ϊ�գ��򱣳�ԭֵ
end;

{���޸�״̬�£����ڸü�¼���޸���Ҫ�Ǽ����Ʒ�����Ƿ���ڣ�һ���ڿ��в�Ӧ��
����ͬ����Ʒ���ƣ���ˡ���Ʒ���ơ����޸��ˣ��˳�ʱҪ���м�⣬�������Ѵ�����ͬ
����Ʒ���ƣ���ʾһ����ʾ���ڣ���û���޸���Ʒ���ƣ�ֻ�޸��������������ȷ����
�������棬����True����������򷵻�False������ա������棬���������޸ġ�
�ڡ���ӡ�״̬�£�������ͬ����Ʒ���ƣ�������ʾ���ڣ�����ա���Ʒ���ơ�������Ʒ��ơ����������롣
}
Function TSPJBXX.Add_SP: Boolean;
begin                  //�����Ʒ,��������ͬ���Ƶ���Ʒ
  if SPInTable then
  begin
    Application.MessageBox('����Ʒ��¼�룡', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    Edit2.Text := '';     //��¼������գ���������
    Edit10.Text := '';
    Edit2.SetFocus;
    Result := False;
  end else
  begin
    Result := True;
    Exit;
  end;
end;

Function TSPJBXX.Edit_SP: Boolean;
begin                //�༭��Ʒ��������ͬ��Ʒ���ƣ���ȷ�Ϻ�����������˳�
  if SPInTable then
  begin
////      Application.MessageBox('����Ʒ��¼�룡', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    if Application.MessageBox('����Ʒ��¼�룡�Ƿ�������棿', '��ʾ��Ϣ', MB_OKCANCEL) = 2 then
    begin
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

Function TSPJBXX.SPInTable: Boolean;
var
  qstr: String;
begin               //��ѯ�����Ƿ����
  Result := False;
  qstr := 'Select GYS_NOMB from GYSXX,SPJBXX ';
  qstr := qstr + 'Where GYS_NOMB=''' + Edit11.Text + ''' and (GYS_NOMB=SP_GYSID)';
  qstr := qstr + ' and (SP_NAME=''' + Edit2.Text + ''')';
  //QuerySP := Gob_DBMrg.GetAnQuery('qry_jshowc');   //��
  Querysp.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  if (Querysp.ReCordCount > 0) then
    Result := True;
//  With DM.ZQuery do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Add('Select GYS_NOMB from GYSXX,SPJBXX ');
//    SQL.Add('Where GYS_NOMB=''' + Edit11.Text + ''' and (GYS_NOMB=SP_GYSID)');
//    SQL.Add(' and (SP_NAME=''' + Edit2.Text + ''')');
//    Open;
//  end;
  //Querysp.Free;
end;

procedure TSPJBXX.Edit3Enter(Sender: TObject);
begin
  Edit3.ImeName := MyIme;
end;

procedure TSPJBXX.Edit4Enter(Sender: TObject);
begin
  Edit4.ImeName := MyIme;
end;

procedure TSPJBXX.Edit5Enter(Sender: TObject);
begin
  Edit5.ImeName := MyIme;
end;

procedure TSPJBXX.Edit6Enter(Sender: TObject);
begin
  Edit6.ImeName := MyIme;
end;

procedure TSPJBXX.Edit7Exit(Sender: TObject);
begin                            //���ۼۼ���
  if (Edit7.Text <> '0') then
  begin
    if (ComboBox1.Text = 'ARIIX') then
      Edit9.Text := FloatToStr(StrToFloat(Edit7.Text) * 7) else
    if ComboBox1.Text = '����' then
      Edit9.Text := FloatToStr(StrToFloat(Edit7.Text) * 0.85);
  end;
end;

procedure TSPJBXX.Memo1Enter(Sender: TObject);
begin
  Memo1.ImeName := MyIme;
end;

end.
