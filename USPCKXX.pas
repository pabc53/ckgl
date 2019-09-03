unit USPCKXX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, dbclient, UntRemSql, untfunctions,
  DBGrids, TntStdCtrls, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDCustomMaskEdit,
  LMDCustomExtSpinEdit, LMDExtSpinEdit, Spin, uUserMaint;

type
  TSPCKXX = class(TForm)
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
    ComboBox2: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox3: TTntComboBox;
    SpinEdit: TSpinEdit;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    Label13: TLabel;
    ComboBoQX: TTntComboBox;
    EditDH: TEdit;
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3DropDown(Sender: TObject);
    procedure ComboBox3Enter(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure DateTimePicker1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxNAMEChange(Sender: TObject);
    procedure ComboBoxNAMEDropDown(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit6Enter(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    function pCUST(SCUST: string): Integer;              //通过名称查ID
    function pCUSTID(SCUSTID: Integer): string;          //通过ID查名称

  private
    procedure ARIIX_Edit3;

    { Private declarations }
  public
    procedure GetAll;   //获得所有数据
    procedure posting;  //提交数据
    Function CanSave: Boolean; //判断是否保存
    function ZQuyStr(STABL, sFIEL, Str: String): String;   //查找名称:表、字段、值
    procedure bh;   //自动编号
    Procedure tr;   //去除空字符
    procedure calculate;    //计算存量
    procedure QDelete(str: String);
    function comQTY: Integer;   //返回库存量
    procedure InsertCust;       //插入客户
    procedure WiterCust;        //写入客户
    procedure GetQX;            //通过产品名称获取库存表中该产品的期限


    { Public declarations }
  end;

var
  SPCKXX: TSPCKXX;
  BtnTJ, BtnXG, kuan: BOOLEAN;
  OldCK: Integer;         //旧出库数量（修改出库信息时用于保存修改前的数据）
  QueryCKX, QuyKCB: TClientDataSet;
  oldQx: String;

implementation

uses zMAIN, ZAbstractDataset, USPCKXX_Z;

{$R *.dfm}

function TSPCKXX.pCUSTID(SCUSTID: Integer): string;
var
  cstr: string;
begin
  if scustid <> 0 then
  begin
    cstr := 'Select * From cust';
    cstr := cstr + ' Where CUST_ID=' + IntToStr(scustID);
    QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
    Result := QueryCKX.FieldByName('CUST_NAME').Value;    //返回id
  end else
    Result := '';
end;

function TSPCKXX.pCUST(SCUST: string): Integer;
var
  cstr: string;
begin
  cstr := 'Select * From cust';
  cstr := cstr + ' Where CUST_NAME=''' + scust + '''';
  QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
  Result := QueryCKX.FieldByName('CUST_ID').Value;    //返回id
end;

procedure TSPCKXX.InsertCust;      //插入第1次出现的客户
var
  cstr: String;
begin
  ComboBox3.Text := trim(ComboBox3.Text);
  if ComboBox3.Text <> '' then
  begin
    cstr := 'Select DISTINCT CUST_NAME from CUST ';                //查询客户库中是否存在
    cstr := cstr + ' Where CUST_NAME=''' + trim(ComboBox3.Text) + '''';   //查询客户中否存在ComboBox3.Text
    QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
    if (QueryCKX.Recordcount = 0) then                              //若不存在写入库中
    begin
      cstr := 'INSERT INTO CUST(CUST_NAME)';
      cstr := cstr + 'Values(''' + ComboBox3.Text + ''')';
      MyObj.ExecSQL(cstr);
    end;
  end;
end;

procedure TSPCKXX.QDelete(str: String);
begin              //删除库存表中记录
  MyObj.ExecSQL('Delete From KCB Where ' + str);
//  Gob_Rmo.BathExec;
end;

function TSPCKXX.ZQuyStr(STABL, sFIEL, Str: String): String;
var
  cstr: String;
begin
  Result := '';
  cstr := 'select * from ' + STABL;                //查询客户库中是否存在
  cstr := cstr + ' Where ' + sFIEL + '=''' + str + '''';
  QueryCKX.Data := MyObj.OpenSQL(cstr);                        //打开商品数据表
  Result := QueryCKX.FieldByName(sFIEL).AsString;
end;

procedure TSPCKXX.tr;
var
  i: integer;
begin
  for i := ComponentCount - 1 downto 0 do
    if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := trim(TEdit(Components[i]).Text);
end;

procedure TSPCKXX.GetAll;//获得所有数据
begin
  Edit1.Text := QueryCK.FieldByName('出库编号').AsString;
  ComboBox1.Text := QueryCK.FieldByName('供应商名称').AsString;
  ComboBoxNAME.Text := QueryCK.FieldByName('商品名称').AsString;
  ComboBox2.Text := QueryCK.FieldByName('出库类型').AsString;
  ComboBox3.Text := QueryCK.FieldByName('去向').AsString;
  ComboBox4.Text := QueryCK.FieldByName('供应商编号').AsString;
  ComboBox5.Text := QueryCK.FieldByName('商品编号').AsString;
  ComboBoQX.Text := QueryCK.FieldByName('产品期限').AsString;
  oldQx := QueryCK.FieldByName('产品期限').AsString;         //保存
  Edit3.Text := QueryCK.FieldByName('进价').AsString;
  EditDH.Text := QueryCK.FieldByName('货单号').AsString;
  Edit4.Text := QueryCK.FieldByName('销售价').AsString;
  SpinEdit.Value := QueryCK.FieldByName('出库数量').AsInteger;
  OldCK := StrToInt(SpinEdit.Text);        //保存修改前的数据
  if SpinEdit.Value = 0 then
    SpinEdit.Value := 1;              //默认值
  DateTimePicker1.Date := QueryCK.FieldByName('出库日期').AsDateTime;
  Edit6.Text := QueryCK.FieldByName('经手人').AsString;
  Memo1.Text := QueryCK.FieldByName('备注').AsString;
end;

procedure TSPCKXX.Posting;          //提交数据
var
  cstr: String;
begin
  if Edit4.Text = '' then
    Edit4.Text := '0';              //空格转为0
  if ActionCD = 'N' then
  begin
    try
      calculate;        //计算库存量
      Cstr := 'INSERT INTO SPCKXX(CK_GYS_NOMB,CK_SP_NOMB,CK_TYPE,CK_DJ,CK_QTY,CK_DATE,CK_JSR,CK_MEMO,CK_NOMB,CK_GOTOID,CK_DH,CK_QX)';
      Cstr := Cstr + ' Values(''' + ComboBox4.Text + ''',''' + ComboBox5.Text + ''',''' + ComboBox2.Text + ''',' + Edit4.Text
        + ',' + IntToStr(SpinEdit.Value) + ',''' + FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + ''',''' + Edit6.Text + ''',''' + Memo1.Text + ''',''' + Edit1.Text + ''',';
      Cstr := Cstr + IntToStr(pCUST(ComboBox3.Text)) + ',''' + EditDH.Text + ''',''' + ComboBoQX.Text + ''')';
      MyObj.ExecSQL(cstr);
    TipInfo('保存成功!', []);
  except
    TipInfo('保存失败!', []);
    end;
  end;
end;

function TSPCKXX.CanSave: Boolean;//判断是否保存
begin
  if ComboBox1.Text = '' then
  begin
    Result := False;
    Application.MessageBox('供应商名称不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if ComboBox2.Text = '' then
  begin
    Result := False;
    Application.MessageBox('出库类型称不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if ComboBox3.Text = '' then
  begin
    Result := False;
    Application.MessageBox('商品去向不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if Edit1.Text = '' then
  begin
    Result := False;
    Application.MessageBox('出库编号不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if ComboBoxNAME.Text = '' then
  begin
    Result := False;
    Application.MessageBox('商品名称不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if SpinEdit.Value = 0 then
  begin
    Result := False;
    Application.MessageBox('商品数量不能为空！', '提示信息', 0 + MB_ICONINFORMATION);
    exit;
  end;
end;

procedure TSPCKXX.bh;     //自动编号
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
  Edit1.Text := s;
end;

procedure TSPCKXX.SpeedButton5Click(Sender: TObject);
begin
  ActionCD := '';
  BtnTJ := False;        //添加状态
  BtnXG := False;        //修改状态
  SpeedButton2.Enabled := True;
  Close;
end;

procedure TSPCKXX.WiterCust;     //写入客户
var
  i: Integer;
  cName, cStr, qstr: string;
begin
  cName := ComboBox3.Text;
  ComboBox3.clear;
  qstr := 'select SP_NAME from SPJBXX where SP_GYSID=' + '''' + Edit1.Text + '''';
  if ComboBox2.Text = '还出' then
  begin
    cStr := 'RK_FROMID';
    qstr := 'Select DISTINCT RK_FROM From SPRKXX ';
    qstr := qstr + ' Where (RK_GYS_NOMB=''' + ComboBox4.Text + ''') and (RK_TYPE=''借入'')';    //
  end else
  begin
    cStr := 'CUST_NAME';
    qstr := 'select * from CUST';
  end;
  QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
  if QueryCKX.Recordcount > 0 then      //如有记录将其写入ComboBox3
  begin
    ComboBox3.Clear;
    for i := 0 to QueryCKX.Recordcount - 1 do
    begin
      if ComboBox2.Text = '还出' then
        ComboBox3.Items.Add(pCUSTID(QueryCKX.FieldByName(cStr).AsInteger)) else
        ComboBox3.Items.Add(QueryCKX.FieldByName(cStr).AsString);
      QueryCKX.next;
    end;
  end;
  ComboBox3.Text := cName;
end;

procedure TSPCKXX.FormCreate(Sender: TObject);
begin                //创建窗体时
  QuyKCB := TClientDataSet.Create(self);  //库存信息表 QueryCKX
  QueryCKX := TClientDataSet.Create(self);  //库存信息表
  kuan := False;
  BtnTJ := False;        //添加状态
  BtnXG := False;        //修改状态
  //WiterCust;           //写入客户
end;

procedure TSPCKXX.FormShow(Sender: TObject);
begin                          //判断按钮是否选中状态
  GroupBox1.Enabled := True;
  if ActionCD = 'M' then
    GetAll
  else if ActionCD = 'N' then
  begin
    GroupBox1.Enabled := False;
    SpeedButton2Click(Sender);
  end;
  ARIIX_Edit3;
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
end;

procedure TSPCKXX.SpeedButton1Click(Sender: TObject);
begin    //单击添加按钮，控件初始化
  GroupBox1.Enabled := True;
//  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  ComboBox1.Text := 'ARIIX';
  ComboBox4.Text := 'GS20150126001';
  ComboBoxNAME.Clear;
  Edit3.Clear;
  Edit4.Clear;
  SpinEdit.Value := 1;      //默认值
  Edit6.Text := 'pjj';    //默认值
  DateTimePicker1.Date := now;
  Memo1.Clear;
  BtnTJ := True;        //添加状态
  BtnXG := False;        //修改状态
  ActionCD := 'N';
  bh;
  ComboBox1.SetFocus;
  SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
end;

procedure TSPCKXX.SpeedButton3Click(Sender: TObject);        //添加
var
  kQTY, nQTY: Integer;                 //kQTY库中存量，nQTY当前更正后的量
  kNOMB, cstr: String;
begin
  if BtnTJ then            //添加
  begin
    if comQTY - SpinEdit.Value >= 0 then  //判断库存量-出库量是否大于等于0
    begin
      if (cansave) then
      begin
        Posting;                      //  提交存盘
        GroupBox1.Enabled := False;
//        Application.MessageBox('保存成功!', '提示!', 64);
        SPCKXX_Z.FormShow(Sender);         //刷新
                 //重新复原
        GroupBox1.Enabled := True;
        SpeedButton3.Enabled := True;
        SpeedButton4.Enabled := True;
        Edit1.Clear;
//        if ((ComboBoxNAME.Text = '矿物质') or (ComboBoxNAME.Text = '维生素')) and (not kuan) then
//        begin
//          if (ComboBoxNAME.Text = '矿物质') then
//          begin
//            ComboBoxNAME.ItemIndex := ComboBoxNAME.ItemIndex + 1;
//          end else
//          if (ComboBoxNAME.Text = '维生素') then
//          begin
//            ComboBoxNAME.ItemIndex := ComboBoxNAME.ItemIndex - 1;
//          end;
//          ComboBoxNAME.OnChange(Sender);
//          kuan := True;
//        end else
        begin
          ComboBoxNAME.Text := '';
          SpinEdit.Value := 1;      //默认值
        end;
        Edit3.Clear;
        Edit4.Clear;
        Edit6.Text := 'pjj';    //默认值
        ActionCD := 'N';
        bh;
        ComboBox1.SetFocus;
        SpeedButton1.Enabled := False;
      end;
    end else
    begin
      Application.MessageBox('出库数量不能大于库存数量！', '提示！', 64);
      SpinEdit.Value := 1;             //默认值
      SpinEdit.SetFocus;
    end;
  end else
  if BtnXG then     //修改
  begin
    try
      kNOMB := IntToStr(pCUST(ComboBox3.Text));
      if OldCK <> SpinEdit.Value then         //修改前数量与保存时的数量不相等表示改了数量，可执行下面代码进行库存数量的修改
      begin
        kQTY := comQTY;                      //获取库存数量
        nQTY := kQTY + OldCK - StrToInt(SpinEdit.Text);      //更正后数值  库存量+更正前出库量-更正后出库量
        if nQTY < 0 then  //更正后数值小于0，表示出库量大于库存量
        begin
          Application.MessageBox('出库数量不能大于库存数量！', '提示！', 64);
          SpinEdit.SetFocus;
          Exit;
        end else
        if nQTY > 0 then      //
        begin
          if kQTY <> 0 then
          begin
            cstr := 'Update kcb set KCSP_QTY=' + IntToStr(nQTY);
            cstr := cstr + ' Where (KCSP_SP_NOMB=''' + ComboBox5.Text + ''') and (KCSP_QX=''' + ComboBoQX.Text + ''')';   //条件：编号、期限
            MyObj.ExecSQL(cstr);    //更新库存数
          end else              //更新前库存量等于0，在库存表中插入一条记录
          begin                 //该商品在库存表中不存在，将数据插入库存表中
            cstr := 'INSERT INTO KCB(KCSP_SP_NOMB,KCSP_QTY,KCSP_GYSID,KCSP_QX)';
            cstr := cstr + ' Values(''' + ComboBox5.Text + ''',' + IntToStr(nQTY) + ',''' + ComboBox1.Text + ''',''' + ComboBoQX.Text + ''')';
            MyObj.ExecSQL(cstr);
          end;
        end else
        if nQTY = 0 then  //更新后出库量等于0
        begin
          cstr := '(KCSP_SP_NOMB=''' + ComboBox5.Text + ''') and (KCSP_QX=''' + ComboBoQX.Text + ''')';
          QDelete(cstr);          //更正后库存量等于0则删除库存记录
        end;
      end;
  //更新出库记录

      Cstr := 'Update SPCKXX set CK_SP_NOMB=''' + ComboBox5.Text + ''',CK_TYPE=''' + ComboBox2.Text + ''',CK_DJ=' + Edit4.Text
        + ',CK_QTY=' + IntToStr(SpinEdit.Value) + ',CK_DATE=''' + FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date)
        + ''',CK_DH=''' + EditDH.Text + ''',CK_QX=''' + ComboBoQX.Text
        + ''',CK_JSR=''' + Edit6.Text + ''',CK_MEMO=''' + Memo1.Text + ''',CK_GOTOID=' + kNOMB;
      cstr := cstr + ' Where CK_NOMB=''' + Edit1.Text + '''';       //更新条件　CK_NOMB= Edit1.Text
      MyObj.ExecSQL(cstr);      //更新出库记录
      SPCKXX_Z.FormShow(Sender);         //刷新
      Application.MessageBox('保存成功!', '提示!', 64);
      Close;
    except
      TipInfo('保存失败!', []);
    end;
  end;
end;

procedure TSPCKXX.ARIIX_Edit3;
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

procedure TSPCKXX.SpeedButton4Click(Sender: TObject);
begin
//  SpeedButton1.Enabled := True;     //单击取消，控件按钮可用状态
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
//  GroupBox1.Enabled := False;
  ActionCD := 'N';
  GetAll;
end;

procedure TSPCKXX.ComboBox1Change(Sender: TObject);
begin
  ComboBox4.ItemIndex := ComboBox1.ItemIndex;
  Edit3.Clear;
  Edit4.Clear;
  ARIIX_Edit3;
end;

procedure TSPCKXX.ComboBox1DropDown(Sender: TObject);
var              //将商品编号显示在ComboBox1中
  i: integer;
  cstr: string;
begin
  ComboBox1.Clear;
  ComboBox4.Clear;
  cstr := 'select DISTINCT GYSNAME, GYS_NOMB from SPRKXX S,GYSXX G';    //从入库信息中提出供应商名称
  cstr := cstr + ' Where RK_GYS_NOMB=GYS_NOMB';
  QueryCKX.Data := MyObj.OpenSQL(cstr);    //打开数据表
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

function TSPCKXX.comQTY: Integer;
var
  cstr: String;
begin      //返回库存量
  if ComboBoQX.Text <> '' then
    cstr := 'Select KCSP_QTY,KCSP_SP_NOMB from KCB where (KCSP_SP_NOMB=' + '''' + ComboBox5.Text + ''') and (KCSP_QX=' + '''' + ComboBoQX.Text + ''')' else
    cstr := 'Select KCSP_QTY,KCSP_SP_NOMB from KCB where (KCSP_SP_NOMB=' + '''' + ComboBox5.Text + ''')';

  QueryCKX.Data := MyObj.OpenSQL(cstr);    //打开数据表
  if QueryCKX.RecordCount = 0 then
    Result := 0 else
    Result := QueryCKX.FieldByName('KCSP_QTY').Value;    //返回库存数
end;

procedure TSPCKXX.calculate;
var
  kQTY: Integer;
  kNOMB, cstr: String;
begin        //判断出库数量与库存数据是否相等，相等则删除记录，否则减去出库量   QuyKCB
  if QueryCKX.FieldByName('KCSP_QTY').Value = SpinEdit.Value then
  begin
    cstr := '(KCSP_SP_NOMB=''' + ComboBox5.Text + ''') and (KCSP_QX=''' + ComboBoQX.Text + ''')';
    QDelete(cstr);          //出库量与库存量相等则删除库存记录
  end else
  begin
    kQTY := QueryCKX.FieldByName('KCSP_QTY').AsInteger - SpinEdit.Value;
    kNOMB := QueryCKX.FieldByName('KCSP_SP_NOMB').Value;  //保存当前记录的商品编号
    cstr := 'Update kcb set KCSP_QTY=' + IntToStr(kQTY);
    cstr := cstr + ' Where KCSP_SP_NOMB=''' + kNOMB + '''';
    MyObj.ExecSQL(cstr);
  end;
end;

procedure TSPCKXX.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#13]) then
    key := #0;
  if key = #13 then
    SpinEdit.SetFocus;
end;

procedure TSPCKXX.ComboBox2Change(Sender: TObject);
begin
  //WiterCust;
  if ComboBox2.Text = '自用' then
  begin
    ComboBox3.Text := '自用';
    DateTimePicker1.SetFocus;
  end else
    ComboBox3.SetFocus;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
end;

procedure TSPCKXX.ComboBox3DropDown(Sender: TObject);
begin
  WiterCust;
end;

procedure TSPCKXX.ComboBox3Enter(Sender: TObject);
begin
  ComboBox3.ImeName := MyIme;
end;

procedure TSPCKXX.ComboBox3Exit(Sender: TObject);
begin
  InsertCust;
end;

procedure TSPCKXX.DateTimePicker1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Edit6.SetFocus;
end;

procedure TSPCKXX.ComboBoxNAMEChange(Sender: TObject);
var
  cstr: string;
begin          //通过供应商名称，商品名称将进价等信息显示在相对应的EDIT中
  ComboBox5.ItemIndex := ComboBoxNAME.ItemIndex;
  begin
    cstr := 'Select SP_JINJA 进价,SP_XIAOSOJA 销售价 from GYSXX G,SPJBXX J ';
    cstr := cstr + ' where (GYSNAME=' + '''' + ComboBox1.Text + ''') and (SP_JNAME=' + '''' + ComboBoxNAME.Text + ''')';
    QueryCKX.Data := MyObj.OpenSQL(cstr);  //打开数据表
  end;
  if QueryCKX.FieldByName('进价').Value <> null then
    Edit3.Text := QueryCKX.FieldByName('进价').Value;
  if QueryCKX.FieldByName('销售价').Value <> null then
    Edit4.Text := QueryCKX.FieldByName('销售价').Value;
  ComboBoQX.Clear;      //清空
  GetQX;                //商品期限写入下拉框中
end;

procedure TSPCKXX.GetQX;    //通过产品名称获取库存表中该产品的期限
var
  cstr: string;
begin
  cstr := 'Select * from kcb ';
  cstr := cstr + ' where (KCSP_SP_NOMB=' + '''' + ComboBox5.Text + ''') ';
  QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
  if QueryCKX.RecordCount <> 0 then
  begin
    ComboBoQX.text := QueryCKX.fieldbyname('KCSP_QX').AsString;
    QueryCKX.Next;
  end;
end;

procedure TSPCKXX.ComboBoxNAMEDropDown(Sender: TObject);
var
  i: Integer;
  cstr: string;
begin              //  通过供应商名称，将该供应商所属商品名称提出到ComboBoxNAME中
  ComboBoxNAME.Clear;
  ComboBox5.Clear;
  begin
    cstr := 'Select DISTINCT SP_NAME 商品名称,SP_JNAME 商品简称,SP_NOMB from Kcb S,GYSXX G,SPJBXX J';    //从入库信息中提出供应商名称
    cstr := cstr + ' Where (KCSP_SP_NOMB=SP_NOMB) and (SP_GYSID=''' + ComboBox4.Text + ''')';
    cstr := cstr + 'Order By KCSP_QTY DESC';
    QueryCKX.Data := MyObj.OpenSQL(cstr);   //打开数据表
    if (QueryCKX.recordcount > 0) then
      QueryCKX.first;
    for i := 0 to QueryCKX.recordcount - 1 do
    begin
      ComboBoxNAME.Items.add(QueryCKX.FieldByName('商品简称').asstring);   //商品名称
      ComboBox5.Items.add(QueryCKX.FieldByName('SP_NOMB').asstring);       //商品编号
      QueryCKX.next;
    end;
    Edit3.Clear;
    Edit4.Clear;
  end;
end;

procedure TSPCKXX.Edit4Change(Sender: TObject);
begin
  BtnXG := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
end;

procedure TSPCKXX.Edit6Enter(Sender: TObject);
begin
  Edit6.ImeName := MyIme;
end;

procedure TSPCKXX.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Memo1.SetFocus;
end;

procedure TSPCKXX.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SpeedButton4Click(Sender);
end;

procedure TSPCKXX.Memo1Change(Sender: TObject);
begin
  Memo1.Text := Trim(Memo1.Text);
  BtnXG := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
end;

procedure TSPCKXX.Memo1Enter(Sender: TObject);
begin
  Memo1.ImeName := MyIme;
end;

procedure TSPCKXX.SpeedButton2Click(Sender: TObject);
begin
  GroupBox1.Enabled := True;
//  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  ComboBox1.SetFocus;
  SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
  OldCK := StrToInt(SpinEdit.Text);        //保存修改前的数据
  BtnTJ := False;        //添加状态
  BtnXG := True;        //修改状态
end;

end.
