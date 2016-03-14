#ifndef pp_explode_arrOut
	#dim pp_explode_arrOut [1]
#endif
#ifndef pp_explode_strIn
	#define pp_explode_strIn
#endif
#ifndef pp_explode_intInit
	#define pp_explode_intInit 0
#endif
#ifndef pp_explode_strSep
	#define pp_explode_strSep '\'
#endif
#ifndef pp_explode_strText
	#define pp_explode_strText SourcePath
#endif

#sub pp_explode_loopBody
    //{#pp_explode_arrOut[pp_explode_intInit]}
	#if Pos(pp_explode_strSep,pp_explode_strText) != 0
		#redim public pp_explode_arrOut[pp_explode_intInit + 1];
		#define pp_explode_strTextCur
		#define pp_explode_strTextCur Copy(pp_explode_strText, 1, Pos(pp_explode_strSep, pp_explode_strText)-1);
		#define public pp_explode_arrOut[pp_explode_intInit] pp_explode_strTextCur;
		#define public pp_explode_strText Copy(pp_explode_strText, Len(pp_explode_strTextCur)+Len(pp_explode_strSep)+1, Len(pp_explode_strText));
		#pragma message "pp_explode: exploded (" + Str(pp_explode_intInit) + "): " + pp_explode_arrOut[pp_explode_intInit];
	#else
		#redim public pp_explode_arrOut[pp_explode_intInit + 1];
		#define public pp_explode_arrOut[pp_explode_intInit] pp_explode_strText;
		#define public pp_explode_strText "";
		#pragma message "pp_explode: last pp_explode_intInit: " + Str(pp_explode_intInit);
		#pragma message "pp_explode: last exploded (" + Str(pp_explode_intInit) + "): " + pp_explode_arrOut[pp_explode_intInit];
	#endif
	#pragma message "pp_explode: ----end of pp_explode_loopBody: " + Str(pp_explode_intInit+1);
#endsub //pp_explode_loopBody
#for {pp_explode_intInit = 0; Len(pp_explode_strText) > 0; pp_explode_intInit++} pp_explode_loopBody

//#define parentFolder pp_explode_arrOut[DimOf(pp_explode_arrOut)-1];