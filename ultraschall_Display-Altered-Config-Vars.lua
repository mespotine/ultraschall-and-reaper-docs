-- written by Meo Mespotine mespotine.de 16th of May 2018
-- for the ultraschall.fm-project

-- requires Reaper 5.80 and SWS 2.9.7

-- This script shows altered double-float-settings for all config-variables available in Reaper, that can be used by
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

--[[
__numcpu
acidimport
actionmenu
adjreclat
adjrecmanlat
adjrecmanlatin
allstereopairs
altpeaks
altpeaksopathlist
altpeakspath
alwaysallowkb
aot
applyfxtail
audioasync
audiocloseinactive
audioclosestop
audioprshift
audiothreadpr
autoclosetrackwnds
automute
automuteflags
automuteval
autonbworkerthreads
autoreturntime
autoreturntime_action
autosaveint
autosavemode
autoxfade
copyimpmedia
cpuallowed
csurfrate
ctrlcopyitem
cueitems
custommenu
defautomode
defenvs
deffadelen
deffadeshape
defhwvol
defpitchcfg
defrenderpath
defsavepath
defsendflag
defsendvol
defsplitxfadelen
deftrackrecflags
deftrackrecinput
deftrackvol
defvzoom
defxfadeshape
disabledxscan
disk_peakmmap2
disk_rdblksex
disk_rdmodeex
disk_rdsizeex
disk_wrblks
disk_wrblks2
disk_wrmode
disk_wrsize
diskcheck
diskcheckmb
edit_fontsize
env_autoadd
env_deffoc
env_ol_minh
env_options
env_reduce
envattach
envclicksegmode
envlanes
envtranstime
envtrimadjmode
envwritepasschg
errnowarn
fadeeditflags
fadeeditlink
fadeeditpostsel
fadeeditpresel
feedbackmode
fullscreenRectB
fullscreenRectL
fullscreenRectR
fullscreenRectT
fxdenorm
fxfloat_focus
fxresize
g_config_project
g_markerlist_updcnt
griddot
gridinbg
gridinbg2
groupdispmode
guidelines2
handzoom
help
hwfadex
hwoutfx_bypass
ide_colors
insertmtrack
isFullscreen
itemclickmovecurs
itemdblclk
itemeditpr
itemfade_minheight
itemfade_minwidth
itemfadehandle_maxwidth
itemfxtail
itemicons
itemicons_minheight
itemlabel_minheight
itemlowerhalf_minheight
itemmixflag
itemprops
itemprops_timemode
itemsnap
itemtexthide
itemtimelock
itemvolmode
kbd_usealt
labelitems2
lastthemefn5
loadlastproj
locklooptotime
loop
loopclickmode
loopgran
loopgranlen
loopnewitems
loopselpr
loopstopfx
manuallat
manuallatin
mastermutesolo
maxitemlanes
maxrecent
maxrecentfx
maxrecsize
maxrecsize_use
maxsnaptrack
maxspeakgain
metronome_defout
metronome_flags
midiccdensity
mididefcolormap
midieditor
midiins
midiins_cs
midioctoffs
midiouts
midiouts_clock
midiouts_clock_nospp
midiouts_llmode
midioutthread
midisendflags
miditicksperbeat
midivu
mixerflag
mixeruiflag
mixrowflags
mousemovemod
mousewheelmode
multiprojopt
multitouch
multitouch_ignore_ms
multitouch_ignorewheel_ms
multitouch_rotate_gear
multitouch_swipe_gear
multitouch_zoom_gear
mutefadems10
mvu_rmsgain
mvu_rmsmode
mvu_rmsoffs2
mvu_rmsred
mvu_rmssize
nativedrawtext
newfnopt
newprojdo
newtflag
nometers
norunmute
offlineinact
opencopyprompt
opennotes
optimizesilence
pandispmode
panlaw
panmode
peakcachegenmode
peakcachegenrs
peakrecbm
peaksedges
pitchenvrange
playcursormode
playrate
playresamplemode
pmfol
pooledenvattach
pooledenvs
prebufperb
preroll
prerollmeas
projalignbeatsrate
projbpm
projfrbase
projfrdrop
projgriddiv
projgriddivsnap
projgridframe
projgridmin
projgridsnapmin
projgridswing
projgroupover
projgroupsel
projintmix
projmasternch
projmastervuflags
projmaxlen
projmaxlenuse
projmeaslen
projmeasoffs
projmetrobeatlen
projmetrocountin
projmetroen
projmetrof1
projmetrof2
projmetrov1
projmetrov2
projmidieditor
projpeaksgain
projrecforopencopy
projrecmode
projrelpath
projrenderaddtoproj
projrenderdither
projrenderlimit
projrendernch
projrenderqdelay
projrenderrateinternal
projrenderresample
projrendersrate
projrenderstems
projripedit
projsellock
projshowgrid
projsmpteahead
projsmptefw_rec
projsmpteinput
projsmptemaxfree
projsmpteoffs
projsmpterate
projsmpterateuseproj
projsmpteresync
projsmpteresync_rec
projsmpteskip
projsmptesync
projsrate
projsrateuse
projtakelane
projtimemode
projtimemode2
projtimeoffs
projtrackgroupdisabled
projtsdenom
projvidflags
projvidh
projvidw
promptendrec
psmaxv
psminv
quantflag
quantolms
quantolms2
quantsize2
rbn
reamote_maxblock
reamote_maxlat_render
reamote_maxpkt
reamote_smplfmt
reascript
reascripttimeout
recaddatloop
recfile_wildcards
recopts
recupdatems
relativeedges
relsnap
renderaheadlen
renderaheadlen2
renderbsnew
rendercfg
renderclosewhendone
renderqdelay
rendertail
rendertaillen
rendertails
resetvuplay
restrictcpu
rewireslave
rewireslavedelay
reximport
rfprojfirst
rightclickemulate
ripplelockmode
rulerlayout
runafterstop
runallonstop
sampleedges
saveopts
saveundostatesproj
scnameedit
scnotes
scoreminnotelen
scorequant
screenset_as_views
screenset_as_win
screenset_autosave
scrubloopend
scrubloopstart
scrubmode
scrubrelgain
seekmodes
selitem_tintalpha
selitemtop
showctinmix
showlastundo
showmaintrack
showpeaks
showpeaksbuild
showrecitems
slidermaxv
sliderminv
slidershex
smoothseek
smoothseekmeas
snapextrad
snapextraden
solodimdb10
solodimen
soloip
specpeak_alpha
specpeak_bv
specpeak_ftp
specpeak_hueh
specpeak_huel
specpeak_lo
specpeak_na
splitautoxfade
stopendofloop
stopprojlen
syncsmpmax2
syncsmpuse
tabtotransflag
takelanes
tcpalign
templateditcursor
tempoenvmax
tempoenvmin
tempoenvtimelock
textflags
threadpr
timeseledge
tinttcp
titlebarreghide
tooltipdelay
tooltips
trackitemgap
trackselonmouse
transflags
transientsensitivity
transientthreshold
trimmidionsplit
tsmarker
undomask
undomaxmem
unselitem_tintalpha
use_reamote
usedxplugs
useinnc
userewire
verchk
vgrid
video_colorspace
video_decprio
video_delayms
viewadvance
volenvrange
vstbr64
vstfolder_settings
vstfullstate
vuclipstick
vudecay
vumaxvol
vuminvol
vuupdfreq
vzoom2
vzoommode
warnmaxram64
workbehvr
workbuffxuims
workbufmsex
workrender
workset_max
workset_min
workset_use
workthreads
zoom
zoommode
zoomshowarm
--]]

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

L=reaper.MB("Read variable-names from clipboard?\n(Select No to use Reaper 5.80-variables.)","Query",3)
if L==6 then 
  A=ultraschall.GetStringFromClipboard_SWS()
elseif L==2 then return
else
  -- all valid variables
  A="__numcpu\nacidimport\nactionmenu\nadjreclat\nadjrecmanlat\nadjrecmanlatin\nallstereopairs\naltpeaks\naltpeaksopathlist\naltpeakspath\nalwaysallowkb\naot\napplyfxtail\nasio_bsize\naudioasync\naudiocloseinactive\naudioclosestop\naudioprshift\naudiothreadpr\nautoclosetrackwnds\nautomute\nautomuteflags\nautomuteval\nautonbworkerthreads\nautoreturntime\nautoreturntime_action\nautosaveint\nautosavemode\nautoxfade\ncopyimpmedia\ncpuallowed\ncsurfrate\nctrlcopyitem\ncueitems\ncustommenu\ndefautomode\ndefenvs\ndeffadelen\ndeffadeshape\ndefhwvol\ndefpitchcfg\ndefrenderpath\ndefsavepath\ndefsendflag\ndefsendvol\ndefsplitxfadelen\ndeftrackrecflags\ndeftrackrecinput\ndeftrackvol\ndefvzoom\ndefxfadeshape\ndisabledxscan\ndisk_peakmmap2\ndisk_rdmodeex\ndisk_rdsizeex\ndisk_wrblks"
  A=A.."\ndisk_wrblks2\ndisk_wrmode\ndisk_wrsize\ndiskcheck\ndiskcheckmb\nedit_fontsize\nenv_autoadd\nenv_deffoc\nenv_ol_minh\nenv_options\nenv_reduce\nenvattach\nenvclicksegmode\nenvlanes\nenvtranstime\nenvtrimadjmode\nenvwritepasschg\nerrnowarn\nfadeeditflags\nfadeeditlink\nfadeeditpostsel\nfadeeditpresel\nfeedbackmode\nfullscreenRectB\nfullscreenRectL\nfullscreenRectR\nfullscreenRectT\nfxdenorm\nfxfloat_focus\nfxresize\ng_config_project\ng_markerlist_updcnt\ngriddot\ngridinbg\ngridinbg2\ngroupdispmode\nguidelines2\nhandzoom\nhelp\nhwfadex\nhwoutfx_bypass\nide_colors\ninsertmtrack\nisFullscreen\nitemclickmovecurs\nitemdblclk\nitemeditpr\nitemfade_minheight\nitemfade_minwidth\nitemfadehandle_maxwidth\nitemfxtail\nitemicons\nitemicons_minheight\nitemlabel_minheight\nitemlowerhalf_minheight"
  A=A.."\nitemmixflag\nitemprops\nitemprops_timemode\nitemsnap\nitemtexthide\nitemtimelock\nitemvolmode\nkbd_usealt\nlabelitems2\nlastthemefn5\nloadlastproj\nlocklooptotime\nloop\nloopclickmode\nloopgran\nloopgranlen\nloopnewitems\nloopselpr\nloopstopfx\nmanuallat\nmanuallatin\nmastermutesolo\nmaxitemlanes\nmaxrecent\nmaxrecentfx\nmaxrecsize\nmaxrecsize_use\nmaxsnaptrack\nmaxspeakgain\nmetronome_defout\nmetronome_flags\nmidiccdensity\nmididefcolormap\nmidieditor\nmidiins\nmidiins_cs\nmidioctoffs\nmidiouts\nmidiouts_clock\nmidiouts_clock_nospp\nmidiouts_llmode\nmidioutthread\nmidisendflags\nmiditicksperbeat\nmidivu\nmixerflag\nmixeruiflag\nmixrowflags\nmousemovemod\nmousewheelmode\nmultiprojopt\nmultitouch\nmultitouch_ignore_ms\nmultitouch_ignorewheel_ms\nmultitouch_rotate_gear"
  A=A.."\nmultitouch_swipe_gear\nmultitouch_zoom_gear\nmutefadems10\nmvu_rmsgain\nmvu_rmsmode\nmvu_rmsoffs2\nmvu_rmsred\nmvu_rmssize\nnativedrawtext\nnewfnopt\nnewprojdo\nnewtflag\nnometers\nnorunmute\nofflineinact\nopencopyprompt\nopennotes\noptimizesilence\npandispmode\npanlaw\npanmode\npeakcachegenmode\npeakcachegenrs\npeakrecbm\npeaksedges\npitchenvrange\nplaycursormode\nplayrate\nplayresamplemode\npmfol\npooledenvattach\npooledenvs\nprebufperb\npreroll\nprerollmeas\nprojalignbeatsrate\nprojbpm\nprojfrbase\nprojfrdrop\nprojgriddiv\nprojgriddivsnap\nprojgridframe\nprojgridmin\nprojgridsnapmin\nprojgridswing\nprojgroupover\nprojgroupsel\nprojintmix\nprojmasternch\nprojmastervuflags\nprojmaxlen\nprojmaxlenuse\nprojmeaslen\nprojmeasoffs\nprojmetrobeatlen\nprojmetrocountin"
  A=A.."\nprojmetroen\nprojmetrof1\nprojmetrof2\nprojmetrov1\nprojmetrov2\nprojmidieditor\nprojpeaksgain\nprojrecforopencopy\nprojrecmode\nprojrelpath\nprojrenderaddtoproj\nprojrenderdither\nprojrenderlimit\nprojrendernch\nprojrenderqdelay\nprojrenderrateinternal\nprojrenderresample\nprojrendersrate\nprojrenderstems\nprojripedit\nprojsellock\nprojshowgrid\nprojsmpteahead\nprojsmptefw_rec\nprojsmpteinput\nprojsmptemaxfree\nprojsmpteoffs\nprojsmpterate\nprojsmpterateuseproj\nprojsmpteresync\nprojsmpteresync_rec\nprojsmpteskip\nprojsmptesync\nprojsrate\nprojsrateuse\nprojtakelane\nprojtimemode\nprojtimemode2\nprojtimeoffs\nprojtrackgroupdisabled\nprojtsdenom\nprojvidflags\nprojvidh\nprojvidw\npromptendrec\npsmaxv\npsminv\nquantflag\nquantolms\nquantolms2\nquantsize2\nrbn"
  A=A.."\nreamote_maxblock\nreamote_maxlat_render\nreamote_maxpkt\nreamote_smplfmt\nreascript\nreascripttimeout\nrecaddatloop\nrecfile_wildcards\nrecopts\nrecupdatems\nrelativeedges\nrelsnap\nrenderaheadlen\nrenderaheadlen2\nrenderbsnew\nrendercfg\nrenderclosewhendone\nrenderqdelay\nrendertail\nrendertaillen\nrendertails\nresetvuplay\nrestrictcpu\nrewireslave\nrewireslavedelay\nreximport\nrfprojfirst\nrightclickemulate\nripplelockmode\nrulerlayout\nrunafterstop\nrunallonstop\nsampleedges\nsaveopts\nsaveundostatesproj\nscnameedit\nscnotes\nscoreminnotelen\nscorequant\nscreenset_as_views\nscreenset_as_win\nscreenset_autosave\nscrubloopend\nscrubloopstart\nscrubmode\nscrubrelgain\nseekmodes\nselitem_tintalpha\nselitemtop\nshowctinmix\nshowlastundo\nshowmaintrack\nshowpeaks"
  A=A.."\nshowpeaksbuild\nshowrecitems\nslidermaxv\nsliderminv\nslidershex\nsmoothseek\nsmoothseekmeas\nsnapextrad\nsnapextraden\nsolodimdb10\nsolodimen\nsoloip\nspecpeak_alpha\nspecpeak_bv\nspecpeak_ftp\nspecpeak_hueh\nspecpeak_huel\nspecpeak_lo\nspecpeak_na\nsplitautoxfade\nstopendofloop\nstopprojlen\nsyncsmpmax2\nsyncsmpuse\ntabtotransflag\ntakelanes\ntcpalign\ntemplateditcursor\ntempoenvmax\ntempoenvmin\ntempoenvtimelock\ntextflags\nthreadpr\ntimeseledge\ntinttcp\ntitlebarreghide\ntooltipdelay\ntooltips\ntrackitemgap\ntrackselonmouse\ntransflags\ntransientsensitivity\ntransientthreshold\ntrimmidionsplit\ntsmarker\nundomask\nundomaxmem\nunselitem_tintalpha\nuse_reamote\nusedxplugs\nuseinnc\nuserewire\nverchk\nvgrid\nvideo_colorspace\nvideo_decprio\nvideo_delayms\nviewadvance"
  A=A.."\nvolenvrange\nvstbr64\nvstfolder_settings\nvstfullstate\nvuclipstick\nvudecay\nvumaxvol\nvuminvol\nvuupdfreq\nvzoom2\nvzoommode\nwarnmaxram64\nworkbehvr\nworkbuffxuims\nworkbufmsex\nworkrender\nworkset_max\nworkset_min\nworkset_use\nworkthreads\nzoom\nzoommode\nzoomshowarm"
  
  -- these are rumored to work, but I couldn't verify them. I include them anyway, just in case
  A=A.."\nafxcfg\nbigwndframes\nccresettab\ndefrecpath\nlazyupds\nmidiedit\nmidilatmask\nprojmetrofn1\nprojmetrofn2\nprojmetropattern\nprojrelsnap\nreccfg\nreuseeditor\nrulerlabelmargin\nvstbr32"
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
for line in A:gmatch("(.-)%c") do
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
        if line~=nil and line~="" and count==3 then reaper.ShowConsoleMsg(line.." : "..vars[line].."\n") end -- show varname and value
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
        
        if count==3 then reaper.ShowConsoleMsg("      Bitfield, with &1 at start: "..a1.." "..a2.." "..a3.." "..a4..":"..a5.." "..a6.." "..a7.." "..a8.." - "..a9.." "..a10.." "..a11.." "..a12..":"..a13.." "..a14.." "..a15.." "..a16.." - "..a17.." "..a18.." "..a19.." "..a20..":"..a21.." "..a22.." "..a23.." "..a24.." - "..a25.." "..a26.." "..a27.." "..a28..":"..a29.." "..a30.." "..a31.." "..a32.."\n") end
      end
    end
  if count~=3 then count=2 end
  -- after the first run, show an introduction to the script
  if count==2 then reaper.ClearConsole() reaper.ShowConsoleMsg("Reaper-Config-Variable-Inspector by Meo Mespotine(mespotine.de) 15.5.2018 for Ultraschall.fm\n\n  This shows all altered Config-Variables and their bitwise-representation, that can be accessed at runtime through LUA \n  using the SWS-functions: \n     SNM_GetIntConfigVar(), SNM_SetIntConfigVar(), SNM_GetDoubleConfigVar() and SNM_SetDoubleConfigVar(). \n\n  These variables cover the preferences window, project-settings, \n  render-dialog, settings in the context-menu of transportarea \n  and numerous other things.\n\n  Just change some settings in the preferences and click apply to see, \n  which variable is changed to which value, shown in this Reascript-Console.\n\n  Keep in mind: certain variables use bit-wise-values, which means, \n  that one variable may contain the settings for numerous \n  checkboxes; stored using a bitmask, which will be shown in here as well.\n\n") count=3 end
  end
  reaper.defer(main)
end

main() -- kick it off
