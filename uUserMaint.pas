//逻辑分离后的业务单元代码
unit uUserMaint;

interface

uses
  xls,   //写excel文件核心类
  Graphics, Dialogs, comobj,jpeg, ADODB,db,StdCtrls,Grids, DBGrids,

  Windows, Messages, SysUtils, Variants, Classes, DBClient, ZAbstractConnection, ZConnection,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, shellapi, Forms, zDM, 
  Controls, ComCtrls, ExtCtrls, WinSock;
  function pSaveDialog : String;

type
  TUserMaint = class(TObject)
    AUserDM: TDModule;
  private
    function FindStr(ShortStr: String; LongStrIng: String): integer;

  public
    constructor create;                    //构造函数
    destructor Destroy; override;          //析构函数
    procedure cChk4;
    procedure cChKC_GYS;
    function OpenSQL(str: string): OleVariant;
    function CustSQL(str: string): OleVariant;
//    procedure CustSQL(str: string);
    procedure ExecSQL(str: string);
    procedure OpenTable(ItabName: string; Iado: TClientDataSet);
    procedure BackupFile;
    procedure ChangeDB(FileName: String);
    procedure RestoreFile;
    procedure StarTrans;
    procedure ComTrans;
    procedure RollTrans;
    procedure DataSetToExcel(MydataSet:tdataset);  //数据集导入Excel文件
    procedure DataSetToExcelw(MydataSet: tdataset; cArray: array of Integer);  //数据集导入Excel文件，数组传入列宽值
    procedure SetProviderName(ACds: TClientDataSet);

  end;

var
  MyObj: TUserMaint;               //全局变量

implementation

uses USPKCCX, zMain;

{
******************************* TUserMaint
}
constructor TUserMaint.create;
begin
  AUserDM := TDModule.Create(nil);          //创建AUserDM对象(实例)
  MAIN.LabStatBar.Caption := AUserDM.ZUser.database;    //在状态栏显示数据库路径
end;

function pSaveDialog : String;     //打开保存文件
var
  SaveDialog1 : TSaveDialog;
begin
     SaveDialog1:=TSaveDialog.Create(nil);
     SaveDialog1.FileName:='';
     SaveDialog1.Filter:='Excel files (*.xls) | *.xls';
     SaveDialog1.DefaultExt:='xls';
     SaveDialog1.Execute;
     Result := SaveDialog1.FileName;
end;

destructor TUserMaint.Destroy;
begin
  FreeAndNil(AUserDM);
  inherited;
end;

procedure TUserMaint.SetProviderName(ACds: TClientDataSet);
begin
  ACds.ProviderName := 'DModule.DP_Cust';
end;

procedure TUserMaint.BackupFile;
var
  Str_Path, Str_File: string;
begin
  Str_File := ExtractFileName(AUserDM.ZUser.database);          //获取数据库文件名
  Str_Path := ExtractFilePath(Paramstr(0)) + 'databack\' + Copy(Str_File, 1, findStr('.', Str_File) - 1) + '.bak';    //在子文件夹中生成带bak扩展名的备份文件名
  Str_File := ExtractFilePath(Paramstr(0)) + Str_File;
  if CopyFile(Pchar(Str_File), Pchar(Str_Path), False) then
    MessageBox(Application.Handle, PChar('数据备份成功'), PChar('提示'), 64)
  else
    MessageBox(Application.Handle, PChar('数据备份失败'), PChar('提示'), 64);
end;

procedure TUserMaint.cChk4;
begin
  with SPKCCX do
  begin
    if chk4.Checked then
    begin
      ComboBoxGYS2.Enabled := True;
    end
    else
    begin
      ComboBoxGYS2.Enabled := False;
    end;
  end;
  // TODO -cMM: TUserMaint.cChk4 default body inserted
end;

procedure TUserMaint.cChKC_GYS;
begin
  with SPKCCX do
  begin
    if chkC_GYS.Checked then
    begin
      ComboBoxGYS1.Enabled := True;
    end
    else
    begin
      ComboBoxGYS1.Enabled := False;
    end;
  end;
end;

procedure TUserMaint.ChangeDB(FileName: String);    //更换数据库
begin
  with AUserDM.ZUser do begin
    Connected := False;               //断开
//连接Sqlite
    database := FileName;
    AUserDM.ZUser.Connect;                          //连接
  end;
  MAIN.LabStatBar.Caption := AUserDM.ZUser.database;    //在状态栏显示数据库路径
end;

function TUserMaint.CustSQL(str: string): OleVariant;
begin
//  with DModule do
  with AUserDM do
    try
      if not ZUser.Connected then
        ZUser.Connected := True;
      with CustQry do
      begin
        Close;
        SQL.Clear;
        SQL.Add(str);
        Open;
        Result := DP_Cust.Data;
      end;
    except
      ZUser.Connected := False;
    end;
end;

function TUserMaint.OpenSQL(str: string): OleVariant;
begin
  with AUserDM do
    try
      if not ZUser.Connected then
        ZUser.Connected := True;
      with Gqry do
      begin
        Close;
        SQL.Clear;
        SQL.Add(str);
        Open;
        Result := dp.Data;
      end;
    except
      ZUser.Connected := False;
    end;
end;

procedure TUserMaint.ExecSQL(str: string);
begin
  with AUserDM do
    try
      if not ZUser.Connected then
        ZUser.Connected := True;
      with Gqry do
      begin
        Close;
        SQL.Clear;
        SQL.Add(str);
        ExecSQL;
      end;
    except
      ZUser.Connected := False;
    end;
end;

function TUserMaint.FindStr(ShortStr: String; LongStrIng: String): integer;
var
  locality: integer;
begin
  locality := Pos(ShortStr, LongStrIng);
  if locality = 0 then
    Result := 0
  else
    Result := locality;
end;

procedure TUserMaint.OpenTable(ItabName: string; Iado: TClientDataSet);
begin
  with Iado do begin
    Close;
    CommandText := Format('Select RK_NOMB from %s ', [ItabName]);
    Open;
  end; //
end;

procedure TUserMaint.RestoreFile;
var
  ExePath, Str_Path, Str_File: string;
begin
  Str_File := ExtractFileName(AUserDM.ZUser.database);          //获取数据库文件名
  Str_Path := ExtractFilePath(Paramstr(0)) + 'databack\' + Copy(Str_File, 1, findStr('.', Str_File) - 1) + '.bak';    //在子文件夹中生成带bak扩展名的备份文件名

 // Str_Path := ExtractFilePath(Paramstr(0)) + 'databack\ckgls.bak';   //备份路径
//  ExePath := ExtractFilePath(Paramstr(0)) + 'ckgls.md';                  //目的路径
  ExePath := ExtractFilePath(Paramstr(0)) + Str_File;                  //目的路径
  if Application.MessageBox('恢复数据将导致现在的数据丢失，并不可恢复，你确认吗？', '提示', Mb_YesNo or Mb_IconQuestion) = IdYes then
  begin
    try
      AUserDM.ZUser.Connected := False;               //断开
      if CopyFile(Pchar(Str_Path), Pchar(ExePath), False) then
      begin
        MessageBox(Application.Handle, PChar('数据恢复成功'), PChar('提示'), 64);
        AUserDM.ZUser.Connect;                       //连接
        MAIN.LabStatBar.Caption := AUserDM.ZUser.database;    //在状态栏显示数据库路径
      end else
        MessageBox(Application.Handle, PChar(
          '数据恢复失败'), PChar('提示'), 64);
    except
      MessageBox(Application.Handle, PChar(
        '数据恢复失败'), PChar('提示'), 64);
    end;
  end;
end;

procedure TUserMaint.StarTrans;     //事务开始
begin
  with AUserDM do
  begin
    if not ZUser.Connected then     //是否连接
      ZUser.Connected := True;
    if not ZUser.InTransaction then
      ZUser.StartTransaction;
    end;
end;

procedure TUserMaint.ComTrans;      //事务结束
begin
  with AUserDM do  begin
    if not ZUser.Connected then
      ZUser.Connected := True;
    AUserDM.ZUser.Commit;
    ZUser.Connected := False;
  end;
end;

procedure TUserMaint.RollTrans;     //事务回滚
begin
  with AUserDM do
  begin
    if not ZUser.Connected then
      ZUser.Connected := True;
    AUserDM.ZUser.Rollback;
    ZUser.Connected := False;
  end;
end;

procedure TUserMaint.DataSetToExcel(MydataSet:tdataset);
var
    FileHandle : Integer;
    tt:string;
    x,y:integer;
begin
  if  MydataSet.Active=false     then exit;
  if  MydataSet.RecordCount<1   then exit ;
  tt:= pSaveDialog;
  if tt='' then exit;

  Screen.Cursor := crHourGlass;
  FileHandle := Xls_Create(tt);
  Xls_SetFormat(FileHandle,'yyyy-mm-dd hh:mm:ss');

  with MydataSet do
  begin
    Open;
    DisableControls;
    First;
    for y:= 0 to FieldCount-1 do
      Xls_SetString(FileHandle, 0, y,Fields[y].FieldName);
    for x:=0 to RecordCount-1 do
    begin
      for y:=0 to FieldCount-1 do
      begin
        if FieldTypeNames[Fields[y].datatype]='WideString'  then
          Xls_SetString(FileHandle, x+1, y,Fields[y].AsString)
        else if FieldTypeNames[Fields[y].datatype]='LargeInt'  then
            Xls_SetInteger(FileHandle, x+1, y,Fields[y].Asinteger)
        else if FieldTypeNames[Fields[y].datatype]='Integer'  then
              Xls_SetInteger(FileHandle, x+1, y,Fields[y].Asinteger)
        else if FieldTypeNames[Fields[y].datatype]='BCD'   then
          Xls_SetDouble(FileHandle, x+1, y,Fields[y].Asfloat)
        else  Xls_SetString(FileHandle, x+1, y,Fields[y].AsString);
        Application.ProcessMessages;
      end;
      next;
    end;
    first;
    EnableControls;
  end;
  Xls_Close (FileHandle);
  Screen.Cursor := crDefault;
  showmessage('数据导出完毕！');
end;

procedure TUserMaint.DataSetToExcelw(MydataSet: tdataset; cArray: array of Integer);
var
  FileHandle: Integer;
  tt: string;
  x, y: integer;
begin
  if MydataSet.Active = false then exit;
  if MydataSet.RecordCount < 1 then exit;
     tt:= pSaveDialog;
  if tt = '' then exit;

  Screen.Cursor := crHourGlass;
  FileHandle := Xls_Create(tt);
  Xls_SetFormat(FileHandle, 'yyyy-mm-dd hh:mm:ss');

  with MydataSet do
  begin
    Open;
    DisableControls;
    First;
    for y := 0 to FieldCount - 1 do          //字段数
    begin
      Xls_SetString(FileHandle, 0, y, Fields[y].FieldName);    //列名称
      Xls_SetColWidth(FileHandle, y, cArray[y]);               //列宽
    end;
    
    for x := 0 to RecordCount - 1 do         //记录数
    begin
      for y := 0 to FieldCount - 1 do        //字段数
      begin
        if FieldTypeNames[Fields[y].datatype] = 'WideString' then
          Xls_SetString(FileHandle, x + 1, y, Fields[y].AsString)
        else if FieldTypeNames[Fields[y].datatype] = 'LargeInt' then
          Xls_SetInteger(FileHandle, x + 1, y, Fields[y].Asinteger)
        else if FieldTypeNames[Fields[y].datatype] = 'Integer' then
          Xls_SetInteger(FileHandle, x + 1, y, Fields[y].Asinteger)
        else if FieldTypeNames[Fields[y].datatype] = 'BCD' then
          Xls_SetDouble(FileHandle, x + 1, y, Fields[y].Asfloat)
        else Xls_SetString(FileHandle, x + 1, y, Fields[y].AsString);
        Application.ProcessMessages;
      end;
      next;
    end;
    first;
    EnableControls;
  end;
  Xls_Close(FileHandle);
  Screen.Cursor := crDefault;
  showmessage('数据导出完毕！');
end;

end.
