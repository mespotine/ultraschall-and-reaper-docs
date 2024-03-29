--[[
################################################################################
# 
# Copyright (c) 2014-2018 Ultraschall (http://ultraschall.fm)
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# 
################################################################################
]] 

-- Ultraschall Toolbox
-- Preview Audio Before Recording beta 1 (9th of September 2018) - by Meo Mespotine mespotine.de
--
-- 1. Set Editcursor to position, where you want to start recording
-- 2. Start script; a window with an OK-button will pop up
-- 3. Set Editcursor to the position, from where you want to "preview-playback". You can 
--       playback until you find the right position
-- 4. When you've found the right position, click "OK" in the opened window
-- 5. You will hear a playback of your audio until you reach your desired recording-position, where
--       recording will start
--
-- Good for audioplays, where you want to give the speaker/voice-actor a preview of their last performance or
-- their last sentence they acted, more easily than with usual pre-roll, as you can set the exact spot to restart.
-- Maybe helpful for other things as well?
--
-- Help us making good scripts, donate to our team at: ultraschall.fm/danke
--
-- Cheers



retval, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, 10)

Preroll_Settings=reaper.SNM_GetIntConfigVar("preroll", -99)
Preroll_Settings_new=6
reaper.SNM_SetIntConfigVar("preroll", Preroll_Settings_new)

OldTime=reaper.SNM_GetDoubleConfigVar("prerollmeas", -99)

ultraschall={}

function ultraschall.TimeToMeasures(project, time)
  -- quick function that converts a time into current projects time-measures
  -- only useful, when there are no tempo-changes in the project
  --
  -- parameters:
  --  project - ReaProject to use the timesignature-settings from
  --  time    - in seconds, the time to convert into a time-measurment, which can be
  --             used in config-variable "prerollmeas"
  --
  -- retval:
  --  measuer - the measures, that parameter time needs to be reflected
  
  local Measures=reaper.TimeMap2_beatsToTime(0, 0, 1)
  local QN=reaper.TimeMap2_timeToQN(0, 1)
  local Measures_Fin=Measures/cdenom
  local Measures_Fin2=Measures_Fin*time
  return Measures_Fin2
end

if reaper.GetPlayState()~=0 then
  Recposition=reaper.GetPlayPosition()
else
  Recposition=reaper.GetCursorPosition()
end

if reaper.GetPlayState()&4==4 then reaper.CSurf_OnStop() end

function drawgfx()
  -- draws OK-Button and the text
  gfx.set(0.8,0.8,0.8,0.8)
  gfx.rect(230,30,60,60,1)
  gfx.set(1)
  gfx.x=16 gfx.y=28
  gfx.setfont(1,"Arial", 18.5, 66)
  gfx.drawstr("Place Editcursor to \nStart of Preview-Playposition \nand click OK")
  gfx.x=241 gfx.y=46
  gfx.setfont(1,"Arial", 30, 66)
  gfx.drawstr("OK")
end

function main()
  -- let's do the magic
  
  -- if the window-size is changed, redraw window-content
  if height~=gfx.h or width~=gfx.w then
    height=gfx.h
    width=gfx.w
    drawgfx()
  end
  
  -- let's check for user-input
  local A=gfx.getchar()
  
  -- if window is closed or user hits ESC-key, quit the script
  if A==-1 or A==27 then tudelu=false gfx.quit() reaper.SNM_SetIntConfigVar("preroll", Preroll_Settings) end
  
  -- if user hits the OK,Button:
  if gfx.mouse_cap&1==1 and gfx.mouse_x>=230 and gfx.mouse_x<=290 and gfx.mouse_y>=30 and gfx.mouse_y<=90 then 
    local Playposition=reaper.GetCursorPosition() -- get current editcursor-position, from where the previewing will start
    gfx.quit() -- close gfx-window
    if Playposition==Recposition then 
      -- if previewposition equals recposition, just start recording, clean up and exit
      reaper.SNM_SetDoubleConfigVar("prerollmeas", 0)
      reaper.CSurf_OnRecord()
      reaper.SNM_SetIntConfigVar("preroll", Preroll_Settings)
      reaper.SNM_SetDoubleConfigVar("prerollmeas", OldTime)
      return
    elseif Recposition<Playposition then
      -- if playposition is bigger than recposition, then show error-message, clean up and exit
      reaper.SNM_SetIntConfigVar("preroll", Preroll_Settings)
      reaper.MB("The recording-position must be after the preview-play-position!", "Ooops" ,0)
      return
    else
      -- in all other cases, set the correct pre-roll-measure-settings, start recording(with preroll activated), clean up and exit
      if reaper.GetPlayState()~=0 then reaper.CSurf_OnStop() end
      reaper.MoveEditCursor(Recposition-Playposition, false)
      local Gap=Recposition-Playposition
      local NewTime=ultraschall.TimeToMeasures(0, Gap)
      reaper.SNM_SetDoubleConfigVar("prerollmeas", NewTime)
      reaper.CSurf_OnRecord()
-- Debug-lines
--      L=reaper.GetPlayPosition()
--      if L>Playposition then reaper.MB(L.." "..Playposition,"",0) end
      reaper.SNM_SetIntConfigVar("preroll", Preroll_Settings)
      reaper.SNM_SetDoubleConfigVar("prerollmeas", OldTime)
      tudelu=false 
    end
  end
  gfx.update()
  if tudelu~=false then reaper.defer(main) end
end

-- main program
gfx.init("Place Edit-Cursor", 320,120,0,100,300) -- open window

-- let's get initial window height and width(for checking later, if we need to redraw the window contents due window-size-changes)
height=gfx.h
width=gfx.w

-- draw gfx
drawgfx()

-- start the magic
main()

