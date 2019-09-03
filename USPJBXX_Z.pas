unit USPJBXX_Z;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms, 
  Grids, DBGrids, ExtCtrls, DBCtrls, Buttons, ComCtrls, dbclient,
  StdCtrls, Controls, ToolWin, DB, uUserMaint;

type
  TSPJBXX_Z = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    btSPCount: TButton;
    DS_JBXX: TDataSource;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    procedure QDelete(str: String);
    procedure ShowData;
{ Public declarations }
  end;

var
  SPJBXX_Z: TSPJBXX_Z;
  QueryJB: TClientDataSet;

implementation

uses zMAIN, USPJBXX;

{$R *.dfm}

procedure TSPJBXX_Z.QDelete(str: String);
begin              //删除记录
  MyObj.ExecSQL('Delete From SPJBXX Where SP_NOMB=''' + str + '''');
  ShowData;
end;

procedure TSPJBXX_Z.SpeedButton3Click(Sender: TObject);
begin
//  QueryJB.Free;
  Close;
end;

procedure TSPJBXX_Z.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TSPJBXX, SPJBXX);
//  SPJBXX.GetAll;
  ActionCD := 'M';
  SPJBXX.Top := 248;
  SPJBXX.ShowModal;
end;

procedure TSPJBXX_Z.FormCreate(Sender: TObject);
begin
  QueryJB := TClientDataSet.Create(self);  //出库信息表
  ShowData;
end;

procedure TSPJBXX_Z.ShowData;
var
  str: String;
begin                             //创建窗体时，打开数据库
  DBGrid1.DataSource := DS_JBXX;
  str := 'Select GYSNAME 供应商名称,SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称,SP_BZQ 保质期,SP_GG 规格,SP_SCD 产地,SP_UNIT 单位,SP_JINJA 进价,SP_PIFAJA 批发价,SP_XIAOSOJA 销售价,SP_MEMO 备注,GYS_NOMB 供应商编号  ';
  str := str + ' From SPJBXX,GYSXX Where SP_GYSID=GYS_NOMB';
  str := str + ' Order by 2 desc';
  QueryJB.IndexName:='';
  QueryJB.Data := MyObj.OpenSQL(str);  //打开商品数据表
  DS_JBXX.DataSet := QueryJB;
  if QueryJB.RecordCount <> 0 then
  begin
    DBGrid1.Columns[0].Width := 60;
    DBGrid1.Columns[1].Width := 90;
    DBGrid1.Columns[2].Width := 108;
    DBGrid1.Columns[3].Width := 80;
    DBGrid1.Columns[4].Width := 50;
    DBGrid1.Columns[5].Width := 50;
    DBGrid1.Columns[6].Width := 50;
    DBGrid1.Columns[7].Width := 40;
    DBGrid1.Columns[8].Width := 40;
    DBGrid1.Columns[9].Width := 40;
    DBGrid1.Columns[10].Width := 40;
    DBGrid1.Columns[11].Width := 120;
    DBGrid1.Columns[12].visible := False;
//  DBGrid1.Columns[13].Width := 110;
//  DBGrid1.Columns[12].Width := 60;
//  DBGrid1.Columns[13].Width := 50;
//  DBGrid1.Columns[14].Width := 70;
//  DBGrid1.Columns[15].Width := 70;
//  DBGrid1.Columns[16].Width := 70;
//  DBGrid1.Columns[17].Width := 70;
  end;
  btSPCount.Caption := '记录: ' + IntToStr(QueryJB.RecordCount);
end;

procedure TSPJBXX_Z.SpeedButton2Click(Sender: TObject);
begin
  if QueryJB.RecordCount = 0 then         //判断数据库内是否有数据
  begin
    Application.MessageBox('已无记录可删除!', '提示', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if QueryJB.IsEmpty then
    exit;
  if ID_YES = application.MessageBox('确实要删除这条记录吗？', '提示', MB_YESNO) then
  begin
    QDelete(QueryJB.FieldByName('商品编号').AsString);
  end;
  btSPCount.Caption := '记录: ' + IntToStr(QueryJB.RecordCount);
end;

procedure TSPJBXX_Z.DBGrid1DblClick(Sender: TObject);
begin
  Application.CreateForm(TSPJBXX, SPJBXX);   //创建窗体
  SPJBXX.GetAll;
  ActionCD := 'M';
  SPJBXX.ShowModal;
//  SPJBXX.Free;
end;

procedure TSPJBXX_Z.DBGrid1TitleClick(Column: TColumn);
begin
  MAIN.DBGridTitleClick(DBGrid1, Column);
end;

end.

