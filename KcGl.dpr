program KcGl;

uses
  Forms,
  Controls,
  zMain in 'zMain.pas' {MAIN},
  UGYSXX in 'UGYSXX.pas' {GYSXX},
  UGYSXX_Z in 'UGYSXX_Z.pas' {GYSXX_Z},
  USPKCCX in 'USPKCCX.pas' {SPKCCX},
  uUserMaint in 'uUserMaint.pas',
  zDM in 'zDM.pas' {DModule: TDataModule},
  USPRKXX_Z in 'USPRKXX_Z.pas' {SPRKXX_Z},
  USPRKXX_Adv in 'USPRKXX_Adv.pas' {SPRKXX_Adv},
  USPCKXX_SG in 'USPCKXX_SG.pas' {SPCKXX_SG},
  USPCKXX_Z in 'USPCKXX_Z.pas' {SPCKXX_Z},
  USPJBXX in 'USPJBXX.pas' {SPJBXX},
  USPJBXX_Z in 'USPJBXX_Z.pas' {SPJBXX_Z},
  USPJGJS in 'USPJGJS.pas' {SPJGJS},
  USPCKXX in 'USPCKXX.pas' {SPCKXX};

{$R *.res}

begin
  Application.Initialize;
//  Application.CreateForm(TDModule, DModule);
  Application.CreateForm(TMAIN, MAIN);
  Application.CreateForm(TSPKCCX, SPKCCX);
  Application.CreateForm(TDModule, DModule);
  Application.CreateForm(TSPRKXX_Z, SPRKXX_Z);
  Application.CreateForm(TSPRKXX_Adv, SPRKXX_Adv);
  Application.CreateForm(TSPCKXX_SG, SPCKXX_SG);
  Application.CreateForm(TSPCKXX_Z, SPCKXX_Z);
  Application.CreateForm(TSPJGJS, SPJGJS);
  Application.Run;
end.
