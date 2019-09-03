unit USPCKXX_Z;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DBCtrls, Buttons, ToolWin, ComCtrls,
  dbclient, UntRemSql, untfunctions, StdCtrls, DB, uUserMaint;

type
  TSPCKXX_Z = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    RKJLS: TButton;
    DS_CK: TDataSource;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure QDelete(str: String);
    procedure TZ_KCB;              //调整库存表中的存量   
    procedure ShowData;

    { Public declarations }
  end;

var
  SPCKXX_Z: TSPCKXX_Z;
  QueryCK: TClientDataSet;

implementation

uses zMAIN, ZAbstractRODataset, USPCKXX_SG, USPCKXX;

{$R *.dfm}

procedure TSPCKXX_Z.QDelete(str: String);
begin              //删除记录
  MyObj.ExecSQL('Delete From SPCKXX Where CK_NOMB=''' + str + '''');
  ShowData;
end;

procedure TSPCKXX_Z.TZ_KCB;              //调整库存表中的存量
var
  Qstr, cxtj: string;
  QTYS: Integer;
  QryCL: TClientDataSet;
begin
  QryCL := TClientDataSet.Create(nil); //创建实例
  cxtj := '(KCSP_SP_NOMB=''' + QueryCK.FieldByName('商品编号').AsString + ''') and (KCSP_QX=''' + QueryCK.FieldByName('产品期限').AsString + ''')';
  begin
    Qstr := 'Select * From KCB Where ' + cxtj;
    QryCL.Data := MyObj.OpenSQL(qstr);   //打开数据表
    if QryCL.RecordCount = 0 then         //若为0，即已删除，需添加记录
    begin
      Qstr := 'INSERT INTO KCB(KCSP_GYSID,KCSP_SP_NOMB,KCSP_QTY, KCSP_QX)';
      Qstr := Qstr + ' Values(''' + QueryCK.FieldByName('供应商名称').AsString + ''',''' + QueryCK.FieldByName('商品编号').AsString + ''',' + QueryCK.FieldByName('出库数量').AsString + ',''' + QueryCK.FieldByName('产品期限').AsString + ''')';
      MyObj.ExecSQL(Qstr);
    end else                           //否则，更新库存数量
    begin
      QTYS := QryCL.fieldbyname('KCSP_QTY').AsInteger + QueryCK.FieldByName('出库数量').AsInteger;  //修改数量
      MyObj.ExecSQL('Update kcb set KCSP_QTY=' + IntToStr(qtys) + ' Where ' + cxtj);
    end;
//    Gob_Rmo.BathExec;
  end;
//  QryCL.Free;
end;

procedure TSPCKXX_Z.SpeedButton1Click(Sender: TObject);
begin
//  Application.CreateForm(TSPCKXX, SPCKXX);
  ActionCD := 'M';
  SPCKXX_SG.ShowModal;
//  SPCKXX.ShowModal;
//  SPCKXX.Free;
end;

procedure TSPCKXX_Z.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TSPCKXX_Z.ShowData;
var
  str: string;
begin                   //创建窗体时，打开数据库表
  DBGrid1.DataSource := DS_CK;
  DBNavigator1.DataSource := DS_CK;
  str := 'Select GYSNAME 供应商名称,SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称,';
  str := str + ' SP_UNIT 单位,CK_DJ 销售价 ,CK_TYPE 出库类型,CK_QTY 出库数量,';
  str := str + 'CK_DH 货单号,CK_QX 产品期限,CUST_NAME 去向,CK_DATE 出库日期,CK_JSR 经手人,CK_MEMO 备注,SP_JINJA 进价,SP_GG 规格,SP_SCD 产地,GYS_NOMB 供应商编号,CK_NOMB 出库编号';
  str := str + ' From SPJBXX a,GYSXX b, cust c, SPCKXX d ';
  str := str + ' Where (a.SP_GYSID=b.GYS_NOMB) and (a.SP_NOMB=D.CK_SP_NOMB) and (c.CUST_ID=d.CK_GOTOID)';
  str := str + ' Order by CK_NOMB desc';
  QueryCK.IndexName := '';
  QueryCK.Data := MyObj.OpenSQL(str);   //打开商品数据表
  DS_CK.DataSet := QueryCK;
  if QueryCK.ReCordCount <> 0 then
  begin
    DBGrid1.Columns[0].Width := 70;      //
    DBGrid1.Columns[1].Width := 90;      //
    DBGrid1.Columns[2].Width := 95;     //
    DBGrid1.Columns[3].Width := 80;      //商品简称
    DBGrid1.Columns[4].Width := 30;      //单位
    DBGrid1.Columns[5].Width := 55;      //
    DBGrid1.Columns[6].Width := 36;      //出库类型
    DBGrid1.Columns[7].Width := 50;      //出库数量
    DBGrid1.Columns[8].Width := 50;     //
    DBGrid1.Columns[9].Width := 56;      //产品期限
    DBGrid1.Columns[10].Width := 56;     //去向
    DBGrid1.Columns[11].Width := 74;    //出库日期
    DBGrid1.Columns[12].Width := 55;     //经手人
    DBGrid1.Columns[13].Width := 90;    //备注
    DBGrid1.Columns[14].Width := 55;    //进价
    DBGrid1.Columns[15].Width := 55;     //规格
    DBGrid1.Columns[2].Visible := False;
    DBGrid1.Columns[16].Visible := False;
    DBGrid1.Columns[17].Visible := False;
    DBGrid1.Columns[18].Visible := False;
  end;
  RKJLS.Caption := '记录：' + IntToStr(QueryCK.ReCordCount);
end;

procedure TSPCKXX_Z.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  QueryCK.Free;
end;

procedure TSPCKXX_Z.SpeedButton2Click(Sender: TObject);
begin                     //判断数据库中是否有记录
  if QueryCK.RecordCount = 0 then        //判断数据库内是否有记录
  begin
    Application.MessageBox('已无记录可删除!', '提示', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if QueryCK.IsEmpty then
    exit;
  if ID_YES = application.MessageBox('确实要删除这条记录吗？', '提示', MB_YESNO) then
  begin
    TZ_KCB;              //调整库存表中的存量
    QDelete(QueryCK.FieldByName('出库编号').AsString);  //删除记录
    Showdata;
  end;
end;

procedure TSPCKXX_Z.DBGrid1DblClick(Sender: TObject);
begin
////  Application.CreateForm(TSPCKXX, SPCKXX);      //创建窗体
//  ActionCD := 'N';
//  SPCKXX_SG.GetAll;
//  SPCKXX_SG.ShowModal;
//  SPCKXX.Free;
end;

procedure TSPCKXX_Z.DBGrid1TitleClick(Column: TColumn);
begin
  MAIN.DBGridTitleClick(DBGrid1, Column);
end;

procedure TSPCKXX_Z.FormShow(Sender: TObject);
begin
  QueryCK := TClientDataSet.Create(self); //出库信息表
  ShowData;
end;

procedure TSPCKXX_Z.SpeedButton4Click(Sender: TObject);
begin
  ActionCD := 'M';
  Application.CreateForm(TSPCKXX, SPCKXX);
  SPCKXX.ShowModal;
end;

procedure TSPCKXX_Z.SpeedButton5Click(Sender: TObject);
begin
  ShowData;
end;

end.

