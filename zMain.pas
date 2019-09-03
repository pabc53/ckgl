      //本程序是在远程程序的基础上修改了连接数据库的方法，改用刘艺OOP一书中的相关方法。
      //在uUserMaint单元中编写了OpenSQL、ExecSQL等方法进行统一连接数据库及事务处理。
unit zMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms, IniFiles, ComObj, StrUtils, XPMan,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Grids, DBGrids, DB, dbclient, midaslib, DBGridEh,
  Buttons, jpeg, shellapi, Controls, TntButtons, uUserMaint;

type
  TMAIN = class(TForm)
    Image1: TImage;
    SpeedButton6: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label3: TLabel;
    ComboBoxIME: TComboBox;
    Label4: TLabel;
    SpeedButton13: TSpeedButton;
    LabStatBar: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure ComboBoxIMEChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    function DBGridTitleClick(Gx: TDBGrid; Column: TColumn): Boolean;
    function DBGridEhTitleClick(Gx: TDBGridEh; Column: TColumnEh): Boolean;    //排序
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton12MouseMove(Sender: TObject; Shift: TShiftState; X, Y:
        Integer);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X, Y:
        Integer);
    procedure SpeedButton2MouseMove(Sender: TObject; Shift: TShiftState; X, Y:
        Integer);
    procedure SpeedButton3MouseMove(Sender: TObject; Shift: TShiftState; X, Y:
        Integer);
    procedure SpeedButton4MouseMove(Sender: TObject; Shift: TShiftState; X, Y:
        Integer);
    procedure SpeedButton5MouseMove(Sender: TObject; Shift: TShiftState; X, Y:
        Integer);
    procedure SpeedButton6MouseMove(Sender: TObject; Shift: TShiftState; X, Y:
        Integer);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { Private declarations }
    //objUsers: TUserMaint;
  public
    QryShower, Query, QryMaster, Queryini: TClientDataSet;
  end;

var
  MAIN: TMAIN;
  ActionCD: string;
  MyIme: String;
  MyTitl: string = '直销仓库管理系统(单机版) V1.05';
  {
   2019年8月： 1.05版增加了出库单中库存商品量
   2019年6月： 1.05版修改了入库、出库增加记录时使用事务功能；因Excel无法安装，所以修改了查询窗体中导出Excel的代码，从网上下载了
   相关的代码（xls.pas），实现无Excel也可导出数据到Excel文件中; 入库信息窗体增加了点击表头排序。
   2019年2月：1.04版增加了查询“全部”供应商的功能
  }

implementation

uses untfunctions, TlHelp32, Math, UGYSXX_Z, USPKCCX, USPRKXX_Z, USPCKXX_Z,
  USPJBXX_Z, USPJGJS, zDM;

{$R *.dfm}

procedure TMAIN.FormDestroy(Sender: TObject);
begin
  MyObj.Free;
end;

procedure TMAIN.ComboBoxIMEChange(Sender: TObject);
begin
  MyIme := ComboBoxIME.Text;
end;

procedure TMAIN.FormClose(Sender: TObject; var Action: TCloseAction);
var
  MyIni: Tinifile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Paramstr(0)) + 'ckgl.ini');
  MyIni.WriteString('设置', '输入法', ComboBoxIME.Text);     //保存使用的输入法
  MyIni.Free;
  Application.Terminate;
end;

procedure TMAIN.FormCreate(Sender: TObject);
var
  i, rime: Integer;
  cstr: String;
begin
  MyObj := TUserMaint.Create;
  MAIN.Caption := MyTitl;
  try
    if (Screen.Width = 1280) and (Screen.Height = 800) then
    begin
      Main.Width := 800;
      Main.Height := 566;
      Main.Left := Trunc((Screen.Width - Main.Width) / 2);
      Main.Top := Trunc((Screen.Height - Main.Height) / 2);
    end else
    if (Screen.Width = 1280) and (Screen.Height = 720) then
    begin
      Main.Width := 800;
      Main.Height := 566;
      Main.Left := Trunc((Screen.Width - Main.Width) / 2);
      Main.Top := Trunc((Screen.Height - Main.Height) / 2);
    end else
    if (Screen.Width = 1024) and (Screen.Height = 768) then
    begin
      Main.Width := 800;
      Main.Height := 566;
      Main.Position := poDesktopCenter;
    end else
    if (Screen.Width = 1680) and (Screen.Height = 1050) then
    begin
      Main.Width := 802;
      Main.Height := 570;
      Main.Position := poDesktopCenter;
    end else
    if (Screen.Width = 1920) and (Screen.Height = 1080) then
    begin
      Main.Width := 810;
      Main.Height := 570;
      Main.Position := poDesktopCenter;
    end else
    begin
      Main.Width := 800;
      Main.Height := 566;
      Main.Position := poDesktopCenter;
    end;
  except
    Application.MessageBox('请正确选择屏幕分辨率：1024X768 或 800X600 !', '提示！', 0 + 64);
    exit;
  end;
  Query := TClientDataSet.Create(nil);
//  Queryini := TClientDataSet.Create(nil);
  //获取另外一个数据集 作为和dbgrid连接
  QryShower := TClientDataSet.Create(nil);
//  cstr := 'Select * from ini ';                //查询ini库中是否存在
//  Queryini.Data := MyObj.OpenSQL(cstr);        //打开ini数据表
//  MyIme := Queryini.FieldByName('imename').AsString;
//  rime := 0;
//  sip := MyIni.ReadString('设置', 'sip', '');
  ComboBoxIME.Items.Clear;
  //将输入法加入下拉框
  for i := 0 to Screen.Imes.Count - 1 do
  begin
    ComboBoxIME.Items.Add(Screen.Imes.Strings[i]);        //获取系统安装的输入法
  end;
    ComboBoxIME.ItemIndex := 0;               //显示第一个输入法
end;

procedure TMAIN.SpeedButton1Click(Sender: TObject);
begin             //通过获取屏幕分辨率，控制窗体在桌面的位置
  Application.CreateForm(TGYSXX_Z, GYSXX_Z);
  try
    if (Screen.Width = 1280) and (Screen.Height = 800) then
    begin
//      Application.CreateForm(TGYSXX_Z, GYSXX_Z);
      GYSXX_Z.Width := 800;
      GYSXX_Z.Height := 566;
      GYSXX_Z.Left := Trunc((Screen.Width - GYSXX_Z.Width) / 2);;
      GYSXX_Z.Top := Trunc((Screen.Height - GYSXX_Z.Height) / 2);;
      ActionCD := 'M';
    end else
    if (Screen.Width = 1024) and (Screen.Height = 768) then
    begin
//      Application.CreateForm(TGYSXX_Z, GYSXX_Z);
      GYSXX_Z.Width := 800;
      GYSXX_Z.Height := 566;
      GYSXX_Z.Position := poDesktopCenter;
      ActionCD := 'M';
    end else
    begin
      GYSXX_Z.Width := 800;
      GYSXX_Z.Height := 566;
      GYSXX_Z.Position := poDesktopCenter;
      ActionCD := 'M';
    end;
  except
    Application.MessageBox('请正确选择屏幕分辨率：1024X768 或 800X600', '提示！', 0 + 64);
    exit;
  end;
  GYSXX_Z.Show;
end;

procedure TMAIN.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TSPJBXX_Z, SPJBXX_Z);
  try
    if (Screen.Width = 1280) and (Screen.Height = 800) then
    begin
//      Application.CreateForm(TSPJBXX_Z, SPJBXX_Z);
      SPJBXX_Z.Width := 800;
      SPJBXX_Z.Height := 566;
      SPJBXX_Z.Left := Trunc((Screen.Width - SPJBXX_Z.Width) / 2);;
      SPJBXX_Z.Top := Trunc((Screen.Height - SPJBXX_Z.Height) / 2);;
      ActionCD := 'M';
//      SPJBXX_Z.ShowModal;
//      SPJBXX_Z.Free;
    end else
    if (Screen.Width = 1024) and (Screen.Height = 768) then
    begin
//      Application.CreateForm(TSPJBXX_Z, SPJBXX_Z);
      SPJBXX_Z.Width := 800;
      SPJBXX_Z.Height := 566;
      SPJBXX_Z.Position := poDesktopCenter;
      ActionCD := 'M';
    end else
    begin
      SPJBXX_Z.Width := 800;
      SPJBXX_Z.Height := 566;
      SPJBXX_Z.Position := poDesktopCenter;
      ActionCD := 'M';
//      SPJBXX_Z.ShowModal;
    end;
    SPJBXX_Z.ShowModal;
  except
    Application.MessageBox('请正确选择屏幕分辨率：1024X768 或 800X600', '提示！', 0 + 64);
    exit;
  end;
end;

procedure TMAIN.SpeedButton3Click(Sender: TObject);
begin
  try
    if (Screen.Width = 1280) and (Screen.Height = 800) then
    begin
//      Application.CreateForm(TSPRKXX_Z, SPRKXX_Z);
      SPRKXX_Z.Width := 800;
      SPRKXX_Z.Height := 566;
      SPRKXX_Z.Left := Trunc((Screen.Width - SPRKXX_Z.Width) / 2);;
      SPRKXX_Z.Top := Trunc((Screen.Height - SPRKXX_Z.Height) / 2);;
      ActionCD := 'M';
      SPRKXX_Z.Show;
//      SPRKXX_Z.Free;
    end else
    if (Screen.Width = 1024) and (Screen.Height = 768) then
    begin
//      Application.CreateForm(TSPRKXX_Z, SPRKXX_Z);
      SPRKXX_Z.Width := 800;
      SPRKXX_Z.Height := 566;
      SPRKXX_Z.Position := poDesktopCenter;
      ActionCD := 'M';
      SPRKXX_Z.Show;
//      SPRKXX_Z.Free;
    end else
    begin
      SPRKXX_Z.Width := 800;
      SPRKXX_Z.Height := 566;
      SPRKXX_Z.Position := poDesktopCenter;
      ActionCD := 'M';
      SPRKXX_Z.Show;
    end;
  except
    Application.MessageBox('请正确选择屏幕分辨率：1024X768 或 800X600', '提示！', 0 + 64);
    exit;
  end;
end;

procedure TMAIN.SpeedButton4Click(Sender: TObject);
begin
  try
    if (Screen.Width = 1280) and (Screen.Height = 800) then
    begin
//      Application.CreateForm(TSPCKXX_Z, SPCKXX_Z);
      SPCKXX_Z.Width := 800;
      SPCKXX_Z.Height := 566;
      SPCKXX_Z.Left := Trunc((Screen.Width - Main.Width) / 2);;
      SPCKXX_Z.Top := Trunc((Screen.Height - Main.Height) / 2);;
      ActionCD := 'M';
      SPCKXX_Z.Show;
//      SPCKXX_Z.Free;
    end else
    if (Screen.Width = 1024) and (Screen.Height = 768) then
    begin
//      Application.CreateForm(TSPCKXX_Z, SPCKXX_Z);
      SPCKXX_Z.Width := 800;
      SPCKXX_Z.Height := 566;
      SPCKXX_Z.Position := poDesktopCenter;
      ActionCD := 'M';
      SPCKXX_Z.Show;
//      SPCKXX_Z.Free;
    end else
    begin
      SPCKXX_Z.Width := 800;
      SPCKXX_Z.Height := 566;
      SPCKXX_Z.Position := poDesktopCenter;
      ActionCD := 'M';
      SPCKXX_Z.Show;
    end;
  except
    Application.MessageBox('请正确选择屏幕分辨率：1024X768 或 800X600', '提示！', 0 + 64);
    exit;
  end;
end;
procedure TMAIN.SpeedButton5Click(Sender: TObject);
begin
  SPKCCX.Show;
end;

procedure TMAIN.SpeedButton6Click(Sender: TObject);
begin
  Close;
end;

function TMAIN.DBGridEhTitleClick(Gx: TDBGridEh; Column: TColumnEh): Boolean;    //排序
var fdn, disp, flag, ins1: string;
  Fdns, descs: string;
  tmp: string;
  pos1: integer;
  Cx: TClientDataSet;
  function GetIndexName: string;
  var s1: string;
  begin
    s1 := 'I' + DateTimeToStr(Now) + IntToStr(Random(999));
    s1 := AnsiReplaceText(s1, ' ', '');
    s1 := AnsiReplaceText(s1, '_', '');
    s1 := AnsiReplaceText(s1, ':', '');
    Result := s1;
  end;
begin
  Result := False;
  tmp := Gx.Hint;
  pos1 := pos('$', tmp);
  if pos1 > 0 then
  begin
    fdns := copy(tmp, 1, pos1 - 1);
    delete(tmp, 1, pos1);
    descs := tmp;
  end;
  if not Assigned(Gx.DataSource) then exit;
  if not Assigned(Gx.DataSource.DataSet) then exit;
  if Uppercase(Gx.DataSource.DataSet.ClassName) <> Uppercase('TClientDataSet') then exit;
  Cx := (Gx.DataSource.DataSet as TClientDataSet);
  if not Assigned(Column) then exit;
  if not Cx.Active then
  begin
    ShowMessage('数据集没有打开');
    exit;
  end;
  if Gx.DataSource.DataSet.RecordCount = 0 then exit;
  if Cx.IndexDefs.Count > 0 then  fdns := Cx.IndexDefs.Items[Cx.IndexDefs.Count - 1].Fields;
  if Cx.IndexDefs.Count > 0 then  descs := Cx.IndexDefs.Items[Cx.IndexDefs.Count - 1].DescFields;
  fdn := Cx.Fields[Column.Index].FieldName;
  disp := Cx.Fields[Column.Index].DisplayLabel;
  if pos('↓', disp) > 0 then
  begin
    flag := '↑';//如果正续排列
    if pos(fdn, fdns) = 0 then fdns := fdns + ';' + fdn;//如果没有正序,则添加
    if pos(fdn, descs) = 0 then descs := descs + ';' + fdn;//增加反序
  end
  else if pos('↑', disp) > 0 then
  begin
    flag := '';//如果无序
    fdns := AnsiReplaceText(fdns, fdn, '');
    descs := AnsiReplaceText(descs, fdn, '');
  end
  else
  begin
    flag := '↓';//如果反序
    if pos(fdn, fdns) = 0 then fdns := fdns + ';' + fdn;//增加索引
    if pos(fdn, descs) = 0 then descs := AnsiReplaceText(descs, fdn, '');//去除反续
  end;
  fdns := AnsiReplaceText(fdns, ' ', '');
  while pos(';;', fdns) > 0 do fdns := AnsiReplaceText(fdns, ';;', ';');
  if copy(fdns, 1, 1) = ';' then delete(fdns, 1, 1);
  if copy(fdns, length(fdns), 1) = ';' then delete(fdns, length(fdns), 1);
  descs := AnsiReplaceText(descs, ' ', '');
  while pos(';;', descs) > 0 do descs := AnsiReplaceText(descs, ';', ';');
  if copy(descs, 1, 1) = ';' then delete(descs, 1, 1);
  if copy(descs, length(descs), 1) = ';' then delete(descs, length(descs), 1);
  disp := flag + fdn;

  Cx.DisableControls;
  ins1 := GetIndexName;
  while Cx.IndexDefs.Count > 0 do Cx.DeleteIndex(Cx.IndexDefs.Items[0].Name);
  Cx.IndexName := '';
  Cx.AddIndex(ins1, fdns, [ixCaseInsensitive], descs, '', 0);
  Cx.IndexName := ins1;
  Cx.Fields[Column.Index].DisplayLabel := flag + fdn;
  Cx.First;
  Cx.EnableControls;
  Gx.Hint := fdns + '$' + descs;
  pos1 := cx.IndexDefs.Count;
  Result := True;
end;
function TMAIN.DBGridTitleClick(Gx: TDBGrid; Column: TColumn): Boolean;    //排序
var fdn, disp, flag, ins1: string;
  Fdns, descs: string;
  tmp: string;
  pos1: integer;
  Cx: TClientDataSet;
  function GetIndexName: string;
  var s1: string;
  begin
    s1 := 'I' + DateTimeToStr(Now) + IntToStr(Random(999));
    s1 := AnsiReplaceText(s1, ' ', '');
    s1 := AnsiReplaceText(s1, '_', '');
    s1 := AnsiReplaceText(s1, ':', '');
    Result := s1;
  end;
begin
  Result := False;
  tmp := Gx.Hint;
  pos1 := pos('$', tmp);
  if pos1 > 0 then
  begin
    fdns := copy(tmp, 1, pos1 - 1);
    delete(tmp, 1, pos1);
    descs := tmp;
  end;
  if not Assigned(Gx.DataSource) then exit;
  if not Assigned(Gx.DataSource.DataSet) then exit;
  if Uppercase(Gx.DataSource.DataSet.ClassName) <> Uppercase('TClientDataSet') then exit;
  Cx := (Gx.DataSource.DataSet as TClientDataSet);
  if not Assigned(Column) then exit;
  if not Cx.Active then
  begin
    ShowMessage('数据集没有打开');
    exit;
  end;
  if Gx.DataSource.DataSet.RecordCount = 0 then exit;
  if Cx.IndexDefs.Count > 0 then  fdns := Cx.IndexDefs.Items[Cx.IndexDefs.Count - 1].Fields;
  if Cx.IndexDefs.Count > 0 then  descs := Cx.IndexDefs.Items[Cx.IndexDefs.Count - 1].DescFields;
  fdn := Cx.Fields[Column.Index].FieldName;
  disp := Cx.Fields[Column.Index].DisplayLabel;
  if pos('↓', disp) > 0 then
  begin
    flag := '↑';//如果正续排列
    if pos(fdn, fdns) = 0 then fdns := fdns + ';' + fdn;//如果没有正序,则添加
    if pos(fdn, descs) = 0 then descs := descs + ';' + fdn;//增加反序
  end
  else if pos('↑', disp) > 0 then
  begin
    flag := '';//如果无序
    fdns := AnsiReplaceText(fdns, fdn, '');
    descs := AnsiReplaceText(descs, fdn, '');
  end
  else
  begin
    flag := '↓';//如果反序
    if pos(fdn, fdns) = 0 then fdns := fdns + ';' + fdn;//增加索引
    if pos(fdn, descs) = 0 then descs := AnsiReplaceText(descs, fdn, '');//去除反续
  end;
  fdns := AnsiReplaceText(fdns, ' ', '');
  while pos(';;', fdns) > 0 do fdns := AnsiReplaceText(fdns, ';;', ';');
  if copy(fdns, 1, 1) = ';' then delete(fdns, 1, 1);
  if copy(fdns, length(fdns), 1) = ';' then delete(fdns, length(fdns), 1);
  descs := AnsiReplaceText(descs, ' ', '');
  while pos(';;', descs) > 0 do descs := AnsiReplaceText(descs, ';', ';');
  if copy(descs, 1, 1) = ';' then delete(descs, 1, 1);
  if copy(descs, length(descs), 1) = ';' then delete(descs, length(descs), 1);
  disp := flag + fdn;

  Cx.DisableControls;
  ins1 := GetIndexName;
  while Cx.IndexDefs.Count > 0 do Cx.DeleteIndex(Cx.IndexDefs.Items[0].Name);
  Cx.IndexName := '';
  Cx.AddIndex(ins1, fdns, [ixCaseInsensitive], descs, '', 0);
  Cx.IndexName := ins1;
  Cx.Fields[Column.Index].DisplayLabel := flag + fdn;
  Cx.First;
  Cx.EnableControls;
  Gx.Hint := fdns + '$' + descs;
  pos1 := cx.IndexDefs.Count;
  Result := True;
end;

procedure TMAIN.Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y:
    Integer);
begin
  SpeedButton1.Caption := '供应商信息';
  SpeedButton2.Caption := '商品基本信息';
  SpeedButton3.Caption := '商品入库信息';
  SpeedButton4.Caption := '商品出库信息';
  SpeedButton5.Caption := '商 品 查 询';
  SpeedButton12.Caption := '商品价格计算';
  SpeedButton6.Caption := '退 出 系 统';
end;

procedure TMAIN.SpeedButton10Click(Sender: TObject);
begin          //计算器
  ShellExecute(handle, 'open', 'calc.exe', nil, nil, sw_shownormal);
end;

procedure TMAIN.SpeedButton11Click(Sender: TObject);
begin                                       //关于
//  Application.CreateForm(TABOUT, ABOUT);
//  ABOUT.ShowModal;
//  ABOUT.Free;
end;

procedure TMAIN.SpeedButton12Click(Sender: TObject);
begin
  SPJGJS.Show;
end;

procedure TMAIN.SpeedButton12MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);            //鼠标移动到该按钮时
begin
  SpeedButton1.Caption := '供应商信息';
  SpeedButton2.Caption := '商品基本信息';
  SpeedButton3.Caption := '商品入库信息';
  SpeedButton4.Caption := '商品出库信息';
  SpeedButton5.Caption := '商 品 查 询';
  SpeedButton12.Caption := '  商品价格计算';
  SpeedButton6.Caption := '退 出 系 统';
end;

procedure TMAIN.SpeedButton13Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    MyObj.ChangeDB(OpenDialog1.FileName);
//    LabStatBar.Caption := DataModel.Coner.database;    //显示数据库路径
  end;
end;

procedure TMAIN.SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
begin
  SpeedButton1.Caption := '  供应商信息';
  SpeedButton2.Caption := '商品基本信息';
  SpeedButton3.Caption := '商品入库信息';
  SpeedButton4.Caption := '商品出库信息';
  SpeedButton5.Caption := '商 品 查 询';
  SpeedButton12.Caption := '商品价格计算';
  SpeedButton6.Caption := '退 出 系 统';
end;

procedure TMAIN.SpeedButton2MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
begin
  SpeedButton1.Caption := '供应商信息';
  SpeedButton2.Caption := '  商品基本信息';
  SpeedButton3.Caption := '商品入库信息';
  SpeedButton4.Caption := '商品出库信息';
  SpeedButton5.Caption := '商 品 查 询';
  SpeedButton12.Caption := '商品价格计算';
  SpeedButton6.Caption := '退 出 系 统';
end;

procedure TMAIN.SpeedButton3MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
begin
  SpeedButton1.Caption := '供应商信息';
  SpeedButton2.Caption := '商品基本信息';
  SpeedButton3.Caption := '  商品入库信息';
  SpeedButton4.Caption := '商品出库信息';
  SpeedButton5.Caption := '商 品 查 询';
  SpeedButton12.Caption := '商品价格计算';
  SpeedButton6.Caption := '退 出 系 统';
end;

procedure TMAIN.SpeedButton4MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
begin
  SpeedButton1.Caption := '供应商信息';
  SpeedButton2.Caption := '商品基本信息';
  SpeedButton3.Caption := '商品入库信息';
  SpeedButton4.Caption := '  商品出库信息';
  SpeedButton5.Caption := '商 品 查 询';
  SpeedButton12.Caption := '商品价格计算';
  SpeedButton6.Caption := '退 出 系 统';
end;

procedure TMAIN.SpeedButton5MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
begin
  SpeedButton1.Caption := '供应商信息';
  SpeedButton2.Caption := '商品基本信息';
  SpeedButton3.Caption := '商品入库信息';
  SpeedButton4.Caption := '商品出库信息';
  SpeedButton5.Caption := '   商 品 查 询';
  SpeedButton12.Caption := '商品价格计算';
  SpeedButton6.Caption := '退 出 系 统';
end;

procedure TMAIN.SpeedButton6MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
begin
  SpeedButton1.Caption := '供应商信息';
  SpeedButton2.Caption := '商品基本信息';
  SpeedButton3.Caption := '商品入库信息';
  SpeedButton4.Caption := '商品出库信息';
  SpeedButton5.Caption := '商 品 查 询';
  SpeedButton12.Caption := '商品价格计算';
  SpeedButton6.Caption := '  退 出 系 统';
end;

procedure TMAIN.SpeedButton7Click(Sender: TObject);
begin     //备份
  MyObj.BackupFile;
end;

procedure TMAIN.SpeedButton8Click(Sender: TObject);
begin       //恢复
  MyObj.RestoreFile;
end;

procedure TMAIN.SpeedButton9Click(Sender: TObject);
begin
   //记事本
  ShellExecute(handle, 'open', 'notepad.exe', nil, nil, sw_shownormal);
end;

procedure TMAIN.Timer1Timer(Sender: TObject);
begin
//  Label2.Caption := '路径：' + Auser.UserName;
  Label1.Caption := '系统时间：' + DateTimeToStr(now);
end;

end.

