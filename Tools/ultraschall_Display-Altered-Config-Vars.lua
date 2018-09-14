-- written by Meo Mespotine mespotine.de 12th of September 2018
-- for the ultraschall.fm-project

-- requires Reaper 5.95 and SWS 2.9.7

-- This script shows altered integer and double-float-settings for all config-variables available in Reaper, that can be used by
-- the SWS-functions SNM_GetIntConfigVar(), SNM_SetIntConfigVar(), SNM_GetDoubleConfigVar() and SNM_SetDoubleConfigVar()
-- where you pass the variable-name as parameter "varname".
-- This script also shows bitwise-representation of the variable's-value, so you can work easily with bitfields.

-- To use this script, just copy the variable-names from the following commentsection, which contains the available 
-- variables for Reaper 5.80 and start the script or click NO in the MessageBox after starting the script.

-- Change settings in the preferences/project-settings/render-dialog-window to see, which variable 
-- contains which value for which setting. There are also some other Reaper-settings, that can be accessed
-- that way. Just experiment and see, what you can change. The names of the variables are a hint to, what can be
-- accessed.

-- Feel free to document the variable-settings(some seem to be identically named, as settings in reaper.ini) ;)
-- Keep in mind, some of the variables are bitmask-variables and contain the values for several 
-- checkboxes(e.g. in the preferences-dialog).

-- IMPORTANT! This script has an issue with float-variables, when the float is set as an integer, it's changes will not be shown.
--           For instance, when setting projmaxlen (maximum project-length) in Project Settings, it will not update, if you 
--           set the value to 1.000, but it will update it, when you set it to 1.001(triggering the float-section of the value).
--           So when reverse-engineering floats, keep in mind to set the float-part of the value, or it will not show up!

ultraschall={}
function ultraschall.GetStringFromClipboard_SWS()
-- gets a big string from clipboard, using the 
-- CF_GetClipboardBig-function from SWS
-- and deals with all aspects necessary, that
-- surround using it.
  local buf = reaper.CF_GetClipboard(buf)
  local WDL_FastString=reaper.SNM_CreateFastString("HudelDudel")
  local clipboardstring=reaper.CF_GetClipboardBig(WDL_FastString)
  reaper.SNM_DeleteFastString(WDL_FastString)
  return clipboardstring
end

L=reaper.MB("Read variable-names from clipboard?\n(Select No to use Reaper 5.95-variables(inclusive pre-release-only-ones).","Query",3)
if L==6 then 
  A=ultraschall.GetStringFromClipboard_SWS()
elseif L==2 then return
else
  A="__numcpu\nacidimport\nactionmenu\nadjreclat\nadjrecmanlat\nadjrecmanlatin\nafxcfg\nallstereopairs\naltpeaks\naltpeaksopathlist\naltpeakspath\nalwaysallowkb\naot\napplyfxtail\naudioasync\naudiocloseinactive\naudioclosestop\naudioprshift\naudiothreadpr\nautoclosetrackwnds\nautomute\n"
  A=A.."automuteflags\nautomuteval\nautonbworkerthreads\nautoreturntime\nautoreturntime_action\nautosaveint\nautosavemode\nautoxfade\nbigwndframes\ncopyimpmedia\ncpuallowed\ncsurfrate\nctrlcopyitem\ncueitems\ncustommenu\ndefautomode\ndefenvs\ndeffadelen\ndeffadeshape\ndefhwvol\ndefpitchcfg\n"
  A=A.."defrenderpath\ndefsavepath\ndefsendflag\ndefsendvol\ndefsplitxfadelen\ndeftrackrecflags\ndeftrackrecinput\ndeftrackvol\ndefvzoom\ndefxfadeshape\ndisabledxscan\ndisk_peakmmap2\ndisk_rdblksex\ndisk_rdmodeex\ndisk_rdsizeex\ndisk_wrblks\ndisk_wrblks2\ndisk_wrmode\ndisk_wrsize\ndiskcheck\n"
  A=A.."diskcheckmb\nedit_fontsize\nenv_autoadd\nenv_deffoc\nenv_ol_minh\nenv_options\nenv_reduce\nenvattach\nenvclicksegmode\nenvlanes\nenvtranstime\nenvtrimadjmode\nenvwritepasschg\nerrnowarn\nfadeeditflags\nfadeeditlink\nfadeeditpostsel\nfadeeditpresel\nfeedbackmode\nfullscreenrectb\nfullscreenrectl\n"
  A=A.."fullscreenrectr\nfullscreenrectt\nfxdenorm\nfxfloat_focus\nfxresize\ng_config_project\ng_markerlist_updcnt\ngriddot\ngridinbg\ngridinbg2\ngroupdispmode\nguidelines2\nhandzoom\nhelp\nhwfadex\nhwoutfx_bypass\nide_colors\ninsertmtrack\nisfullscreen\nitemclickmovecurs\nitemdblclk\nitemeditpr\n"
  A=A.."itemfade_minheight\nitemfade_minwidth\nitemfadehandle_maxwidth\nitemfxtail\nitemicons\nitemicons_minheight\nitemlabel_minheight\nitemlowerhalf_minheight\nitemmixflag\nitemprops\nitemprops_timemode\nitemsnap\nitemtexthide\nitemtimelock\nitemvolmode\nkbd_usealt\nlabelitems2\nlastthemefn5\nloadlastproj\n"
  A=A.."locklooptotime\nloop\nloopclickmode\nloopgran\nloopgranlen\nloopnewitems\nloopselpr\nloopstopfx\nmanuallat\nmanuallatin\nmastermutesolo\nmaxitemlanes\nmaxrecent\nmaxrecentfx\nmaxrecsize\nmaxrecsize_use\nmaxsnaptrack\nmaxspeakgain\nmetronome_defout\nmetronome_flags\nmiscopts\nmidiccdensity\nmididefcolormap\n"
  A=A.."midieditor\nmidiins\nmidiins_cs\nmidioctoffs\nmidiouts\nmidiouts_clock\nmidiouts_clock_nospp\nmidiouts_llmode\nmidioutthread\nmidisendflags\nmiditicksperbeat\nmidivu\nmixerflag\nmixeruiflag\nmixrowflags\nmousemovemod\nmousewheelmode\nmultiprojopt\nmultitouch\nmultitouch_ignore_ms\nmultitouch_ignorewheel_ms\n"
  A=A.."multitouch_rotate_gear\nmultitouch_swipe_gear\nmultitouch_zoom_gear\nmutefadems10\nmvu_rmsgain\nmvu_rmsmode\nmvu_rmsoffs2\nmvu_rmsred\nmvu_rmssize\nnativedrawtext\nnewfnopt\nnewprojdo\nnewtflag\nnometers\nnorunmute\nofflineinact\nopencopyprompt\nopennotes\noptimizesilence\npandispmode\npanlaw\npanmode\n"
  A=A.."peakcachegenmode\npeakcachegenrs\npeakrecbm\npeaksedges\npitchenvrange\nplaycursormode\nplayrate\nplayresamplemode\npmfol\npooledenvattach\npooledenvs\nprebufperb\npreroll\nprerollmeas\nprojalignbeatsrate\nprojbpm\nprojfrbase\nprojfrdrop\nprojgriddiv\nprojgriddivsnap\nprojgridframe\nprojgridmin\nprojgridsnapmin\n"
  A=A.."projgridswing\nprojgroupover\nprojgroupsel\nprojintmix\nprojmasternch\nprojmastervuflags\nprojmaxlen\nprojmaxlenuse\nprojmeaslen\nprojmeasoffs\nprojmeasoffsruler\nprojmetrobeatlen\nprojmetrocountin\nprojmetroen\nprojmetrof1\nprojmetrof2\nprojmetrov1\nprojmetrov2\nprojmidieditor\nprojpeaksgain\nprojrecforopencopy\n"
  A=A.."projrecmode\nprojrelpath\nprojrenderaddtoproj\nprojrenderdither\nprojrenderlimit\nprojrendernch\nprojrenderqdelay\nprojrenderrateinternal\nprojrenderresample\nprojrendersrate\nprojrenderstems\nprojripedit\nprojsellock\nprojshowgrid\nprojsmpteahead\nprojsmptefw_rec\nprojsmpteinput\nprojsmptemaxfree\nprojsmpteoffs\n"
  A=A.."projsmpterate\nprojsmpterateuseproj\nprojsmpteresync\nprojsmpteresync_rec\nprojsmpteskip\nprojsmptesync\nprojsrate\nprojsrateuse\nprojtakelane\nprojtimemode\nprojtimemode2\nprojtimeoffs\nprojtrackgroupdisabled\nprojtsdenom\nprojvidflags\nprojvidh\nprojvidw\npromptendrec\npsmaxv\npsminv\nquantflag\nquantolms\n"
  A=A.."quantolms2\nquantsize2\nrbn\nreamote_maxblock\nreamote_maxlat_render\nreamote_maxpkt\nreamote_smplfmt\nreascript\nreascripttimeout\nrecaddatloop\nreccfg\nrecfile_wildcards\nrecopts\nrecupdatems\nrelativeedges\nrelsnap\nrenderaheadlen\nrenderaheadlen2\nrenderbsnew\nrendercfg\nrenderclosewhendone\nrenderqdelay\n"
  A=A.."rendertail\nrendertaillen\nrendertails\nresetvuplay\nrestrictcpu\nrewireslave\nrewireslavedelay\nreximport\nrfprojfirst\nrightclickemulate\nripplelockmode\nrulerlayout\nrunafterstop\nrunallonstop\nsampleedges\nsaveopts\nsaveundostatesproj\nscnameedit\nscnotes\nscoreminnotelen\nscorequant\nscreenset_as_views\n"
  A=A.."screenset_as_win\nscreenset_autosave\nscrubloopend\nscrubloopstart\nscrubmode\nscrubrelgain\nseekmodes\nselitem_tintalpha\nselitemtop\nshowctinmix\nshowlastundo\nshowmaintrack\nshowpeaks\nshowpeaksbuild\nshowrecitems\nslidermaxv\nsliderminv\nslidershex\nsmoothseek\nsmoothseekmeas\nsnapextrad\nsnapextraden\n"
  A=A.."solodimdb10\nsolodimen\nsoloip\nspecpeak_alpha\nspecpeak_bv\nspecpeak_ftp\nspecpeak_hueh\nspecpeak_huel\nspecpeak_lo\nspecpeak_na\nsplitautoxfade\nstopendofloop\nstopprojlen\nsyncsmpmax2\nsyncsmpuse\ntabtotransflag\ntakelanes\ntcpalign\ntemplateditcursor\ntempoenvmax\ntempoenvmin\ntempoenvtimelock\ntextflags\n"
  A=A.."threadpr\ntimeseledge\ntinttcp\ntitlebarreghide\ntooltipdelay\ntooltips\ntrackitemgap\ntrackselonmouse\ntransflags\ntransientsensitivity\ntransientthreshold\ntrimmidionsplit\ntsmarker\nundomask\nundomaxmem\nunselitem_tintalpha\nuse_reamote\nusedxplugs\nuseinnc\nuserewire\nverchk\nvgrid\nvideo_colorspace\n"
  A=A.."video_decprio\nvideo_delayms\nviewadvance\nvolenvrange\nvstbr64\nvstfolder_settings\nvstfullstate\nvuclipstick\nvudecay\nvumaxvol\nvuminvol\nvuupdfreq\nvzoom2\nvzoommode\nwarnmaxram64\nworkbehvr\nworkbuffxuims\nworkbufmsex\nworkrender\nworkset_max\nworkset_min\nworkset_use\nworkthreads\nzoom\nzoommode\n"
  A=A.."zoomshowarm\nasio_bsize\nccresettab\ndefrecpath\nlazyupds\nmidiedit\nmidilatmask\nprojmetrofn1\nprojmetrofn2\nprojmetropattern\nprojrelsnap\nreuseeditor\nrulerlabelmargin\n"
  
  -- pre-release-config-vars only
  A=A.."\nara\nbouncecfg\ndefstretchmode\nuiscale\nwiring_options\n"
end


-- prepare all entries and read their current values

-- Keep in mind, you must have all config-variable-names in the clipboard to execute 
-- the script successfully. You can find a list for Reaper 5.80 to copy'n'paste in the
-- comment-section at the beginning of this script.
-- Every variable-name must be in it's own line without trailing or preceding whitespaces or tabs!
vars={} -- variable-values
vars2={} -- variable-names
counter=0
i=1 -- number of variables(for later use)
for line in A:gmatch("(.-)\n") do
  if vars[line]==nil then counter=counter+1 end
  vars[line]=reaper.SNM_GetDoubleConfigVar(line,-8)
  i=i+1
  vars2[i]=line
end

count=1
Lotto=1

-- Let's do the magic
function main()
  Lotto=Lotto+1
  if Lotto==15 then Lotto=1
    -- update only every 15th cycle, to save ressources.
    for a=1, i do
      line=vars2[a]

      -- go through all variables and see, if their values have changed since last defer-run
      -- if they've changed, display them and update the value stored in the table vars
      if reaper.SNM_GetIntConfigVar(line,-8)==vars[line] then--and reaper.SNM_GetDoubleConfigVar(line,-7)==vars[line] then
      elseif line~=nil then
        vars[line]=reaper.SNM_GetIntConfigVar(line,-8) -- update value
        varsB=reaper.SNM_GetDoubleConfigVar(line,-8)
        if reaper.get_config_var_string~=nil then hui, varsString=reaper.get_config_var_string(line) varsString="string: "..varsString.."\n" else varsString="string: string-variables not available in this Reaper-version, sorry.\n" end
        if line~=nil and line~="" and count==3 then reaper.ShowConsoleMsg("\n"..line.." : \n       int:"..vars[line].."\n       double:"..varsB.."\n       "..varsString) end -- show varname and value        
        a1=vars[line]&1 if a1~=0 then a1=1 end
        a2=vars[line]&2 if a2~=0 then a2=1 end
        a3=vars[line]&4 if a3~=0 then a3=1 end
        a4=vars[line]&8 if a4~=0 then a4=1 end
        a5=vars[line]&16 if a5~=0 then a5=1 end
        a6=vars[line]&32 if a6~=0 then a6=1 end
        a7=vars[line]&64 if a7~=0 then a7=1 end
        a8=vars[line]&128 if a8~=0 then a8=1 end
  
        a9=vars[line]&256 if a9~=0 then a9=1 end
        a10=vars[line]&512 if a10~=0 then a10=1 end
        a11=vars[line]&1024 if a11~=0 then a11=1 end
        a12=vars[line]&2048 if a12~=0 then a12=1 end
        a13=vars[line]&4096 if a13~=0 then a13=1 end
        a14=vars[line]&8192 if a14~=0 then a14=1 end
        a15=vars[line]&16384 if a15~=0 then a15=1 end
        a16=vars[line]&32768 if a16~=0 then a16=1 end
        
        a17=vars[line]&65536 if a17~=0 then a17=1 end
        a18=vars[line]&131072 if a18~=0 then a18=1 end
        a19=vars[line]&262144 if a19~=0 then a19=1 end
        a20=vars[line]&524288 if a20~=0 then a20=1 end
        a21=vars[line]&1048576 if a21~=0 then a21=1 end
        a22=vars[line]&2097152 if a22~=0 then a22=1 end
        a23=vars[line]&4194304 if a23~=0 then a23=1 end
        a24=vars[line]&8388608 if a24~=0 then a24=1 end
  
        a25=vars[line]&16777216 if a25~=0 then a25=1 end
        a26=vars[line]&33554432 if a26~=0 then a26=1 end
        a27=vars[line]&67108864 if a27~=0 then a27=1 end
        a28=vars[line]&134217728 if a28~=0 then a28=1 end
        a29=vars[line]&268435456 if a29~=0 then a29=1 end
        a30=vars[line]&536870912 if a30~=0 then a30=1 end
        a31=vars[line]&1073741824 if a31~=0 then a31=1 end
        a32=vars[line]&2147483648 if a32~=0 then a32=1 end
        
        if count==3 then 
          reaper.ShowConsoleMsg("       Bitfield, with &1 at start: "..a1.." "..a2.." "..a3.." "..a4..":"..a5.." "..a6.." "..a7.." "..a8.." - "..a9.." "..a10.." "..a11.." "..a12..":"..a13.." "..a14.." "..a15.." "..a16.." - "..a17.." "..a18.." "..a19.." "..a20..":"..a21.." "..a22.." "..a23.." "..a24.." - "..a25.." "..a26.." "..a27.." "..a28..":"..a29.." "..a30.." "..a31.." "..a32.."\n") 
          Lr,LLr=reaper.BR_Win32_GetPrivateProfileString("REAPER", line,"nothingfound",reaper.get_ini_file())
          if LLR~="nothingfound" then reaper.ShowConsoleMsg("       Entry in the reaper.ini: [REAPER] -> "..line.."   - Currently-set-ini-value: "..LLr.."\n") end
        end
      end
    end
  if count~=3 then count=2 end
  -- after the first run, show an introduction to the script
    if count==2 then 
      reaper.ClearConsole() 
      reaper.ShowConsoleMsg("Reaper-Config-Variable-Inspector by Meo Mespotine(mespotine.de) 18.5.2018 for Ultraschall.fm\n\n  This shows all altered Config-Variables and their bitwise-representation as well as the value in the reaper.ini,\n  that can be accessed at runtime through LUA using the SWS-functions: \n     SNM_GetIntConfigVar(), SNM_SetIntConfigVar(), SNM_GetDoubleConfigVar() and SNM_SetDoubleConfigVar(). \n\n  These variables cover the preferences window, project-settings, render-dialog, settings in the context-menu of \n  transportarea and numerous other things.\n\n  Just change some settings in the preferences and click apply to see, which variable is changed to which value, \n  shown in this Reascript-Console.\n\n  Keep in mind: certain variables use bit-wise-values, which means, that one variable may contain the settings for \n  numerous checkboxes; stored using a bitmask, which will be shown in here as well.\n\n") 
      reaper.ShowConsoleMsg("  Mismatch between int/double-values the currently set reaper.ini-value(as well as only int/double changing) is a hint at,\n  that the value is not stored into reaper.ini.\n\n")
      reaper.ShowConsoleMsg("IMPORTANT! This script has an issue with float-variables, when the float is set as an integer, it's changes will not be shown.\n      For instance, when setting projmaxlen (maximum project-length) in Project Settings, it will not update, if you \n      set the value to 1.000, but it will update it, when you set it to 1.001(triggering the float-section of the value).\n      So when reverse-engineering floats, keep in mind to set the float-part of the value, or it will not show up!\n      Sorry for that...\n")      count=3 
    end
  end
  reaper.defer(main)
end

main() -- kick it off


