//DB@BATCH PROC PROG='?',      * REQUIRED FIELD USE PROGRAM NAME        00010004
//         PARAM='',                                                    00020004
//         THATDFLT='UT',                                               00030004
//         THIRDPTY=,                                                   00040004
//         ENV='?',            * P=PROD   T=TEST                        00050004
//         THEMAPPL=T,         * T=THAT   3=THIRDPTY                    00060004
//         DFSPRM='NORMAL',    * REGULAR PARMS FOR DFSORT               00070004
//         LVL=,                                                        00080004
//         DB2ID='????',       * REQUIRED FIELD USE DB2 SYSTEM ID       00090004
//         PLAN='??????',      * REQUIRED FIELD USE DB2 PLAN NAME       00100004
//         INSPRT='*'                                                   00110004
//**********************************************************************00120004
//***                      C O M M E N T S                           ***00130004
//***                                                                ***00140004
//**********************************************************************00280004
//PS0010   EXEC PGM=&PROG,PARM=&PARAM,REGION=128M                       00290005
//STEPLIB  INCLUDE MEMBER=&THATDFLT.&THIRDPTY.D&THEMAPPL.01&ENV         00300004
//DBAPRINT DD SYSOUT=&INSPRT                                            00310004
//SYSPRINT DD SYSOUT=&INSPRT                                            00320004
//SYSPUNCH DD SYSOUT=&INSPRT                                            00330004
//SYSTSPRT DD SYSOUT=&INSPRT                                            00340004
//SYSOUT   DD SYSOUT=&INSPRT                                            00350004
//SYSABOUT DD SYSOUT=U                                                  00360004
//*                                                                     00370004
//DFSPARM  DD DISP=SHR,DSN=SYS1.DFSORT.SORTPRM(&DFSPRM)                 00380004
//*                                                                     00390004
//SYSUDUMP DD SYSOUT=U                                                  00400004
//SYSTSIN  INCLUDE MEMBER=&THATDFLT.&THIRDPTY.D&THEMAPPL.02&ENV         00410004
//DUMLVL   DD DSN=&&DUM&LVL,DISP=(,PASS),                               00420004
//         SPACE=(TRK,(0))                                              00430004
//XRES    EXEC  PGM=THE&DB2ID.                                          00440004
//DD1      DD DSN=&&THEDSN                                              00450004
//SYSPRINT DD SYSOUT=*                                                  00460004
//SYSUDUMP DD SYSOUT=U                                                  00470004
