unit USPRKXX_Adv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, dbclient, UntRemSql, untfunctions, Buttons,
  TntStdCtrls, Spin, Grids, AdvObj, BaseGrid, AdvGrid, uUserMaint;

const
    //声明常量，用于保存Cells的列数
  cColQty1 = 10;

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
  cColProp1: array[0..cColQty1 - 1] of array[0..13] of string = (   //列属性
   //显示 编辑 必输 类型 对齐     颜色       宽度    标题
    // 0   1    2    3    4       5         6      7     8  9  10 11
    ('Y', 'N', 'N', 'E', 'L', 'clBtnFace', '21', '', 'N', '', '', '0', 'N', '0'),    // 0
    ('Y', 'N', 'N', 'E', 'L', 'clInfoBk', '110', '入库编号', 'Y', 'POJBSUB', 'PART_NO', '30', 'Y', '2'),         // 1
    ('Y', 'N', 'N', 'C', 'L', 'clWindow', '90', '商品名称', 'Y', 'POJBSUB', 'ORDER_QUANTITY', '9', 'Y', '3'),    // 2
    ('Y', 'N', 'N', 'C', 'L', 'clWindow', '66', '入库类型', 'Y', 'POJBSUB', 'DELIVERY_TO_DEPT', '3', 'Y', '5'),    // 3
    ('Y', 'Y', 'N', 'C', 'L', 'clMoneyGr', '70', '商品来源', 'Y', 'POJBSUB', 'UNIT_OF_MEASURE', '2', 'Y', '4'),    // 4
    ('Y', 'Y', 'N', 'E', 'L', 'clWindow', '60', '商品进价', 'Y', 'POJBSUB', 'GROUP_A', '3', 'Y', '7'),    // 5
    ('Y', 'Y', 'N', 'E', 'L', 'clSkyBlue', '60', '商品数量', 'Y', 'POJBSUB', 'PART_NAME_C', '70', 'Y', '8'),      // 6
    ('Y', 'Y', 'N', 'E', 'L', 'clWindow', '70', '商品期限', 'Y', 'POJBSUB', 'VENDOR_NO', '5', 'Y', '6'),          // 7
    ('Y', 'Y', 'N', 'M', 'L', 'clBtnFace', '125', '备注', 'N', '', '', '0', 'N', '0'),                    // 8
    ('N', 'N', 'N', 'E', 'L', 'clWindow', '70', '商品编号', 'Y', 'POJBSUB', 'VENDOR_NO', '5', 'Y', '6')   // 9
    );
    //声明常量，定义列号，便于修改与引用
  cC1NO = 0;
  cC1PART_NO = 1;
  cC1ORDER_QUANTITY = 2;
  cC1UNIT_OF_MEASURE = 3;
  cC1DELIVERY_TO_DEPT = 4;
  cC1GROUP_A = 5;
  cC1PART_NAME_C = 6;
  cC1Data_Flag = 7;

type
  TSPRKXX_Adv = class(TForm)
    GroupBox3: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Edit2: TEdit;
    ComboBox2: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Edit7: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit3: TComboBox;
    Label12: TLabel;
    ComboBox4: TComboBox;
    EditJJ: TEdit;
    Label8: TLabel;
    Label6: TLabel;
    EdHDH: TEdit;
    AdvStringGrid1: TAdvStringGrid;
    ComboBox3: TComboBox;
    procedure AdvStringGrid1Click(Sender: TObject);
    procedure AdvStringGrid1ComboChange(Sender: TObject; ACol, ARow, AItemIndex:
      Integer; ASelection: string);
    procedure AdvStringGrid1GetEditorType(Sender: TObject; ACol, ARow: Integer; var
      AEditor: TEditorType);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox3DropDown(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit7Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function pCUST(SCUST: string): Integer;              //通过名称查ID
    function pCUSTID(SCUSTID: Integer): string;          //通过ID查名称

  private
    procedure ARIIX_Edit5;
    procedure prStgInitialize1;
    procedure prStg1Clear;
    procedure prClear(pMode: byte);
    procedure AdvBh;                  //AdvStringGrid1的第一列写入编号
    procedure StringGridClear;
    procedure AddShiYong(SPNOMB: String);      //商品使用频率加1

    { Private declarations }
  public
    procedure GetAll;     //获得数据
    procedure posting;    //提交数据
    Function CanSave: Boolean;  //判断是否保存
    function bh: String;     //自动编号
    function DataTemp: Boolean;
    Procedure tr;            //去除空字符
    procedure InsertCust;    //客户库中插入记录
    procedure WiterCust;     //客户写入Combobox


    { Public declarations }
  end;

var
  SPRKXX_Adv: TSPRKXX_Adv;
  QueryRKX, QueryCX: TClientDataSet;
  kuan, ComWrite: Boolean;
  cRow, cCol: Integer;      //传递行号

implementation

uses zMAIN, USPRKXX_Z;

{$R *.dfm}

procedure TSPRKXX_Adv.FormDestroy(Sender: TObject);
begin
end;

//{$O-}
//{$OPTIMIZATION OFF}

function TSPRKXX_Adv.pCUSTID(SCUSTID: Integer): string;
var
  cstr: string;
begin
  if scustid <> 0 then
  begin
    cstr := 'Select * From cust';
    cstr := cstr + ' Where CUST_ID=' + IntToStr(scustID);
    QueryCX.Data := MyObj.OpenSQL(cstr);  //打开数据表
    Result := QueryCX.FieldByName('CUST_NAME').Value;    //返回id
  end else
    Result := '';
end;

//AdvStringGrid初始化过程
procedure TSPRKXX_Adv.prStgInitialize1;
Var
  I: Integer;
begin

    //设定初始行数和列数
  AdvStringGrid1.RowCount := 2;
  AdvStringGrid1.ColCount := cColQty1;
  AdvStringGrid1.FixedRows := 1;
  AdvStringGrid1.FixedCols := 1;

    //设定列宽度和列标题
  for I := 0 to cColQty1 - 1 do begin
    AdvStringGrid1.Cells[I, 0] := cColProp1[I, 7];                 //标题
    if cColProp1[I, 0] = 'Y' then
      AdvStringGrid1.ColWidths[I] := strToInt(cColProp1[I, 6])  //列宽
    else
      AdvStringGrid1.ColWidths[I] := 0;                        //列宽
  end;
  AdvStringGrid1.Cells[0, 1] := '1';
end;

//窗体清空代码
procedure TSPRKXX_Adv.prClear(pMode: byte);
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
procedure TSPRKXX_Adv.prStg1Clear;
Var
  I: integer;
  J: integer;
begin
  for I := 1 to AdvStringGrid1.RowCount - 1 do begin
    for J := 0 to cColQty1 - 1 do begin
      AdvStringGrid1.Cells[J, I] := '';
//      StringGrid1.SetCheckBoxState(J, I, false);
    end;
  end;
end;

procedure TSPRKXX_Adv.tr;
var
  i: integer;
begin
  for i := ComponentCount - 1 downto 0 do
    if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := trim(TEdit(Components[i]).Text);
end;

procedure TSPRKXX_Adv.ARIIX_Edit5;
begin
  if ComboBox1.Text = 'ARIIX' then
  begin
    EditJJ.left := 356;
    EditJJ.Width := 139;
    Label8.Caption := '商品进价：＄';
  end else
  begin
    EditJJ.left := 338;
    EditJJ.Width := 158;
    Label8.Caption := '商品进价：';
  end;
end;

procedure TSPRKXX_Adv.GetAll;     //获得所有数据
begin
//  ComboBox1.Text := USPRKXX_Z.QueryRK.FieldByName('供应商名称').AsString;    //
//  EdHDH.Text := USPRKXX_Z.QueryRK.FieldByName('货单号').AsString;
//  EdQX.Text := USPRKXX_Z.QueryRK.FieldByName('产品期限').AsString;
//  Edit1.Text := USPRKXX_Z.QueryRK.FieldByName('供应商编号').AsString;
//  Edit2.Text := USPRKXX_Z.QueryRK.FieldByName('入库编号').AsString;         //入库编号
//  ComboBox2.Text := USPRKXX_Z.QueryRK.FieldByName('商品名称').AsString;    //商品ID
//  ComboBox3.Text := USPRKXX_Z.QueryRK.FieldByName('来源').AsString;    //
//  Edit3.Text := USPRKXX_Z.QueryRK.FieldByName('入库类型').AsString;         //入库类型
//  SpinEdit.Value := USPRKXX_Z.QueryRK.FieldByName('入库数量').AsInteger;          //入库数量
//  DateTimePicker1.Date := USPRKXX_Z.QueryRK.FieldByName('入库日期').AsDateTime;  //RK_DATE
//  Edit7.Text := USPRKXX_Z.QueryRK.FieldByName('经手人').AsString;    //RK_JSR
//  Memo1.Text := USPRKXX_Z.QueryRK.FieldByName('备注').AsString;    //备注
end;

function TSPRKXX_Adv.pCUST(SCUST: string): Integer;
var
  cstr: string;
begin
  cstr := 'Select * From cust';
  cstr := cstr + ' Where CUST_NAME=''' + scust + '''';
  QueryCX.Data := MyObj.OpenSQL(cstr);   //打开数据表
  Result := QueryCX.FieldByName('CUST_ID').Value;    //返回id
end;

procedure TSPRKXX_Adv.Posting;        //提交数据
var
  Qstr, CxTj: String;
  qtys, i: Integer;
begin
  if ActionCD = 'N' then
  begin
    try
      MyObj.StarTrans;         //事务开始
      for i := 1 to AdvStringGrid1.RowCount - 1 do
      begin                        //公司编号   商品编号   单号  期限  入库类型  数量  日期   经手人  备注    入库编号  来源  进价
        with AdvStringGrid1 do
        begin
          if Cells[2, i] <> '' then
          begin
            qtys := pCUST(Cells[4, i]);
            Qstr := 'INSERT INTO SPRKXX(RK_GYS_NOMB,RK_SP_NOMB,RK_DH,RK_QX,RK_TYPE,RK_QTY,RK_DATE,RK_JSR,RK_MEMO,RK_NOMB,RK_FROMID,RK_JINJA)';
            Qstr := Qstr + ' Values(''' + Edit1.Text + ''',''' + Cells[9, i] + ''',''' + Trim(EdHDH.Text) + ''',''' + Cells[7, i]
              + ''',''' + Cells[3, i] + ''',' + Cells[6, i]
              + ',''' + FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + ''',''' + Trim(Edit7.Text) + ''',''' + Cells[8, i] + ''',''' + Cells[1, i] + ''',';
            Qstr := Qstr + IntToStr(qtys) + ',''' + Cells[5, i] + ''')';
            MyObj.ExecSQL(Qstr);
            CxTj := '(KCSP_SP_NOMB=''' + Cells[9, i] + ''') and (KCSP_QX=''' + Cells[7, i] + ''')';
            Qstr := 'Select * from KCB where ' + CxTj;
            QueryRKX.Data := MyObj.OpenSQL(Qstr);   //打开商品数据表
            if QueryRKX.RecordCount = 1 then    //该商品在库存表中存在，将相数量相加
            begin
              qtys := QueryRKX.fieldbyname('KCSP_QTY').AsInteger + StrToInt(Cells[6, i]);
              MyObj.ExecSQL('Update kcb set KCSP_QTY=' + IntToStr(qtys) + ' Where ' + CxTj);
            end
            else
            begin                      //该商品在库存表中不存在，将数据插入库存表中
              Qstr := 'INSERT INTO KCB(KCSP_SP_NOMB,KCSP_QTY,KCSP_GYSID,KCSP_QX)';
              Qstr := Qstr + ' Values(''' + Cells[9, i] + ''',' + Cells[6, i] + ',''' + ComboBox1.Text + ''',''' + Cells[7, i] + ''')';
              MyObj.ExecSQL(Qstr);
            end;
          end;
//        AddShiYong(Cells[9, i]);      //商品使用频率加1
        end;
      end;
      MyObj.ComTrans;         //事务完成
    except
      MyObj.RollTrans;        //事务回滚
      Application.MessageBox(PChar(AdvStringGrid1.Cells[2, i] + ' 出现错误！'), '提示！', 64);
      Exit;
    end;
  end;
end;

procedure TSPRKXX_Adv.AddShiYong(SPNOMB: String);      //商品使用频率加1
var
  cstr: string;
begin
  cstr := 'Select * from SPJBXX where SP_NOMB=''' + SPNOMB + '''';
  QueryRKX.Data := MyObj.OpenSQL(cstr);   //打开商品数据表

end;

function TSPRKXX_Adv.CanSave: Boolean;//判断是否保存
begin
//  showmessage('判断是否保存 ');
  Result := True;
  if (AdvStringGrid1.Cells[6, cRow] = '0') and (cCol > 6) then
  begin
    Result := False;
    Application.MessageBox('商品数量错误！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
//  if ComboBox1.Text = '' then
//  begin
//    Result := False;
//    Application.MessageBox('供应商名称不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
//  if StringGrid1.Cells[6, cRow] = '' then
//  begin
//    Result := False;
//    Application.MessageBox('供应商编号不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
//    exit;
//  end;
  if (AdvStringGrid1.Cells[1, cRow] = '') and (cCol > 1) then
  begin
    Result := False;
    Application.MessageBox('入库编号不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if (AdvStringGrid1.Cells[2, cRow] = '') and (cCol > 2) then
  begin
    Result := False;
    Application.MessageBox('商品名称不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if (AdvStringGrid1.Cells[3, cRow] = '') and (cCol > 3) then
  begin
    Result := False;
    Application.MessageBox('入库类型不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
end;

procedure TSPRKXX_Adv.AdvBh;
var
  sst, sst2: String;
begin
  sst := AdvStringGrid1.Cells[1, cRow];
  sst2 := Copy(sst, 13, 2);
  sst2 := IntToStr(StrToInt(sst2) + 1);
  AdvStringGrid1.Cells[1, cRow + 1] := Copy(sst, 1, 12) + sst2;    //合成入库编号
  AdvStringGrid1.Cells[6, cRow + 1] := '1';                        //默认数量
end;

procedure TSPRKXX_Adv.AdvStringGrid1Click(Sender: TObject);
begin
  cRow := AdvStringGrid1.Row;
  cCol := AdvStringGrid1.Col;
  if (cRow >= AdvStringGrid1.RowCount - 1) and CanSave and (cCol > 7) then
  begin
//    lenn := Length(StringGrid1.Cells[7, cRow]);
//    if (lenn <> 7) and (lenn <> 4) then
//    begin
//      Application.MessageBox('有效期不正确，请重新输入！', '提示信息', 0 + MB_ICONINFORMATION);
//      Exit;
//    end;
    with AdvStringGrid1 do
    begin
      RowCount := RowCount + 1;        //添加一行
      Cells[0, RowCount] := IntToStr(RowCount);    //写序号
      AdvBh;               //写入新编号
      Cells[3, cRow + 1] := Cells[3, cRow];    //与上一行相同
      Cells[4, cRow + 1] := Cells[4, cRow];    //与上一行相同
      Cells[6, cRow + 1] := Cells[6, cRow];    //与上一行相同
      Cells[8, cRow + 1] := Cells[8, cRow];    //与上一行相同
    end;
  end;

end;

procedure TSPRKXX_Adv.AdvStringGrid1ComboChange(Sender: TObject; ACol, ARow,
  AItemIndex: Integer; ASelection: string);
var
  qstr: string;
begin
  AdvStringGrid1.Cells[ACol, ARow] := ASelection;
  case ACol of
    2:
    begin
      ComboBox4.ItemIndex := AItemIndex;        //获取选择商品的编号
      AdvStringGrid1.Cells[9, ARow] := ComboBox4.Text;
      qstr := 'Select * from SPJBXX where SP_NAME=' + '''' + ASelection + '''';
      QueryRKX.Data := MyObj.OpenSQL(qstr);   //打开数据表
      if QueryRKX.FieldByName('SP_JINJA').Value <> null then
        AdvStringGrid1.Cells[5, ARow] := QueryRKX.FieldByName('SP_JINJA').Value else    //填写进价
        AdvStringGrid1.Cells[5, ARow] := '';
      if ARow = 1 then                      //第一行自动填写
      begin
        AdvStringGrid1.Cells[4, ARow] := '公司';
        AdvStringGrid1.Cells[3, ARow] := '购入';
      end;
    end;
    3:
    begin
      WiterCust;
      if ASelection = '购入' then
      begin
        AdvStringGrid1.Cells[4, ARow] := '公司';
        AdvStringGrid1.Cells[3, ARow] := '购入';
      end else           //填写购入的默认来源
        AdvStringGrid1.Cells[4, ARow] := '';
    end;
    4:
    begin
    end;
  end;
end;

procedure TSPRKXX_Adv.AdvStringGrid1GetEditorType(Sender: TObject; ACol, ARow:
  Integer; var AEditor: TEditorType);
begin
  case ACol of
    2: //第3列商品名
    begin
      AEditor := edComboList;  //设置单元格编译类型为 下拉列表
      AdvStringGrid1.Combobox.Items := ComboBox2.Items; //动态设置下拉列表内容
    end;
    3: // 类型
    begin
      AEditor := edComboList;  //设置单元格编译类型为 下拉列表
      AdvStringGrid1.Combobox.Items := Edit3.Items; //动态设置下拉列表内容
    end;
    4:    //来源
    begin
      AEditor := edComboEdit;  //设置单元格编译类型为 下拉列表可编辑
      AdvStringGrid1.Combobox.Items := ComboBox3.Items; //动态设置下拉列表内容
    end;
  end;
end;

function TSPRKXX_Adv.bh: String;       //自动编号
var
  s, m, qstr: string;
  i: integer;
begin
  qstr := 'Select RK_NOMB From SPRKXX ';
  if QueryRKX = nil then
    QueryRKX := TClientDataSet.Create(self);  //出库信息表
  QueryRKX.Data := MyObj.OpenSQL(qstr);
  s := 'RK' + FormatDateTime('yyyymmdd', Now());
  If QueryRKX.RecordCount = 0 then
    s := s + '001'
  else
  begin
    QueryRKX.Last;
    m := Trim(QueryRKX.FieldByName('RK_NOMB').Value);
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

procedure TSPRKXX_Adv.SpeedButton5Click(Sender: TObject);
begin
  ActionCD := '';
  StringGridClear;         //清空StringGrid
  Close;
end;

procedure TSPRKXX_Adv.StringGridClear;
var
  i: Integer;
begin
  for i := 1 to 8 do
  begin
    AdvStringGrid1.Cells[i, 1] := '';
  end;
end;

procedure TSPRKXX_Adv.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#13, #46]) then         //回车
    key := #0;
  if key = #13 then
    Edit1.SetFocus;
end;

procedure TSPRKXX_Adv.FormCreate(Sender: TObject);
begin        //
  if QueryRKX = nil then
    QueryRKX := TClientDataSet.Create(self);  //出库信息表
  QueryCX := TClientDataSet.Create(self);
  ComboBox3.ImeName := MyIme;
  kuan := False;
  ComWrite := False;
  prClear(0);
  cCol := 1;
  cRow := 1;
end;

procedure TSPRKXX_Adv.FormShow(Sender: TObject);
begin
  ComboBox1.Clear;
  GroupBox1.Enabled := False;
  GroupBox2.Enabled := False;
  if ActionCD = 'M' then
    GetAll
  else if ActionCD = 'N' then
  begin
    GroupBox1.Enabled := False;
    GroupBox2.Enabled := False;
  end;
  SpeedButton1Click(Sender);
end;

procedure TSPRKXX_Adv.SpeedButton1Click(Sender: TObject);
begin
  if not GroupBox1.Enabled then
    DateTimePicker1.Date := Now;
  GroupBox1.Enabled := True;            //控件初始化
  GroupBox2.Enabled := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  Edit2.Clear;
  EditJJ.Clear;
  Edit7.Text := 'pjj';
  ActionCD := 'N';
  if not SpeedButton1.Enabled then      //判断“添加”是否激活，未激活不清零售
  begin
  end else
  begin
    ComboBox1.Text := 'ARIIX';
    Edit1.Text := 'GS20150126001';
  end;
  ComboBox2DropDown(Sender);
  ComboBox3DropDown(Sender);
  SpeedButton1.Enabled := False;
  StringGridClear;
  AdvStringGrid1.Cells[1, 1] := bh;    //合成入库编号
  AdvStringGrid1.Cells[6, 1] := '1';                        //默认数量
  AdvStringGrid1.RowCount := 2;
end;

procedure TSPRKXX_Adv.SpeedButton3Click(Sender: TObject);
begin
  if not DataTemp then
  begin
    Application.MessageBox('录入数据不全，请检查！', '提示！', 64);
//    Exit;
  end;
//  if (CanSave) then
  begin
    Posting; //  提交存盘
//    GroupBox1.Enabled := False;
//    GroupBox2.Enabled := False;
    TipInfo('保存成功!', []);
//    Application.MessageBox('保存成功!', '提示!', 64);
    InsertCust;       //新客户插入库中
    SPRKXX_Z.ShowData;;
    SpeedButton1Click(Sender);
  end;
  AdvStringGrid1.Col := 1;
end;

procedure TSPRKXX_Adv.SpeedButton4Click(Sender: TObject);
begin
  SpeedButton1.Enabled := True;
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
  GroupBox1.Enabled := False;
  GroupBox2.Enabled := False;
  ActionCD := '';
  StringGridClear;
  AdvStringGrid1.Cells[1, 1] := bh;    //合成入库编号
  AdvStringGrid1.Cells[6, 1] := '1';                        //默认数量
  AdvStringGrid1.RowCount := 2;

//  GetAll;
end;

procedure TSPRKXX_Adv.ComboBox1Change(Sender: TObject);
Var
  qstr: String;
begin
  Edit1.Clear;                            //通过供应商名称将供应商编号显示在EDIT1中
  qstr := 'Select DISTINCT GYS_NOMB from GYSXX where GYSNAME=''' + ComboBox1.Text + '''';
  QueryRKX.Data := MyObj.OpenSQL(qstr);   //打开数据表
  Edit1.Text := QueryRKX.FieldByName('GYS_NOMB').Value;
  ComboBox2DropDown(Sender);
  //ARIIX_Edit5;
end;

procedure TSPRKXX_Adv.ComboBox1DropDown(Sender: TObject);
var
  i: integer;
  qstr: String;
begin              //将供应商名称显示在ComboBox1中
  ComboBox1.Clear;
  qstr := 'select GYS_NOMB,GYSNAME from GYSXX';
  QueryRKX.Data := MyObj.OpenSQL(qstr);   //打开数据表
  if (QueryRKX.recordcount > 0) then
  begin
    QueryRKX.First;
    for i := 0 to QueryRKX.recordcount - 1 do
    begin
      combobox1.Items.add(QueryRKX.FieldByName('GYSNAME').asstring);
      QueryRKX.next;
    end;
  end;
end;

procedure TSPRKXX_Adv.ComboBox2Change(Sender: TObject);
var
  qstr: String;
begin         //通过商品名称，把规格、单位、商品单价显示在相对应的编号框组件内
  ComboBox4.ItemIndex := Combobox2.ItemIndex;        //获取选择商品的编号
  AdvStringGrid1.Cells[9, cRow] := ComboBox4.Text;
  with Sender as TComboBox do
  begin
    hide;
    if itemindex >= 0 then         //点击ComboBox后itemindex >= 0
      with AdvStringGrid1 do
      begin
        Cells[2, row] := Text;   //未点击不赋值
      end;
  end;

  EditJJ.Clear;
  qstr := 'Select * from SPJBXX where SP_NAME=' + '''' + ComboBox2.Text + '''';
  QueryRKX.Data := MyObj.OpenSQL(qstr);   //打开数据表
  begin
    if QueryRKX.FieldByName('SP_JINJA').Value <> null then
      AdvStringGrid1.Cells[5, cRow] := QueryRKX.FieldByName('SP_JINJA').Value;
  end;
end;                               //   DM.QSPXX.FieldByName('SP_NOMB').Value;

procedure TSPRKXX_Adv.ComboBox2DropDown(Sender: TObject);
var
  i: Integer;
  qstr: String;
begin
  ComboBox2.Clear;
  combobox4.Clear;
  qstr := 'select SP_JNAME, SP_NOMB from SPJBXX where SP_GYSID=' + '''' + Edit1.Text + '''';
  qstr := qstr + ' Order By shiyong DESC';
  QueryRKX.Data := MyObj.OpenSQL(qstr);   //打开数据表
  if (QueryRKX.RecordCount > 0) then
    QueryRKX.first;
  for i := 0 to QueryRKX.recordcount - 1 do         //将Edit1.Text显示的公司商品写入
  begin
    combobox2.Items.add(QueryRKX.FieldByName('SP_JNAME').asstring);
    combobox4.Items.add(QueryRKX.FieldByName('SP_NOMB').asstring);
    QueryRKX.next;
  end;

end;

procedure TSPRKXX_Adv.ComboBox3Change(Sender: TObject);
begin
  ComboBox3.hide;
  if ComboBox3.Text <> '' then
    with AdvStringGrid1 do
      Cells[4, row] := ComboBox3.Text else   //退出Combobox
    Application.MessageBox('商品来源不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
end;

procedure TSPRKXX_Adv.ComboBox3DropDown(Sender: TObject);
begin
  WiterCust;
end;

function TSPRKXX_Adv.DataTemp: Boolean;
begin
  Result := False;
  with AdvStringGrid1 do
  begin
    if (Cells[2, cRow] <> '') and (Cells[3, cRow] <> '') and (Cells[4, cRow] <> '') and (Cells[6, cRow] <> '') then
      Result := True;
  end;
end;

procedure TSPRKXX_Adv.Edit3Change(Sender: TObject);
begin
  with Sender as TComboBox do
  begin
    hide;
    if itemindex >= 0 then         //点击ComboBox后itemindex >= 0
      with AdvStringGrid1 do
      begin
        Cells[3, row] := Text;   //未点击不赋值
        if (AdvStringGrid1.Cells[3, Row] = '购入') then
          AdvStringGrid1.Cells[4, Row] := '公司';
      end;
  end;
  WiterCust;
end;

procedure TSPRKXX_Adv.WiterCust;     //客户写入Combobox ,客户要区分是还或借
var
  i: Integer;
  cStr, sComb3, qstr: string;
begin
  sComb3 := ComboBox3.Text;            //保存当前值
  ComboBox3.Clear;
  qstr := 'select SP_NAME from SPJBXX where SP_GYSID=' + '''' + Edit1.Text + '''';
  if Edit3.Text = '还入' then               //若为“还入”，则从spcrxx中过滤出借出者
  begin
    cStr := 'CK_GOTOID';
    qstr := 'Select DISTINCT CK_GOTOID From SPCKXX ';
    qstr := qstr + 'Where CK_GYS_NOMB=''' + Edit1.Text + ''' and (CK_TYPE=''借出'')';    //
    qstr := qstr + ' Group By CK_GOTOID';
    qstr := qstr + ' ORDER BY CK_DATE  DESC';      //以日期排序，最近者在前
  end else
  begin
    cStr := 'CUST_NAME';
    qstr := 'select * from CUST';
    qstr := qstr + ' Order By pinglu DESC';
  end;
  QueryRKX.Data := MyObj.OpenSQL(qstr);   //打开数据表
  if QueryRKX.Recordcount > 0 then      //如有记录将其写入ComboBox3
  begin
    for i := 0 to QueryRKX.Recordcount - 1 do
    begin
      if Edit3.Text = '还入' then
        ComboBox3.Items.Add(pCUSTID(QueryRKX.FieldByName(cStr).AsInteger)) else
        ComboBox3.Items.Add(QueryRKX.FieldByName(cStr).AsString);
      QueryRKX.next;
    end;
  end;
  ComboBox3.Text := sComb3;           //还原当前值
end;

procedure TSPRKXX_Adv.Edit7Change(Sender: TObject);
begin
  Edit7.Text := Trim(Edit7.Text);
end;

procedure TSPRKXX_Adv.Edit7Enter(Sender: TObject);
begin
  Edit7.ImeName := MyIme;
end;

procedure TSPRKXX_Adv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SpeedButton4Click(Sender);
end;

procedure TSPRKXX_Adv.InsertCust;      //不存在的客户插入库中
var
  qstr: String;
begin
  if Trim(AdvStringGrid1.Cells[4, cRow]) <> '' then
    qstr := 'Select DISTINCT CUST_NAME from CUST';                //查询客户库中是否存在
  qstr := qstr + ' Where CUST_NAME=''' + AdvStringGrid1.Cells[4, cRow] + '''';   //查询客户中否存在ComboBox3.Text
  QueryRKX.Data := MyObj.OpenSQL(qstr);                        //打开商品数据表
  if (QueryRKX.Recordcount = 0) then                              //若不存在写入库中
  begin
    qstr := 'INSERT INTO CUST(CUST_NAME)';
    qstr := qstr + 'Values(''' + Trim(AdvStringGrid1.Cells[4, cRow]) + ''')';
    MyObj.ExecSQL(qstr);
  end;
end;

end.
