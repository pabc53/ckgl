unit USPKCCX;

interface

uses
  xls,   //写excel文件核心类,xls.pas拷入E:\CLXBase7\IDE\Source\Rtl\Win；xls.duc拷入E:\CLXBase7\IDE\Lib\Debug
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms, ComObj, ExcelXP,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DBCtrls,
  StrUtils, RzDBCmbo, Mask, RzEdit, DB, dbclient, zDM,
  DBGridEhGrouping, GridsEh, DBGridEh, TntStdCtrls,
  RzCmboBx, Graphics, ToolCtrlsEh, dxtree, dxdbtree, uUserMaint;

type
  TSPKCCX = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    TabSheet3: TTabSheet;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;
    grp1: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    btn2: TButton;
    chk1: TCheckBox;
    chk2: TCheckBox;
    RzDateTimeEdit1: TRzDateTimeEdit;
    RzDateTimeEdit2: TRzDateTimeEdit;
    chk3: TCheckBox;
    chk4: TCheckBox;
    btn3: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    btnCK: TButton;
    CheckBox1: TCheckBox;
    RzDateTimeEdit3: TRzDateTimeEdit;
    RzDateTimeEdit4: TRzDateTimeEdit;
    Button2: TButton;
    Panel1: TPanel;
    cbRKSPLX: TComboBox;
    cbRKSPNAME: TComboBox;
    CbSPBH: TComboBox;
    chk5: TCheckBox;
    cbSPLY: TComboBox;
    Label4: TLabel;
    chkC_GYS: TCheckBox;
    CHKC_SPNAME: TCheckBox;
    ComboBox2: TComboBox;
    cbCKSPNAME: TComboBox;
    CHKC_TYPE: TCheckBox;
    CHKC_GOTO: TCheckBox;
    CBC_GOTO: TComboBox;
    cbCKTYPE: TComboBox;
    Label5: TLabel;
    TabSheet4: TTabSheet;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    btnSPCX: TButton;
    CheckBox3: TCheckBox;
    CheckBox5: TCheckBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    ComboBox5: TComboBox;
    CheckBox6: TCheckBox;
    ComboBox6: TComboBox;
    Panel3: TPanel;
    Label6: TLabel;
    Label1: TLabel;
    SpeedButton3: TSpeedButton;
    SaveDialog: TSaveDialog;
    ComboBox4: TTntComboBox;
    DBGrid1: TDBGridEh;
    DBGridSP: TDBGridEh;
    DBGridCK: TDBGridEh;
    DBGridRK: TDBGridEh;
    Button1: TButton;
    ComboBoxGYS1: TComboBox;
    ComboBoxGYS2: TComboBox;
    ComboBoxGysN2: TComboBox;
    ComboBoxGysN1: TComboBox;
    Button3: TButton;
    SpeedButPD: TSpeedButton;
    TabSheet5: TTabSheet;
    DBGridEhPD: TDBGridEh;
    Panel4: TPanel;
    Label7: TLabel;
    CheckBox7: TCheckBox;
    ComboBox3: TComboBox;
    ComboBox7: TComboBox;
    ButRkDc: TButton;
    ButCkDc: TButton;
    But_Ck_Rk: TButton;
    TabSheet6: TTabSheet;
    Panel5: TPanel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Button4: TButton;
    RzDateTimeEdit5: TRzDateTimeEdit;
    RzDateTimeEdit6: TRzDateTimeEdit;
    ComboBoxJS: TComboBox;
    ComboBoxGYS3: TComboBox;
    ComboBoxGysN3: TComboBox;
    ButtonJS_DC: TButton;
    Label12: TLabel;
    Panel6: TPanel;
    DBGridEhJS: TDBGridEh;
    Label11: TLabel;
    sg_JS: TStringGrid;
    CheckBox4: TCheckBox;
    RzDBLookupComboBox4: TTntComboBox;
    CheckBox2: TCheckBox;
    ComboBox1: TTntComboBox;
    Label13: TLabel;
    Edit1: TEdit;
    SpeedButton4: TSpeedButton;
    TabSheet7: TTabSheet;
    Panel7: TPanel;
    dsCust: TDataSource;
    DBGridCust: TDBGrid;
    Button5: TButton;
    DBNavigator1: TDBNavigator;
    Memo1: TMemo;
    Button6: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btnCKClick(Sender: TObject);
    procedure btnSPCXClick(Sender: TObject);
    procedure ButCkDcClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ButRkDcClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ButtonJS_DCClick(Sender: TObject);
    procedure But_Ck_RkClick(Sender: TObject);
    procedure cbCKSPNAMEChange(Sender: TObject);
    procedure cbCKSPNAMEDropDown(Sender: TObject);
    procedure cbCKSPNAMEExit(Sender: TObject);
    procedure CBC_GOTODropDown(Sender: TObject);
    procedure cbRKSPNAMEChange(Sender: TObject);
    procedure cbRKSPNAMEDropDown(Sender: TObject);
    procedure cbSPLYDropDown(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure chk3Click(Sender: TObject);
    procedure chk4Click(Sender: TObject);
    procedure chk5Click(Sender: TObject);
    procedure CHKC_GOTOClick(Sender: TObject);
    procedure chkC_GYSClick(Sender: TObject);
    procedure CHKC_SPNAMEClick(Sender: TObject);
    procedure CHKC_TYPEClick(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4ContextPopup(Sender: TObject; MousePos: TPoint; var Handled:
      Boolean);
    procedure ComboBox4DropDown(Sender: TObject);
    procedure ComboBox7Click(Sender: TObject);
    procedure ComboBoxGYS1Change(Sender: TObject);
    procedure ComboBoxGYS2Change(Sender: TObject);
    procedure ComboBoxGYS3Change(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:
      Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumnEh);
    procedure DBGridCKDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:
      Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridCKTitleClick(Column: TColumnEh);
    procedure DBGridRKDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:
      Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridRKTitleClick(Column: TColumnEh);
    procedure DBGridSPTitleClick(Column: TColumnEh);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure RzDBLookupComboBox4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButPDClick(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    function pCUST(SCUST: string): Integer;
    function pCUSTID(SCUSTID: Integer): string;
    procedure RzDBLookupComboBox4Change(Sender: TObject);
    function JS_CKSJ(cstr: String): string;
    procedure sg_JSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure CxShow;
    procedure SpeedButton1Click(Sender: TObject);


  private
    { Private declarations }
  public
    procedure cBtn2;
    procedure cbtnCK;
    procedure cCheckBox4;
    procedure DBGridColmWidth;
    procedure DBGridRKColumsWidth;     //调整显示行及行宽
    procedure GetSPNAME;               //提取入库商品名称
    procedure GetSPLY;                 //获取商品来源列表
    procedure DBGridCKColumsWidth;
    procedure GetckSPNAME;     //提取出库商品名称
    procedure GetCKSPQX;        //获取出库商品来源列表
    procedure GetCxSPNAME;      //商品查询页获取商品名称
    procedure DBGridSPColumsWidth;
    procedure GetKCNAME;
    function DBGridTitleClick(Gx: TDBGridEh; Column: TColumnEh): Boolean;
    function FormatDate(pDate: String): String;
    function ChrTran(psInput: String; pcSearch: Char; pcTranWith: Char): String;
    procedure DBGridTjCKColumsWidth;       //统计出库调整显示行及行宽
    procedure DBGridTjRKColumsWidth;       //统计入库调整显示行及行宽
    procedure DBGridTjSPColumsWidth;         //调整显示行及行宽
    procedure KCCXTJ(str: string);         //库存查询统计
    function RKTJ(cstr: String): string;            //入库条件选择
    function CKTJ(cstr: String): string;            //出库条件选择
    procedure cSpeedBut;
{ Public declarations }
  end;

var
  QrySPNAME, QuerySP, QueryCRK, QueryCCK, QueryCKC, QueryPD, QueryCGYS, QueryPDB, QueryCTYPE, QueryJS, QueryJS2: TClientDataSet;
  DS_CXSP, DS_CXRK, DS_CXCK, DS_CXKC, DS_PDB, DS_JS: TDataSource;
  SPKCCX: TSPKCCX;
  CX_page, TitleColumn, RTitleColumn, CTitleColumn: Integer;   //CRTitleColumn:出库、入库表格列
  CDSPNAME: TDataSource;
  CX_BOOL, cdc_BOOL, rdc_BOOL: BOOLean;                                            //查询标志, 导出标志
  hl, astr, rkgys, ckgys, kcgys: String;
  Queryini: TClientDataSet;
  acc, acc2: TColor;
  pdstr: string;

implementation

uses zMAIN;

{$R *.dfm}

procedure TSPKCCX.FormDestroy(Sender: TObject);
begin
  Queryini.Free;
end;

procedure TSPKCCX.btn2Click(Sender: TObject);
begin
  cBtn2;
end;

procedure TSPKCCX.FormCreate(Sender: TObject);
var
  Present: TDateTime;
  Year, Month, Day: Word;
begin
  ComboBox3.Clear;
  sg_JS.ColWidths[0] := 34;
  sg_JS.ColWidths[1] := 80;
  sg_JS.ColWidths[2] := 135;
  Present := Now;
  DecodeDate(Present, Year, Month, Day);
  rkgys := 'ARIIX';
  Ckgys := 'ARIIX';
  kcgys := 'ARIIX';
  SPKCCX.Caption := '查询数据:' + FormatDateTime('yyyy/mm/dd', Now());
  cdc_BOOL := False;
  rdc_BOOL := False;
  //将当前日期写入
  RzDateTimeEdit2.Text := IntToStr(Year) + '-' + IntToStr(Month) + '-' + IntToStr(Day);
  RzDateTimeEdit4.Text := IntToStr(Year) + '-' + IntToStr(Month) + '-' + IntToStr(Day);
  RzDateTimeEdit6.Text := IntToStr(Year) + '-' + IntToStr(Month) + '-' + IntToStr(Day);
end;

function TSPKCCX.pCUST(SCUST: string): Integer;    //返回id
var
  cstr: string;
begin
  cstr := 'Select * From cust';
  cstr := cstr + ' Where CUST_NAME=''' + scust + '''';
  QueryPD.Data := MyObj.OpenSQL(cstr);   //打开数据表
  Result := QueryPD.FieldByName('CUST_ID').Value;
end;

function TSPKCCX.pCUSTID(SCUSTID: Integer): string;   //返回CUST_NAME
var
  cstr: string;
begin
  if scustid <> 0 then
  begin
    cstr := 'Select * From cust';
    cstr := cstr + ' Where CUST_ID=' + IntToStr(scustID);
    QueryPD.Data := MyObj.OpenSQL(cstr);   //打开数据表
    Result := QueryPD.FieldByName('CUST_NAME').Value;
  end else
    Result := '';
end;

function TSPKCCX.FormatDate(pDate: String): String;
var
  pStr: String;
begin                                //统一日期格式
  pStr := ChrTran(pDate, '/', '-');
  if Copy(pStr, 7, 1) = '-' then
    pStr := Copy(pStr, 1, 5) + '0' + Copy(pStr, 6, Length(pStr) - 5);
  if Length(pStr) = 9 then
    pStr := Copy(pStr, 1, 8) + '0' + Copy(pStr, 9, 1);
  Result := pStr;
//  Result := ChrTran(pDate, '/', '-');
end;

function TSPKCCX.ChrTran(psInput: String; pcSearch: Char; pcTranWith: Char): String;
var
  i, j: integer;
begin
  j := Length(psInput);
  for i := 1 to j do
  begin
    if psInput[i] = pcSearch then
      psInput[i] := pcTranWith;
  end;
  Result := psInput;
end;

function TSPKCCX.JS_CKSJ(cstr: String): string;            //结算条件选择
var
  zDate, str, ldrq_q, ldrq_z: String;
begin
  zDate := FormatDate(RzDateTimeEdit6.Text);
  if (FormatDate(RzDateTimeEdit5.Text) > zDate) then
  begin
    ldrq_z := FormatDate(RzDateTimeEdit5.Text);
    ldrq_q := zDate;
    RzDateTimeEdit5.Text := ldrq_q;
    RzDateTimeEdit6.Text := ldrq_z;
  end else
  begin
    ldrq_z := zDate;
    ldrq_q := FormatDate(RzDateTimeEdit5.Text);
  end;
  str := ' AND ' + cstr + ' BETWEEN ''' + ldrq_q + ''' ';
  str := str + ' and ''' + ldrq_z + ''' ';
  Result := str;
end;

function TSPKCCX.CKTJ(cstr: String): string;            //出库条件选择
var
  zDate, str, ldrq_q, ldrq_z1: String;
begin
  str := cstr;
  if CheckBox1.Checked then//选择日期
  begin
    if RzDateTimeEdit4.Text = '' then      //为空时
      zDate := FormatDate(RzDateTimeEdit3.Text)
    else
      zDate := FormatDate(RzDateTimeEdit4.Text);
    if (FormatDate(RzDateTimeEdit3.Text) < zDate) then
    begin
      ldrq_q := FormatDate(RzDateTimeEdit3.Text);
      ldrq_z1 := zDate;
    end else
    begin
      ldrq_q := zDate;
      ldrq_z1 := FormatDate(RzDateTimeEdit3.Text);
    end;
    str := str + ' AND CK_DATE BETWEEN ''' + ldrq_q + ''' ';
    str := str + ' and ''' + ldrq_z1 + ''' ';
    if CHKC_SPNAME.Checked then//选择产品名称
    begin
      if cbCKSPNAME.Text = '' then
        ShowMessage('您还没有选择产品名称,请先选择产品名称!') else
      begin
        str := str + ' and SP_NOMB=''' + Trim(ComboBox2.Text) + ''' ';
//          Params.ParamByName('CK_SP_NOMB').Value := Trim(ComboBox2.Text);
      end;
    end;
    if CHKC_TYPE.Checked then//选择了出库类型
    begin
      if cbCKTYPE.Text = '' then
        ShowMessage('您还没有选择出库类型,请先选择出库类型!') else
      begin
        str := str + ' and CK_TYPE=''' + Trim(cbCKTYPE.Text) + '''';
//          Params.ParamByName('CK_TYPE').Value := Trim(cbCKTYPE.Text);
      end;
    end;
    if chkC_GYS.Checked then//选择了供应商
    begin
      if ComboBoxGYS1.Text = '' then
        ShowMessage('您还没有选择供应商,请先选择供应商!') else
      begin
        str := str + ' and GYSNAME=''' + Trim(ComboBoxGYS1.Text) + '''';
//          Params.ParamByName('GYSNAME').Value := Trim(ComboBoxGYS1.Text);
      end;
    end;
    if CHKC_GOTO.Checked then//选择了商品去向
    begin
      if CBC_GOTO.Text = '' then
        ShowMessage('您还没有选择商品去向,请先选择商品去向!') else
      begin
        str := str + ' and CK_GOTOID=' + IntToStr(pCust(Trim(CBC_GOTO.Text)));
      end;
    end;
  end
  else//没有选择日期
  begin
    if CHKC_SPNAME.Checked then//选择商品名称
    begin
      if cbCKSPNAME.Text = '' then
        ShowMessage('您还没有选择商品名称,请先选择商品名称!') else
      begin

        str := str + ' and (SP_NOMB=''' + Trim(ComboBox2.Text) + ''') ';
        if CHKC_TYPE.Checked then//选择了出库类型
        begin
          if cbCKTYPE.Text = '' then
            ShowMessage('您还没有选择出库类型,请先选择出库类型!') else
          begin
            str := str + 'and (CK_TYPE=''' + Trim(cbCKTYPE.Text) + ''')';
          end;
        end;
        if chkC_GYS.Checked then//选择了供应商
        begin
          if ComboBoxGYS1.Text = '' then
            ShowMessage('您还没有选择供应商,请先选择供应商!') else
          begin
            str := str + ' and (GYSNAME=''' + Trim(ComboBoxGYS1.Text) + ''')';
//              Params.ParamByName('GYSNAME').Value := Trim(ComboBoxGYS1.Text);
          end;
        end;
        if CHKC_GOTO.Checked then//选择了商品去向
        begin
          if CBC_GOTO.Text = '' then
            ShowMessage('您还没有选择商品去向,请先选择商品去向!') else
          begin
            str := str + ' and CK_GOTOID=' + IntToStr(pCust(Trim(CBC_GOTO.Text)));
          end;
        end;
      end;
    end
    else//没有选择产品名称
    begin
      if CHKC_TYPE.Checked then//选择了出库类型
      begin
        str := str + ' and CK_TYPE=''' + Trim(cbCKTYPE.Text) + '''';
//          Params.ParamByName('CK_TYPE').Value := Trim(cbCKTYPE.Text);
        if chkC_GYS.Checked then//选择了供应商
        begin
          if ComboBoxGYS1.Text = '' then
            ShowMessage('您还没有选择供应商,请先选择供应商!') else
          begin
            str := str + ' and GYSNAME=''' + Trim(ComboBoxGYS1.Text) + '''';
//              Params.ParamByName('GYSNAME').Value := Trim(ComboBoxGYS1.Text);
          end;
        end;
        if CHKC_GOTO.Checked then//选择了商品去向
        begin
          if CBC_GOTO.Text = '' then
            ShowMessage('您还没有选择商品去向,请先选择商品去向!') else
          begin
            str := str + ' and CK_GOTOID=' + IntToStr(pCust(Trim(CBC_GOTO.Text)));
          end;
        end;
      end
      else//没有选择出库类型
      begin
        if chkC_GYS.Checked then//选择了供应商
        begin
          if ComboBoxGYS1.Text = '' then
            ShowMessage('您还没有选择供应商,请先选择供应商!') else
          begin
            str := str + 'and GYSNAME=''' + Trim(ComboBoxGYS1.Text) + '''';
//              Params.ParamByName('GYSNAME').Value := Trim(ComboBoxGYS1.Text);
            if CHKC_GOTO.Checked then//选择了商品去向
            begin
              if CBC_GOTO.Text = '' then
                ShowMessage('您还没有选择商品去向,请先选择商品去向!') else
              begin
                str := str + ' and CK_GOTOID=' + IntToStr(pCust(Trim(CBC_GOTO.Text)));
              end;
            end;
          end;
        end
        else
        begin
          if CHKC_GOTO.Checked then//选择了商品去向
          begin
            if CBC_GOTO.Text = '' then
              ShowMessage('您还没有选择商品去向,请先选择商品去向!') else
            begin
              str := str + ' and CK_GOTOID=' + IntToStr(pCust(Trim(CBC_GOTO.Text)));
            end;
          end else
          begin
//              ShowMessage('您还没有输入查询条件,请先输入查询条件!');
          end;
        end;
      end;
    end;
  end;
  Result := str;
end;

function TSPKCCX.RKTJ(cstr: String): string;            //入库条件选择
var
  zDate, str, ldrq_q, ldrq_z: String;
begin
  str := cstr;
  if chk1.Checked then//选择日期
  begin
    if RzDateTimeEdit2.Text = '' then      //为空时
      zDate := FormatDate(RzDateTimeEdit1.Text)
    else
      zDate := FormatDate(RzDateTimeEdit2.Text);
    if (FormatDate(RzDateTimeEdit1.Text) < zDate) then
    begin
      ldrq_q := FormatDate(RzDateTimeEdit1.Text);
      ldrq_z := zDate;
    end else
    begin
      ldrq_q := zDate;
      ldrq_z := FormatDate(RzDateTimeEdit1.Text);
    end;
    str := str + ' AND RK_DATE BETWEEN ''' + ldrq_q + ''' ';
    str := str + ' and ''' + ldrq_z + ''' ';
    if chk2.Checked then//选择产品名称
    begin
      if cbRKSPNAME.Text = '' then
        ShowMessage('您还没有选择产品名称,请先选择产品名称!') else
      begin
        str := str + ' and RK_SP_NOMB Like ''%' + Trim(CbSPBH.Text) + '%'' ';
      end;
    end;
    if chk3.Checked then//选择了入库类型
    begin
      if cbRKSPLX.Text = '' then
        ShowMessage('您还没有选择入库类型,请先选择入库类型!') else
      begin
        str := str + ' and RK_TYPE=''' + Trim(cbRKSPLX.Text) + '''';
      end;
    end;
    if chk4.Checked then//选择了供应商
    begin
      if ComboBoxGYS2.Text = '' then
        ShowMessage('您还没有选择供应商,请先选择供应商!') else
      begin
        str := str + ' and GYSNAME=''' + Trim(ComboBoxGYS2.Text) + '''';
      end;
    end;
    if chk5.Checked then//选择了商品来源
    begin
      if cbSPLY.Text = '' then
        ShowMessage('您还没有选择商品来源,请先选择商品来源!') else
      begin
        str := str + ' and (RK_FROMID=' + IntToStr(pcust(cbSPLY.Text)) + ')';
      end;
    end;
  end else//没有选择日期
  begin
    if chk2.Checked then//选择商品名称
    begin
      if cbRKSPNAME.Text = '' then
        ShowMessage('您还没有选择产品名称,请先选择产品名称!') else
      begin
        str := str + ' and RK_SP_NOMB=''' + Trim(CbSPBH.Text) + ''' ';
      end;
      if chk3.Checked then//选择了入库类型
      begin
        if cbRKSPLX.Text = '' then
          ShowMessage('您还没有选择入库类型,请先选择入库类型!') else
        begin
          str := str + ' and RK_TYPE=''' + Trim(cbRKSPLX.Text) + '''';
        end;
      end;
      if chk4.Checked then//选择了供应商
      begin
        if ComboBoxGYS2.Text = '' then
          ShowMessage('您还没有选择供应商,请先选择供应商!') else
        begin
          str := str + ' and GYSNAME=''' + Trim(ComboBoxGYS2.Text) + '''';
        end;
      end;
      if chk5.Checked then//选择了商品来源
      begin
        if cbSPLY.Text = '' then
          ShowMessage('您还没有选择商品来源,请先选择商品来源!') else
        begin
          str := str + ' and RK_FROMID=' + IntToStr(pcust(cbSPLY.Text));
        end;
      end;
    end
    else//没有选择产品名称
    begin
      if chk3.Checked then//选择了入库类型
      begin
        if cbRKSPLX.Text = '' then
          ShowMessage('您还没有选择入库类型,请先选择入库类型!') else
        begin
          str := str + ' and RK_TYPE=''' + Trim(cbRKSPLX.Text) + '''';
        end;
        if chk4.Checked then//选择了供应商
        begin
          if ComboBoxGYS2.Text = '' then
            ShowMessage('您还没有选择供应商,请先选择供应商!') else
          begin
            str := str + ' and GYSNAME=''' + Trim(ComboBoxGYS2.Text) + '''';
          end;
        end;
        if chk5.Checked then//选择了商品来源
        begin
          if cbSPLY.Text = '' then
            ShowMessage('您还没有选择商品来源,请先选择商品来源!') else
          begin
            str := str + ' and RK_FROMID=' + IntToStr(pcust(cbSPLY.Text));
          end;
        end;
      end
      else//没有选择入库类型
      begin
        if chk4.Checked then//选择了供应商
        begin
          if ComboBoxGYS2.Text = '' then
            ShowMessage('您还没有选择供应商,请先选择供应商!') else
          begin
            str := str + ' and GYSNAME=''' + Trim(ComboBoxGYS2.Text) + '''';
          end;
          if chk5.Checked then//选择了商品来源
          begin
            if cbSPLY.Text = '' then
              ShowMessage('您还没有选择商品来源,请先选择商品来源!') else
            begin
              str := str + ' and RK_FROMID=' + IntToStr(pcust(cbSPLY.Text));
            end;
          end;
        end
        else
        begin
          if chk5.Checked then//选择了商品来源
          begin
            if cbSPLY.Text = '' then
              ShowMessage('您还没有选择商品来源,请先选择商品来源!') else
            begin
              str := str + ' and RK_FROMID=' + IntToStr(pcust(cbSPLY.Text));
            end;
          end else
          begin
//              ShowMessage('您还没有输入查询条件,请先输入查询条件!');
          end;
        end;
      end;
    end;
  end;
  Result := str;
end;

procedure TSPKCCX.btn3Click(Sender: TObject);
var
  str: String;       //统计入库
begin
  rdc_BOOL := False;
  RTitleColumn := 2;
//构造查询语句
  QueryCRK.IndexName := '';
  if (ComboBoxGYS2.Text = 'ARIIX') or (chk4.Checked = False) then
  begin
    str := 'Select GYSNAME 供应商名称,GYS_NOMB 供应商编号,SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称,';
    str := str + 'SP_GG 规格,SP_SCD 产地, SP_UNIT 单位, Sum(RK_QTY) 入库量,SP_JINJA*Sum(RK_QTY)*' + hl + ' 金额 ';
  end else
  if (ComboBoxGYS2.Text = '安利') then
  begin
    str := 'Select GYSNAME 供应商名称,GYS_NOMB 供应商编号,SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称,';
    str := str + 'SP_GG 规格,SP_SCD 产地, SP_UNIT 单位, Sum(RK_QTY) 入库量,SP_JINJA*Sum(RK_QTY)*0.85 金额';
  end else
  begin
    str := 'Select GYSNAME 供应商名称,GYS_NOMB 供应商编号,SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称,';
    str := str + 'SP_GG 规格,SP_SCD 产地, SP_UNIT 单位, Sum(RK_QTY) 入库量,SP_JINJA*Sum(RK_QTY) 金额';
  end;
  str := str + ' From SPJBXX,GYSXX,SPRKXX ';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=RK_SP_NOMB) ';

  str := RKTJ(str) + ' Group by SP_NOMB Order By 入库量 DESC';
  QueryCRK.Data := MyObj.OpenSQL(str);           //查询
  DBGridTjRKColumsWidth;                        //调整显示行及行宽
  DBGridRK.Columns[7].Footer.Value := '合计';
  DBGridRK.Columns[7].Footer.ValueType := fvtStaticText;
  DBGridRK.Columns[8].Footer.ValueType := fvtSum;
  DBGridRK.Columns[9].Footer.ValueType := fvtSum;
  Label4.Caption := '记录：' + IntToStr(QueryCRK.ReCordCount);
  But_Ck_Rk.Enabled := False;
end;

procedure TSPKCCX.btnCKClick(Sender: TObject);
begin
  cbtnCK;
end;

procedure TSPKCCX.btnSPCXClick(Sender: TObject);
Var
  str: String;
begin                  //查出库
//构造查询语句
  if RzDBLookupComboBox2.Text = '安利' then
  begin
    str := 'Select GYSNAME 供应商名称,GYS_NOMB 供应商编号,SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称,SP_GG 规格,SP_SCD 产地,';
    str := str + 'SP_UNIT 单位,SP_JINJA 进价,CASE WHEN SP_JINJA>10 THEN ROUND(SP_JINJA*0.85,0) ELSE SP_JINJA END  打折价,SP_XIAOSOJA 销售价,SP_MEMO 备注';  //判断是否打折，小于10元的应不打折
  end else
  begin
    str := 'Select GYSNAME 供应商名称,GYS_NOMB 供应商编号,SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称,SP_GG 规格,SP_SCD 产地,';
    str := str + 'SP_UNIT 单位,SP_JINJA 进价,SP_PIFAJA 批发价,SP_XIAOSOJA 销售价,SP_MEMO 备注';
  end;
  str := str + ' From SPJBXX,GYSXX ';
  str := str + ' Where (SP_GYSID=GYS_NOMB)';
  if CheckBox5.Checked then//选择供应商
  begin
    str := str + ' and (GYSNAME=''' + Trim(RzDBLookupComboBox2.Text) + ''') ';
    if CheckBox3.Checked then//选择了商品名称
    begin
      str := str + ' and  (SP_JName Like ''%' + Trim(ComboBox4.Text) + '%'')';
    end;
    if CHKC_GOTO.Checked then//选择了商品去向
    begin
      str := str + ' and CK_GOTOID=' + IntToStr(pCust(Trim(CBC_GOTO.Text)));
    end;
  end
  else//没有选择供应商
  begin
    if CheckBox3.Checked then//选择了商品名称
    begin
      str := str + ' and  (SP_JName Like ''%' + Trim(ComboBox4.Text) + '%'')';
    end;
  end;
  QuerySP.IndexName := '';
  QuerySP.Data := MyObj.OpenSQL(str);   //打开数据表
  DBGridSPColumsWidth;                 //调整显示行及行宽
  Label8.Caption := '记录：' + IntToStr(QuerySP.ReCordCount);
end;

procedure TSPKCCX.ButCkDcClick(Sender: TObject);
var
  i: integer;
  excelapp, book, sheet: variant;
  Present: TDateTime;
  Year, Month, Day: Word;
  xl: olevariant;
  cWidch: Array[0..18] of Integer;     //列宽
begin
  cWidch[0] := 8;
  cWidch[1] := 16;
  cWidch[2] := 16;
  cWidch[3] := 16;
  cWidch[4] := 16;
  for i := 5 to 18 do
    cWidch[i] := 8;
//  cWidch[6] := 8;
//  cWidch[7] := 8;
//  cWidch[8] := 11;
//  cWidch[9] := 16;
//  cWidch[10] := 8;
//  cWidch[11] := 18;
//  cWidch[12] := 11;
//  cWidch[13] := 11;
//  cWidch[14] := 8;
  cWidch[15] := 12;
  cWidch[16] := 12;
//  cWidch[17] := 8;
  cWidch[18] := 12;
  MyObj.DataSetToExcelw(DBGridCK.datasource.dataset, cWidch);    //调用导出函数
//  Present := Now;
//  DecodeDate(Present, Year, Month, Day);
//  excelapp := createoleobject('excel.application');
//  excelapp.visible := false;
//  excelapp.DisplayAlerts := False;
//  SaveDialog.DefaultExt := 'xls';
//  SaveDialog.Filter := '*.xls|*.xls';
//  if SaveDialog.Execute then
//  begin
//    if SaveDialog.FileName = '' then Exit;
//    try
//      Book := CreateOleobject('Excel.Sheet');
//      Book := excelapp.workBooks.Add;                //
//      sheet := excelapp.worksheets[1];             //选择工作表 1
//      sheet.Range['A1', 'D1'].Merge(xl);           //合并execl单元格
//      if CHKC_GOTO.Checked then
//        sheet.Cells[1, 1] := IntToStr(Year) + '年' + IntToStr(Month) + '月' + IntToStr(Day) + '日' + CBC_GOTO.Text + '出库查询结果(' + RzDateTimeEdit3.Text + ' 至 ' + RzDateTimeEdit4.Text + ')' else                //
//        sheet.Cells[1, 1] := IntToStr(Year) + '年' + IntToStr(Month) + '月' + IntToStr(Day) + '日出库查询结果(' + RzDateTimeEdit3.Text + ' 至 ' + RzDateTimeEdit4.Text + ')';                  //
//      if cdc_BOOL then
//      begin
//        sheet.Cells[2, 1] := '供应商名称';                  //第2行写表头
//        sheet.Cells[2, 2] := '出库日期';                  //
//        sheet.Cells[2, 5] := '有效期';            //
//      end else
//        sheet.Cells[2, 2] := '供应商名称';                  //第2行写表头
//      sheet.Cells[2, 3] := '商品简称';           //
//      sheet.Cells[2, 4] := '出库量';            //
//      sheet.Columns[1].ColumnWidth := 11;        //列宽
//      sheet.Columns[2].ColumnWidth := 15;        //列宽
//      sheet.Columns[3].ColumnWidth := 18;        //列宽
//      sheet.Columns[4].ColumnWidth := 9;         //列宽
//      sheet.Columns[5].ColumnWidth := 15;        //列宽
//      QueryCCK.First;
//      for i := 3 to QueryCCK.RecordCount + 2 do       //第3行开始写数据
//      begin
//        if cdc_BOOL then
//        begin
//          sheet.cells[i, 1].value := QueryCCK.FieldByName('供应商名称').AsString;      //
//          sheet.Cells[i, 2] := QueryCCK.FieldByName('出库日期').AsString;         //
//          sheet.Cells[i, 5] := QueryCCK.FieldByName('有效期').AsString;             //
//        end else
//          sheet.cells[i, 2].value := QueryCCK.FieldByName('供应商名称').AsString;      //
//        sheet.Cells[i, 3] := QueryCCK.FieldByName('商品简称').AsString;           //
//        sheet.Cells[i, 4] := QueryCCK.FieldByName('出库量').AsInteger;              //
//        QueryCCK.Next;
//      end;  //DBGRIDEH1.getfootervalue(0,DBGRIDEH1.columns[i])
//      sheet.Cells[QueryCCK.RecordCount + 3, 4] := DBGRID1.getfootervalue(0, DBGRID1.columns[2]);
//      for i := 2 to QueryCCK.RecordCount + 3 do            //画单元格边框
//      begin
//        sheet.Range['A' + inttostr(i), 'e' + inttostr(i)].Borders.LineStyle := xlContinuous;
//        sheet.Range['A' + inttostr(i), 'e' + inttostr(i)].Borders.Weight := xlThin;
//        sheet.Range['A' + inttostr(i), 'e' + inttostr(i)].Borders.ColorIndex := xlAutomatic;
//      end;
//      Book.SaveAs(SaveDialog.FileName);           //保存
//    Finally
//      ExcelApp.Quit;
//      excelapp := Unassigned;
//    end;
//    QueryCCK.First;
//    Application.MessageBox('导出文件成功！', '提示信息', 0 + MB_ICONINFORMATION);
//  end;
end;

procedure TSPKCCX.Button1Click(Sender: TObject);
Var
  str: String;
begin                  //统计商品
//构造查询语句
  str := 'Select GYSNAME 供应商名称,GYS_NOMB 供应商编号, Count(SP_NOMB) 产品种类';
  str := str + ' From SPJBXX,GYSXX ';
  str := str + ' Where (SP_GYSID=GYS_NOMB) Group by 供应商名称';
  QuerySP.IndexName := '';
  QuerySP.Data := MyObj.OpenSQL(str);   //打开数据表
  DBGridSP.Columns[1].Footer.Value := '合计';
  DBGridSP.Columns[1].Footer.ValueType := fvtStaticText;
  DBGridSP.Columns[2].Footer.ValueType := fvtSum;
  DBGridTjSPColumsWidth;                 //调整显示行及行宽
  Label8.Caption := '记录：' + IntToStr(QuerySP.ReCordCount);
end;

procedure TSPKCCX.Button2Click(Sender: TObject);
var
  str: String;
begin                  //统计出库商品数量
  cdc_BOOL := False;
  CTitleColumn := 2;
//构造查询语句
  if (ComboBoxGYS1.Text = 'ARIIX') or (chkC_GYS.Checked = False) then
  begin
    str := 'Select GYSNAME 供应商名称,GYS_NOMB 供应商编号,SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称,';
    str := str + 'SP_GG 规格,SP_SCD 产地, SP_UNIT 单位, Sum(CK_QTY) 出库量,SP_JINJA*Sum(CK_QTY)*' + hl + ' 金额';
  end else
  if (ComboBoxGYS1.Text = '安利') then
  begin
    str := 'Select GYSNAME 供应商名称,GYS_NOMB 供应商编号,SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称,';
    str := str + 'SP_GG 规格,SP_SCD 产地, SP_UNIT 单位, Sum(CK_QTY) 出库量,SP_JINJA*Sum(CK_QTY)*0.85 金额';
  end else
  begin
    str := 'Select GYSNAME 供应商名称,GYS_NOMB 供应商编号,SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称,';
    str := str + 'SP_GG 规格,SP_SCD 产地, SP_UNIT 单位, Sum(CK_QTY) 出库量,SP_JINJA*Sum(CK_QTY) 金额';
  end;
  str := str + ' From SPJBXX,GYSXX,SPCKXX ';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=CK_SP_NOMB) ';
  str := CKTJ(str) + ' Group by SP_NOMB Order By 出库量 DESC';
  QueryCCK.IndexName := '';
  QueryCCK.Data := MyObj.OpenSQL(str);   //打开数据表
  DBGridCK.Columns[7].Footer.Value := '合计';
  DBGridCK.Columns[7].Footer.ValueType := fvtStaticText;
  DBGridCK.Columns[8].Footer.ValueType := fvtSum;
  DBGridCK.Columns[9].Footer.ValueType := fvtSum;
//  DBGridCK.Columns[13].FieldName := '出库量';
  DBGridTjCKColumsWidth;                //调整显示行及行宽
  Label1.Caption := '记录：' + IntToStr(QueryCCK.ReCordCount);
  But_Ck_Rk.Enabled := False;
end;

procedure TSPKCCX.Button3Click(Sender: TObject);
var
  str: String;
begin                  //统计库存量
  CX_BOOL := True;        //统计标志
//构造查询语句
  str := 'select  kcsp_gysid 公司名称,SP_NAME 商品名称,SP_JNAME 商品简称,SP_JINJA 价格, Sum(KCSP_QTY) 数量 ';
  str := str + ' from KCB,SPJBXX,GYSXX';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB)';
  QueryCKC.IndexName := '';
  KCCXTJ(str);
  DBGrid1.Columns[3].Footer.ValueType := fvtSum;
  DBGrid1.Columns[4].Footer.ValueType := fvtSum;
//  DBGrid1.Columns[3].FieldName := '数量';
  CX_BOOL := False;        //
end;

procedure TSPKCCX.ButRkDcClick(Sender: TObject);
var
  i: integer;
  excelapp, book, sheet: variant;
  Present: TDateTime;
  Year, Month, Day: Word;
  xl: olevariant;
  cWidch: Array[0..18] of Integer;
begin
  cWidch[0] := 8;
  cWidch[1] := 16;
  cWidch[2] := 16;
  cWidch[3] := 16;
  cWidch[4] := 16;
  for i := 5 to 18 do
    cWidch[i] := 8;
//  cWidch[6] := 8;
//  cWidch[7] := 8;
//  cWidch[8] := 11;
//  cWidch[9] := 16;
//  cWidch[10] := 8;
//  cWidch[11] := 18;
//  cWidch[12] := 11;
//  cWidch[13] := 11;
//  cWidch[14] := 8;
  cWidch[15] := 12;
  cWidch[16] := 12;
//  cWidch[17] := 8;
  cWidch[18] := 11;
  MyObj.DataSetToExcelw(DBGridRK.datasource.dataset, cWidch);    //调用导出函数
//  Present := Now;
//  DecodeDate(Present, Year, Month, Day);
//  excelapp := createoleobject('excel.application');
//  excelapp.visible := false;
//  excelapp.DisplayAlerts := False;
//  SaveDialog.DefaultExt := 'xls';
//  SaveDialog.Filter := '*.xls|*.xls';
//  if SaveDialog.Execute then
//  begin
//    if SaveDialog.FileName = '' then Exit;
//    try
//      Book := CreateOleobject('Excel.Sheet');
//      Book := excelapp.workBooks.Add;                //
//      sheet := excelapp.worksheets[1];             //选择工作表 1
//      sheet.Range['A1', 'D1'].Merge(xl);           //合并execl单元格
//      if chk5.Checked then
//        sheet.Cells[1, 1] := IntToStr(Year) + '年' + IntToStr(Month) + '月' + IntToStr(Day) + '日' + cbSPLY.Text + '入库查询结果(' + RzDateTimeEdit1.Text + ' 至 ' + RzDateTimeEdit2.Text + ')' else                //
//        sheet.Cells[1, 1] := IntToStr(Year) + '年' + IntToStr(Month) + '月' + IntToStr(Day) + '日入库查询结果(' + RzDateTimeEdit1.Text + ' 至 ' + RzDateTimeEdit2.Text + ')';                  //
//      if rdc_BOOL then
//      begin
//        sheet.Cells[2, 1] := '供应商名称';                  //第2行写表头
//        sheet.Cells[2, 2] := '入库日期';
//        sheet.Cells[2, 5] := '有效期';            //
//      end else
//        sheet.Cells[2, 2] := '供应商名称';
//      sheet.Cells[2, 3] := '商品简称';           //
//      sheet.Cells[2, 4] := '入库量';            //
//      sheet.Columns[1].ColumnWidth := 11;        //列宽
//      sheet.Columns[2].ColumnWidth := 15;        //列宽
//      sheet.Columns[3].ColumnWidth := 18;        //列宽
//      sheet.Columns[4].ColumnWidth := 9;         //列宽
//      sheet.Columns[5].ColumnWidth := 15;        //列宽
//      QueryCRK.First;
//      for i := 3 to QueryCRK.RecordCount + 2 do       //第3行开始写数据
//      begin
//        if rdc_BOOL then
//        begin
//          sheet.cells[i, 1].value := QueryCRK.FieldByName('供应商名称').AsString;      //
//          sheet.Cells[i, 2] := QueryCRK.FieldByName('入库日期').AsString;           //
//          sheet.Cells[i, 5] := QueryCRK.FieldByName('有效期').AsString;             //
//        end else
//          sheet.Cells[i, 2] := QueryCRK.FieldByName('供应商名称').AsString;           //
//        sheet.Cells[i, 3] := QueryCRK.FieldByName('商品简称').AsString;           //
//        sheet.Cells[i, 4] := QueryCRK.FieldByName('入库量').AsInteger;              //
//        QueryCRK.Next;
//      end;
//      sheet.Cells[QueryCRK.RecordCount + 3, 4] := DBGRID1.getfootervalue(0, DBGRID1.columns[2]);
//      for i := 2 to QueryCRK.RecordCount + 3 do            //画单元格边框
//      begin
//        sheet.Range['A' + inttostr(i), 'E' + inttostr(i)].Borders.LineStyle := xlContinuous;
//        sheet.Range['A' + inttostr(i), 'E' + inttostr(i)].Borders.Weight := xlThin;
//        sheet.Range['A' + inttostr(i), 'E' + inttostr(i)].Borders.ColorIndex := xlAutomatic;
//      end;
//      Book.SaveAs(SaveDialog.FileName);           //保存
//    Finally
//      ExcelApp.Quit;
//      excelapp := Unassigned;
//    end;
//    QueryCRK.First;
//    Application.MessageBox('导出文件成功！', '提示信息', 0 + MB_ICONINFORMATION);
//  end;
end;

procedure TSPKCCX.Button4Click(Sender: TObject);
var
  str, c_ID: string;   //结算对象ID
  i, j, cp: Integer;
begin
  if (ComboBoxJS.Text <> '') and (RzDateTimeEdit5.Text <> '') then
  begin
    c_ID := IntToStr(pCUST(ComboBoxJS.Text));
    cp := 0;      //商品计数
//构造查询语句
    QueryJS.IndexName := '';
    sg_JS.ColCount := 4;
    sg_JS.cells[1, 0] := '供应商名称';
    sg_JS.cells[2, 0] := '商品名称';
    sg_JS.cells[3, 0] := '出货量';
    str := 'Select GYSNAME 供应商名称, SP_NAME 商品名称, RK_TYPE 类型, SUM(RK_QTY) 数量 from sprkxx a, SPJBXX, gysxx';
    str := str + ' where (RK_GYS_NOMB=''' + ComboBoxGysN3.Text + ''' ) and (RK_Fromid=' + c_ID + ') and (RK_SP_NOMB=SP_NOMB) and (RK_GYS_NOMB= GYS_NOMB)';
    str := str + JS_CKSJ('RK_DATE') + ' Group By 商品名称';
    QueryJs.Data := MyObj.OpenSQL(str);   //查询
    QueryJS.First;
    str := 'Select GYSNAME 供应商名称, SP_NAME 商品名称,CK_TYPE 类型, SUM(CK_QTY) 数量 from spckxx b,SPJBXX, GYSXX';
    str := str + ' where  (CK_GYS_NOMB=''' + ComboBoxGysN3.Text + ''') and (CK_GOTOID=' + c_ID + ') and (CK_SP_NOMB=SP_NOMB) and (CK_GYS_NOMB= GYS_NOMB)';
    str := str + JS_CKSJ('CK_DATE') + ' Group By 商品名称 Order By 类型, 商品名称 ';
    QueryJs2.Data := MyObj.OpenSQL(str);   //查询
    for i := 1 to QueryJS.RecordCount do                       //以入库商品依次与出库商品进行比较
    begin
      sg_JS.cells[0, i] := IntToStr(i) + ' ';
      sg_JS.cells[1, i] := QueryJs.Fields[0].AsString;         //先将入货商品名称、数量记入表格，再寻找相同的出货商品进行数量相减
      sg_JS.cells[2, i] := QueryJs.Fields[1].AsString;         //若出货商品中没有相同的商品，则保留入货商品的入库数量
      sg_JS.cells[3, i] := '-' + QueryJS.Fields[3].AsString + ' ';
      QueryJS2.First;
      for j := 0 to QueryJS2.RecordCount - 1 do                //取出库商品进行循环比较
      begin
        if QueryJS2.Fields[1].AsString = QueryJs.Fields[1].AsString then     //入货商品与出货商品比较
        begin                                                                //若都有则将数量相减并计数
          sg_JS.cells[3, i] := IntToStr(QueryJS2.Fields[3].AsInteger - QueryJS.Fields[3].AsInteger) + ' ';
          cp := cp + 1;                                           //出货与进货有相同商品计数
        end;
        QueryJS2.Next;
      end;
      QueryJS.Next;
    end;
    sg_JS.RowCount := QueryJS.RecordCount + 1;
    if cp < QueryJS2.RecordCount then     //出货的商品数大于进货的商品数
    begin
      QueryJS2.First;
      cp := 0;
      for i := 0 to QueryJS2.RecordCount - 1 do            //将出货商品在入货商品没有的直接记入sg_JS中
      begin
        for j := 1 to QueryJS.RecordCount do
        begin
          if (QueryJS2.Fields[1].AsString <> sg_JS.cells[2, j]) and (j = QueryJS.RecordCount) then   //寻找出货商品在入货商品中没有的商品
          begin
            sg_JS.cells[0, cp + QueryJS.RecordCount + 1] := IntToStr(cp + sg_JS.RowCount) + ' ';     //序号
            cp := cp + 1;
            sg_JS.cells[1, cp + QueryJS.RecordCount] := QueryJs2.Fields[0].AsString;          //将入货商品中没有的出货商品写入表格
            sg_JS.cells[2, cp + QueryJS.RecordCount] := QueryJs2.Fields[1].AsString;
            sg_JS.cells[3, cp + QueryJS.RecordCount] := QueryJS2.Fields[3].AsString + ' ';
          end else
          if (QueryJS2.Fields[1].AsString = sg_JS.cells[2, j]) then
            Break;                                                   //如果相同则退出循环
        end;
        QueryJS2.Next;
      end;
      sg_JS.RowCount := sg_JS.RowCount + cp;                      //表格的行数
    end;
//将查询结果显示在左侧的表格中
    str := 'Select GYSNAME 供应商名称, SP_NAME 商品名称, CK_TYPE 类型, SUM(CK_QTY) 数量 from spCkxx a, SPJBXX, gysxx';
    str := str + ' where (CK_GYS_NOMB=''' + ComboBoxGysN3.Text + ''' ) and (CK_GOTOID=' + c_ID + ') and (CK_SP_NOMB=SP_NOMB) and (CK_GYS_NOMB= GYS_NOMB)';
    str := str + JS_CKSJ('CK_DATE') + ' Group By 商品名称';
    str := str + ' union all select GYSNAME 供应商名称, SP_NAME 商品名称,RK_TYPE 类型, SUM(RK_QTY) 数量 from spRkxx b,SPJBXX, GYSXX';
    str := str + ' where  (RK_GYS_NOMB=''' + ComboBoxGysN3.Text + ''') and (RK_Fromid=' + c_ID + ') and (RK_SP_NOMB=SP_NOMB) and (RK_GYS_NOMB= GYS_NOMB)';
    str := str + JS_CKSJ('RK_DATE') + ' Group By 商品名称  ';

    QueryJs.Data := MyObj.OpenSQL(str);   //查询
    for i := 0 to 2 do
      DBGridEhJS.Columns[i].Width := 100;
    DBGridEhJS.Columns[3].Width := 60;
    if QueryJS.RecordCount > 0 then
      ButtonJS_DC.Enabled := True else
      ButtonJS_DC.Enabled := False;
  end;
end;

procedure TSPKCCX.ButtonJS_DCClick(Sender: TObject);
var
  i, y, FileHandle: integer;
  excelapp, book, sheet: variant;
  Present: TDateTime;
  Year, Month, Day: Word;
  xl: olevariant;
  tt: string;
  cWidch: Array[0..6] of Integer;
begin                             //结算导出
  cWidch[0] := 11;
  cWidch[1] := 18;
  cWidch[2] := 10;
  cWidch[3] := 8;
  cWidch[4] := 8;
  cWidch[5] := 18;
  cWidch[6] := 11;
  Present := Now;
  DecodeDate(Present, Year, Month, Day);
  tt := pSaveDialog;
  if tt = '' then exit;
  Screen.Cursor := crHourGlass;
  FileHandle := Xls_Create(tt);
  Xls_SetFormat(FileHandle, 'yyyy-mm-dd hh:mm:ss');
  for i := 0 to QueryJS.FieldCount + 2 do          //字段数
  begin
    Xls_SetColWidth(FileHandle, i, cWidch[i]);               //列宽
  end;
  tt := IntToStr(Year) + '年' + IntToStr(Month) + '月' + IntToStr(Day) + '日'
    + ComboBoxJS.Text + '结算结果(' + RzDateTimeEdit5.Text + ' 至 ' + RzDateTimeEdit6.Text + ')';                //
  Xls_SetString(FileHandle, 0, 0, tt);                  //
  Xls_SetString(FileHandle, 1, 0, '供应商名称');                  //第2行写表头
  Xls_SetString(FileHandle, 1, 1, '商品名称');
  Xls_SetString(FileHandle, 1, 2, '类型');           //
  Xls_SetString(FileHandle, 1, 3, '数量');            //
  Xls_SetString(FileHandle, 1, 5, '商品名称');            //
  Xls_SetString(FileHandle, 1, 6, '出货量(出-入)');            //
  QueryJS.First;
  for i := 2 to QueryJS.RecordCount + 1 do       //第3行开始写数据
  begin
    Xls_SetString(FileHandle, i, 0, QueryJS.FieldByName('供应商名称').AsString);      //
    Xls_SetString(FileHandle, i, 1, QueryJS.FieldByName('商品名称').AsString);           //
    Xls_SetString(FileHandle, i, 2, QueryJS.Fields[2].AsString);              //
    Xls_SetInteger(FileHandle, i, 3, QueryJS.Fields[3].AsInteger);              //
    QueryJS.Next;
    Application.ProcessMessages;     //响应外界事件
  end;
//导出计算后sg_JS中的结果
  for i := 2 to sg_JS.RowCount do       //第3行开始写数据
  begin
    Xls_SetString(FileHandle, i, 5, sg_JS.cells[2, i - 1]);           //
    Xls_SetDouble(FileHandle, i, 6, StrToFloat(sg_JS.cells[3, i - 1]));              //
  end;
//  Xls_SetString(FileHandle, sg_JS.RowCount + 1, 5, '合计');
//  Xls_SetString(FileHandle, sg_JS.RowCount + 1, 6, '=SUM(G3:G' + IntToStr(sg_JS.RowCount + 1) + ')');

  Xls_Close(FileHandle);
  Screen.Cursor := crDefault;
  showmessage('数据导出完毕！');
  QueryJS.First;

{  Present := Now;
  DecodeDate(Present, Year, Month, Day);
  excelapp := createoleobject('excel.application');
  excelapp.visible := false;
  excelapp.DisplayAlerts := False;
  SaveDialog.DefaultExt := 'xls';
  SaveDialog.Filter := '*.xls|*.xls';
  if SaveDialog.Execute then
  begin
    if SaveDialog.FileName = '' then Exit;
    try
      Book := CreateOleobject('Excel.Sheet');
      Book := excelapp.workBooks.Add;                //
      sheet := excelapp.worksheets[1];             //选择工作表 1
      sheet.Range['A1', 'G1'].Merge(xl);           //合并execl单元格
      sheet.Cells[1, 1] := IntToStr(Year) + '年' + IntToStr(Month) + '月' + IntToStr(Day) + '日'
        + ComboBoxJS.Text + '结算结果(' + RzDateTimeEdit5.Text + ' 至 ' + RzDateTimeEdit6.Text + ')';                //
      sheet.Cells[2, 1] := '供应商名称';                  //第2行写表头
      sheet.Cells[2, 2] := '商品名称';
      sheet.Cells[2, 3] := '类型';           //
      sheet.Cells[2, 4] := '数量';            //
      sheet.Columns[1].ColumnWidth := 11;        //列宽
      sheet.Columns[2].ColumnWidth := 18;        //列宽
      sheet.Columns[3].ColumnWidth := 14;        //列宽
      sheet.Columns[4].ColumnWidth := 9;         //列宽
      QueryJS.First;
      for i := 3 to QueryJS.RecordCount + 2 do       //第3行开始写数据
      begin
        sheet.cells[i, 1].value := QueryJS.FieldByName('供应商名称').AsString;      //
        sheet.Cells[i, 2] := QueryJS.FieldByName('商品名称').AsString;           //
        sheet.Cells[i, 3] := QueryJS.Fields[2].AsString;           //
        sheet.Cells[i, 4] := QueryJS.Fields[3].AsInteger;              //
        QueryJS.Next;
      end;
//导出计算后sg_JS中的结果
      sheet.Cells[2, 6] := '商品名称';        //第2行写表头
      sheet.Cells[2, 7] := '出货量';           //
      sheet.Columns[6].ColumnWidth := 18;        //列宽
      sheet.Columns[7].ColumnWidth := 9;        //列宽
      for i := 3 to sg_JS.RowCount + 2 do       //第3行开始写数据
      begin
        sheet.Cells[i, 6] := sg_JS.cells[2, i - 2];           //
        sheet.Cells[i, 7] := sg_JS.cells[3, i - 2];              //
        if (sg_JS.cells[3, i - 2] <> '') and (StrToInt(sheet.Cells[i, 7]) < 0) then
          sheet.Cells[i, 7].font.color := clRed else
          sheet.Cells[i, 7].font.color := clBlack;
      end;
      sheet.Cells[sg_JS.RowCount + 2, 6] := '合计';
      sheet.Cells[sg_JS.RowCount + 2, 7] := '=SUM(G3:G' + IntToStr(sg_JS.RowCount + 1) + ')';
      for i := 2 to QueryJS.RecordCount + 3 do            //画单元格边框
      begin
        sheet.Range['A' + inttostr(i), 'G' + inttostr(i)].Borders.LineStyle := xlContinuous;
        sheet.Range['A' + inttostr(i), 'G' + inttostr(i)].Borders.Weight := xlThin;
        sheet.Range['A' + inttostr(i), 'G' + inttostr(i)].Borders.ColorIndex := xlAutomatic;
      end;
      Book.SaveAs(SaveDialog.FileName);           //保存
    Finally
      ExcelApp.Quit;
      excelapp := Unassigned;
    end;
    QueryJS.First;
    Application.MessageBox('导出文件成功！', '提示信息', 0 + MB_ICONINFORMATION);
  end;    }
end;

{$O-}
{$OPTIMIZATION OFF}

procedure TSPKCCX.But_Ck_RkClick(Sender: TObject);
var
  i, j, FileHandle: integer;
  excelapp, book, sheet: variant;
  Present: TDateTime;
  Year, Month, Day: Word;
  xl: olevariant;
  tt: string;
  cWidch: Array[0..5] of Integer;
begin
  cWidch[0] := 8;
  cWidch[1] := 12;
  cWidch[2] := 15;
  cWidch[3] := 8;
  cWidch[4] := 8;
  cWidch[5] := 12;
  Present := Now;
  DecodeDate(Present, Year, Month, Day);
  tt := pSaveDialog;
  if tt = '' then exit;
  QueryCRK.First;
  Screen.Cursor := crHourGlass;
  FileHandle := Xls_Create(tt);
  Xls_SetFormat(FileHandle, 'yyyy-mm-dd hh:mm:ss');
  for i := 0 to QueryCRK.FieldCount - 1 do          //字段数
  begin
    Xls_SetColWidth(FileHandle, i, cWidch[i]);               //列宽
  end;
  if chk1.Checked then          //有起始时间否
    tt := RzDateTimeEdit1.Text else
    tt := '开始';
  if chk5.Checked then          //有来源否
    Xls_SetString(FileHandle, 0, 0, IntToStr(Year) + '年' + IntToStr(Month) + '月' + IntToStr(Day) + '日' + cbSPLY.Text + '入库查询结果(' + tt + ' 至 ' + RzDateTimeEdit2.Text + ')') else                //
    Xls_SetString(FileHandle, 0, 0, IntToStr(Year) + '年' + IntToStr(Month) + '月' + IntToStr(Day) + '日入库查询结果(' + tt + ' 至 ' + RzDateTimeEdit2.Text + ')');                  //
  Xls_SetString(FileHandle, 1, 0, '供应商名称');                  //第2行写表头
  Xls_SetString(FileHandle, 1, 1, '入库日期');
  Xls_SetString(FileHandle, 1, 2, '商品简称');           //
  Xls_SetString(FileHandle, 1, 3, '入库类型');            //
  Xls_SetString(FileHandle, 1, 4, '入库量');            //
  Xls_SetString(FileHandle, 1, 5, '有效期');            //
  for i := 2 to QueryCRK.RecordCount + 2 do       //第3行开始写数据
  begin
    Xls_SetString(FileHandle, i, 0, QueryCRK.FieldByName('供应商名称').AsString);      //
    Xls_SetString(FileHandle, i, 1, QueryCRK.FieldByName('入库日期').AsString);           //
    Xls_SetString(FileHandle, i, 2, QueryCRK.FieldByName('商品简称').AsString);           //
    Xls_SetString(FileHandle, i, 3, QueryCRK.FieldByName('入库类型').AsString);              //
    Xls_SetInteger(FileHandle, i, 4, QueryCRK.FieldByName('入库量').AsInteger);              //
    Xls_SetString(FileHandle, i, 5, QueryCRK.FieldByName('有效期').AsString);             //
    QueryCRK.Next;
  end;

  j := QueryCRK.RecordCount + 4;
  if CheckBox1.Checked then          //有起始时间否
    tt := RzDateTimeEdit1.Text else
    tt := '开始';
  if CHKC_GOTO.Checked then          //有来源否
    Xls_SetString(FileHandle, j, 0, IntToStr(Year) + '年' + IntToStr(Month) + '月' + IntToStr(Day) + '日' + cbSPLY.Text + '出库查询结果(' + tt + ' 至 ' + RzDateTimeEdit2.Text + ')') else                //
    Xls_SetString(FileHandle, j, 0, IntToStr(Year) + '年' + IntToStr(Month) + '月' + IntToStr(Day) + '日出库查询结果(' + tt + ' 至 ' + RzDateTimeEdit2.Text + ')');                  //
  Xls_SetString(FileHandle, j + 1, 0, '供应商名称');           //第j行写表头
  Xls_SetString(FileHandle, j + 1, 1, '出库日期');
  Xls_SetString(FileHandle, j + 1, 2, '商品简称');           //
  Xls_SetString(FileHandle, j + 1, 3, '出库类型');            //
  Xls_SetString(FileHandle, j + 1, 4, '出库量');            //
  Xls_SetString(FileHandle, j + 1, 5, '有效期');             //
  QueryCCK.First;
  for i := j + 2 to QueryCCK.RecordCount + J do       //第3行开始写数据
  begin
    Xls_SetString(FileHandle, i, 0, QueryCCK.FieldByName('供应商名称').AsString);      //
    Xls_SetString(FileHandle, i, 1, QueryCCK.FieldByName('出库日期').AsString);           //
    Xls_SetString(FileHandle, i, 2, QueryCCK.FieldByName('商品简称').AsString);           //
    Xls_SetString(FileHandle, i, 3, QueryCCK.FieldByName('出库类型').AsString);              //
    Xls_SetInteger(FileHandle, i, 4, QueryCCK.FieldByName('出库量').AsInteger);              //
    Xls_SetString(FileHandle, i, 5, QueryCCK.FieldByName('有效期').AsString);             //
    QueryCCK.Next;
  end;
  Xls_Close(FileHandle);
  Screen.Cursor := crDefault;
  showmessage('数据导出完毕！');
  QueryCRK.First;
  QueryCCK.First;

{  Present := Now;
  DecodeDate(Present, Year, Month, Day);
  excelapp := createoleobject('excel.application');
  excelapp.visible := false;
  excelapp.DisplayAlerts := False;
  SaveDialog.DefaultExt := 'xls';
  SaveDialog.Filter := '*.xls|*.xls';
  if SaveDialog.Execute then
  begin
    if SaveDialog.FileName = '' then Exit;
    try
      Book := CreateOleobject('Excel.Sheet');
      Book := excelapp.workBooks.Add;                //
      sheet := excelapp.worksheets[1];             //选择工作表 1
      sheet.Range['A1', 'F1'].Merge(xl);           //合并execl单元格
      if chk5.Checked then
        sheet.Cells[1, 1] := IntToStr(Year) + '年' + IntToStr(Month) + '月' + IntToStr(Day) + '日' + cbSPLY.Text + '入库查询结果(' + RzDateTimeEdit1.Text + ' 至 ' + RzDateTimeEdit2.Text + ')' else                //
        sheet.Cells[1, 1] := IntToStr(Year) + '年' + IntToStr(Month) + '月' + IntToStr(Day) + '日入库查询结果(' + RzDateTimeEdit1.Text + ' 至 ' + RzDateTimeEdit2.Text + ')';                  //
      sheet.Cells[2, 1] := '供应商名称';                  //第2行写表头
      sheet.Cells[2, 2] := '入库日期';
      sheet.Cells[2, 3] := '商品简称';           //
      sheet.Cells[2, 4] := '入库类型';            //
      sheet.Cells[2, 5] := '入库量';            //
      sheet.Cells[2, 6] := '有效期';            //
      sheet.Columns[1].ColumnWidth := 8;        //列宽
      sheet.Columns[2].ColumnWidth := 11;        //列宽
      sheet.Columns[3].ColumnWidth := 18;        //列宽
      sheet.Columns[4].ColumnWidth := 9;         //列宽
      sheet.Columns[5].ColumnWidth := 8;         //列宽
      sheet.Columns[6].ColumnWidth := 15;        //列宽
      QueryCRK.First;
      for i := 3 to QueryCRK.RecordCount + 2 do       //第3行开始写数据
      begin
        sheet.cells[i, 1].value := QueryCRK.FieldByName('供应商名称').AsString;      //
        sheet.Cells[i, 2] := QueryCRK.FieldByName('入库日期').AsString;           //
        sheet.Cells[i, 3] := QueryCRK.FieldByName('商品简称').AsString;           //
        sheet.Cells[i, 4] := QueryCRK.FieldByName('入库类型').AsString;              //
        sheet.Cells[i, 5] := QueryCRK.FieldByName('入库量').AsInteger;              //
        sheet.Cells[i, 6] := QueryCRK.FieldByName('有效期').AsString;             //
        QueryCRK.Next;
      end;
      j := QueryCRK.RecordCount + 4;
      sheet.Cells[j, 1] := '供应商名称';                  //第2行写表头
      sheet.Cells[j, 2] := '出库日期';                  //
      sheet.Cells[j, 3] := '商品简称';           //
      sheet.Cells[j, 4] := '出库类型';            //
      sheet.Cells[j, 5] := '出库量';            //
      sheet.Cells[j, 6] := '有效期';            //
      QueryCCK.First;
      for i := j + 1 to QueryCCK.RecordCount + J do       //第3行开始写数据
      begin
        sheet.cells[i, 1].value := QueryCCK.FieldByName('供应商名称').AsString;      //
        sheet.Cells[i, 2] := QueryCCK.FieldByName('出库日期').AsString;         //
        sheet.Cells[i, 3] := QueryCCK.FieldByName('商品简称').AsString;           //
        sheet.Cells[i, 4] := QueryCCK.FieldByName('出库类型').AsString;              //
        sheet.Cells[i, 5] := QueryCCK.FieldByName('出库量').AsInteger;              //
        sheet.Cells[i, 6] := QueryCCK.FieldByName('有效期').AsString;             //
        QueryCCK.Next;
      end;


//      sheet.Cells[QueryCRK.RecordCount + QueryCCK.RecordCount + 6, 4] := DBGRID1.getfootervalue(0, DBGRID1.columns[2]);
      for i := 2 to QueryCRK.RecordCount + QueryCCK.RecordCount + 4 do            //画单元格边框
      begin
        sheet.Range['A' + inttostr(i), 'F' + inttostr(i)].Borders.LineStyle := xlContinuous;
        sheet.Range['A' + inttostr(i), 'F' + inttostr(i)].Borders.Weight := xlThin;
        sheet.Range['A' + inttostr(i), 'F' + inttostr(i)].Borders.ColorIndex := xlAutomatic;
      end;
      Book.SaveAs(SaveDialog.FileName);           //保存
    Finally
      ExcelApp.Quit;
      excelapp := Unassigned;
    end;
    QueryCRK.First;
    Application.MessageBox('导出文件成功！', '提示信息', 0 + MB_ICONINFORMATION);
  end;   }
end;

procedure TSPKCCX.cbCKSPNAMEChange(Sender: TObject);
begin
  ComboBox2.ItemIndex := cbCKSPNAME.ItemIndex;
  btnCKClick(Sender);
end;

procedure TSPKCCX.cbCKSPNAMEDropDown(Sender: TObject);
begin
  GetCKSPNAME;           //获取出库产品名
end;

procedure TSPKCCX.cbCKSPNAMEExit(Sender: TObject);
begin
  ComboBox2.ItemIndex := cbCKSPNAME.ItemIndex;
end;

procedure TSPKCCX.CBC_GOTODropDown(Sender: TObject);
begin
  GetCKSPQX;
end;

procedure TSPKCCX.cbRKSPNAMEChange(Sender: TObject);
begin
  CbSPBH.ItemIndex := cbRKSPNAME.ItemIndex;
  btn2Click(Sender);
end;

procedure TSPKCCX.cbRKSPNAMEDropDown(Sender: TObject);
begin
  GetSPNAME;
end;

procedure TSPKCCX.cbSPLYDropDown(Sender: TObject);
begin
  GetSPLY;
end;

procedure TSPKCCX.cBtn2;
var
  str: String;
begin
  rdc_BOOL := True;          //查询导出
  ComboBoxGysN2.Itemindex := ComboBoxGYS2.ItemIndex;
  if DBGridRK.FieldCount > 8 then
    RTitleColumn := 15;    //获取出库、入库页表格列
//构造查询语句
  QueryCRK.IndexName := '';
  str := 'Select GYSNAME 供应商名称,GYS_NOMB 供应商编号,SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称,SP_GG 规格,SP_SCD 产地,';
  str := str + ' SP_UNIT 单位,SP_JINJA 进价,SP_PIFAJA 批发价,SP_XIAOSOJA 销售价 ,';
  str := str + 'RK_NOMB 入库编号,RK_TYPE 入库类型,RK_QTY 入库量,CUST_NAME 入库来源,RK_DATE 入库日期,RK_QX 有效期, RK_JSR 经手人, RK_MEMO 备注';
  str := str + ' From SPJBXX,GYSXX,SPRKXX,CUST ';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=RK_SP_NOMB) and (RK_FROMID=CUST_ID)';

  str := RKTJ(str) + ' Order By RK_DATE DESC';    //加排序语句
  QueryCRK.Data := MyObj.OpenSQL(str);   //查询
  DBGridRKColumsWidth;                  //调整显示行及行宽
  Label4.Caption := '记录：' + IntToStr(QueryCRK.ReCordCount);
  DBGridRK.Columns[12].Footer.Value := '合计';
  DBGridRK.Columns[12].Footer.ValueType := fvtStaticText;
  DBGridRK.Columns[13].Footer.ValueType := fvtSum;
  DBGridRK.Columns[13].FieldName := '入库量';
  But_Ck_Rk.Enabled := True;
end;

procedure TSPKCCX.cbtnCK;
var
  str: String;
begin                  //查出库
  cdc_BOOL := True;
  ComboBoxGysN1.Itemindex := ComboBoxGYS1.ItemIndex;
  if DBGridCK.FieldCount > 8 then
    CTitleColumn := 15;   //获取出库、入库页表格列
//构造查询语句
  str := 'Select GYSNAME 供应商名称,GYS_NOMB 供应商编号,SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称,SP_GG 规格,SP_SCD 产地,';
  str := str + ' SP_UNIT 单位,SP_JINJA 进价,SP_PIFAJA 批发价,CK_DJ 销售价 ,';
  str := str + 'CK_NOMB 出库编号,CK_TYPE 出库类型,CK_QTY 出库量,CUST_NAME 去向,CK_DATE 出库日期,CK_QX 有效期, CK_JSR 经手人,CK_MEMO 备注';
  str := str + ' From SPJBXX,GYSXX,SPCKXX, CUST ';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=CK_SP_NOMB) and (CK_GOTOID=CUST_ID)';

  str := CKTJ(str) + ' Order By CK_DATE DESC';
  QueryCCK.IndexName := '';
  QueryCCK.Data := MyObj.OpenSQL(str);   //打开数据表
  DBGridCK.Columns[12].Footer.Value := '合计';
  DBGridCK.Columns[12].Footer.ValueType := fvtStaticText;
  DBGridCK.Columns[13].Footer.ValueType := fvtSum;
  DBGridCK.Columns[13].FieldName := '出库量';
  DBGridCKColumsWidth;                //调整显示行及行宽
  Label1.Caption := '记录：' + IntToStr(QueryCCK.ReCordCount);
  But_Ck_Rk.Enabled := True;
end;

procedure TSPKCCX.cCheckBox4;
begin
  if CheckBox4.Checked then
  begin
    RzDBLookupComboBox4.Enabled := True;
    SpeedButton1.Enabled := True;
  end
  else
  begin
    RzDBLookupComboBox4.Enabled := False;
    if ComboBox1.Enabled then
      SpeedButton1.Enabled := True else
      SpeedButton1.Enabled := False;
  end;
  // TODO -cMM: TSPKCCX.cCheckBox4 default body inserted
end;

procedure TSPKCCX.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    RzDateTimeEdit3.Enabled := True;
    RzDateTimeEdit4.Enabled := True;
  end
  else
  begin
    RzDateTimeEdit3.Enabled := False;
    RzDateTimeEdit4.Enabled := False;
  end;
end;

procedure TSPKCCX.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  begin
    ComboBox1.Enabled := True;
//    ComboBox1DropDown(Sender);
    ComboBox1.ImeName := zMAIN.MyIme;
    SpeedButton1.Enabled := True;
    GetKCNAME;
  end
  else
  begin
    ComboBox1.Enabled := False;
    if not RzDBLookupComboBox4.Enabled then
      SpeedButton1.Enabled := False;
  end;
end;

procedure TSPKCCX.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then
  begin
    ComboBox4.ImeName := zMAIN.MyIme;
    ComboBox4.Enabled := True;
  end
  else
  begin
    ComboBox4.Enabled := False;
  end;
end;

procedure TSPKCCX.CheckBox4Click(Sender: TObject);
begin
  cCheckBox4;
end;

procedure TSPKCCX.CheckBox5Click(Sender: TObject);
begin
  if CheckBox5.Checked then
  begin
    RzDBLookupComboBox2.Enabled := True;
  end else
  begin
    RzDBLookupComboBox2.Enabled := False;
  end;
end;

procedure TSPKCCX.CheckBox6Click(Sender: TObject);
begin
  if CheckBox6.Checked then
  begin
    ComboBox6.Enabled := True;
  end else
  begin
    ComboBox6.Enabled := False;
  end;
end;

procedure TSPKCCX.CheckBox7Click(Sender: TObject);
begin
  if CheckBox7.Checked then
  begin
    ComboBox7.Enabled := True;
    ComboBox3Change(Sender);
  end
  else
  begin
    ComboBox7.Enabled := False;
  end;

end;

procedure TSPKCCX.chk1Click(Sender: TObject);
begin
  if chk1.Checked then
  begin
    RzDateTimeEdit1.Enabled := True;
    RzDateTimeEdit2.Enabled := True;
  end
  else
  begin
    RzDateTimeEdit1.Enabled := False;
    RzDateTimeEdit2.Enabled := False;
  end;
end;

procedure TSPKCCX.chk2Click(Sender: TObject);
begin
  if chk2.Checked then
  begin
    cbRKSPNAME.Enabled := True;
  end
  else
  begin
    cbRKSPNAME.Enabled := False;
  end;
end;

procedure TSPKCCX.chk3Click(Sender: TObject);
begin
  if chk3.Checked then
  begin
    cbRKSPLX.Enabled := True;
  end
  else
  begin
    cbRKSPLX.Enabled := False;
  end;
end;

procedure TSPKCCX.chk4Click(Sender: TObject);
begin
  MyObj.cChk4;
end;

procedure TSPKCCX.GetSPNAME;
var
  i: Integer;
  Qstr: String;
begin
  cbRKSPNAME.Items.Clear;
  cbRKSPNAME.Text := '';
  CbSPBH.Items.Clear;
  CbSPBH.Text := '';

  Qstr := 'Select DISTINCT SP_NOMB 商品编号,SP_JNAME 商品名称';
  Qstr := Qstr + ' From SPJBXX,GYSXX,SPRKXX ';
  //提取商品名称
  if not chk4.Checked then         //如果
  begin             //未选择供应商
    Qstr := Qstr + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=RK_SP_NOMB)';                    //选择了供应商
  end else
  begin             //选择了供应商
    Qstr := Qstr + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=RK_SP_NOMB) and (GYSNAME=''' + ComboBoxGYS2.Text + ''')';            //未选择供应商
  end;
  qstr := qstr + ' Order By shiyong DESC';
  QrySPNAME.Data := MyObj.OpenSQL(qstr);   //打开数据表
  for i := 0 to QrySPNAME.RecordCount - 1 do
  begin
//    ComboBox1.Items.Add(QrySPNAME.FieldByName('商品名称').AsString);
    cbRKSPNAME.Items.Add(QrySPNAME.FieldByName('商品名称').AsString);
    CbSPBH.Items.Add(QrySPNAME.FieldByName('商品编号').AsString);
    QrySPNAME.Next;
  end;
end;

procedure TSPKCCX.GetKCNAME;
var
  i: Integer;
  Qstr: String;
begin
  ComboBox1.Items.Clear;
  ComboBox1.Text := '';
  Qstr := 'Select DISTINCT SP_NOMB 商品编号,SP_JNAME 商品名称';
  Qstr := Qstr + ' From GYSXX,KCB,SPJBXX';
  //提取商品名称
  if not CheckBox4.Checked then         //如果
  begin             //未选择供应商
    Qstr := Qstr + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB)';                    //选择了供应商
  end else
  begin             //选择了供应商
    if RzDBLookupComboBox4.Text <> '全部' then       //如果没选择全部，进行下行
    Qstr := Qstr + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB) and (GYSNAME=''' + RzDBLookupComboBox4.Text + ''')';             //未选择供应商
  end;
  qstr := qstr + ' Order By shiyong DESC';
  QrySPNAME.Data := MyObj.OpenSQL(qstr);   //打开数据表
  for i := 0 to QrySPNAME.RecordCount - 1 do
  begin
    ComboBox1.Items.Add(QrySPNAME.FieldByName('商品名称').AsString);
    QrySPNAME.Next;
  end;
  QrySPNAME.first;
end;

procedure TSPKCCX.GetckSPNAME;
var
  i: Integer;
  Qstr: String;
begin
  cbcKSPNAME.Items.Clear;
  cbcKSPNAME.Text := '';
  ComboBox2.Items.Clear;
  ComboBox2.Text := '';
  //提取出库商品名称
  Qstr := 'Select DISTINCT SP_NOMB 商品编号,SP_JNAME 商品名称';
  Qstr := Qstr + ' From SPJBXX a,GYSXX b,SPCKXX c ';
  if not chkC_GYS.Checked then         //如果
  begin             //未选择供应商
    Qstr := Qstr + 'Where (a.SP_GYSID=b.GYS_NOMB) and (a.SP_NOMB=c.CK_SP_NOMB)';                    //选择了供应商
  end else
  begin             //选择了供应商
    Qstr := Qstr + 'Where (a.SP_GYSID=b.GYS_NOMB) and (a.SP_NOMB=c.CK_SP_NOMB) and (GYSNAME=''' + ComboBoxGYS1.Text + ''')';             //未选择供应商
  end;
  qstr := qstr + ' Order By shiyong DESC';
  QrySPNAME.Data := MyObj.OpenSQL(qstr);   //打开数据表
  begin
    for i := 0 to QrySPNAME.RecordCount - 1 do
    begin
      cbcKSPNAME.Items.Add(QrySPNAME.FieldByName('商品名称').AsString);
      ComboBox2.Items.Add(QrySPNAME.FieldByName('商品编号').AsString);
      QrySPNAME.Next;
    end;
  end;
end;

procedure TSPKCCX.GetCxSPNAME;     //商品查询页获取商品名称
var
  i: Integer;
  Qstr: String;
begin
  ComboBox4.Items.Clear;
  ComboBox4.Text := '';
  ComboBox5.Items.Clear;
  ComboBox5.Text := '';
  //提取出库商品名称
  Qstr := 'Select DISTINCT SP_NOMB 商品编号,SP_JNAME 商品名称';
  Qstr := Qstr + ' From SPJBXX a,GYSXX b ';
  if not checkbox5.Checked then         //如果
  begin             //未选择供应商
    Qstr := Qstr + ' Where (a.SP_GYSID=b.GYS_NOMB)';         //选择了供应商
  end else
  begin             //选择了供应商
    Qstr := Qstr + ' Where (a.SP_GYSID=b.GYS_NOMB) and (GYSNAME=''' + RzDBLookupComboBox2.Text + ''')';             //未选择供应商
  end;
  qstr := qstr + ' Order By shiyong DESC';
  QrySPNAME.Data := MyObj.OpenSQL(qstr);   //打开数据表
  for i := 0 to QrySPNAME.RecordCount - 1 do
  begin
    ComboBox4.Items.Add(QrySPNAME.FieldByName('商品名称').AsString);
//    ComboBox5.Items.Add(QrySPNAME.FieldByName('商品编号').AsString);
    QrySPNAME.Next;
  end;
end;

procedure TSPKCCX.DBGridRKColumsWidth;       //调整显示行及行宽
begin
  if QueryCRK.ReCordCount = 0 then
  begin
    ShowMessage('没有找到合符条件的记录!');
  end else
  begin
    DBGridRK.Columns[0].Width := 80;
    DBGridRK.Columns[1].Width := 90;
    DBGridRK.Columns[2].Width := 90;
    DBGridRK.Columns[3].Width := 90;
    DBGridRK.Columns[4].Width := 60;
    DBGridRK.Columns[5].Width := 40;
    DBGridRK.Columns[6].Width := 40;
    DBGridRK.Columns[7].Width := 40;
    DBGridRK.Columns[8].Width := 40;
    DBGridRK.Columns[9].Width := 40;
    DBGridRK.Columns[10].Width := 40;
    DBGridRK.Columns[11].Width := 90;
    DBGridRK.Columns[12].Width := 60;
    DBGridRK.Columns[13].Width := 50;
    DBGridRK.Columns[14].Width := 55;
    DBGridRK.Columns[15].Width := 70;
    DBGridRK.Columns[16].Width := 60;
    DBGridRK.Columns[17].Width := 60;
    DBGridRK.Columns[18].Width := 100;
    DBGridRK.Columns[1].Visible := False;
    DBGridRK.Columns[2].Visible := False;
    DBGridRK.Columns[4].Visible := False;
    DBGridRK.Columns[6].Visible := False;
    DBGridRK.Columns[8].Visible := False;
    DBGridRK.Columns[9].Visible := False;
    DBGridRK.Columns[10].Visible := False;
    DBGridRK.Columns[11].Visible := False;
  end;
end;

procedure TSPKCCX.DBGridTjRKColumsWidth;       //调整统计入库显示行及行宽
begin
  if QueryCRK.ReCordCount = 0 then
  begin
    ShowMessage('没有找到合符条件的记录!');
  end else
  begin
    DBGridRK.Columns[0].Width := 68;
    DBGridRK.Columns[1].Width := 92;
    DBGridRK.Columns[2].Width := 92;
    DBGridRK.Columns[3].Width := 110;
    DBGridRK.Columns[4].Width := 70;
    DBGridRK.Columns[5].Width := 50;
    DBGridRK.Columns[6].Width := 40;
    DBGridRK.Columns[7].Width := 35;
    DBGridRK.Columns[8].Width := 40;
    DBGridRK.Columns[9].Width := 40;
//    DBGridRK.Columns[10].Width := 40;
//    DBGridRK.Columns[11].Width := 90;
//    DBGridRK.Columns[12].Width := 60;
//    DBGridRK.Columns[13].Width := 50;
//    DBGridRK.Columns[14].Width := 55;
//    DBGridRK.Columns[15].Width := 70;
//    DBGridRK.Columns[16].Width := 55;
//    DBGridRK.Columns[17].Width := 100;
//    DBGridRK.Columns[1].Visible := False;
//    DBGridRK.Columns[2].Visible := False;
//    DBGridRK.Columns[4].Visible := False;
//    DBGridRK.Columns[6].Visible := False;
//    DBGridRK.Columns[8].Visible := False;
//    DBGridRK.Columns[9].Visible := False;
//    DBGridRK.Columns[10].Visible := False;
//    DBGridRK.Columns[11].Visible := False;
  end;
end;

procedure TSPKCCX.DBGridSPColumsWidth;       //调整显示行及行宽
begin
  if QuerySP.ReCordCount = 0 then
  begin
    ShowMessage('没有找到合符条件的记录!');
  end else
  if RzDBLookupComboBox2.Text = '安利' then
  begin
    DBGridSP.Columns[0].Width := 65;
    DBGridSP.Columns[1].Width := 90;
    DBGridSP.Columns[2].Width := 92;
    DBGridSP.Columns[3].Width := 110;
    DBGridSP.Columns[4].Width := 90;
    DBGridSP.Columns[5].Width := 50;
    DBGridSP.Columns[6].Width := 40;
    DBGridSP.Columns[7].Width := 35;
    DBGridSP.Columns[8].Width := 40;
    DBGridSP.Columns[9].Width := 55;
//    DBGridSP.Columns[10].Width := 40;
//    DBGridSP.Columns[11].Width := 120;
//    DBGridSP.Columns[1].Visible := False;
//    DBGridSP.Columns[2].Visible := False;
//    DBGridSP.Columns[7].Visible:=False;
//    DBGridSP.Columns[6].Visible := False;
//    DBGridSP.Columns[8].Visible := False;
//    DBGridSP.Columns[9].Visible := False;
    DBGridSP.Columns[10].Visible := False;
    DBGridSP.Columns[11].Visible := False;
//    DBGridRK.Columns[12].Width := 60;
//    DBGridRK.Columns[13].Width := 50;
//    DBGridRK.Columns[14].Width := 55;
//    DBGridRK.Columns[15].Width := 70;
//    DBGridRK.Columns[16].Width := 55;
//    DBGridRK.Columns[17].Width := 100;

  end else
  begin
    DBGridSP.Columns[0].Width := 65;
    DBGridSP.Columns[1].Width := 90;
    DBGridSP.Columns[2].Width := 92;
    DBGridSP.Columns[3].Width := 110;
    DBGridSP.Columns[4].Width := 90;
    DBGridSP.Columns[5].Width := 50;
    DBGridSP.Columns[6].Width := 40;
    DBGridSP.Columns[7].Width := 35;
    DBGridSP.Columns[8].Width := 40;
    DBGridSP.Columns[9].Width := 40;
//    DBGridSP.Columns[10].Width := 40;
//    DBGridSP.Columns[11].Width := 120;
//    DBGridSP.Columns[1].Visible := False;
//    DBGridSP.Columns[2].Visible := False;
//    DBGridSP.Columns[7].Visible:=False;
//    DBGridSP.Columns[6].Visible := False;
//    DBGridSP.Columns[8].Visible := False;
//    DBGridSP.Columns[9].Visible := False;
    DBGridSP.Columns[10].Visible := False;
    DBGridSP.Columns[11].Visible := False;
//    DBGridRK.Columns[12].Width := 60;
//    DBGridRK.Columns[13].Width := 50;
//    DBGridRK.Columns[14].Width := 55;
//    DBGridRK.Columns[15].Width := 70;
//    DBGridRK.Columns[16].Width := 55;
//    DBGridRK.Columns[17].Width := 100;
  end;
end;

procedure TSPKCCX.DBGridTjSPColumsWidth;       //调整统计商品显示行及行宽
begin
  if QuerySP.ReCordCount = 0 then
  begin
    ShowMessage('没有找到合符条件的记录!');
  end else
  begin
    DBGridSP.Columns[0].Width := 85;
    DBGridSP.Columns[1].Width := 110;
    DBGridSP.Columns[2].Width := 112;
//    DBGridSP.Columns[3].Width := 110;
//    DBGridSP.Columns[4].Width := 90;
//    DBGridSP.Columns[5].Width := 60;
//    DBGridSP.Columns[6].Width := 40;
//    DBGridSP.Columns[7].Width := 35;
//    DBGridSP.Columns[8].Width := 40;
  end;
end;

procedure TSPKCCX.DBGridCKColumsWidth;       //调整显示行及行宽
begin
  if QueryCCK.RecordCount > 0 then
  begin
    DBGridCK.Columns[0].Width := 80;
    DBGridCK.Columns[1].Width := 90;
    DBGridCK.Columns[2].Width := 90;
    DBGridCK.Columns[3].Width := 90;
    DBGridCK.Columns[4].Width := 60;
    DBGridCK.Columns[5].Width := 40;
    DBGridCK.Columns[6].Width := 40;
    DBGridCK.Columns[7].Width := 40;
    DBGridCK.Columns[8].Width := 40;
    DBGridCK.Columns[9].Width := 40;
    DBGridCK.Columns[10].Width := 50;
    DBGridCK.Columns[11].Width := 90;
    DBGridCK.Columns[12].Width := 60;
    DBGridCK.Columns[13].Width := 50;
    DBGridCK.Columns[14].Width := 55;
    DBGridCK.Columns[15].Width := 60;
    DBGridCK.Columns[16].Width := 60;
    DBGridCK.Columns[17].Width := 60;
    DBGridCK.Columns[18].Width := 80;
    DBGridCK.Columns[1].Visible := False;
    DBGridCK.Columns[2].Visible := False;
    DBGridCK.Columns[4].Visible := False;
    DBGridCK.Columns[6].Visible := False;
    DBGridCK.Columns[8].Visible := False;
    DBGridCK.Columns[9].Visible := False;
//    DBGridCK.Columns[10].Visible := False;
    DBGridCK.Columns[11].Visible := False;
  end;
end;

procedure TSPKCCX.DBGridTjCKColumsWidth;       //统计调整显示行及行宽
begin
  if QueryCCK.RecordCount > 0 then
  begin
    DBGridCK.Columns[0].Width := 70;
    DBGridCK.Columns[1].Width := 90;
    DBGridCK.Columns[2].Width := 90;
    DBGridCK.Columns[3].Width := 110;
    DBGridCK.Columns[4].Width := 90;
    DBGridCK.Columns[5].Width := 50;
    DBGridCK.Columns[6].Width := 40;
    DBGridCK.Columns[7].Width := 35;
    DBGridCK.Columns[8].Width := 40;
  end;
end;

procedure TSPKCCX.chk5Click(Sender: TObject);
begin
  if chk5.Checked then
  begin
    cbSPLY.Enabled := True;
    GetSPLY;
  end else
  begin
    cbSPLY.Enabled := False;
  end;
end;

procedure TSPKCCX.CHKC_GOTOClick(Sender: TObject);
begin
  if CHKC_GOTO.Checked then
  begin
    CBC_GOTO.Enabled := True;
  end
  else
  begin
    CBC_GOTO.Enabled := False;
  end;
end;

procedure TSPKCCX.chkC_GYSClick(Sender: TObject);
begin
  MyObj.cChKC_GYS;
end;

procedure TSPKCCX.CHKC_SPNAMEClick(Sender: TObject);
begin
  if chkC_SPNAME.Checked then
  begin
    cbCKSPNAME.Enabled := True;
  end
  else
  begin
    cbCKSPNAME.Enabled := False;
  end;
end;

procedure TSPKCCX.CHKC_TYPEClick(Sender: TObject);
begin
  if chkC_TYPE.Checked then
  begin
    cbCKTYPE.Enabled := True;
  end
  else
  begin
    cbCKTYPE.Enabled := False;
  end;
end;

procedure TSPKCCX.ComboBox1Click(Sender: TObject);
begin
  cSpeedBut;
end;

procedure TSPKCCX.ComboBox3Change(Sender: TObject);
var
  istr: string;
begin
  istr := 'Select PD_DATE 盘点日期, PD_GYS 供应商, SP_name 产品名称, PD_QTY 数量 From pdb, spjbxx Where pd_sp_nomb = sp_nomb';
  if CheckBox7.Checked then
    istr := istr + ' and (PD_Date=''' + ComboBox3.text + ''') and (PD_GYS=''' + ComboBox7.Text + ''')'
  else
    istr := istr + ' and (PD_Date=''' + ComboBox3.text + ''')';
  istr := istr + '  Order By PD_DATE DESC, PD_GYS';
  QueryPDB.Data := MyObj.OpenSQL(istr);   //打开数据表
end;

procedure TSPKCCX.GetSPLY;        //入库查询__获取商品来源列表
var
  i: Integer;
  str: string;
begin
  cbSPLY.Clear;
  str := 'Select DISTINCT RK_FROMID  From SPRKXX ';
  if chk3.Checked then
    str := str + ' Where RK_GYS_NOMB=''' + ComboBoxGysN2.Text + ''' and (RK_TYPE=''' + cbRKSPLX.Text + ''')' else
    str := str + ' Where RK_GYS_NOMB=''' + ComboBoxGysN2.Text + '''';
  str := str + ' GROUP BY RK_FROMID';
  str := str + ' ORDER BY  RK_DATE  DESC';
  QrySPNAME.Data := MyObj.OpenSQL(str);   //打开数据表
  for i := 0 to QrySPNAME.RecordCount - 1 do
  begin
    cbSPLY.Items.Add(pCUSTID(QrySPNAME.FieldByName('RK_FROMID').AsInteger));
    QrySPNAME.Next;
  end;
end;

procedure TSPKCCX.GetCKSPQX;        //获取商品去向列表
var
  i: Integer;
  str: string;
begin
  CBC_GOTO.Clear;
  str := 'Select DISTINCT CK_GOTOID, CK_DATE From SPCKXX, CUST ';
  if CHKC_TYPE.Checked then
    str := str + ' Where (CK_GYS_NOMB=''' + ComboBoxGysN1.Text + ''') and (CUST_ID=CK_GOTOID) and (CK_TYPE=''' + cbCKTYPE.Text + ''')' else
    str := str + ' Where (CK_GYS_NOMB=''' + ComboBoxGysN1.Text + ''') and (CUST_ID=CK_GOTOID)';
  str := str + ' GROUP BY CK_GOTOID';
  str := str + ' ORDER BY pinglu  DESC';
  QrySPNAME.Data := MyObj.OpenSQL(str);   //打开数据表
  for i := 0 to QrySPNAME.RecordCount - 1 do
  begin
    CBC_GOTO.Items.Add(pCUSTID(QrySPNAME.FieldByName('CK_GOTOID').AsInteger));
    QrySPNAME.Next;
  end;
end;

procedure TSPKCCX.ComboBox4ContextPopup(Sender: TObject; MousePos: TPoint; var
  Handled: Boolean);
begin
  GetKCNAME;
end;

procedure TSPKCCX.ComboBox4DropDown(Sender: TObject);
begin
  GetCxSPNAME;
end;

procedure TSPKCCX.ComboBox7Click(Sender: TObject);
var
  istr: string;
begin
  istr := 'Select PD_DATE 盘点日期, PD_GYS 供应商, SP_name 产品名称, PD_QTY 数量 From pdb, spjbxx Where (pd_sp_nomb = sp_nomb) ';
  if ComboBox3.Text <> '' then
    istr := istr + ' and (PD_Date=''' + ComboBox3.text + ''') and (PD_GYS=''' + ComboBox7.Text + ''')'
  else
    istr := istr + ' and (PD_GYS=''' + ComboBox7.Text + ''')';
  QueryPDB.Data := MyObj.OpenSQL(istr);   //打开数据表
end;

procedure TSPKCCX.ComboBoxGYS1Change(Sender: TObject);
begin
  ckgys := ComboBoxGYS1.Text;
  ComboBoxGYSN1.ItemIndex := ComboBoxGYS1.ItemIndex;
end;

procedure TSPKCCX.ComboBoxGYS2Change(Sender: TObject);
begin
  rkgys := ComboBoxGYS2.Text;
  ComboBoxGYSN2.ItemIndex := ComboBoxGYS2.ItemIndex;
end;

procedure TSPKCCX.ComboBoxGYS3Change(Sender: TObject);
begin
  ComboBoxGysN3.ItemIndex := ComboBoxGYS3.ItemIndex;
end;

procedure TSPKCCX.cSpeedBut;
var
  str: String;
begin                  //查库存
//构造查询语句
  str := 'select GYSNAME 公司名称,SP_JNAME 商品简称,SP_JINJA 价格, KCSP_QTY 数量,KCSP_QX 有效期 ';
  str := str + ' from KCB,SPJBXX,GYSXX';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB)';
  QueryCKC.IndexName := '';
  KCCXTJ(str);
  DBGrid1.Columns[3].Footer.ValueType := fvtSum;
  CX_BOOL := False;        //
end;

procedure TSPKCCX.CxShow;
var
  CDSGYS: TDataSource;
  i: Integer;
  str: String;
begin
  // TODO -cMM: TSPKCCX.CxShow default body inserted
  pdstr := 'Select PD_DATE 盘点日期, PD_GYS 供应商, SP_name 产品名称, PD_QTY 数量 From pdb, spjbxx Where pd_sp_nomb = sp_nomb Order By PD_DATE DESC, PD_GYS';
  RTitleColumn := 15;
  CTitleColumn := 15;     //获取出库、入库页表格列
  TitleColumn := 1;        //要排序的表头列，以此列相同名称值为颜色的区分值，即此列排序后相同值的行颜色相同
  CX_BOOL := False;        //统计的标志（库存查询页统计按钮按下为True
  hl := '7';                 //汇率
  if QrySPNAME = nil then
    QrySPNAME := TClientDataSet.Create(self);  //用来显示商品名称
//  if QueryCGYS = nil then
  QueryCGYS := TClientDataSet.Create(self);   //供应商表
//  if QuerySP = nil then
  QuerySP := TClientDataSet.Create(self);   //商品基本信息表
//  if QueryCKC = nil then
  QueryCKC := TClientDataSet.Create(self);   //商品基本信息表
  QueryPD := TClientDataSet.Create(self);   //盘点信息表
  QueryPDB := TClientDataSet.Create(self);
//  if QueryCRK = nil then
  QueryCRK := TClientDataSet.Create(self);
 // if QueryCCK = nil then
  QueryCCK := TClientDataSet.Create(self);  //出库信息表
  QueryCTYPE := TClientDataSet.Create(self);  //出库类型
  QueryJS := TClientDataSet.Create(self);  //
  QueryJS2 := TClientDataSet.Create(self);  //
  Queryini := TClientDataSet.Create(self);;

  DS_CXSP := TDataSource.Create(self);
  DS_CXRK := TDataSource.Create(self);
  DS_CXCK := TDataSource.Create(self);
  DS_CXKC := TDataSource.Create(self);
  DS_PDB := TDataSource.Create(self);
  DS_JS := TDataSource.Create(self);
  DS_CXSP.DataSet := QuerySP;
  DS_CXRK.DataSet := QueryCRK;
  DS_CXCK.DataSet := QueryCCK;
  DS_CXKC.DataSet := QueryCKC;
  DS_PDB.DataSet := QueryPDB;
  DS_JS.DataSet := QueryJS;
  DBGridEhPD.DataSource := DS_PDB;

  DBGrid1.DataSource := DS_CXKC;
  DBGridRK.DataSource := DS_CXRK;
  DBGridCK.DataSource := DS_CXCK;
  DBGridSP.DataSource := DS_CXSP;
  DBGridEhJS.DataSource := DS_JS;


  CDSGYS := TDataSource.Create(self);
  CDSPNAME := TDataSource.Create(self);
  CDSPNAME.DataSet := QrySPNAME;
  CDSGYS.DataSet := QueryCGYS;
  RzDBLookupComboBox2.ListSource := CDSGYS;
  RzDBLookupComboBox2.ListField := 'GYSNAME';
  RzDBLookupComboBox2.KeyField := 'GYS_NOMB';

  //Cust
  dsCust.DataSet := DModule.cdsCust;
//  DModule.cdsCust.Data := MyObj.CustSQL('Select CUST_ID ID, CUST_NAME 客户名, CUST_AID From Cust');
  DModule.cdsCust.Data := MyObj.CustSQL('Select CUST_ID ID, CUST_NAME 客户名 From Cust');

//  str := 'Select DISTINCT SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称';
  str := 'Select DISTINCT SP_NOMB ,SP_NAME ,SP_JNAME ';
  str := str + ' From GYSXX,KCB,SPJBXX';
  str := str + ' Order By shiyong DESC';
  QrySPNAME.Data := MyObj.OpenSQL(str);   //打开商品数据表
  str := 'Select GYSNAME 供应商名称,GYS_NOMB 供应商编号,SP_NOMB 商品编号,SP_NAME 商品名称,SP_JNAME 商品简称,SP_GG 规格,SP_SCD 产地,';
  str := str + 'SP_UNIT 单位,SP_JINJA 进价,SP_PIFAJA 批发价,SP_XIAOSOJA 销售价,SP_MEMO 备注';
  str := str + ' From SPJBXX,GYSXX ';
  str := str + ' Where (SP_GYSID=GYS_NOMB)';
  str := str + ' and (GYSNAME=''ARIIX'') ';
  QuerySP.Data := MyObj.OpenSQL(str);   //打开商品数据表
  DBGridSPColumsWidth;                 //调整显示行及行宽
  QueryPDB.Data := MyObj.OpenSQL(pdstr);

  str := 'Select * From GYSXX ';
  QueryCGYS.Data := MyObj.OpenSQL(str);   //打开GYS数据表
  RzDBLookupComboBox4.Items.Clear;
  RzDBLookupComboBox4.Text := '';
  for i := 0 to QueryCGYS.RecordCount - 1 do
  begin
    RzDBLookupComboBox4.Items.Add(QueryCGYS.FieldByName('GYSNAME').AsString);  //供应商名称写入下拉列表
    QueryCGYS.Next;
  end;

  Label1.Caption := '记录：';
  Label4.Caption := '记录：';
  Label5.Caption := '记录：';
  Label6.Caption := '记录：';
  Label8.Caption := '记录：';
  str := 'Select * from ini ';                //查询ini库
  Queryini.Data := MyObj.OpenSQL(str);                        //打开商品数据表
  CX_page := Queryini.FieldByName('sear').AsInteger;          //上次退出时所在TAB
  RzDBLookupComboBox4.Text := 'ARIIX';
  PageControl1.TabIndex := CX_page;
  cCheckBox4;
  CheckBox4.Enabled := True;
  GetKCNAME;
  MyObj.cChKC_GYS;
  MyObj.cChk4;
  cSpeedBut;

  ComboBoxGYS1.Clear;
  ComboBoxGYS2.Clear;
  ComboBoxGYS3.Clear;
  ComboBoxGysN1.Clear;
  ComboBoxGysN2.Clear;
  ComboBox7.Clear;
  QueryCGYS.First;
  ////          生成类型出库列表
  cbCKTYPE.Items.Clear;
  str := 'select DISTINCT CK_TYPE from SPCKXX ';    //
  QueryCTYPE.Data := MyObj.OpenSQL(str);   //打开数据表
  if (QueryCTYPE.recordcount > 0) then
  begin
    QueryCTYPE.first;
    for i := 0 to QueryCTYPE.recordcount - 1 do
    begin
      cbCKTYPE.Items.add(QueryCTYPE.FieldByName('CK_TYPE').asstring);
      QueryCTYPE.next;
    end;
  end;

  cbRKSPLX.Items.Clear;
  str := 'select DISTINCT RK_TYPE from SPRKXX ';    //
  QueryCTYPE.Data := MyObj.OpenSQL(str);   //打开数据表
  if (QueryCTYPE.recordcount > 0) then
  begin
    QueryCTYPE.first;
    for i := 0 to QueryCTYPE.recordcount - 1 do
    begin
      cbRKSPLX.Items.add(QueryCTYPE.FieldByName('RK_TYPE').asstring);
      QueryCTYPE.next;
    end;
  end;
  ////

  str := 'select DISTINCT GYSNAME, GYS_NOMB from SPRKXX S,GYSXX G';    //从入库信息中提出供应商名称
  str := str + ' Where RK_GYS_NOMB=GYS_NOMB Order By GYS_NOMB';
  QueryCGYS.Data := MyObj.OpenSQL(str);   //打开数据表
  if (QueryCGYS.recordcount > 0) then
  begin
    QueryCGYS.first;
    for i := 0 to QueryCGYS.recordcount - 1 do
    begin
      ComboBoxGYS1.Items.add(QueryCGYS.FieldByName('GYSNAME').asstring);
      ComboBoxGYS2.Items.add(QueryCGYS.FieldByName('GYSNAME').asstring);
      ComboBoxGYS3.Items.add(QueryCGYS.FieldByName('GYSNAME').asstring);
      ComboBox7.Items.Add(QueryCGYS.FieldByName('GYSNAME').asstring);
      ComboBoxGysN1.items.add(QueryCGYS.FieldByName('GYS_NOMB').asstring);
      ComboBoxGysN2.items.add(QueryCGYS.FieldByName('GYS_NOMB').asstring);
      ComboBoxGysN3.items.add(QueryCGYS.FieldByName('GYS_NOMB').asstring);
      QueryCGYS.next;
    end;
  end;
  ComboBoxJS.Clear;
  str := 'Select *  From CUST Order By pinglu DESC';
  QrySPNAME.Data := MyObj.OpenSQL(str);   //打开数据表
  for i := 0 to QrySPNAME.RecordCount - 1 do
  begin
    ComboBoxJS.Items.Add(QrySPNAME.FieldByName('CUST_NAME').AsString);
    QrySPNAME.Next;
  end;
  ComboBoxJS.ItemIndex := 2;
  ComboBoxGYS1.ItemIndex := 0;
  ComboBoxGYS2.ItemIndex := 0;
  ComboBoxGYS3.ItemIndex := 0;
  ComboBoxGYS1.Text := CKGYS;          //默认值
  ComboBoxGYS2.Text := RKGYS;
  ComboBoxGYS3.Text := RKGYS;
  RzDBLookupComboBox4.Text := kcgys;
  ComboBox7.ItemIndex := 0;
  ComboBox7.Enabled := False;
  cBtn2;
  cbtnCK;
  RTitleColumn := 15;
  CTitleColumn := 15;
end;

procedure TSPKCCX.Button5Click(Sender: TObject);
var
  str : string;
begin
  str := 'Update Cust set Cust_Name =''' + DBGridCust.Fields[1].AsString + '''  Where Cust_ID = ' + DBGridCust.Fields[0].AsString;
  MyObj.ExecSQL(str);   //
//  Memo1.Lines.Add(str);
//  DModule.cdsCust.ApplyUpdates(0);
//  Memo1.Lines.Add('路径: ' + MyObj.AUserDM.ZUser.database);    //在状态栏显示数据库路径
//  Memo1.Lines.Add('DModule.cdsCust: ' + DModule.cdsCust.ProviderName);
end;

procedure TSPKCCX.Button6Click(Sender: TObject);
var
  str: String;
begin                  //统计库存量
  CX_BOOL := True;        //统计标志
//构造查询语句
  str := 'select  kcsp_gysid 公司名称,SP_NAME 商品名称,SP_JNAME 商品简称,SP_JINJA 价格, Sum(KCSP_QTY) 数量 ';
  str := str + ' from KCB,SPJBXX,GYSXX';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB)';
  QueryCKC.IndexName := '';
  KCCXTJ(str);
  DBGrid1.Columns[3].Footer.ValueType := fvtSum;
  DBGrid1.Columns[4].Footer.ValueType := fvtSum;
//  DBGrid1.Columns[3].FieldName := '数量';
  CX_BOOL := False;        //
end;

procedure TSPKCCX.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if DBGrid1.Fields[TitleColumn].AsString = astr then
  begin
//    DBGrid1.Canvas.Font.Color := clBlue;
    DBGrid1.Canvas.Brush.Color := acc;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end else
  begin
    if acc = $FACE87 then
      DBGrid1.Canvas.Brush.Color := $FFFFF0 else
      DBGrid1.Canvas.Brush.Color := $FACE87;
//  DBGrid1.Canvas.Font.Color:=clWhite;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
//
  if DataCol = 4 then
  begin
    astr := DBGrid1.Fields[TitleColumn].AsString;
    acc := DBGrid1.Canvas.Brush.Color;
  end;
  if gdSelected in state then
  begin
    DBGrid1.Canvas.Font.Color := $FFFFF0; //clRed;
    DBGrid1.Canvas.Brush.Color := $008CFF; //clBlue;
    DBGrid1.DefaultDrawColumnCell(rect, datacol, column, state);
  end;
end;

procedure TSPKCCX.DBGrid1TitleClick(Column: TColumnEh);
begin
  DBGridTitleClick(DBGrid1, Column);
end;

procedure TSPKCCX.DBGridCKDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if DBGridCK.Fields[CTitleColumn].AsString = astr then
  begin
//    DBGrid1.Canvas.Font.Color := clBlue;
    DBGridCK.Canvas.Brush.Color := acc;
//    DBGridCK.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end else
  begin
    if acc = $FFFFE0 then
      DBGridCK.Canvas.Brush.Color := $EEEEAF   else     //  $96D2C8
      DBGridCK.Canvas.Brush.Color := $FFFFE0;
//  DBGrid1.Canvas.Font.Color:=clWhite;
//    DBGridCK.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if DataCol = 3 then
  begin
    astr := DBGridCK.Fields[CTitleColumn].AsString;
    acc := DBGridCK.Canvas.Brush.Color;
  end;
  if gdSelected in state then
  begin
    DBGridCK.Canvas.Font.Color := clWhite;
    DBGridCK.Canvas.Brush.Color := $008CFF;
  end;
  DBGridCK.DefaultDrawColumnCell(rect, datacol, column, state);
//  Label14.Caption:= DBGridCK.Fields[15].AsString;
end;

procedure TSPKCCX.DBGridCKTitleClick(Column: TColumnEh);
begin
  DBGridTitleClick(DBGridCK, Column);
end;

procedure TSPKCCX.KCCXTJ(str: string);     //库存查询统计
begin
  if CheckBox4.Checked then//选择供应商
  begin
    str := str + ' and (GYSNAME=''' + Trim(kcgys) + ''') ';
    if CheckBox2.Checked then//选择了商品名称
    begin
      str := str + ' and (SP_JNAME Like ''%' + Trim(ComboBox1.Text) + '%'')';
    end;
  end
  else//没有选择供应商
  begin
    if CheckBox2.Checked then//选择了商品名称
    begin
      str := str + ' and (SP_JNAME Like ''%' + Trim(ComboBox1.Text) + '%'')';
    end;
  end;
  if CX_BOOL then
    str := str + ' Group by SP_NAME Order By 数量 DESC' else
    str := str + ' Order By KCSP_SP_NOMB, KCSP_QTY DESC';               // KCSP_SP_NOMB, KCSP_QTY DESC       商品名称
  QueryCKC.Data := MyObj.OpenSQL(str);   //打开商品数据表
  DBGridColmWidth;
  SpeedButton3.Enabled := True;
  Label6.Caption := '记录：' + IntToStr(QueryCKC.ReCordCount);
  DBGrid1.Columns[2].Footer.ValueType := fvtStaticText;
  DBGrid1.Columns[2].Footer.Value := '合计';
end;

procedure TSPKCCX.SpeedButton2Click(Sender: TObject);
var
  str: String;
begin                   //查询数据库内所有数据
  QueryCKC.IndexName := '';
  str := 'select GYSNAME 公司名称,SP_JNAME 商品简称,SP_JINJA 价格, KCSP_QTY 数量, KCSP_QX 有效期 ';
  str := str + ' from KCB,SPJBXX,GYSXX  Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB) Order By 公司名称';
  QueryCKC.Data := MyObj.OpenSQL(str);   //打开数据表
  DBGridColmWidth;
  Label6.Caption := '记录：' + IntToStr(QueryCKC.ReCordCount);
  SpeedButton3.Enabled := True;
  DBGrid1.Columns[3].Footer.ValueType := fvtSum;
  DBGrid1.Columns[3].FieldName := '数量';
end;

procedure TSPKCCX.DBGridColmWidth;
begin
  DBGrid1.DataSource := DS_CXKC;
  if QueryCKC.ReCordCount > 0 then
  begin
    DBGrid1.Columns[0].Width := 58;   //DBGrid宽度设置
    DBGrid1.Columns[1].Width := 110;
    DBGrid1.Columns[2].Width := 60;
    DBGrid1.Columns[3].Width := 60;
    DBGrid1.Columns[4].Width := 70;
//    DBGrid1.Columns[5].Width := 60;
  end;
end;

procedure TSPKCCX.DBGridRKDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if DBGridRK.Fields[RTitleColumn].AsString = astr then       //如果与上一行的值相同
  begin
//    DBGrid1.Canvas.Font.Color := clBlue;
    DBGridRK.Canvas.Brush.Color := acc;
    DBGridRK.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end else
  begin                                            //与上一行的颜色值不同
    if acc = RGB(095, 212, 189) then                          //上一行的颜色是否为此色
      DBGridRK.Canvas.Brush.Color := RGB(189, 236, 230)   else     //$FFF8F0 else  //改变颜色
      DBGridRK.Canvas.Brush.Color := RGB(095, 212, 189);                 //$ADE6CD;
//  DBGrid1.Canvas.Font.Color:=clWhite;
    DBGridRK.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if DataCol = 3 then                             //DataCol为表格中显示的字段序号，不显示的不会有该字段的序号出现，
  begin
    astr := DBGridRK.Fields[RTitleColumn].AsString;          //记录本行的某字段值
    acc := DBGridRK.Canvas.Brush.Color;            //记录本行的颜色
  end;
  if gdSelected in state then
  begin
//    DBGridRK.Canvas.Font.Color := clRed;         //选中行的字体色
    DBGridRK.Canvas.Brush.Color := $008CFF;
  DBGridRK.DefaultDrawColumnCell(rect, datacol, column, state);
  end;
end;

procedure TSPKCCX.DBGridRKTitleClick(Column: TColumnEh);
begin
  DBGridTitleClick(DBGridRK, Column);
end;

procedure TSPKCCX.DBGridSPTitleClick(Column: TColumnEh);
begin
  DBGridTitleClick(DBGridSP, Column);
end;

procedure TSPKCCX.FormClose(Sender: TObject; var Action: TCloseAction);
var
  cstr: string;
begin
  Cstr := 'Update ini set sear=' + IntToStr(PageControl1.TabIndex);   //记录PageControl1.TabIndex值
  MyObj.ExecSQL(cstr);
  Queryini.Close;
end;

procedure TSPKCCX.SpeedButton3Click(Sender: TObject);
var
  i: integer;
  excelapp, book, sheet: variant;
  Present: TDateTime;
  Year, Month, Day: Word;
  xl: olevariant;
  cWidch: Array[0..4] of Integer;     //单元格宽度
begin
  cWidch[0] := 8;
  cWidch[1] := 18;
  cWidch[2] := 11;
  cWidch[3] := 10;
  cWidch[4] := 10;
  MyObj.DataSetToExcelw(DBGrid1.datasource.dataset, cWidch);    //调用导出函数
end;

function TSPKCCX.DBGridTitleClick(Gx: TDBGridEh; Column: TColumnEh): Boolean;
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

{  if pos('↑', disp) > 0 then
  begin
    flag := '↓';//如果反序
    if pos(fdn, fdns) = 0 then
     fdns := fdns + ';' + fdn;//增加索引
    if pos(fdn, descs) = 0 then
     descs := AnsiReplaceText(descs, fdn, '');//去除反续
  end
  else if pos('↓', disp) > 0 then
  begin
    flag := '';//如果无序
    fdns := AnsiReplaceText(fdns, fdn, '');
    descs := AnsiReplaceText(descs, fdn, '');
  end
  else
  begin
    flag := '↑';//如果正续排列
    if pos(fdn, fdns) = 0 then fdns := fdns + ';' + fdn;//如果没有正序,则添加
    if pos(fdn, descs) = 0 then descs := descs + ';' + fdn;//增加反序
  end;     }
  if pos('↓', disp) > 0 then
  begin
    flag := '↑';//如果正续排列
    if pos(fdn, fdns) = 0 then
      fdns := fdns + ';' + fdn;//如果没有正序,则添加
    if pos(fdn, descs) = 0 then
      descs := descs + ';' + fdn;//增加反序
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
    if pos(fdn, fdns) = 0 then
      fdns := fdns + ';' + fdn;//增加索引                                                           
    if pos(fdn, descs) = 0 then
      descs := AnsiReplaceText(descs, fdn, '');//去除反续
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
  Result := True;
  TitleColumn := Column.Index;     //排序的表头序号，用来给DBGridEh按照列的值设置行颜色
end;

procedure TSPKCCX.FormShow(Sender: TObject);
begin
  CxShow;
end;

procedure TSPKCCX.PageControl1Change(Sender: TObject);
begin
  case PageControl1.TabIndex of
    0: begin
      acc := $FFFFF0;          //起始行颜色;    
      cSpeedBut;
      RzDBLookupComboBox4.Text := kcgys;
    end;
    1: begin
      acc := $E6FAFF;          //起始行颜色;
      ComboBoxGYS2.Text := rkgys;
    end;
    2: begin
      acc := $FFFFE0;          //起始行颜色;
      ComboBoxGYS1.Text := ckgys;
    end;
    3: begin
      acc := $FFFFE0;          //起始行颜色;
//      ComboBoxGYS1.Text := ckgys;
    end;
    4: begin
      acc := $FFFFE0;          //起始行颜色;
//      ComboBoxGYS1.Text := ckgys;
    end;
  end;
end;

procedure TSPKCCX.RzDBLookupComboBox4Change(Sender: TObject);
begin
  kcgys := RzDBLookupComboBox4.Text;
  SpeedButton1.Click;
end;

procedure TSPKCCX.RzDBLookupComboBox4Click(Sender: TObject);
begin
  GetKCNAME;
end;

procedure TSPKCCX.sg_JSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect:
  TRect; State: TGridDrawState);
var
  CellStr: string;
  Mode: integer;
begin
  if (ARow = 0) then
    Mode := DT_CENTER or DT_SINGLELINE or DT_VCENTER   else         //第一行标题栏，居中
  if (ACol = 3) or (ACol = 0) then
  begin
    Mode := DT_RIGHT or DT_SINGLELINE or DT_VCENTER;
    CellStr := Trim(sg_JS.Cells[ACol, ARow]);
    if (CellStr <> '') and (StrToInt(CellStr) < 0) then
      sg_JS.Canvas.Font.Color := clRed;
  end;
  begin
    CellStr := sg_JS.Cells[ACol, ARow];
    Inc(Rect.Left, 2); //让文本区域左缩进2像素
  end;
  sg_JS.Canvas.FillRect(Rect);
  DrawText(sg_JS.Canvas.Handle, PChar(CellStr), Length(CellStr), Rect, Mode);
end;

procedure TSPKCCX.SpeedButPDClick(Sender: TObject);
var                 //库存盘点
  str, iDate: String;
  i: Integer;
begin
  CX_BOOL := True;        //标志
  iDate := FormatDateTime('yyyy/mm/dd', Now());
  str := 'select * from pdb where PD_DATE = ''' + iDate + '''';
  QueryPD.Data := MyObj.OpenSQL(str);
//  if QueryPD.RecordCount = 0 then     //无查询结果表示当日没有盘点，继续执行
//  begin
//构造查询语句
  str := 'select  kcsp_gysid 公司名称, KCSP_SP_NOMB, KCSP_QTY 数量 ';
  str := str + ' from KCB,SPJBXX,GYSXX';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB) ';
  QueryPD.Data := MyObj.OpenSQL(str);           //打开库存数据表
  for i := 0 to QueryPD.RecordCount - 1 do
  begin
    str := 'INSERT INTO pdb(PD_DATE, PD_SP_NOMB, PD_GYS, PD_QTY)';
    str := str + ' Values(''' + iDate + ''',''' + QueryPD.Fields[1].Value + ''',''' + QueryPD.Fields[0].Value + ''',' + QueryPD.Fields[2].AsString + ')';
    str := str;
    MyObj.ExecSQL(str);
    QueryPD.Next;
  end;
  Application.MessageBox('盘点数据保存成功！', '提示信息', 0 + MB_ICONINFORMATION);
//  end else
//    Application.MessageBox('当天数据不必重复保存！', '提示信息', 0 + MB_ICONINFORMATION);
end;

procedure TSPKCCX.SpeedButton1Click(Sender: TObject);
begin
  cSpeedBut;
end;

procedure TSPKCCX.TabSheet5Show(Sender: TObject);
var
  str: string;
  i: Integer;
begin
  //QueryPD:= Gob_DBMrg.GetAnQuery('QueryPD');   //盘点信息表
  str := 'Select distinct pd_date from pdb Order By PD_DATE DESC';
  QueryPD.Data := MyObj.OpenSQL(str);
  for i := 0 to QueryPD.ReCordCount - 1 do
  begin
    ComboBox3.Items.Add(QueryPD.Fields[0].AsString);
    QueryPD.Next;
  end;
end;

end.

