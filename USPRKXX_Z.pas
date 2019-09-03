unit USPRKXX_Z;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Grids, DBGrids, ExtCtrls, DBCtrls, Buttons, ToolWin, ComCtrls,
  dbclient, UntRemSql, untfunctions, StdCtrls, DB, ComObj, DBGridEhGrouping,
  StrUtils, RzDBCmbo, Mask, RzEdit, SUIDBCtrls, GridsEh, DBGridEh, TntStdCtrls,
  RzCmboBx, SUIComboBox, AdvCombo, Graphics, ToolCtrlsEh, uUserMaint;

type
  TSPRKXX_Z = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBNavigator1: TDBNavigator;
    RKJLS: TButton;
    DS_RK: TDataSource;
    DBGridEh1: TDBGridEh;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:
      Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh; AFont:
      TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure QDelete(str: String);
    procedure TZ_KCB;              //调整库存表中的存量
    procedure ShowData;
    procedure DBGridEhColumns;

    { Public declarations }
  end;

var
  SPRKXX_Z: TSPRKXX_Z;
  QueryRK: TClientDataSet;
  astr: string;
  acc: TColor;

implementation

uses zMAIN, USPRKXX_Adv;

{$R *.dfm}

procedure TSPRKXX_Z.TZ_KCB;              //调整库存表中的存量   DM.QSPRKXX
var
  Qstr, CxTj: string;
  QTYS: Integer;
  QueryCL: TClientDataSet;
begin
  CxTj := '(KCSP_SP_NOMB=''' + QueryRK.FieldByName('商品编号').AsString + ''') and (KCSP_QX=''' + QueryRK.FieldByName('产品期限').AsString + ''')';     //查询条件
  QueryCL := TClientDataSet.Create(self);  //出库信息表
  Qstr := 'Select * From KCB Where ' + CxTj;
  QueryCL.Data := MyObj.OpenSQL(Qstr);  //打开数据表
  QTYS := QueryCL.fieldbyname('KCSP_QTY').AsInteger - QueryRK.FieldByName('入库数量').AsInteger;  //修改数量
  if QTYS < 0 then
  begin
    Application.MessageBox('删除该记录后，库存为负，不能删除！', '提示', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if QTYS = 0 then           //库存为零，删除库存记录
  begin
    MyObj.ExecSql('Delete From kcb Where ' + CxTj);
//      Application.MessageBox('已无记录不可删除!', '提示', 0 + MB_ICONINFORMATION);
//    exit;
  end else                   //否则更新库存量
  begin
    MyObj.ExecSql('Update kcb set KCSP_QTY=' + IntToStr(qtys) + ' Where ' + CxTj);
  end;
//  QueryCL.Free;
end;

procedure TSPRKXX_Z.QDelete(str: String);
begin              //删除记录
  MyObj.ExecSql('Delete From SPRKXX Where RK_NOMB=''' + str + '''');
  ShowData;
end;

procedure TSPRKXX_Z.SpeedButton1Click(Sender: TObject);
begin
//  Application.CreateForm(TSPRKXX, SPRKXX);      //创建商品入库信息主窗体
  ActionCD := 'M';
//  SPRKXX.GetAll;
  SPRKXX_Adv.ShowModal;
//  SPRKXX.ShowModal;
//  SPRKXX_G.ShowModal;
//  SPRKXX.Free;
end;

procedure TSPRKXX_Z.SpeedButton3Click(Sender: TObject);
begin
//  QueryRK.Free;
  Close;
end;

procedure TSPRKXX_Z.FormCreate(Sender: TObject);
begin
  acc := $FFFFFF;
  DBGridEh1.ShowHint := True;
end;

procedure TSPRKXX_Z.ShowData;
var
  str: string;
begin                                    //RK_NOMB 入库编号,   GYS_NOMB 供应商编号,
  DBGridEh1.DataSource := DS_RK;
  DBNavigator1.DataSource := DS_RK;
  str := 'Select GYSNAME 供应商名称,SP_NAME 商品名称,SP_JNAME 商品简称,SP_GG 规格,SP_JINJA 进价,SP_PIFAJA 批发价,';
  str := str + ' SP_XIAOSOJA 销售价 ,RK_TYPE 入库类型,RK_DH 货单号,RK_DATE 入库日期,RK_QX 产品期限,RK_QTY 入库数量,';
  str := str + ' CUST_NAME 来源,RK_JSR 经手人,RK_MEMO 备注,SP_SCD 产地,SP_UNIT 单位,RK_NOMB 入库编号,GYS_NOMB 供应商编号,SP_NOMB 商品编号,RK_ID';
  str := str + ' From SPJBXX a,GYSXX b,SPRKXX d, CUST c ';
  str := str + ' Where (a.SP_GYSID=b.GYS_NOMB) and (a.SP_NOMB=d.RK_SP_NOMB) and (c.CUST_ID=d.RK_FROMID)';
  str := str + ' Order by RK_ID desc';
  QueryRK.IndexName := '';
  QueryRK.Data := MyObj.OpenSQL(str);   //打开商品数据表
  DS_RK.DataSet := QueryRK;
//  if QueryRK.RecordCount <> 0 then
//  begin
//    DBGrid1.Columns[0].Width := 70;
//    DBGrid1.Columns[1].Width := 90;       //
//    DBGrid1.Columns[2].Width := 76;       //  商品简称
//    DBGrid1.Columns[3].Width := 42;
//    DBGrid1.Columns[4].Width := 46;
//    DBGrid1.Columns[5].Width := 46;
//    DBGrid1.Columns[6].Width := 50;       //销售价
//    DBGrid1.Columns[7].Width := 50;       //入库类型
//    DBGrid1.Columns[8].Width := 50;       //货单号
//    DBGrid1.Columns[9].Width := 65;       //入库日期
//    DBGrid1.Columns[10].Width := 52;
//    DBGrid1.Columns[11].Width := 50;      //入库数量
//    DBGrid1.Columns[12].Width := 50;        //来源
//    DBGrid1.Columns[13].Width := 40;
//    DBGrid1.Columns[14].Width := 80;       //备注
//    DBGrid1.Columns[15].Width := 50;
//    DBGrid1.Columns[19].Width := 50;       //商品编号
//    DBGrid1.Columns[20].Visible := False;
//    DBGrid1.Columns[1].Visible := False;
//    DBGrid1.Columns[5].Visible := False;
//    DBGrid1.Columns[16].Visible := False;
//    DBGrid1.Columns[16].Visible := False;
//    DBGrid1.Columns[17].Visible := False;
//    DBGrid1.Columns[18].Visible := False;
//  end;
  DBGridEhColumns;
  RKJLS.Caption := '记录：' + IntToStr(QueryRK.ReCordCount);
end;

procedure TSPRKXX_Z.DBGridEhColumns;
begin
  if QueryRK.RecordCount <> 0 then
  begin
    DBGridEh1.Columns[0].Width := 70;
    DBGridEh1.Columns[1].Width := 90;       //
    DBGridEh1.Columns[2].Width := 76;       //  商品简称
    DBGridEh1.Columns[3].Width := 42;
    DBGridEh1.Columns[4].Width := 46;
    DBGridEh1.Columns[5].Width := 46;
    DBGridEh1.Columns[6].Width := 50;       //销售价
    DBGridEh1.Columns[7].Width := 50;       //入库类型
    DBGridEh1.Columns[8].Width := 50;       //货单号
    DBGridEh1.Columns[9].Width := 65;       //入库日期
    DBGridEh1.Columns[10].Width := 52;
    DBGridEh1.Columns[11].Width := 50;      //入库数量
    DBGridEh1.Columns[12].Width := 50;        //来源
    DBGridEh1.Columns[13].Width := 40;
    DBGridEh1.Columns[14].Width := 80;       //备注
    DBGridEh1.Columns[15].Width := 50;
    DBGridEh1.Columns[19].Width := 50;       //商品编号
    DBGridEh1.Columns[20].Visible := False;
    DBGridEh1.Columns[1].Visible := False;
    DBGridEh1.Columns[5].Visible := False;
    DBGridEh1.Columns[15].Visible := False;
    DBGridEh1.Columns[16].Visible := False;
    DBGridEh1.Columns[17].Visible := False;
    DBGridEh1.Columns[18].Visible := False;
    DBGridEh1.Columns[19].Visible := False;
  end;
end;

procedure TSPRKXX_Z.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  QueryRK.Free;
end;

procedure TSPRKXX_Z.DBGrid1DblClick(Sender: TObject);
begin
//  Application.CreateForm(TSPRKXX, SPRKXX);
  ActionCD := 'M';
  SPRKXX_Adv.GetAll;
  SPRKXX_Adv.ShowModal;
//  SPRKXX.Free;
end;

procedure TSPRKXX_Z.DBGridEh1DblClick(Sender: TObject);
begin
  ActionCD := 'M';
  SPRKXX_Adv.GetAll;
  SPRKXX_Adv.ShowModal;
end;

procedure TSPRKXX_Z.DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if DBGridEh1.Fields[9].AsString = astr then
  begin
//    DBGrid1.Canvas.Font.Color := clBlue;
    DBGridEh1.Canvas.Brush.Color := acc;
    DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end else
  begin
    if acc = $FFFFFF then
      DBGridEh1.Canvas.Brush.Color := $EEEEAF   else     //  $96D2C8
      DBGridEh1.Canvas.Brush.Color := $FFFFFF;
//  DBGrid1.Canvas.Font.Color:=clWhite;
    DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if DataCol = 3 then
  begin
    astr := DBGridEh1.Fields[9].AsString;
    acc := DBGridEh1.Canvas.Brush.Color;
  end;
  if gdSelected in state then
  begin
      DBGridEh1.Canvas.Font.Color := $FFFFF0; //clRed;
      DBGridEh1.Canvas.Brush.Color := $228B22;//$32CD32; //$008CFF; //clBlue;
    DBGridEh1.DefaultDrawColumnCell(rect, datacol, column, state);
  end;
end;

procedure TSPRKXX_Z.DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
//在 name 字段值为 aaa 的行设置行背景色（ado 设置情况下）
  if DBGridEh1.Fields[9].AsString = astr then
    Background := acc   //  $EEEEAF
//在 xm 字段值为 Li ming 的行设置行背景色（bde 设置情况下）
  else
    if acc = $FFFFFF then
    Background := $EEEEAF else        // clGreen;
    Background := $FFFFFF;
//      DBGridEh1.Canvas.Brush.Color := $EEEEAF   else     //  $96D2C8
//      DBGridEh1.Canvas.Brush.Color := $FFFFFF;
  if Column.Field.DisplayName = '商品简称' then
  begin
    astr := DBGridEh1.Fields[9].AsString;
    acc := DBGridEh1.Canvas.Brush.Color;
  end;
end;

procedure TSPRKXX_Z.DBGridEh1TitleClick(Column: TColumnEh);
begin
  MAIN.DBGridEhTitleClick(DBGridEh1, Column);
end;

procedure TSPRKXX_Z.FormShow(Sender: TObject);
begin
  if QueryRK = nil then
    QueryRK := TClientDataSet.Create(self);  //出库信息表
  ShowData;
end;

procedure TSPRKXX_Z.SpeedButton2Click(Sender: TObject);
begin
  if QueryRK.RecordCount = 0 then        //判断数据库内是否有记录
  begin
    Application.MessageBox('已无记录可删除!', '提示', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if QueryRK.IsEmpty then
    exit;
  if ID_YES = application.MessageBox('确实要删除这条记录吗？', '提示', MB_YESNO) then
  begin
    TZ_KCB;              //调整库存表中的存量
    QDelete(QueryRK.FieldByName('入库编号').AsString);  //删除记录
    Showdata;
  end;
end;

procedure TSPRKXX_Z.SpeedButton4Click(Sender: TObject);
begin
  ShowData;
end;

end.
