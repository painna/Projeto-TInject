program TInject;
{$I cef.inc}
uses
  {$IFDEF DELPHI16_UP}
  Vcl.Forms,
  {$ELSE}
  Forms,
  Windows,
  {$ENDIF }
  uCEFApplication,
  uCEFConstants,
  u_principal in 'u_principal.pas' {frmPrincipal};

{$R *.res}

begin
  GlobalCEFApp := TCefApplication.Create;
  GlobalCEFApp.EnableGPU            := True;
  GlobalCEFApp.cache                := 'DATA\cache';
  GlobalCEFApp.DisableFeatures      := 'NetworkService,OutOfBlinkCors';

  if GlobalCEFApp.StartMainProcess then
    begin
      Application.Initialize;
      {$IFDEF DELPHI11_UP}
      Application.MainFormOnTaskbar := True;
      {$ENDIF}
      Application.CreateForm(TfrmPrincipal, frmPrincipal);
      Application.Run;
    end;

  GlobalCEFApp.Free;
  GlobalCEFApp := nil;
end.