unit UGYSXX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, uUserMaint;

type
  TGYSXX = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure Edit2Enter(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure bh;  //�Զ����
    function CanSave: Boolean;//�ж��Ƿ񱣴�
    procedure posting;  //�ύ����
    procedure GetAll;   //�����������
    procedure tr;       //ȥ�����ַ�
    { Public declarations }
  end;

var
  GYSXX: TGYSXX;

implementation

uses zMAIN, UGYSXX_Z;

{$R *.dfm}

procedure TGYSXX.tr;       //ȥ�����ַ�
var
  i: integer;
begin
  for i := ComponentCount - 1 downto 0 do
    if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := trim(TEdit(Components[i]).Text);
end;

procedure TGYSXX.GetAll;//�����������
begin
  Edit1.Text := UGYSXX_Z.QryGYS2.FieldByName('���').AsString;
  Edit2.Text := uGYSXX_Z.QryGYS2.FieldByName('��Ӧ������').AsString;
  Edit3.Text := uGYSXX_Z.QryGYS2.FieldByName('��ַ').AsString;
  Edit4.Text := uGYSXX_Z.QryGYS2.FieldByName('��ϵ��').AsString;
  Edit5.Text := uGYSXX_Z.QryGYS2.fieldByName('�绰').AsString;
  Edit6.Text := uGYSXX_Z.QryGYS2.FieldByName('����').AsString;
  Edit7.Text := uGYSXX_Z.QryGYS2.FieldByName('��������').AsString;
  Memo1.Text := uGYSXX_Z.QryGYS2.FieldByName('��ע').AsString;
end;

procedure TGYSXX.Posting;          //�ύ����
var
  str: String;
begin
  if ActionCD = 'N' then
  BEGIN
    str := 'INSERT INTO GYSXX(GYSNAME,GYSADD,LIANXIREN,PHON,FAX,YCODE,MEMO,GYS_NOMB)';
    str := str + ' Values(''' + Edit2.Text + ''',''' + Edit3.Text + ''',''' + Edit4.Text + ''',''' + Edit5.Text + ''',''' + Edit6.Text + ''',''' + Edit7.Text + ''',''' + Memo1.Text + ''',''' + Edit1.Text + ''')';
    MyObj.ExecSQL(str);
  END else
  if ActionCD = 'M' then
  begin
    str := 'update GYSXX Set GYSNAME=''' + Edit2.Text + ''', GYSADD=''' + Edit3.Text + ''' ,LIANXIREN=''' + Edit4.Text + ''' ,';
    str := str + ' PHON=''' + Edit5.Text + ''' ,FAX=''' + Edit6.Text + ''',';
    str := str + ' YCODE=''' + Edit7.Text + ''',MEMO=''' + Memo1.Text + ''' Where GYS_NOMB=''' + Edit1.Text + '''';
    MyObj.ExecSQL(str);
  end;
end;

function TGYSXX.CanSave: Boolean;//�ж��Ƿ񱣴�
begin
  if Edit1.Text = '' then
  begin
    Result := False;
    Application.MessageBox('��Ӧ�̱�Ų���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if Edit2.Text = '' then
  begin
    Result := False;
    Application.MessageBox('��Ӧ�����Ʋ���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if Edit3.Text = '' then
  begin
    Result := False;
    Application.MessageBox('��Ӧ�̵�ַ����Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    exit;
  end;
//  if Edit4.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('��ϵ�˲���Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
//  if Edit5.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('��ϵ�绰����Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
//  if Edit6.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('���治��Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
//  if Edit7.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('�������벻��Ϊ�գ�', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
end;
procedure TGYSXX.BH;   //�Զ����
var
  s, m, qstr: string;
  i: integer;
begin
  s := 'GS' + FormatDateTime('yyyymmdd', Now());
  qstr := 'select GYS_NOMB From GYSXX ';
  MAIN.Query.Data := MyObj.OpenSQL(qstr);
  If MAIN.Query.FieldByName('GYS_NOMB').Value = null then
    s := s + '001'
  else
  begin
    MAIN.Query.Last;
    m := Trim(MAIN.Query.FieldByName('GYS_NOMB').Value);
    i := StrToInt(Trim(Copy(m, 11, 8)));
    if i < 9 then
      s := s + '00' + InttoStr(i + 1)
    else if i < 99 then
      s := s + '0' + InttoStr(i + 1)
    else
      s := s + InttoStr(i + 1);
  end;
  Edit1.Text := s;
//  MAIN.Query.Close;
end;

procedure TGYSXX.Edit2Enter(Sender: TObject);
begin
  Edit2.ImeName := MyIme;
end;

procedure TGYSXX.SpeedButton5Click(Sender: TObject);
begin
  ActionCD := '';
  Close;
end;

procedure TGYSXX.SpeedButton1Click(Sender: TObject);
begin            //���ʱ���ؼ���ʼ��
  GroupBox1.Enabled := True;
  SpeedButton2.Enabled := False;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
  Memo1.Clear;
  ActionCD := 'N';
  bh;
  Edit2.SetFocus;
  SpeedButton1.Enabled := False;
end;

procedure TGYSXX.SpeedButton2Click(Sender: TObject);
begin
  GroupBox1.Enabled := True;
  SpeedButton1.Enabled := False;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  ACtionCD := 'M';
end;

procedure TGYSXX.SpeedButton3Click(Sender: TObject);
begin
  if (cansave) then
  begin
    Posting; //  �ύ����
    GroupBox1.Enabled := False;
    GYSXX_Z.DataCreate;
    SpeedButton1Click(Sender);
    Application.MessageBox('����ɹ�!', '��ʾ!', 64);
  end;
end;

procedure TGYSXX.SpeedButton4Click(Sender: TObject);
begin              //ȡ��ʱ����ť����״̬
  SpeedButton1.Enabled := True;
  SpeedButton2.Enabled := True;
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
  GroupBox1.Enabled := False;
  ActionCD := '';
  GetAll;
end;

procedure TGYSXX.FormShow(Sender: TObject);
begin             //������ʾʱ���жϰ�ť����״̬
//  GroupBox1.Enabled := False;
  if ActionCD = 'M' then
    GetAll
  else if ActionCD = 'N' then
  begin
    GroupBox1.Enabled := False;
  end;
end;

procedure TGYSXX.Edit2KeyPress(Sender: TObject; var Key: Char);
begin                //�ж��ַ��Ϸ���
  if key = #13 then
  begin
    tr;
    Edit3.SetFocus;
  end;
end;

procedure TGYSXX.Edit3Enter(Sender: TObject);
begin
  Edit3.ImeName := MyIme;
end;

procedure TGYSXX.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    tr;
    Edit4.SetFocus;
  end;
end;

procedure TGYSXX.Edit4Enter(Sender: TObject);
begin
  Edit4.ImeName := MyIme;
end;

procedure TGYSXX.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    tr;
    Edit5.SetFocus;
  end;
end;

procedure TGYSXX.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    tr;
    Edit6.SetFocus;
  end;
end;

procedure TGYSXX.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
//  if not (key in ['-', '0'..'9', #13, #8]) then
//    key := #0;
  if key = #13 then
  begin
    tr;
    Edit7.SetFocus;
  end;
end;

procedure TGYSXX.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    tr;
    Memo1.SetFocus;
  end;
end;

procedure TGYSXX.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SpeedButton4Click(Sender);
end;

procedure TGYSXX.Memo1Change(Sender: TObject);
begin
  Memo1.Text := Trim(Memo1.Text);
end;

procedure TGYSXX.Memo1Enter(Sender: TObject);
begin
  Memo1.ImeName := MyIme;
end;

end.
