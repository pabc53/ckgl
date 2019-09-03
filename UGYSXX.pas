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
    Procedure bh;  //自动编号
    function CanSave: Boolean;//判断是否保存
    procedure posting;  //提交数据
    procedure GetAll;   //获得所有数据
    procedure tr;       //去除空字符
    { Public declarations }
  end;

var
  GYSXX: TGYSXX;

implementation

uses zMAIN, UGYSXX_Z;

{$R *.dfm}

procedure TGYSXX.tr;       //去除空字符
var
  i: integer;
begin
  for i := ComponentCount - 1 downto 0 do
    if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := trim(TEdit(Components[i]).Text);
end;

procedure TGYSXX.GetAll;//获得所有数据
begin
  Edit1.Text := UGYSXX_Z.QryGYS2.FieldByName('编号').AsString;
  Edit2.Text := uGYSXX_Z.QryGYS2.FieldByName('供应商名称').AsString;
  Edit3.Text := uGYSXX_Z.QryGYS2.FieldByName('地址').AsString;
  Edit4.Text := uGYSXX_Z.QryGYS2.FieldByName('联系人').AsString;
  Edit5.Text := uGYSXX_Z.QryGYS2.fieldByName('电话').AsString;
  Edit6.Text := uGYSXX_Z.QryGYS2.FieldByName('传真').AsString;
  Edit7.Text := uGYSXX_Z.QryGYS2.FieldByName('邮政编码').AsString;
  Memo1.Text := uGYSXX_Z.QryGYS2.FieldByName('备注').AsString;
end;

procedure TGYSXX.Posting;          //提交数据
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

function TGYSXX.CanSave: Boolean;//判断是否保存
begin
  if Edit1.Text = '' then
  begin
    Result := False;
    Application.MessageBox('供应商编号不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if Edit2.Text = '' then
  begin
    Result := False;
    Application.MessageBox('供应商名称不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if Edit3.Text = '' then
  begin
    Result := False;
    Application.MessageBox('供应商地址不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
//  if Edit4.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('联系人不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
//  if Edit5.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('联系电话不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
//  if Edit6.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('传真不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
//  if Edit7.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('邮政编码不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
end;
procedure TGYSXX.BH;   //自动编号
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
begin            //添加时，控件初始化
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
    Posting; //  提交存盘
    GroupBox1.Enabled := False;
    GYSXX_Z.DataCreate;
    SpeedButton1Click(Sender);
    Application.MessageBox('保存成功!', '提示!', 64);
  end;
end;

procedure TGYSXX.SpeedButton4Click(Sender: TObject);
begin              //取消时，按钮可用状态
  SpeedButton1.Enabled := True;
  SpeedButton2.Enabled := True;
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
  GroupBox1.Enabled := False;
  ActionCD := '';
  GetAll;
end;

procedure TGYSXX.FormShow(Sender: TObject);
begin             //窗体显示时，判断按钮擦作状态
//  GroupBox1.Enabled := False;
  if ActionCD = 'M' then
    GetAll
  else if ActionCD = 'N' then
  begin
    GroupBox1.Enabled := False;
  end;
end;

procedure TGYSXX.Edit2KeyPress(Sender: TObject; var Key: Char);
begin                //判断字符合法性
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
