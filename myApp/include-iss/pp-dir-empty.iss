#ifndef pp_dirEmpty_mask
	#define pp_dirEmpty_mask "programfiles2install\*.*"
#endif
#define pp_dirEmpty_hFind
#define pp_dirEmpty_hResult
#define pp_dirEmpty False
#define pp_dirEmpty_fileName

#sub pp_dirEmpty_loopBody
  #define public pp_dirEmpty_fileName FindGetFileName(pp_dirEmpty_hFind)
	#pragma message 'pp_dirEmpty_fileName: '   + ' (' + pp_dirEmpty_fileName +')';
#endsub
#for {pp_dirEmpty_hFind = pp_dirEmpty_hResult = FindFirst(pp_dirEmpty_mask, faDirectory); pp_dirEmpty_hResult; pp_dirEmpty_hResult = FindNext(pp_dirEmpty_hFind)} pp_dirEmpty_loopBody

#if pp_dirEmpty_hFind
	#if pp_dirEmpty_fileName == ".."
		#define public pp_dirEmpty True;
		#pragma message 'pp_dirEmpty_fileName == ".."'  + ' (' + pp_dirEmpty_fileName +')';
		#expr FindClose(pp_dirEmpty_hFind);
	#else
		#define public pp_dirEmpty False;
		#pragma message 'pp_dirEmpty_fileName == "else"'  + ' (' + pp_dirEmpty_fileName +')';
		#expr FindClose(pp_dirEmpty_hFind);
	#endif
#else
	#define public pp_dirEmpty False;
	#pragma warning 'pp_dirEmpty: search dir not found' + ' (' + pp_dirEmpty_fileName +')';
#endif
#pragma message 'pp_dirEmpty:'  + Str(pp_dirEmpty);