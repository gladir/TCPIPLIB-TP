{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/TCPIPLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}


Unit IPFNC;

INTERFACE

Type
 IPAddrType=Array[0..3]of Byte;

Function  IPAddressToStr(IP:IPAddrType):String;
Function  IsValidIPChar(C:Char):Boolean;
Procedure StrToIPAddress(S:String;Var IP:IPAddrType);

IMPLEMENTATION


Function IPAddressToStr(IP:IPAddrType):String;
Var
 ResultStr,Temp:String;
Begin
 ResultStr:='';
 Str(IP[0],Temp);
 ResultStr:=Temp+'.';
 Str(IP[1],Temp);
 ResultStr:=ResultStr+Temp+'.';
 Str(IP[2],Temp);
 ResultStr:=ResultStr+Temp+'.';
 Str(IP[3],Temp);
 ResultStr:=ResultStr+Temp;
 IPAddressToStr:=ResultStr;
End;

Function IsValidIPChar(C:Char):Boolean;Begin
 IsValidIPChar:=((C>='0')and(C<='9'))or(C in ['.',':']);
End;

Procedure StrToIPAddress(S:String;Var IP:IPAddrType);
Var
 I:Integer;
 CurrNum:String;
 Err:Word;
Begin
 I:=1;
 CurrNum:='';
 While(I<=Length(S))and(S[I]<>'.')do Begin
  CurrNum:=CurrNum+S[I];
  Inc(I);
 End;
 Val(CurrNum,IP[0],Err);
 If(I<=Length(S))and(S[I]='.')Then Begin
  Inc(I);
 End
  Else
 Exit;
 CurrNum:='';
 While(I<=Length(S))and(S[I]<>'.')do Begin
  CurrNum:=CurrNum+S[I];
  Inc(I);
 End;
 Val(CurrNum,IP[1],Err);
 If(I<=Length(S))and(S[I]='.')Then Begin
  Inc(I);
 End
  Else
 Exit;
 CurrNum:='';
 While(I<=Length(S))and(S[I]<>'.')do Begin
  CurrNum:=CurrNum+S[I];
  Inc(I);
 End;
 Val(CurrNum,IP[2],Err);
 If(I<=Length(S))and(S[I]='.')Then Begin
  Inc(I);
 End
  Else
 Exit;
 CurrNum:='';
 While(I<=Length(S))and(S[I]<>'.')do Begin
  CurrNum:=CurrNum+S[I];
  Inc(I);
 End;
 Val(CurrNum,IP[3],Err);
End;

END.