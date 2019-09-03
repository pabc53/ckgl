unit USPCKXX_SG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, dbclient, UntRemSql, untfunctions,
  DBGrids, TntStdCtrls, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDCustomMaskEdit,
  LMDCustomExtSpinEdit, LMDExtSpinEdit, Spin, uUserMaint, AdvObj, BaseGrid,
  AdvGrid, DBGridEh, Mask, DBCtrlsEh, DBLookupEh, DB;

const
    //声明常量，用于保存Cells的列数
  cColQty1 = 11;

    //声明常量数组，保存Cells的各种属性，各种属性含义如下：
    {0-显示
    1-编辑
    2-必输
    3-类型
    4-对齐
    5-颜色
    6-宽度
    7-标题
    8-是否从数据库中读取
    9-数据表名称
    10-字段名
    11-字段长度
    12-文本中读取
    13-文本中位置    }
  cColProp1: array[0..cColQty1 - 1] of array[0..10] of string = (   //列属性
   //显示 编辑 必输 类型 对齐     颜色     宽度    标题
    // 0   1    2    3    4       5         6      7          8     9       10
    ('Y', 'N', 'N', 'E', 'L', 'clBtnFace', '20', '', 'N', '', '0'),    // 0
    ('Y', 'N', 'N', 'E', 'L', 'clInfoBk', '100', '出库编号', 'Y', 'POJBSUB', '2'),    // 1
    ('Y', 'N', 'N', 'C', 'L', 'clWindow', '112', '商品名称', 'Y', 'POJBSUB', '3'),    // 2
    ('Y', 'Y', 'N', 'E', 'L', 'clWindow', '60', '库存数量', 'Y', 'POJBSUB', '7'),    // 3
    ('Y', 'N', 'N', 'C', 'L', 'clWindow', '68', '出库类型', 'Y', 'POJBSUB', '5'),    // 4
    ('Y', 'N', 'N', 'C', 'L', 'clMoneyGr', '68', '商品去向', 'Y', 'POJBSUB', '4'),    // 5
    ('Y', 'Y', 'N', 'E', 'L', 'clWindow', '60', '商品售价', 'Y', 'POJBSUB', '7'),    // 6
    ('Y', 'Y', 'N', 'E', 'L', 'clSkyBlue', '60', '出库数量', 'Y', 'POJBSUB', '6'),    // 7
    ('Y', 'Y', 'N', 'E', 'L', 'clWindow', '88', '商品期限', 'Y', 'POJBSUB', '10'),   // 8
    ('Y', 'Y', 'N', 'M', 'L', 'clBtnFace', '115', '备注', 'N', '', '0'),             //9
    ('N', 'N', 'N', 'E', 'L', 'clWindow', '20', '商品编号', 'Y', 'POJBSUB', '6')     // 10
    );

type
  TSPCKXX_SG = class(TForm)
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
    CbbType: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    Label13: TLabel;
    EditDH: TEdit;
    ComboBoQX: TComboBox;
    CbbGoTo: TComboBox;
    Button1: TButton;
    AdvStringGrid1: TAdvStringGrid;
    procedure AdvStringGrid1Click(Sender: TObject);
    procedure AdvStringGrid1ComboChange(Sender: TObject; ACol, ARow, AItemIndex:
      Integer; ASelection: string);
    procedure AdvStringGrid1GetEditorType(Sender: TObject; ACol, ARow: Integer; var
      AEditor: TEditorType);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure CbbTypeChange(Sender: TObject);
    procedure ComboBoQXChange(Sender: TObject);
    procedure CbbGoToChange(Sender: TObject);
    procedure ComboBoxNAMEChange(Sender: TObject);
    procedure ComboBoxNAMEDropDown(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    function pCUST(SCUST: string): Integer;
    procedure AddCustPinglu(cid: String);

  private
    procedure ARIIX_Edit3;
    procedure prStg1Clear;
    procedure prStgInitialize1;
    procedure prClear(pMode: byte);
    procedure AdvBh;                   //自动获取出库编号

    { Private declarations }
  public
    procedure GetAll;   //获得所有数据
    procedure posting;  //提交数据
    Function CanSave: Boolean; //判断是否保存
    function ZQuyStr(STABL, sFIEL, Str: String): String;   //查找名称:表、字段、值
    function bh: string;   //自动编号
    Procedure tr;   //去除空字符
    procedure calculate;    //计算存量
    procedure QDelete(str, qixian: String);
    function comQTY: Integer;   //返回库存量
    function DataTemp: Boolean;
    procedure InsertCust(user: string);       //插入客户
    procedure WiterCust;        //写入客户
    procedure GetQX;    //通过产品名称获取库存表中该产品的期限
    function KcbReCord(dRow: Integer): Integer;


    { Public declarations }
  end;

var
  SPCKXX_SG: TSPCKXX_SG;
  BtnTJ, BtnXG, kuan: BOOLEAN;
  QueryCKX, QuyKCB: TClientDataSet;
  OldCK: Integer;         //旧出库数量（修改出库信息时用于保存修改前的数据）
  cRow, cCol: Integer;      //传递行号

implementation

uses zMAIN, ZAbstractDataset, USPCKXX_Z, zDM;

{$R *.dfm}

function TSPCKXX_SG.KcbReCord(dRow: Integer): Integer;
var                          //查询某行某期限的数量，没有返回-1
  cstr: String;
begin
  cstr := 'Select * From kcb Where (KCSP_SP_NOMB=''' + AdvStringGrid1.Cells[10, dRow] + ''') and (KCSP_QX=''' + AdvStringGrid1.Cells[8, dRow] + ''')';
  QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
  if QueryCKX.RecordCount > 0 then
    Result := QueryCKX.FieldByName('KCSP_QTY').AsInteger else
    Result := -1;
end;

procedure TSPCKXX_SG.AdvBh;
var
  sst, sst2: String;
begin
  sst := AdvStringGrid1.Cells[1, cRow];
  sst2 := Copy(sst, 13, 2);
  sst2 := IntToStr(StrToInt(sst2) + 1);
  AdvStringGrid1.Cells[1, cRow + 1] := Copy(sst, 1, 12) + sst2;    //合成入库编号
  AdvStringGrid1.Cells[7, cRow + 1] := '1';                        //默认数量
end;

procedure TSPCKXX_SG.AdvStringGrid1Click(Sender: TObject);
begin
  cRow := AdvStringGrid1.Row;
  cCol := AdvStringGrid1.Col;
     //判断该记录与库存表中是否有相应记录
//  if (AdvStringGrid1.Cells[8, cRow]='') and (cCol > 8) then
//  begin
//    Application.MessageBox('需填写有效期！', '提示信息', 0 + MB_ICONINFORMATION);
////    x := MessageBox(0, '未录有效期是否继续？', '询问', MB_OKCANCEL);
//    Exit;
//  end;
  if (cRow >= AdvStringGrid1.RowCount - 1) and CanSave and (cCol > 8) then
  begin
    with AdvStringGrid1 do
    begin
      begin
        InsertCust(trim(Cells[4, cRow]));                   //第1次出现的客户将加入到cust表中
        RowCount := RowCount + 1;        //添加一行
        Cells[0, cRow + 1] := IntToStr(cRow + 1);    //写序号
        AdvBh;               //写入新编号
        Cells[5, cRow + 1] := Cells[5, cRow];    //与上一行相同
        Cells[4, cRow + 1] := Cells[4, cRow];    //与上一行相同
        Cells[7, cRow + 1] := Cells[7, cRow];    //与上一行相同数量
//        Cells[8, cRow + 1] := Cells[8, cRow];    //与上一行相同期限
      end;
    end;
  end;
end;

procedure TSPCKXX_SG.AdvStringGrid1ComboChange(Sender: TObject; ACol, ARow,
  AItemIndex: Integer; ASelection: string);
var
  cstr: string;
begin
  cRow := ARow;
  cCol := ACol;
  AdvStringGrid1.Cells[ACol, ARow] := ASelection;       //ASelection为选择单元格的内容
  case ACol of
    2:
    begin
      ComboBox5.ItemIndex := AItemIndex;        //下拉框序号获取选择商品的编号
      with AdvStringGrid1 do                    //AdvStringGrid1.Cells[2, ARow]  商品名称
      begin
        Cells[10, ARow] := ComboBox5.Text;      //商品的编号
        cstr := 'Select SP_JINJA 进价,SP_XIAOSOJA 销售价 from GYSXX G,SPJBXX J ';
        cstr := cstr + ' where (GYSNAME=' + '''' + ComboBox1.Text + ''') and (SP_JNAME=' + '''' + ASelection + ''')';
        QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表获取进价、销售价
//        if QueryCKX.FieldByName('进价').Value <> null then
//        if QueryCKX.FieldByName('销售价').Value <> null then
        if QueryCKX.Fields[1].Value <> null then
          Cells[6, ARow] := QueryCKX.Fields[1].Value;
        GetQX;          //获取期限
        if Cells[2, ARow] <> '' then
          Cells[3, ARow] := IntToStr(comQTY) else  //将库存数量写入
          Cells[3, ARow] := '';
        if ARow = 1 then                      //第一行自动填写
        begin
          Cells[5, ARow] := '自用';           //默认值
          Cells[4, ARow] := '自用';
        end;
      end;
    end;
    4:
    begin
      CbbType.Text := ASelection;
      WiterCust;
      if ASelection = '自用' then
      begin
        AdvStringGrid1.Cells[5, ARow] := '自用';
        AdvStringGrid1.Cells[4, ARow] := '自用';
      end else           //填写购入的默认来源
        AdvStringGrid1.Cells[5, ARow] := '';
    end;
    8:       //点击了期限列
    begin
      AdvStringGrid1.Cells[3, ARow] := IntToStr(comQTY);  //返回库存量
    end;
  end;
end;

procedure TSPCKXX_SG.AdvStringGrid1GetEditorType(Sender: TObject; ACol, ARow:
  Integer; var AEditor: TEditorType);
begin
  case ACol of
    2: //第3列商品名
    begin
      AEditor := edComboList;  //设置单元格编译类型为 下拉列表
      AdvStringGrid1.Combobox.Items := ComboBoxNAME.Items; //动态设置下拉列表内容
    end;
    4: // 类型
    begin
      AEditor := edComboList;  //设置单元格编译类型为 下拉列表
      AdvStringGrid1.Combobox.Items := CbbType.Items; //动态设置下拉列表内容
    end;
    5:    //去向
    begin
      AEditor := edComboEdit;  //设置单元格编译类型为 下拉列表可编辑
      AdvStringGrid1.Combobox.Items := CbbGoTo.Items; //动态设置下拉列表内容
    end;
    8:    //期限
    begin
      AEditor := edComboList;  //设置单元格编译类型为 下拉列表
      AdvStringGrid1.Combobox.Items := ComboBoQX.Items; //动态设置下拉列表内容
    end;
  end;
end;

//AdvStringGrid初始化过程
procedure TSPCKXX_SG.prStgInitialize1;
Var
  I: Integer;
begin
    //设定零件表初始行数和列数
  AdvStringGrid1.RowCount := 2;
  AdvStringGrid1.ColCount := cColQty1;
  AdvStringGrid1.FixedRows := 1;
  AdvStringGrid1.FixedCols := 1;

    //设定列宽度和列标题(使用数组中的数据)
  for I := 0 to cColQty1 - 1 do begin
    AdvStringGrid1.Cells[I, 0] := cColProp1[I, 7];              //标题：I列 ,0行
    if cColProp1[I, 0] = 'Y' then
      AdvStringGrid1.ColWidths[I] := strToInt(cColProp1[I, 6])  //列宽
    else
      AdvStringGrid1.ColWidths[I] := 0;                        //列宽
  end;
end;

//窗体清空代码
procedure TSPCKXX_SG.prClear(pMode: byte);
begin
  case pMode of
    0: begin
      prStgInitialize1;
    end;
    1: begin
      prStg1Clear;
    end;
  end;

 //其它清空内容

end;

//AdvStringGrid清空过程
procedure TSPCKXX_SG.prStg1Clear;
Var
  I: integer;
  J: integer;
begin
  for I := 1 to AdvStringGrid1.RowCount - 1 do begin
    for J := 0 to cColQty1 - 1 do begin
      AdvStringGrid1.Cells[J, I] := '';
    end;
  end;
  AdvStringGrid1.Cells[0, 1] := '1';       //第一行行号
  AdvStringGrid1.Cells[1, 1] := bh;        //合成入库编号
  AdvStringGrid1.Cells[7, 1] := '1';       //默认数量
  AdvStringGrid1.RowCount := 2;
end;

procedure TSPCKXX_SG.InsertCust(user: string);   //插入第1次出现的客户
var
  cstr: String;
begin
  if CbbType.Text <> '' then
  begin
    cstr := 'Select DISTINCT CUST_NAME from CUST ';                //查询客户库中是否存在
    cstr := cstr + ' Where CUST_NAME=''' + trim(user) + '''';   //查询客户中否存在CbbType.Text
    QueryCKX.Data := MyObj.OpenSQL(cstr);                        //打开商品数据表
    if (QueryCKX.Recordcount = 0) then                              //若不存在写入库中
    begin
      cstr := 'INSERT INTO CUST(CUST_NAME)';
      cstr := cstr + 'Values(''' + user + ''')';
      MyObj.ExecSQL(cstr);
    end;
  end;
end;

procedure TSPCKXX_SG.QDelete(str, qixian: String);   //商品号、期限
begin              //删除记录
  MyObj.ExecSQL('Delete From KCB Where (KCSP_SP_NOMB=''' + str + ''') and (KCSP_QX=''' + qixian + ''')');
end;

function TSPCKXX_SG.ZQuyStr(STABL, sFIEL, Str: String): String;
var
  cstr: String;
begin
  Result := '';
  cstr := 'select * from ' + STABL;                //查询客户库中是否存在
  cstr := cstr + ' Where ' + sFIEL + '=''' + str + '''';
  QueryCKX.Data := MyObj.OpenSQL(cstr);                        //打开商品数据表
  Result := QueryCKX.FieldByName(sFIEL).AsString;
end;

procedure TSPCKXX_SG.tr;
var
  i: integer;
begin
  for i := ComponentCount - 1 downto 0 do
    if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := trim(TEdit(Components[i]).Text);
end;

procedure TSPCKXX_SG.GetAll;//获得所有数据
begin
//  Edit1.Text := QueryCK.FieldByName('出库编号').AsString;
//  ComboBox1.Text := QueryCK.FieldByName('供应商名称').AsString;
//  ComboBoxNAME.Text := QueryCK.FieldByName('商品名称').AsString;
//  CbbType.Text := QueryCK.FieldByName('出库类型').AsString;
//  CbbType.Text := QueryCK.FieldByName('去向').AsString;
//  ComboBox5.Text := QueryCK.FieldByName('商品编号').AsString;
//  ComboBoQX.Text := QueryCK.FieldByName('产品期限').AsString;
//  Edit3.Text := QueryCK.FieldByName('进价').AsString;
//  EditDH.Text := QueryCK.FieldByName('货单号').AsString;
//  Edit4.Text := QueryCK.FieldByName('销售价').AsString;
//  Cells[7, cRow].Value := QueryCK.FieldByName('出库数量').AsInteger;
//  if Cells[7, cRow].Value = 0 then
//    Cells[7, cRow].Value := 1;              //默认值
//  DateTimePicker1.Date := QueryCK.FieldByName('出库日期').AsDateTime;
//  Edit6.Text := QueryCK.FieldByName('经手人').AsString;
//  Cells[9, cRow] := QueryCK.FieldByName('备注').AsString;
end;

procedure TSPCKXX_SG.Posting;          //提交数据
var
  cstr: String;
  i: Integer;
begin
  with AdvStringGrid1 do
  begin
    if Cells[6, cRow] = '' then           //销售价
      Cells[6, cRow] := '0';              //空格转为0
    if ActionCD = 'N' then
    begin
      cRow := i;
      calculate;        //计算库存量，并设置kuan
      if not kuan then  //计算库存量没有错误，插入数据
      begin
        Cstr := 'INSERT INTO SPCKXX(CK_GYS_NOMB, CK_SP_NOMB, CK_TYPE, CK_DJ, CK_QTY, CK_DATE, CK_JSR, CK_MEMO, CK_NOMB, CK_GOTOID, CK_DH,CK_QX)';
        Cstr := Cstr + ' Values(''' + ComboBox4.Text + ''',''' + Cells[10, cRow] + ''',''' + Cells[4, cRow] + ''',' + Cells[6, cRow]
          + ',' + Cells[7, cRow] + ',''' + FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + ''',''' + Trim(Edit6.Text) + ''',''' + Cells[9, cRow] + ''',''' + Cells[1, cRow] + ''',';
        Cstr := Cstr + '''' + IntToStr(pCUST(Cells[5, cRow])) + ''',''' + Trim(EditDH.Text) + ''',''' + Cells[8, cRow] + ''')';
        MyObj.ExecSQL(cstr);     //CK_GOTOID=' + IntToStr(pCUST(Cells[4, cRow]))
      end else Exit;
    end;
  end;
end;

function TSPCKXX_SG.CanSave: Boolean;  //判断是否保存
begin
  Result := True;
  if (AdvStringGrid1.Cells[3, cRow] = '') and (cCol > 3) then
  begin
    Result := False;
    Application.MessageBox('出库类型不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if (AdvStringGrid1.Cells[4, cRow] = '') and (cCol > 4) then
  begin
    Result := False;
    Application.MessageBox('商品去向不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if (AdvStringGrid1.Cells[1, cRow] = '') and (cCol > 1) then
  begin
    Result := False;
    Application.MessageBox('出库编号不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if (AdvStringGrid1.Cells[2, cRow] = '') and (cCol > 2) then
  begin
    Result := False;
    Application.MessageBox('商品名称不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if (AdvStringGrid1.Cells[7, cRow] = '0') and (cCol > 7) then
  begin
    Result := False;
    Application.MessageBox('商品数量不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
end;

function TSPCKXX_SG.bh: String;       //自动编号
var
  s, m, cstr: string;
  i: integer;
begin
  cstr := 'Select  CK_NOMB From SPCKXX  ';
  QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
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
  Result := s;
end;

procedure TSPCKXX_SG.SpeedButton5Click(Sender: TObject);
begin
  ActionCD := '';
  BtnTJ := False;        //添加状态
  BtnXG := False;        //修改状态
  SpeedButton2.Enabled := True;
  prStg1Clear;
  Close;
end;

procedure TSPCKXX_SG.WiterCust;     //根据入库类型选择商品来源列表
var
  i: Integer;
  cStr, qstr: string;
begin
  CbbGoTo.clear;
  if CbbType.Text = '还出' then            //若为“还出”，就从SPRKXX中过滤出“借入”者
  begin
    cStr := 'CUST_NAME';                            //要获取的字段
    qstr := 'Select DISTINCT CUST_NAME From SPRKXX, CUST ';
    qstr := qstr + ' Where (RK_GYS_NOMB=''' + ComboBox4.Text + ''') and (RK_TYPE=''借入'') AND (CUST_ID=RK_FROMID)';    //只过滤出“借入”的客户
    qstr := qstr + ' ORDER BY RK_DATE  DESC';    //以日期排序，最近者在前
  end else
  begin                                           //非“还出”则从CUST表中读取用户
    cStr := 'CUST_NAME';                          //要获取的字段
    qstr := 'select * from CUST';
    qstr := qstr + ' Order By pinglu DESC';
  end;
  QueryCKX.Data := MyObj.OpenSQL(qstr);    //打开数据表
  if QueryCKX.Recordcount > 0 then         //如有记录将其写入CbbGoTo
  begin
    CbbGoTo.Clear;
    for i := 0 to QueryCKX.Recordcount - 1 do
    begin
      CbbGoTo.Items.Add(QueryCKX.FieldByName(cStr).AsString);
      QueryCKX.next;
    end;
  end;
end;

procedure TSPCKXX_SG.FormCreate(Sender: TObject);
begin                    //创建窗体时
  kuan := False;
  BtnTJ := False;        //添加状态
  BtnXG := False;        //修改状态
  prClear(0);
  cCol := 1;
  cRow := 1;
end;

procedure TSPCKXX_SG.FormShow(Sender: TObject);
begin
  QuyKCB := TClientDataSet.Create(self);    //库存信息表 QueryCKX
  QueryCKX := TClientDataSet.Create(self);  //库存信息表
  //判断按钮是否选中状态
  GroupBox1.Enabled := False;
  if ActionCD = 'M' then
    GetAll
  else if ActionCD = 'N' then
  begin
    GroupBox1.Enabled := False;
  end;
  ARIIX_Edit3;
  SpeedButton1Click(Sender);
  ComboBoxNAMEDropDown(Sender);
end;

procedure TSPCKXX_SG.SpeedButton1Click(Sender: TObject);
begin    //单击添加按钮，控件初始化
  GroupBox1.Enabled := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  ComboBox1.Text := 'ARIIX';
  ComboBox4.Text := 'GS20150126001';
  Edit3.Clear;
  Edit4.Clear;
  Edit6.Text := 'pjj';    //默认值
  DateTimePicker1.Date := now;
  Memo1.Clear;
  BtnTJ := True;        //添加状态
  BtnXG := False;        //修改状态
  ActionCD := 'N';
  BtnTJ := True;         //添加状态
  prStg1Clear;
  EditDH.SetFocus;
  SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
end;

procedure TSPCKXX_SG.SpeedButton3Click(Sender: TObject);   //保存数据
var
  kQTY, nQTY, i: Integer;                 //kQTY库中存量，nQTY当前更正后的量
  cstr: String;
begin
  InsertCust(trim(AdvStringGrid1.Cells[4, cRow]));                   //第1次出现的客户将加入到cust表中
  if not DataTemp then       //必须数据检查
  begin
    Application.MessageBox('录入数据不全，请检查！', '提示！', 64);
    Exit;
  end;
  if (AdvStringGrid1.Cells[2, AdvStringGrid1.RowCount - 1] = '') then  //判断商品名称为空
  begin
    AdvStringGrid1.RowCount := AdvStringGrid1.RowCount - 1;   //行数-1(一般为最后一行商品名称为空）
  end;
  kuan := False;      //库存量计算无错标志
  if BtnTJ then      //添加状态
  begin
    MyObj.StarTrans;       //事务开始
    for i := 1 to AdvStringGrid1.RowCount - 1 do
    begin
      if not kuan then                   //无错继续进行
      begin
        cRow := i;
        if (comQTY - StrToInt(AdvStringGrid1.Cells[7, cRow]) >= 0) then  //判断库存量-出库量是否大于等于0
        begin
          if (cansave) then
          begin
            Posting;          //提交存盘
          end;
        end else
        begin
          MyObj.RollTrans;    //事务回滚
          Application.MessageBox(PChar(AdvStringGrid1.Cells[2, cRow] + ' 出库数量大于库存数量！'), '提示！', 64);
          AdvStringGrid1.Cells[7, cRow] := '1';             //默认数量值
          Exit;
        end;
      end else
      begin
        MyObj.RollTrans;    //事务回滚
        Break;              //有错中断循环
        Exit;
      end;
    end;
    if not kuan then        //库存量计算无错误
    begin
      MyObj.ComTrans;       //事务完成
      cstr := 'Select CUST_ID from cust Where CUST_NAME=''' + AdvStringGrid1.Cells[4, 1] + '''';
      QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
      AddCustPinglu(QueryCKX.Fields[0].AsString);     //将用户使用频率加一
      GroupBox1.Enabled := False;
      Application.MessageBox('保存成功!', '提示!', 64);
      SPCKXX_Z.FormShow(Sender);         //刷新
                 //重新复原
      GroupBox1.Enabled := True;
      SpeedButton3.Enabled := True;
      SpeedButton4.Enabled := True;
      Edit1.Clear;
      Edit3.Clear;
      Edit4.Clear;
      Edit6.Text := 'pjj';    //默认值
      ActionCD := 'N';
      AdvStringGrid1.Cells[1, cRow] := bh;
      EditDH.SetFocus;
      SpeedButton1.Enabled := False;
      prStg1Clear;    //清空StringGrid1,行数置为2
    end;
  end else
  if BtnXG then     //修改
  begin
    with AdvStringGrid1 do
    begin
      kQTY := comQTY;
      nQTY := kQTY + OldCK - StrToInt(Cells[7, cRow]);      //更正后数值  库存量+更正前出库量-更正后出库量
      if nQTY < 0 then  //更正后数值小于0，表示出库量大于库存量
      begin
        Application.MessageBox('出库数量不能大于库存数量！', '提示！', 64);
        Exit;
      end else
      if nQTY > 0 then  //
      begin
        if kQTY = 0 then        //等于0，在库存表中插入一条记录
        begin                      //该商品在库存表中不存在，将数据插入库存表中
          cstr := 'INSERT INTO KCB(KCSP_SP_NOMB,KCSP_QTY,KCSP_GYSID,KCSP_QX)';
          cstr := cstr + ' Values(''' + Cells[10, cRow] + ''',' + Cells[7, cRow] + ',''' + ComboBox1.Text + '''' + Cells[8, cRow] + ''')';
          MyObj.ExecSQL(cstr);
        end;
//      kNOMB := QueryCKX.FieldByName('KCSP_SP_NOMB').Value;  //保存当前记录的商品编号
        cstr := 'Update kcb set KCSP_QTY=' + IntToStr(nQTY);
        cstr := cstr + ' Where (KCSP_SP_NOMB=''' + Cells[10, cRow] + ''') and (KCSP_QX=''' + Cells[8, cRow] + ''')';   //条件：编号、期限
        MyObj.ExecSQL(cstr);     //更新库存数

        Cstr := 'Update SPCKXX set CK_GYS_NOMB=''' + ComboBox4.Text + ''',CK_SP_NOMB=''' + Cells[10, cRow] + ''',CK_TYPE=''' + Cells[3, cRow]
          + ''',CK_DJ=' + Cells[6, cRow] + ',CK_QTY=' + Cells[7, cRow] + ',CK_DATE=''' + FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date)
          + ''',CK_DH=''' + EditDH.Text + ''',CK_QX=''' + Cells[8, cRow]
          + ''',CK_JSR=''' + Edit6.Text + ''',CK_MEMO=''' + Cells[9, cRow] + ''', CK_GOTOID=' + IntToStr(pCUST(Cells[4, cRow]));
        cstr := cstr + ' Where CK_NOMB=''' + Cells[1, cRow] + '''';       //更新条件　CK_NOMB= Edit1.Text
        MyObj.ExecSQL(cstr);      //更新出库记录
        SPCKXX_Z.FormShow(Sender);         //刷新
      end else
      if nQTY = 0 then  //判断出库量是否等于0
      begin
        Cstr := 'Update SPCKXX set CK_GYS_NOMB=''' + ComboBox4.Text + ''',CK_SP_NOMB=''' + Cells[10, cRow] + ''',CK_TYPE=''' + Cells[3, cRow]
          + ''',CK_DJ=' + Edit4.Text + ',CK_QTY=' + Cells[7, cRow] + ',CK_DATE=''' + FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date)
          + ''',CK_DH=''' + EditDH.Text + ''',CK_QX=''' + Cells[8, cRow]
          + ''',CK_JSR=''' + Edit6.Text + ''',CK_MEMO=''' + Cells[9, cRow] + ''', CK_GOTOID=' + IntToStr(pCUST(Cells[4, cRow]));
        cstr := cstr + ' Where CK_NOMB=''' + Cells[1, cRow] + '''';       //更新条件　CK_NOMB= Edit1.Text
        MyObj.ExecSQL(cstr);     //更新出库记录
        SPCKXX_Z.FormShow(Sender);         //刷新
        QDelete(ComboBox5.Text, Cells[8, cRow]);          //更正后库存量等于0则删除库存记录
      end;
      //TipInfo('保存成功!', []);
      Application.MessageBox('保存成功!', '提示!', 64);
    end;
  end;
end;

procedure TSPCKXX_SG.AddCustPinglu(cid: String);
var
//  QuyCust : TClientDataSet;
  cstr: String;
begin
//    QuyCust := TClientDataSet.Create(self);  //创建用户信息表
  cstr := 'update CUST set PINGLU=PINGLU+1 where CUST_ID=' + cid;
  MyObj.ExecSQL(cstr);   //打开数据表
//  QuyCust.Free;　　　　　//释放
end;

procedure TSPCKXX_SG.ARIIX_Edit3;
begin
  if ComboBox1.Text = 'ARIIX' then
  begin
    Edit3.left := 336;
    Edit3.Width := 128;
    Label4.Caption := '商品进价：＄';
  end else
  begin
    Edit3.left := 314;
    Edit3.Width := 150;
    Label4.Caption := '商品进价：';
  end;
end;

procedure TSPCKXX_SG.Button1Click(Sender: TObject);
var
  cstr: String;
  i: integer;
begin                       //此过程没有使用
  cstr := 'Select * from cust ';
//  QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
  for i := 1 to QueryCKX.RecordCount do
  begin
    cstr := 'Update sprkxx set RK_FROMID=' + IntToStr(pCUST(QueryCKX.fieldbyname('CUST_NAME').AsString));
    cstr := cstr + ' Where (RK_FROM=''' + QueryCKX.fieldbyname('CUST_NAME').AsString + ''')';
        //and (KCSP_QX=''' + Cells[8, cRow] + ''')';   //条件：编号、期限
//    MyObj.ExecSQL(cstr);     //更新库存数
    QueryCKX.Next;
  end;
//  x := MessageBox(0, '你确定此操作吗？', '询问', MB_OKCANCEL);
//     //判断时可以是
//  if x = 1 then  //.或if x=idok then...
//    Button1.Caption := 'OK' else
//    Button1.Caption := 'NOT';
end;

function TSPCKXX_SG.pCUST(SCUST: string): Integer;
var
  cstr: string;
begin
  cstr := 'Select * From cust';
  cstr := cstr + ' Where CUST_NAME=''' + scust + '''';
  QuyKCB.Data := MyObj.OpenSQL(cstr);   //打开数据表
  Result := QuyKCB.FieldByName('CUST_ID').Value;    //返回id
end;

procedure TSPCKXX_SG.SpeedButton4Click(Sender: TObject);
begin
  SpeedButton1.Enabled := True;     //单击取消，控件按钮可用状态
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
  GroupBox1.Enabled := False;
  ActionCD := '';
  prStg1Clear;
end;

procedure TSPCKXX_SG.ComboBox1Change(Sender: TObject);
begin
  ComboBox4.ItemIndex := ComboBox1.ItemIndex;
  Edit3.Clear;
  Edit4.Clear;
  ARIIX_Edit3;
  ComboBoxNAMEDropDown(Sender);
end;

procedure TSPCKXX_SG.ComboBox1DropDown(Sender: TObject);
var              //将供应商名显示在ComboBox1中
  i: integer;
  cstr: string;
begin
  ComboBox1.Clear;
  ComboBox4.Clear;
  cstr := 'select DISTINCT GYSNAME, GYS_NOMB from SPRKXX S,GYSXX G';    //从入库信息中提出供应商名称
  cstr := cstr + ' Where RK_GYS_NOMB=GYS_NOMB';
  QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
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

function TSPCKXX_SG.comQTY: Integer;
var
  cstr: String;
begin      //返回库存量
  cstr := 'Select KCSP_QTY,KCSP_SP_NOMB from KCB where (KCSP_SP_NOMB=' + '''' + AdvStringGrid1.Cells[10, cRow] + ''') and (KCSP_QX=' + '''' + trim(AdvStringGrid1.Cells[8, cRow]) + ''')';

  QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
  if QueryCKX.RecordCount = 0 then
    Result := 0 else
    Result := QueryCKX.FieldByName('KCSP_QTY').Value;    //返回库存数
end;

procedure TSPCKXX_SG.calculate;
var
  kQTY: Integer;
  kNOMB, cstr: String;
begin        //判断出库数量与库存数据是否相等，相等则删除记录，否则减去出库量   QuyKCB
  with AdvStringGrid1 do
  begin
    if KcbReCord(cRow) > 0 then
    begin
      if QueryCKX.FieldByName('KCSP_QTY').Value = Cells[7, cRow] then
      begin
        QDelete(Cells[10, cRow], Cells[8, cRow]);          //出库量与库存量相等则删除库存记录
        ComboBoxNAMEDropDown(self);                      //更新下拉框
      end else
      begin
        kQTY := QueryCKX.FieldByName('KCSP_QTY').AsInteger - StrToInt(Cells[7, cRow]);       //库存量－出库量
        kNOMB := QueryCKX.FieldByName('KCSP_SP_NOMB').Value;  //保存当前记录的商品编号
        cstr := 'Update kcb set KCSP_QTY=' + IntToStr(kQTY);
        cstr := cstr + ' Where (KCSP_SP_NOMB=''' + kNOMB + ''') and (KCSP_QX=''' + Cells[8, cRow] + ''')';
        MyObj.ExecSQL(cstr);
      end;
    end else
    begin
      Application.MessageBox('未找到库存信息，重新检查录入数据！', '提示信息', 0 + MB_ICONINFORMATION);
      kuan := True;                         //有错误
//      Exit;
    end;
  end;
end;

procedure TSPCKXX_SG.CbbTypeChange(Sender: TObject);
begin
  with Sender as TComboBox do
  begin
    hide;
    if Text <> '' then
      with AdvStringGrid1 do
        Cells[3, row] := CbbType.Text else   //退出Combobox
      //TipInfo('出库类型不能为空!', []);
      Application.MessageBox('出库类型不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
  end;
  WiterCust;          //根据入库类型选择商品来源列表
  if CbbType.Text = '自用' then
  begin
    AdvStringGrid1.Cells[4, crow] := '自用';
  end;
end;

procedure TSPCKXX_SG.ComboBoQXChange(Sender: TObject);
begin
  with Sender as TComboBox do
  begin
    hide;
    if Text <> '' then
      with AdvStringGrid1 do
        Cells[8, row] := ComboBoQX.Text;   //退出Combobox
  end;
end;

procedure TSPCKXX_SG.CbbGoToChange(Sender: TObject);
begin                                           //商品去向
  CbbGoTo.hide;
  if CbbGoTo.Text <> '' then
    with AdvStringGrid1 do
      Cells[4, crow] := CbbGoTo.Text else   //退出Combobox
    Application.MessageBox('商品去向不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
end;

procedure TSPCKXX_SG.ComboBoxNAMEChange(Sender: TObject);
begin          //通过供应商名称，商品名称将进价等信息显示在相对应的EDIT中
  with Sender as TComboBox do
  begin
    hide;
    if Text <> '' then
      with AdvStringGrid1 do
        Cells[2, row] := ComboBoxName.Text else   //退出Combobox
      Application.MessageBox('商品名称不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
  end;
end;

procedure TSPCKXX_SG.GetQX;    //通过产品名称获取库存表中该产品的期限
var
  cstr: string;
  i: Integer;
begin
  with AdvStringGrid1 do
  begin
    cstr := 'Select * from kcb ';
    cstr := cstr + ' where (KCSP_SP_NOMB=' + '''' + Cells[10, cRow] + ''') Order By KCSP_QX';
    QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
    if QueryCKX.RecordCount <> 0 then
    begin
      ComboBoQX.Clear;
      for i := 1 to QueryCKX.RecordCount do
      begin
        ComboBoQX.Items.Add(QueryCKX.fieldbyname('KCSP_QX').AsString);
        QueryCKX.Next;
      end;
    end;
    QueryCKX.First;
    Cells[8, cRow] := QueryCKX.fieldbyname('KCSP_QX').AsString;   //将日期最早记录，直接赋值到表格中
  end;
end;

procedure TSPCKXX_SG.ComboBoxNAMEDropDown(Sender: TObject);
var
  i: Integer;
  cstr: string;
begin              //  通过供应商名称，将该供应商所属商品名称提出到ComboBoxNAME中
  ComboBoxNAME.Clear;
  ComboBox5.Clear;
  begin
    //库存表中按商品名分组，数量排序
    cstr := 'Select SP_NAME 商品名称,SP_JNAME 商品简称,Sum(KCSP_QTY) 数量,SP_NOMB from KCB,SPJBXX,GYSXX ';
    cstr := cstr + 'Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB) and (SP_GYSID=''' + ComboBox4.Text + ''')';
    cstr := cstr + 'Group by SP_NAME Order By 数量 DESC';

    QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
    with QueryCKX do
    begin
      if (recordcount > 0) then
        first;
      for i := 0 to recordcount - 1 do
      begin
        ComboBoxNAME.Items.add(FieldByName('商品简称').asstring);
        ComboBox5.Items.add(FieldByName('SP_NOMB').asstring);      //商品编号
        next;
      end;
    end;
    Edit3.Clear;
    Edit4.Clear;
  end;
end;

function TSPCKXX_SG.DataTemp: Boolean;
begin
  Result := False;
  with AdvStringGrid1 do
  begin
    if (Cells[2, cRow] <> '') and (Cells[3, cRow] <> '') and (Cells[4, cRow] <> '') and (Cells[7, cRow] <> '') then
      Result := True;
  end;
  // TODO -cMM: TSPCKXX_SG.DataTemp default body inserted
end;

procedure TSPCKXX_SG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SpeedButton4Click(Sender);
  QueryCKX.Free;
  QuyKCB.Free;
end;

procedure TSPCKXX_SG.SpeedButton2Click(Sender: TObject);
begin
  GroupBox1.Enabled := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  EditDH.SetFocus;
  SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
  OldCK := StrToInt(AdvStringGrid1.Cells[7, cRow]);        //保存修改前的数据
  BtnTJ := False;        //添加状态
  BtnXG := True;        //修改状态
end;

end.
